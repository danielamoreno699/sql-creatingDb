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

/*Modify database animals*/
ALTER TABLE vet_clinic DROP COLUMN species; /* Drop column species */
ALTER TABLE vet_clinic ADD COLUMN species_id INT FOREIGN KEY  REFERENCES species(id);/* Add column species_id referencing specie id */
ALTER TABLE vet_clinic ADD COLUMN owner_id INT FOREIGN KEY  REFERENCES owners (id); /* Add column owner_id referencing owner id */

/*create a table named vets"*/
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name varchar(100) NOT NULL,
    age int NOT NULL,
    date_of_graduation date NOT NULL,
);

/*create table named specializations - join table*/
CREATE TABLE specializations (
    vet_id int REFERENCES vets(id),
    species_id int REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);

/*create a table named visits*/
CREATE TABLE visits (
    animal_id int REFERENCES vet_clinic(id),
    vet_id int REFERENCES vets(id),
    visit_date date NOT NULL,
    PRIMARY KEY (vet_id, animal_id)
);
