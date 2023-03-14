1.
CREATE VIEW vue_hotel_station
AS
SELECT hot_nom, sta_nom
FROM hotel
JOIN station ON hot_sta_id = sta_id

2.
CREATE VIEW vue_chambre_hotel
AS
SELECT cha_id, hot_nom
FROM chambre
JOIN hotel ON cha_hot_id = hot_id