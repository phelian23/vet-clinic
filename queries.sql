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


/* Update queries (using JOIN) to answer the further questions */
 
SELECT full_name, name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
  
SELECT animals.name, owners.full_name FROM owners LEFT JOIN animals ON owners.id = animals.owners_id;

SELECT species.name, COUNT(species.name) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT animals.name, species.name, owners.full_name FROM animals JOIN owners ON animals.owners_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name, owners.full_name, animals.escape_attempts FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts <= 0;

SELECT owners.full_name, COUNT(animals.name) FROM animals JOIN owners ON animals.owners_id = owners.id GROUP BY owners.full_name ORDER BY COUNT DESC LIMIT 1;


/* Further queries day 4 */

SELECT vets.name, animals.name, date_of_visit FROM vets JOIN visits ON vets.id=visits.vets_id
JOIN animals ON animals.id= visits.animals_id WHERE vets.name ='William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;



SELECT COUNT(*) as total_animals from vets JOIN visits ON vets.id = visits.vets_id WHERE name='Stephanie Mendez';


SELECT 
	vets.name,
	species.name as specialization
from vets
LEFT JOIN specializations ON specializations.vets_id = vets.id
LEFT JOIN  species ON specializations.species_id = species.id;


SELECT animals.name ,date_of_visit from animals 
JOIN visits ON animals.id= visits.animals_id JOIN vets ON vets.id=visits.vets_id
WHERE vets.name= 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';


SELECT animals.name, COUNT(*) as total_visit from animals
JOIN visits ON visits.animals_id = animals.id
GROUP BY animals.name
ORDER BY total_visit DESC
LIMIT 1;


SELECT vets.name, animals.name, date_of_visit FROM vets JOIN visits ON vets.id=visits.vets_id
JOIN animals ON animals.id= visits.animals_id WHERE vets.name ='Maisy Smith' ORDER BY visits.date_of_visit ASC LIMIT 1;



SELECT
	date_of_visit,
	animals.date_of_birth as animal_dob,
	animals.escape_attempts,
	animals.neutered,
	animals.weight_kg as animal_weight,
	vets.name as vet_name,
	vets.age as vet_age,
	vets.date_of_graduation
from visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
ORDER BY date_of_visit DESC
LIMIT 1;



SELECT COUNT(*)
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
JOIN specializations ON specializations.vets_id = visits.vets_id
WHERE animals.species_id != specializations.species_id;


SELECT species.name as specialization , COUNT(visits.animals_id) from visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;

SELECT COUNT(*) FROM visits where animal_id = 4;
CREATE INDEX animals_id_index ON visits(animals_id);
SELECT COUNT(*) FROM visits where animal_id = 4;
