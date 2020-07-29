# retoMerqueo
Reto Merqueo

INSTALACCION:

1. Descargar los archivos del repositorio.

2. Desde la consola instalar los modulos necesarios o tambien envio archivo node_modules.zip con todos los modulos necesarios:
- npm init -Y
- npm i -S mysql
- npm i -S express body-parser

3. Subir el servidor con el comando:
Node servidor


Para el proyecto se crearon 5 archivos:

1. servidor.js 
Este archivo contiene la configuración para crear la instancia que estara escuchando en el puerto 3000

2. api_merqueo.js
Este archivo contiene 6 rutas que resuelven los puntos indicados en el reto:

/lista_inventario 
No recibe parametros

/lista_provee_pedidos
No recibe parametros 

/lista_menos_vendidos
Recibe 2 parametros /fecha/cantidad

/lista_estado_pedido
Recibe 1 parametro /id_order

/calcular_inventario
Ejecuta una vista en Mysql

/producto_mas_vendido
Recibe 1 parametro /fecha
