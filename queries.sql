/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM vet_clinic WHERE name LIKE '%mon';
SELECT name FROM vet_clinic WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

