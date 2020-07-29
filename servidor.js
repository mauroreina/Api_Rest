// Usa express para creacion de las APIS
const express = require('express')

// Importa las APIs de la carpeta ./app 
const apiRouter = require('./app/api_merqueo');

// Inicia Servidor en el puerto 3000
const app = express()
const port = 3000

// Se usa la raiz / para enrutar las APIs
app.use('/', apiRouter);

app.listen(port, () => console.log(`Servidor API Merqueo ejecutandose en puerto: ${port}!`))