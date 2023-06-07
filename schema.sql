/* Database schema to keep the structure of entire database. */

CREATE TABLE vet_clinic (
    id SERIAL PRIMARY KEY,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts int NOT NULL DEFAULT 0,
    neutered boolean NOT NULL DEFAULT false,
    weight float NOT NULL DEFAULT 0
);


/* Modify database schema, add specie column. */
ALTER TABLE vet_clinic ADD COLUMN species varchar(255);

/* Create new table named Owners */
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(100) NOT NULL,
    age int NOT NULL,
);

/* Create new table named species */
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar(100) NOT NULL,
);