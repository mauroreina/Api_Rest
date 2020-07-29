const express = require('express');

// Llama funciones definicas para conexion a BD y poder ejecutar querys
const conexion = require('../funciones/conectarDB');
const query = require('../funciones/consultar');

const router = express.Router();
const conexionBD = require('../conexionBD');




// DEFINICION DE RUTAS:

// Consulta qu� productos y qu� cantidad puede ser alistada desde el inventario.
router.get('/lista_inventario', async (req, res) => {
    const conn = await conexion(conexionBD).catch(e => { })
    const results = await query(conn,
        'SELECT products.name,sum(inventory.cantidad) as cantidad '+
        'FROM`inventory`, `products` '+
        'WHERE inventory.id_prod = products.id '+
        'GROUP by products.name ORDER by products.name'
    ).catch(console.log);

    res.setHeader('Content-Type', 'application/json');
    res.json({ results });
})


// Consultar los productos que deben ser alistados por transportadores, y a qu�
// transportador le corresponde cada pedido.
router.get('/lista_provee_pedidos', async (req, res) => {
    const conn = await conexion(conexionBD).catch(e => { })
    const results = await query(conn,
        'SELECT orders.id, providers.name,products.name,SUM(orders.quantity) as cantidad '+
        'FROM`orders`, `products`, `providers` '+
        'WHERE orders.id_prod = products.id and products.id_prov = providers.id '+
        'GROUP by orders.id, providers.name, products.name'
    ).catch(console.log);

    res.setHeader('Content-Type', 'application/json');
    res.json({ results });
})

// Productos menos vendidos el d�a 1 de marzo
router.get('/lista_menos_vendidos/:fecha/:cntdad', async (req, res) => {

    // Fecha ingresada por el usuario
    const fcha = req.params.fecha;
    // Cantidad ingresada por el usuario
    const cntdad = req.params.cntdad;

    const conn = await conexion(conexionBD).catch(e => { })
    const results = await query(conn,
        'SELECT products.name,SUM(orders.quantity) as cantidad '+
        'FROM`orders`, `products` '+
        'WHERE orders.id_prod = products.id and orders.deliveryDate = "' + fcha + '" '+
        'GROUP BY products.name HAVING SUM(orders.quantity) = ' + cntdad + ' '
    ).catch(console.log);

    res.setHeader('Content-Type', 'application/json');
    res.json({ results });
})


// Dado el Id de un pedido, saber qu� productos y qu� cantidad pueden ser alistados
// seg�n sistema de inventario y cu�les deben ser abastecidos por los proveedores.
router.get('/lista_estado_pedido/:id_order', async (req, res) => {

    // # orden ingresada por el usuario
    const id_order = req.params.id_order

    const conn = await conexion(conexionBD).catch(e => { })
    const results = await query(conn,
        'SELECT orders.id, products.id, products.name,SUM(orders.quantity) as cantidad,providers.name, "ABASTECER"' +
        'FROM`orders`, `products`, `providers` ' +
        'WHERE orders.id = ' + id_order + ' and  orders.id_prod = products.id and products.id_prov = providers.id and orders.id_prod NOT IN(select id_prod from inventory GROUP BY id_prod ' +
        'HAVING sum(cantidad) > SUM(orders.quantity)) ' +
        'GROUP BY orders.id, products.id, products.name, providers.name ' +
        'UNION ' +
        'SELECT orders.id, products.id, products.name, SUM(orders.quantity) as cantidad, "EN INVENTARIO", "ALISTADOS" ' +
        'FROM`orders`, `products` ' +
        'WHERE orders.id=' + id_order + ' and orders.id_prod = products.id and orders.id_prod NOT IN(select id_prod from inventory GROUP BY id_prod HAVING sum(cantidad) <= SUM(orders.quantity)) ' +
        'GROUP BY orders.id, products.id, products.name '
    ).catch(console.log);

    res.setHeader('Content-Type', 'application/json');
    res.json({ results });
})

// Calcular el inventario del d�a 2 de marzo, teniendo en cuenta las pedidos
// despachados el 1 de marzo.
// para est punto se crea la vista calcular_inventario, la cual calcula el inventario del 2 marzo 2019
router.get('/calcular_inventario/', async (req, res) => {

    const conn = await conexion(conexionBD).catch(e => { })
    const results = await query(conn,
        'SELECT id,name,sum(cantidad) as cantidad FROM calcular_inventario GROUP BY id,name'
    ).catch(console.log);

    res.setHeader('Content-Type', 'application/json');
    res.json({ results });
})


// Productos mas vendido el d�a 1 de marzo
// se recibe como parametro la fecha para poder escoger cualquier fecha.
router.get('/producto_mas_vendido/:fecha', async (req, res) => {

    // Fecha ingresada por el usuario
    const fcha = req.params.fecha;

    const conn = await conexion(conexionBD).catch(e => { })
    const results = await query(conn,
        'SELECT products.name,SUM(orders.quantity) as cantidad ' +
        'FROM`orders`, `products` ' +
        'WHERE orders.id_prod = products.id and orders.deliveryDate = "' + fcha + ' "' +
        'ORDER BY SUM(orders.quantity) DESC LIMIT 1'
    ).catch(console.log);

    res.setHeader('Content-Type', 'application/json');
    res.json({ results }); ''
})

module.exports = router;
