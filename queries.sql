/*Queries of first submission*/

SELECT * FROM vet_clinic WHERE name LIKE '%mon';

SELECT name
FROM vet_clinic
WHERE
    date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name
FROM vet_clinic
WHERE
    neutered = true
    AND escape_attempts < 3;

SELECT date_of_birth
FROM vet_clinic
WHERE
    name = 'Agumon'
    OR name = 'Pikachu';

SELECT name, escape_attempts FROM vet_clinic WHERE weight > 10.5;

SELECT * FROM vet_clinic WHERE neutered = true;

SELECT * FROM vet_clinic WHERE name <> 'Gabumon';

SELECT * FROM vet_clinic WHERE weight BETWEEN 10.4 AND 17.3;

/*Queries of Second  submission*/

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

/*Create savepoint and multiply weight with -1*/

BEGIN;

SAVEPOINT my_savepoint;

UPDATE vet_clinic SET weight = weight * -1;

ROLLBACK TO SAVEPOINT my_savepoint;

/*update weight with positive numbers */

UPDATE vet_clinic SET weight = weight * -1 WHERE weight < 0 COMMIT;

/*how many animals are there?*/

SELECT COUNT(*) FROM vet_clinic;

/*how many animals have never tried to escape?*/

SELECT COUNT(*) FROM vet_clinic WHERE escape_attempts = 0;

/*what is the avereage weight of all animals?*/

SELECT AVG(weight) FROM vet_clinic;

/*Who escapes the most, neutered or non-neutered animals?*/

SELECT neutered, COUNT(*)
FROM vet_clinic
WHERE escape_attempts > 0
GROUP BY neutered;

/*What is the minimun and maximun weight of each type of animal?*/

SELECT
    species,
    MIN(weight),
    MAX(weight)
FROM vet_clinic
GROUP BY species;

/*What is the average number of escape attempts per animal type of those between 1990 and 2000?*/

SELECT
    species,
    AVG(escape_attempts)
FROM vet_clinic
WHERE
    date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

/*queries using the JOIN keyword*/

/*Animals that belongs to Melody Pond*/

SELECT vc.name AS animal_name
FROM vet_clinic vc
    JOIN owners o ON vc.owner_id = o.id
WHERE
    o.full_name = 'Melody Pond';

/*List of animals that are pokemon type */

SELECT vc.name AS animal_name
FROM vet_clinic vc
    JOIN species s ON vc.species_id = s.id
WHERE s.name = 'Pokemon';

/*list all owners and their corresponding animals including those who don't have any animals*/

SELECT
    o.full_name AS owner_name,
    vc.name AS animal_name
FROM owners o
    LEFT JOIN vet_clinic vc ON o.id = vc.owner_id
ORDER BY o.full_name;

/* determine the number of animals per species*/

SELECT
    s.name AS species_name,
    COUNT(*) AS animal_count
FROM vet_clinic vc
    JOIN species s ON vc.species_id = s.id
GROUP BY s.name;

/*list all digimon owned by jennifer orwell*/

SELECT vc.name AS animal_name
FROM vet_clinic vc
    JOIN owners o ON vc.owner_id = o.id
    JOIN species s ON vc.species_id = s.id
WHERE
    o.full_name = 'Jennifer Orwell'
    AND s.name = 'Digimon';

/*list all animals owned by Dean Winchester that have not tried to escape*/

SELECT vc.name AS animal_name
FROM vet_clinic vc
    JOIN owners o ON vc.owner_id = o.id
WHERE
    o.full_name = 'Dean Winchester'
    AND vc.escape_attempts = 0;

/* who has most animals*/

SELECT
    o.full_name AS owner_name,
    COUNT(*) AS animal_count
FROM owners o
    JOIN vet_clinic vc ON o.id = vc.owner_id
GROUP BY o.full_name
ORDER BY animal_count DESC
LIMIT 1;

/*queries of 4rth submission*/

/*Who was the last animal seen by William Tatcher?*/

SELECT vc.name AS animal_name
FROM visits v
    JOIN vet_clinic vc ON v.animal_id = vc.id
    JOIN vets vt ON v.vet_id = vt.id
WHERE
    vt.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

/*How many different animals did Stephany Mendez see*/

SELECT
    COUNT(DISTINCT vc.name) AS animal_count
FROM visits v
    JOIN vet_clinic vc ON v.animal_id = vc.id
    JOIN vets vt ON v.vet_id = vt.id
WHERE
    vt.name = 'Stephanie Mendez';

/*List all vets and their specialties, including vets with no specialties.*/

SELECT v.name, s.species_id
FROM vets v
    LEFT JOIN specializations s ON v.id = s.vet_id
ORDER BY v.name;

/*List all animals that visited Stephanie Mendez between April 1st and August 30th 2020*/

SELECT vc.name AS animal_name
FROM visits v
    JOIN vet_clinic vc ON v.animal_id = vc.id
    JOIN vets vt ON v.vet_id = vt.id
WHERE
    vt.name = 'Stephanie Mendez'
    AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

/*what animal has the most visits to vets?*/

SELECT
    vc.name AS animal_name,
    COUNT(*) AS visit_count
FROM visits v
    JOIN vet_clinic vc ON v.animal_id = vc.id
GROUP BY vc.name
ORDER BY visit_count DESC
LIMIT 1;

/*Who was Maisy Smith's first visit?*/

SELECT
    vc.name AS animal_name,
    v.visit_date
FROM visits v
    JOIN vet_clinic vc ON v.animal_id = vc.id
    JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Maisy Smith'
ORDER BY v.visit_date
LIMIT 1;

/*Details for most recent visit: animal information, vet information, and date of visit.*/

SELECT
    vc.name AS animal_name,
    vt.name AS vet_name,
    v.visit_date
FROM visits v
    JOIN vet_clinic vc ON v.animal_id = vc.id
    JOIN vets vt ON v.vet_id = vt.id
ORDER BY v.visit_date DESC
LIMIT 1;

/*How many visits were with a vet that did not specialize in that animal's species?*/

SELECT COUNT(*) AS visit_count
FROM visits v
    JOIN vet_clinic vc ON v.animal_id = vc.id
    JOIN vets vt ON v.vet_id = vt.id
    LEFT JOIN specializations s ON vt.id = s.vet_id AND vc.species_id = s.species_id
WHERE s.vet_id IS NULL;

/*Look for the species  Maisy Smith  gets the most*/

SELECT s.name AS specialty
FROM visits v
    JOIN vet_clinic vc ON v.animal_id = vc.id
    JOIN vets vt ON v.vet_id = vt.id
    JOIN species s ON vc.species_id = s.id
WHERE vt.name = 'Maisy Smith'
GROUP BY s.name
ORDER BY COUNT(*) DESC
LIMIT 1;

--

EXPLAIN ANAlYZE SELECT COUNT(*) FROM visits where animal_id = 4;

EXPLAIN ANAlYZE SELECT * FROM visits where vet_id = 2;

EXPLAIN ANAlYZE
SELECT *
FROM owners
where
    email = 'owner_18327@mail.com';


/*query after improving performance of number of visits for each animal id*/
SELECT COUNT(*)
FROM visits
WHERE animal_id = 4;
