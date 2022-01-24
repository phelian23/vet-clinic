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


CREATE TABLE vets(
   id BIGSERIAL PRIMARY KEY NOT NULL,
   name TEXT NOT NULL,
   age INT,
   date_of_graduation DATE
);

CREATE TABLE specializations (
   species_id INT NOT NULL,
   vets_id INT NOT NULL,
   CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
   CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);

CREATE TABLE visits (
   animals_id INT NOT NULL,
   vets_id INT NOT NULL,
   date_of_visit DATE NOT NULL, 
   CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
   CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);


CREATE INDEX animals_id_index ON visits(animals_id);
CREATE INDEX email_index ON owners(email);
CREATE INDEX vets_id_index ON visits(vets_id);
