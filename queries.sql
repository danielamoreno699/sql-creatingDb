
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



