/* Database schema to keep the structure of entire database. */

CREATE TABLE vet_clinic (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts int NOT NULL DEFAULT 0,
    neurtered boolean NOT NULL DEFAULT false,
    weight float NOT NULL DEFAULT 0,
);
