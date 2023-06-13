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

/*create a join table named specializations*/
CREATE TABLE specializations (
    vet_id int REFERENCES vets(id),
    species_id int REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);

/*create a join table named visits*/
CREATE TABLE visits (
    animal_id int REFERENCES vet_clinic(id),
    vet_id int REFERENCES vets(id),
    visit_date date NOT NULL,
);


 /*Add col into the owners table*/
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

/*add a column named visist_total to the table of vet_clinic, where the total number of visits will be stored for animal id
for this purpose,  We implemented the denormalization method to improve the performance of the database. */
ALTER TABLE vet_clinic
ADD COLUMN visits_total int DEFAULT 0;

/*add a table that will store the information about the visits of each vet, fullfilling the rules of normalization*/
CREATE TABLE vet_summary (
  vet_id int REFERENCES vets(id), 
  total_visits int,
  earliest_visit date,
  latest_visit date
);

/*add col  vet_name to the table vet_summary*/
ALTER TABLE vet_summary
ADD COLUMN vet_name varchar(100);










