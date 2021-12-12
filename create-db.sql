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

INSERT INTO productions (p_id, p_name, p_type, p_genre, score, summary)
VALUES (3, 'Hateful Eight', 'Movie', 'Dramatic Comedy', 9, 'eight men end up in a cabin during a snowstorm and people die gruesomely');

INSERT INTO productions (p_id, p_name, p_type, p_genre, score, summary)
VALUES (4, 'Dexter', 'Show', 'Dark Comedy', 6, 'serial killer dexter was taught a code how not to get caught buy killing bad people, double as a blood splatter analyst');

INSERT INTO productions (p_id, p_name, p_type, p_genre, score, summary)
VALUES (5, 'A Star is Born', 'Movie', 'Drama', 7.5, 'Lady Gaga and Bradley Cooper sing their hearts out until the garage door closes.');

INSERT INTO productions (p_id, p_name, p_type, p_genre, score, summary)
VALUES (6, 'Elf', 'Movie', 'Holiday Comedy', 6.8, 'Elf slips into Santas bag and grows up in the north pole, then goes to NY to find his dad.');