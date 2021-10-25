const express = require("express");
const service = express();

const port = 5000;
service.listen(port, () => {
  console.log(`We're live on port ${port}!`);
});