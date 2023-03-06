1.
SELECT hot_nom, hot_ville 
FROM hotel

2.
SELECT cli_nom, cli_prenom, cli_adresse, cli_ville 
FROM client
WHERE cli_nom = 'White'

3.
SELECT sta_nom , sta_altitude 
FROM station
WHERE sta_altitude < 1000

4.
SELECT cha_numero, cha_capacite 
FROM chambre
WHERE cha_capacite > 1

5.
SELECT cli_nom, cli_ville 
FROM client
WHERE cli_ville != 'Londre'

6.
SELECT hot_nom, hot_ville, hot_categorie 
FROM hotel
WHERE hot_ville = 'Bretou' AND hot_categorie > 3

7.
SELECT hot_nom, sta_nom, hot_ville, hot_categorie
FROM hotel
JOIN station ON hotel.hot_sta_id = station.sta_id

8.
SELECT hot_nom, hot_categorie, hot_ville, cha_numero
FROM chambre
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id

9.
SELECT hot_nom, hot_categorie, hot_ville, cha_numero, cha_capacite
FROM chambre
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id
WHERE cha_capacite > 1 AND hot_ville = 'Bretou'

10.
SELECT cli_nom, hot_nom, res_date
FROM reservation
JOIN client ON reservation.res_cli_id = client.cli_id
JOIN chambre ON reservation.res_cha_id = chambre.cha_id
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id

11.
SELECT sta_nom, hot_nom, cha_numero, cha_capacite
FROM chambre
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id
JOIN station ON hotel.hot_sta_id = station.sta_id

12.
SELECT cli_nom, hot_nom, res_date_debut, DATEDIFF(res_date_fin, res_date_debut)
FROM reservation
JOIN client ON reservation.res_cli_id = client.cli_id
JOIN chambre ON reservation.res_cha_id = chambre.cha_id
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id

13.
SELECT sta_nom, COUNT(hot_id) AS nb_hotel
FROM hotel
JOIN station ON hotel.hot_sta_id = station.sta_id
GROUP BY sta_id

14.
SELECT sta_nom, COUNT(cha_id) AS nb_chambre
FROM chambre
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id
JOIN station ON hotel.hot_sta_id = station.sta_id
GROUP BY sta_id

15.
SELECT sta_nom, COUNT(cha_id) AS nb_chambre
FROM chambre
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id
JOIN station ON hotel.hot_sta_id = station.sta_id
WHERE cha_capacite > 1
GROUP BY sta_id

16.
SELECT cli_nom, hot_nom
FROM reservation
JOIN client ON reservation.res_cli_id = client.cli_id
JOIN chambre ON reservation.res_cha_id = chambre.cha_id
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id
WHERE cli_nom = 'Squire'
GROUP BY cli_nom

17.
SELECT sta_nom, AVG(DATEDIFF(res_date_fin, res_date_debut)) AS duree_moyenne_res
FROM reservation
JOIN client ON reservation.res_cli_id = client.cli_id
JOIN chambre ON reservation.res_cha_id = chambre.cha_id
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id
JOIN station ON hotel.hot_sta_id = station.sta_id