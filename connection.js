require('dotenv').config()
var mysql= require('mysql')

const conne=mysql.createConnection({
    host:process.env.DB_HOST,
    user:process.env.DB_USER,
    password:process.env.DB_PASS,
    database:process.env.DB_NAME,
})

conne.connect((err)=>{
    if(err) throw err
    console.log('Mysql is connected')
})

module.exports=conne