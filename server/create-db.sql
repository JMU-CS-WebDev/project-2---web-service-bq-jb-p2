-- Remove any existing database and user.
DROP DATABASE IF EXISTS recomendations;
DROP USER IF EXISTS rec_user@localhost;

CREATE DATABASE recomendations CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
CREATE USER rec_user@localhost IDENTIFIED WITH mysql_native_password BY 'sunsh1n3';
GRANT ALL PRIVILEGES ON recomendations.* TO rec_user@localhost;


DROP TABLE IF EXISTS productions;

CREATE TABLE productions (
  p_id SERIAL PRIMARY KEY,
  p_name VARCHAR(64),
  p_type VARCHAR(64),
  p_genre VARCHAR(64),
  score INT,
  summary VARCHAR(64)
);