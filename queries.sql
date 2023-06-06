
/* Update the species column to "digimon" for matching animals */
BEGIN;
UPDATE vet_clinic SET species = 'digimon' WHERE name LIKE '%mon';

/* Update the species column to "pokemon" for animals without a species*/
BEGIN; 
UPDATE vet_clinic SET species = 'pokemon' WHERE species IS NULL;

/* Delete all animals from table and then Rollback */
BEGIN;
DELETE FROM vet_clinic;
ROLLBACK;

/*Delete all animals born after Jan 1st, 2022.*/
DELETE FROM vet_clinic WHERE date_of_birth > '2022-01-01';

/*Create savepoint*/
BEGIN; 
SAVEPOINT my_savepoint;
ROLLBACK TO SAVEPOINT my_savepoint;

/*update weight */
UPDATE vet_clinic SET weight = weight * -1;
COMMIT;


/*how many animals are there?*/
SELECT COUNT(*) FROM vet_clinic;

/*how many animals have never tried to escape?*/
SELECT COUNT(*) FROM vet_clinic WHERE escape_attempts = 0;

/*what is the avereage weight of all animals?*/
SELECT AVG(weight) FROM vet_clinic;

/*Who escapes the most, neutered or non-neutered animals?*/
SELECT neutered, COUNT(*) AS escape_count FROM vet_clinic WHERE escape_attempts > 0 GROUP BY neutered;

/*What is the minimun and maximun weight of each type of animal?*/
SELECT species, MIN(weight), MAX(weight) FROM vet_clinic GROUP BY species;

/*What is the average number of escape attempts per animal type of those between 1990 and 2000?*/
SELECT species, AVG(escape_attempts) FROM vet_clinic WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


