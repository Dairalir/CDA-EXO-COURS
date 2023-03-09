1.	
UPDATE vente
SET prix2 = prix2 * 1.02, prix1 = prix1 * 1.04
WHERE numfou = 9180

2.
UPDATE vente
SET prix2 = prix1
WHERE prix2 IS NULL

3.
UPDATE entcom
SET obscom = "*****"
WHERE satisf > 5

4.
DELETE FROM produit
WHERE codart = "I110"

5.
DELETE