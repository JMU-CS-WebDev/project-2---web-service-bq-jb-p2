const express = require("express");
const service = express();

const port = 5000;
service.listen(port, () => {
  console.log(`We're live on port ${port}!`);
});

/*  
    The HTTP specification defines several different kinds of requests—or methods—that 
    clients can send to services. These methods include GET, POST, DELETE, and PATCH. 
    These methods roughly correspond to the four basic operations you use to interact 
    with records in a database: create, read, update, or delete. This collection of 
    operations is sometimes abbreviated as CRUD.
*/