-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NULL,
  planet_id TEXT REFERENCES planets
);

CREATE TABLE suns (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id TEXT REFERENCES planets
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  sun_id TEXT REFERENCES suns NOT NULL,
  galaxy_id TEXT REFERENCES galaxy NOT NULL,
  moon_id TEXT REFERENCES moons
);

CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id TEXT REFERENCES planets
);

INSERT INTO galaxy (
  (name) 
  VALUES ('Milky Way')
);

INSERT INTO moons (
  (name)
  VALUE ('Phobos', 'The Moon', 'Deimos', 'Naiad', 'Thalassa', 'Despina', 'Galatea', 'Larissa', 'Hippocamp', 'Proteus', 'Triton', 'Nereid', 'Halimede', 'Sao', 'Laomedeia', 'Psamathe', 'Neso')
);

INSERT INTO suns 
  (name)
VALUES ('The Sun', 'Proxima Centauri', 'Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years)
VALUES
  ('Earth', 1.00),
  ('Mars', 1.88),
  ('Venus', 0.62),
  ('Neptune', 164.8),
  ('Proxima Centauri b', 0.03),
  ('Gliese 876 b', 0.23);
