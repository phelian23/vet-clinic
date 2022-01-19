/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-1-1';
SELECT name FROM animals WHERE neutered=true AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE NOT name ='Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


/* Transactions to update table */

BEGIN;
UPDATE animals SET species='unspecified';
UPDATE 10
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE 6
UPDATE animals SET species='pokemon' WHERE species is NULL;
UPDATE 4
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
DELETE 10
ROLLBACK;
ROLLBACK

BEGIN;
DELETE FROM animals WHERE date_of_birth >'2022-1-1';
DELETE 1
SAVEPOINT first_delete;
UPDATE animals SET weight_kg= -1*weight_kg;
UPDATE 9
ROLLBACK TO first_delete;
UPDATE animals SET weight_kg= -1*weight_kg WHERE weight_kg < 0;
COMMIT;


/* Update queries to answer further questions */

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT ROUND(AVG(weight_kg)) FROM animals;
SELECT name, neutered FROM animals WHERE escape_attempts =(SELECT MAX(escape_attempts) FROM animals);
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals WHERE species LIKE '%mon%';
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-1-1' GROUP BY species;