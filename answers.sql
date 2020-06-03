-- Setup
CREATE TABLE movie (
  movie_id serial PRIMARY KEY,
  title varchar(150),
  media_type_id int REFERENCES media_type(media_type_id)
);

-- Add new entry
INSERT INTO
  movie (title, media_type_id)
VALUES
  ('Cool Runnings', 3),
  ('Voldemort and the Pesky Child', 3);

-- Add new column
ALTER TABLE
  movie
ADD
  COLUMN genre_id INT REFERENCES genre(genre_id);

-- Update rows
UPDATE
  movie
SET
  genre_id = 22
WHERE
  movie_id = 1;

UPDATE
  movie
SET
  genre_id = 22
WHERE
  movie_id = 2;

-- Join
SELECT
  artist.name AS Artist,
  album.title AS Album
FROM
  artist
  JOIN album ON artist.artist_id = album.artist_id;

-- Nested queries
SELECT
  *
FROM
  track
WHERE
  genre_id IN (
    SELECT
      genre_id
    FROM
      genre
    WHERE
      name IN ('Jazz', 'Blues')
  );

-- Setting values to null
UPDATE
  employee
SET
  phone = NULL
WHERE
  employee_id = 1 returning *;

-- Querying a null value
SELECT
  *
FROM
  customer
WHERE
  company IS NULL;

-- Group by
SELECT
  ar.artist_id,
  ar.name,
  COUNT(*)
FROM
  artist ar
  JOIN album al ON ar.artist_id = al.artist_id
GROUP BY
  ar.artist_id
ORDER BY
  COUNT DESC;

-- Distinct
SELECT
  DISTINCT country
FROM
  customer;

-- Delete Rows
SELECT
  *
FROM
  customer
WHERE
  fax IS NULL;

DELETE FROM
  customer
WHERE
  fax IS NULL;

