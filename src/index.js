require('dotenv').config()
const app = require('express')()
const knex = require('knex')
const {
    HOST,
    PORT,
    USER,
    PASSWORD,
    DB
} = process.env
app.listen(3000, async () => {
    console.log('Server started, configuring knex')
    const conn = await knex({
        client: 'mysql2',
        connection: {
            host: HOST,
            port: PORT,
            user: USER,
            password: PASSWORD,
            database: DB
        },
        pool:{
            min: +process.env.MIN_CONN_POOL,
            max: +process.env.MAX_CONN_POOL
        }
    });
    console.log("Knex launched")
})