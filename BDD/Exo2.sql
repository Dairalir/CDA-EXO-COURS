DROP DATABASE IF EXISTS EXO2;

CREATE DATABASE EXO2;

USE EXO2;

CREATE TABLE `Station`  (
    `sta_num`               INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `sta_nom`               VARCHAR(50)
);

CREATE TABLE `Hotel`    (
    `hot_num`               INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `hot_nom`               VARCHAR(50),
    `hot_cap`               INT,
    `hot_adr`               VARCHAR(50),
    `hot_cat`               VARCHAR(50),
    `hot_sta_num`           INT,
    FOREIGN KEY (`hot_sta_num`) REFERENCES `Station`(`sta_num`)
);

CREATE TABLE `Chambre`  (
    `cha_num`               INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `cha_cap`               INT,
    `cha_conf`              INT,
    `cha_exp`               VARCHAR(50),
    `cha_typ`               VARCHAR(50),
    `cha_hot_num`           INT,
    FOREIGN KEY (`cha_hot_num`) REFERENCES `Hotel`(`hot_num`)
);

CREATE TABLE `Client`   (
    `cli_num`               INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `cli_nom`               VARCHAR(50),
    `cli_pre`               VARCHAR(50),
    `cli_adr`               VARCHAR(50)
);

CREATE TABLE `Reservation`  (
    `res_dat`               DATE NOT NULL,
    `res_dat_deb`           DATE NOT NULL,
    `res_dat_fin`           DATE NOT NULL,
    `res_mont_arr`          INT,
    `res_prix_tot`          INT,
    `res_cha_num`           INT,
    `res_cli_num`           INT,
    FOREIGN KEY (`res_cha_num`)       REFERENCES `Chambre`(`cha_num`),
    FOREIGN KEY (`res_cli_num`)       REFERENCES `Client`(`cli_num`),
    PRIMARY KEY (`res_cha_num`, `res_cli_num`)
);