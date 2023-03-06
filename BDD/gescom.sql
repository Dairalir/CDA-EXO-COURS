DROP DATABASE IF EXISTS Gescom;

CREATE DATABASE Gescom;

USE Gescom;

CREATE TABLE suppliers(
    sup_id              INT NOT NULL,
    sup_name            VARCHAR(50) NOT NULL,
    sup_city            VARCHAR(50) NOT NULL,
    sup_address         VARCHAR(150) NOT NULL,
    sup_mail            VARCHAR(75),
    sup_phone           INT(10),
    PRIMARY KEY (sup_id)
);

CREATE TABLE customers(
    cus_id              INT NOT NULL,
    cus_lastname        VARCHAR(50) NOT NULL,
    cus_firstname       VARCHAR(50) NOT NULL,
    cus_address         VARCHAR(150) NOT NULL,
    cus_zipcode         VARCHAR(5) NOT NULL,
    cus_city            VARCHAR(50) NOT NULL,
    cus_mail            VARCHAR(75),
    cus_phone           INT(10),
    PRIMARY KEY (cus_id)
);

CREATE TABLE orders(
    ord_id              INT AUTO_INCREMENT NOT NULL,
    ord_order_date      DATE DEFAULT CURTIME() NOT NULL,
    ord_ship_date       DATE,
    ord_bill_date       DATE,
    ord_reception_date  DATE,
    ord_status          VARCHAR(25) NOT NULL,
    cus_id              INT,
    PRIMARY KEY (ord_id),
    FOREIGN KEY (cus_id) REFERENCES customers(cus_id)
);

CREATE TABLE categories(
    cat_id              INT NOT NULL,
    cat_name            VARCHAR(50),
    cat_parent_id       INT,
    PRIMARY KEY (cat_id)
);

CREATE TABLE products(
    pro_id              INT AUTO_INCREMENT NOT NULL,
    pro_ref             VARCHAR(10) NOT NULL,
    pro_name            VARCHAR(200) NOT NULL,
    pro_desc            TEXT(1000) NOT NULL,
    pro_price           DECIMAL(6,2) NOT NULL,
    pro_stock           SMALLINT(4),
    pro_color           VARCHAR(30),
    pro_picture         VARCHAR(40),
    pro_add_date        DATE DEFAULT CURTIME() NOT NULL,
    pro_update_date     DATETIME DEFAULT CURTIME() NOT NULL,
    pro_publish         TINYINT(1) NOT NULL,
    cat_id              INT,
    PRIMARY KEY (pro_id),
    FOREIGN KEY (cat_id) REFERENCES categories(cat_id)
);

CREATE TABLE details(
    det_id              INT NOT NULL,
    det_price           DECIMAL(6,2) NOT NULL,
    det_quantity        INT(5) NOT NULL CHECK (det_quantity>=100),
    pro_id              INT NOT NULL,
    ord_id              INT NOT NULL,
    PRIMARY KEY (det_id),
    FOREIGN KEY (pro_id) REFERENCES products(pro_id),
    FOREIGN KEY (ord_id) REFERENCES orders(ord_id)
);

CREATE INDEX products_index
ON products(pro_ref);