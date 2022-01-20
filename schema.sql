/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
   id BIGSERIAL PRIMARY KEY NOT NULL,
   name TEXT NOT NULL,
   date_of_birth DATE NOT NULL,
   escape_attempts INT NOT NULL,
   neutered BOOLEAN NOT NULL,
   weight_kg DECIMAL NOT NULL
);

/* Update database */

ALTER TABLE animals ADD COLUMN species TEXT;


CREATE TABLE owners (
   id BIGSERIAL PRIMARY KEY NOT NULL,
   full_name TEXT NOT NULL,
   age INT NOT NULL );

CREATE TABLE species (
   id BIGSERIAL PRIMARY KEY NOT NULL,
   name TEXT NOT NULL );

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owners_id INT;

ALTER TABLE animals ADD FOREIGN KEY (owners_id) REFERENCES owners(id);