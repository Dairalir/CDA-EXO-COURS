CREATE USER 'util1'@'localhost' IDENTIFIED BY 'afpa1';
CREATE USER 'util2'@'localhost' IDENTIFIED BY 'afpa2';
CREATE USER 'util3'@'localhost' IDENTIFIED BY 'afpa3';

GRANT ALL PRIVILEGES ON Papyrus.* TO 'util1'@'localhost';
GRANT SELECT ON Papyrus.* TO 'util2'@'localhost';
GRANT SELECT ON Papyrus.FOURNIS TO 'util3'@'localhost';