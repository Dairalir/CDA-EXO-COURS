DELIMITER |

CREATE TRIGGER insert_station AFTER INSERT ON station
    FOR EACH ROW
    BEGIN
        DECLARE altitude INT;
        SET altitude = NEW.sta_altitude;
        IF altitude<1000 THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion altitude !';
        END IF;
END|

/*1.*/
DELIMITER |
CREATE OR REPLACE TRIGGER modif_reservation BEFORE UPDATE ON hotel.reservation
    FOR EACH ROW
    BEGIN
        SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Personne ne peu modifier les reservation';
END |

UPDATE hotel.station
SET res_date = '2017-01-11 00:00:00'
WHERE res_id = 1

INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes)
VALUES 
(9, 1, '2017-08-01', '2017-08-01', '2017-09-20', 2400, 800);

/*2*/
DELIMITER |

CREATE TRIGGER insert_reservation BEFORE INSERT ON reservation
    FOR EACH ROW
    BEGIN
        DECLARE NombreChambre INT;
        SET NombreChambre = (SELECT COUNT(res_cha_id) 
                            FROM reservation 
                            JOIN chambre ON chambre.cha_id = reservation.res_cha_id 
                            GROUP BY cha_hot_id)
        IF NombreChambre < 10 THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. hotel reservation supérieur a 10 !';
        END IF;
END|

/*3*/
DELIMITER |

CREATE TRIGGER insert_reservation2 BEFORE INSERT ON reservation
    FOR EACH ROW
    BEGIN
        DECLARE NombreChambreClient INT;
        SET NombreChambreClient = ( SELECT COUNT(res_cha_id)
                                    FROM reservation
                                    JOIN client ON res_cli_id = client.cli_id
                                    GROUP BY cli_id)
        IF NombreChambreClient < 3 THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. client reservation supérieur a 3 !';
        END IF;
END|

/*4*/
DELIMITER |

CREATE TRIGGER insert_chambre AFTER INSERT ON chambre
    FOR EACH ROW
    BEGIN
        DECLARE CapaciteChambre INT;
        SET CapaciteChambre = (SELECT SUM(cha_capacite)
                                FROM chambre
                                GROUP BY cha_hot_id)
        IF CapaciteChambre > 50 THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. capatité chambre supérieur a 50 !';
        END IF;
END|

/**/

INSERT INTO lignedecommande(id_commande, id_produit, quantite, prix)
VALUES
(1, 1, 3, 10)

DELIMITER |

CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
        UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
END|

DELIMITER |

CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
        UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
END|