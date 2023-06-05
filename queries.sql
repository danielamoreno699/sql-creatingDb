/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM vet_clinic WHERE name LIKE '%mon';
SELECT name FROM vet_clinic WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM vet_clinic WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth
FROM vet_clinic WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM vet_clinic WHERE weight > 10.5;

