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

service.listen(port, () => {
  console.log(`We're live on port ${port}!`);
});