const express = require("express");
const service = express();
service.use(express.json());
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


// inserts a new entry for a production
service.post("/newEntry", (request, response, next) => {
  const parameters = [
    request.body.id,
    request.body.name,
    request.body.type,
    request.body.genre,
    request.body.score,
    request.body.summary,
  ];
  const insertQuery = 'INSERT INTO productions (p_id, p_name, p_type, p_genre, score, summary) VALUES (?,?,?,?,?,?)';

  connection.query(insertQuery, parameters, (error) => {
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


// returns all productions that are either a movie or a show
service.get('/type/:prodType', (request, response) => {
  const parameters = [
    request.params.prodType,
  ];

  const query = 'SELECT * FROM productions WHERE p_type = ? ORDER BY score';
  connection.query(query, parameters, (error, rows) => {
    if (error) {
      response.status(500);
      response.json({
        ok: false,
        result: error.message,
      });
    } else {
      response.json({
        ok: true,
        result: rows,
      });
      console.log(response);
    }
  });
});