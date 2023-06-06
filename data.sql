/* Populate database with sample data. */

INSERT INTO vet_clinic (name, date_of_birth, weight, neutered, escape_attempts)
VALUES
    ('Agumon', '2020-02-03', 10.23, true, 0),
    ('Gabumon', '2018-11-15', 8, true, 2),
    ('Pikachu', '2021-01-07', 15.04, false, 1),
    ('Devimon', '2017-05-12', 11, true, 5);


/* Modify database schema, add specie column. */
ALTER TABLE vet_clinic ADD COLUMN species varchar(255);

/* Add more data */
INSERT INTO vet_clinic (name, date_of_birth, escape_attempts, neutered, weight)
VALUES ('Charmander', '2020-02-08', 0, false, -11);

INSERT INTO vet_clinic (name, date_of_birth, escape_attempts, neutered, weight)
VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);

INSERT INTO vet_clinic (name, date_of_birth, escape_attempts, neutered, weight)
VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO vet_clinic (name, date_of_birth, escape_attempts, neutered, weight)
VALUES ('Angemon', '2005-06-12', 1, true, -45);

INSERT INTO vet_clinic (name, date_of_birth, escape_attempts, neutered, weight)
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO vet_clinic (name, date_of_birth, escape_attempts, neutered, weight)
VALUES ('Blossom', '1998-10-13', 3, true, 17);

INSERT INTO vet_clinic (name, date_of_birth, escape_attempts, neutered, weight)
VALUES ('Ditto', '2022-05-14', 4, true, 22);


