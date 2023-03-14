CREATE TABLE `article_a_commander` (
    `codart`      char(4) NOT NULL,
    `date`        DATE DEFAULT CURTIME(),
    `qte`         INT,
    FOREIGN KEY (CODART) REFERENCES produit(codart)
);


DELIMITER |
CREATE TRIGGER stk_phy_inf_ale AFTER UPDATE ON produit
    FOR EACH ROW
    BEGIN
        DECLARE stk_phy_prod INT;
        DECLARE stk_ale_prod INT;
        DECLARE stk_diff INT;
        SET stk_phy_prod = (SELECT stkphy
                        FROM produit
                        GROUP BY produit.codart);
        SET stk_ale_prod = (SELECT stkale
                        FROM produit
                        GROUP BY produit.codart);
        IF stk_phy_prod <= stk_ale_prod THEN
            SET stk_diff = SUM(stk_ale_prod - stk_phy_prod);
            INSERT INTO article_a_commander(codart, date, qte);
            SET codart = NEW.codart;
            SET qte = SUM(stk_diff - OLD.qte);
        END IF;
END|


DELIMITER |

CREATE OR REPLACE TRIGGER update_produit AFTER UPDATE ON papyrus.produit
    FOR EACH ROW
    BEGIN
        DECLARE    
            Diff INT;
        SET Diff = NEW.stkale - NEW.stkphy ;
            IF NEW.stkphy <= NEW.stkale THEN
            INSERT INTO Articles_a_commander(
                codart,
                Qte)
            VALUES(
                NEW.codart,
                Diff;
            );
    END IF;
END |