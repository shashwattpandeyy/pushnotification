// this is used for api call
const client = require('./connection.js')
const express = require('express');
const app = express();

app.listen(3000, ()=>{
    console.log("Sever is now listening at port 3000");
})

client.connect();

app.get('/users', (req, res)=>{
  client.query(`Select * from users`, (err, result)=>{
      if(!err){
          res.send(result.rows[0]["name"]);

      }
  });
  client.end;
})
module.exports = app