const express = require('express')
var mysql = require('mysql');
const app = express()
const http = require('http')
const path = require('path');
const server = http.createServer(app)
const {Server} = require('socket.io')
const io = new Server(server)
app.use(express.static(path.join(__dirname, "public")));
app.get('/',(req,res) =>{
        res.sendFile(__dirname + '/public' +'/index.html');
})
server.listen(5000,() => {
        console.log('listening on port 5000')
})
var con = mysql.createConnection({
        host: "localhost",
        port: "3306",
        user: "root",
        password: "Camcam270301",
        database: "assignment2"
});
con.connect(function(err) {
        if (err) throw err;
        console.log("DB Connected!");
});
var query,table,value,condition;
var sql = "";
function doOperation() {  
        if (query=="INSERT"){
                sql = query +" INTO " + table + " VALUES (" + value +",NULL)";
                con.query(sql, function (err, result) {
                        if (err) throw err;
                        console.log("1 rows inserted on DB");
                });
        }
        else if(query=="SELECT"){
                sql = query + " * FROM " + table;
                con.query(sql, function (err, result) {
                        if (err) throw err;
                        console.log("1 New Operation on DB");
                });
        }
        else if(query=="DELETE"){
                sql = query + " FROM " + table + " WHERE " + condition ;
                con.query(sql, function (err, result) {
                        if (err) throw err;
                        console.log("1 New Operation on DB");
                });
        }
        else if(query=="UPDATE"){
                sql = query + " " + table + " SET " + value + " WHERE " + condition;
                con.query(sql, function (err, result) {
                        if (err) throw err;
                        console.log("1 New update on " + table);
                });
        };
};
io.on('connection',(socket) =>{
        console.log('user connected');
        socket.on('query',data =>{
            query = data.message;
            console.log(query);
        });
        socket.on('table',data =>{
                table = data.message;
                console.log(table);
        });
        socket.on('value',data =>{
                value = data.message;
                console.log(value);
        });
        socket.on('condition',data =>{
                condition = data.message;
                console.log(condition);
                doOperation();
        });
})

