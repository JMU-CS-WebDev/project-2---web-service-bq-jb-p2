-- Remove any existing database and user.
DROP DATABASE IF EXISTS productions;
DROP USER IF EXISTS rec_user@localhost;

CREATE DATABASE productions CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
CREATE USER rec_user@localhost IDENTIFIED WITH mysql_native_password BY 'sunsh1n3';
GRANT ALL PRIVILEGES ON productions.* TO rec_user@localhost;


DROP TABLE IF EXISTS productions;

CREATE TABLE productions (
  p_id SERIAL PRIMARY KEY,
  p_name VARCHAR(64),
  p_type VARCHAR(64),
  p_genre VARCHAR(64),
  score INT,
  summary VARCHAR(256)
);

INSERT INTO productions (p_id, p_name, p_type, p_genre, score, summary)
VALUES (1, 'Breaking Bad', 'Show', 'Drama', 10, 'A highscool chemistry teacher is diagnosed with cancer and becomes a drug lord like a beast');

INSERT INTO productions (p_id, p_name, p_type, p_genre, score, summary)
VALUES (2, 'Rick and Morty', 'Show', 'Comedy', 8, 'Grandpa Rick and grandson morty travel the universe with a portal gun like they dont give a rats tail');