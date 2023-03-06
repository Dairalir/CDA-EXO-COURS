DROP DATABASE IF EXISTS EXO1;

CREATE DATABASE EXO1;

USE EXO1;

CREATE TABLE personne (
    `per_num`           INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `per_nom`           VARCHAR(50),
    `per_prenom`        VARCHAR(50),
    `per_adresse`       VARCHAR(50),
    `per_ville`         VARCHAR(50)
);

CREATE TABLE groupe (
    `gro_num`           INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `gro_libelle`       VARCHAR(50)
);

CREATE TABLE appartient (
    `per_num`           INT,
    `gro_num`           INT,
    FOREIGN KEY (`per_num`) REFERENCES personne(`per_num`),
    FOREIGN KEY (`gro_num`) REFERENCES groupe(`gro_num`)
);
