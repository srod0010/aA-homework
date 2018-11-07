CREATE TABLE plays (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  year INTEGER NOT NULL,
  playwright_id INTEGER NOT NULL,

  FOREIGN KEY (playwright_id) REFERENCES playwrights(id)
);


CREATE TABLE playwrights (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  birth_year INTEGER

);

INSERT INTO
  playwrights (name, birth_year)
VALUES
('Arthur Miller', 1915),
('Eugene O''Neill', 1888);

INSERT INTO
  plays (title, year, playwright_id)
VALUES
  ('All My Sons', 1947, (SELECT id FROM playwrights WHERE name = 'Arthur Miller')),
  ('Long Days Journey', 1956, (SELECT id FROM playwrights WHERE name = 'Eugene O''Neill'));
  -- ***** .quit or ctrl + d to exit sqlite3 in terminal*******
  -- require 'sqlite3' ??????
  -- SQLite3::Database.new('./plays.db')
  -- plays_db.execute("SELECT * FROM plays")

  -- cat import_db.sql | sqlite3.plays.db    ==> this is command to enter in terminal when cd into folder
  -- sqlite3 plays.db  ==> open sqlite command line
  -- .tables  ==> shows tables
  -- .schema  ==> shows how db is configurated
  -- can run queries once inside. all lines end with ;
  -- can also insert data from sqlite3 command line
    -- ex. INSERT INTO playwrights(name, birth_year) VALUES ('Savio', 1995);

    -- INTERACT WITH RUBY
