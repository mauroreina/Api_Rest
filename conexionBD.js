const mysql = require('mysql');

// servidor
const host = process.env.DB_HOST || 'localhost';

// usuario
const user = process.env.DB_USER || 'root';

// contraseña
const password = process.env.DB_PASS || '';

// nombre base de datos
const database = process.env.DB_DATABASE || 'merqueo';

module.exports = { host, user, password, database };