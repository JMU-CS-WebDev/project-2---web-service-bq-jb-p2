const express = require("express");
const service = express();
const port = 5000;

const fs = require("fs");
const mysql = require("mysql");

const json = fs.readFileSync("credentials.json", "utf8");
const credentials = JSON.parse(json);

const connection = mysql.createConnection(credentials);
connection.connect((error) => {
  if (error) {
    console.error(error);
    process.exit(1);
  }
});

const selectQuery = 'SELECT * FROM productions';
connection.query(selectQuery, (error, rows) => {
  if (error) {
    console.error(error);
  } else {
    console.log(rows);
  }
});

service.listen(port, () => {
  console.log(`We're live on port ${port}!`);
});



service.post("/:newEntry", (request, response, next) => {
  // const parameters = [
  //   request.body.name,
  //   request.body.type,
  //   request.body.genre,
  //   request.body.score,
  //   request.body.summary,
  // ];
  const parameters = [
    2, 'Chuck', 'show', 'thriller', 6, 'badshit crazy'
  ];
  const insertQuery = 'INSERT INTO productions (p_id, p_name, p_type, p_genre, score, summary) VALUES (?,?,?,?,?,?)';

  connection.query(insertQuery, parameters, (error, result) => {
    if (error) {
      response.status(500);
      response.json({
        ok: false,
        results: error.message,
      });
    } else {
      response.json({
        ok: true,
        results: 'It worked!',
      });
      console.log(response);
    }
  });
});