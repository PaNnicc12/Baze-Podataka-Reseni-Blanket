--1
CREATE VIEW rezervacije_turista
AS
SELECT t.id, t.ime, t.prezime, t.drzava, COUNT(*) AS broj_hotela
FROM turista t INNER JOIN turista_hotel th ON t.id=th.turista_id
INNER JOIN hotel h ON h.id=th.hotel_id
GROUP BY t.id, t.ime, t.prezime, t.drzava;

SELECT * FROM rezervacije_turista
ORDER BY broj_hotela DESC
FETCH FIRST 1 ROW ONLY;

--2
UPDATE hotel
SET adresa = 'Budva bb'
WHERE grad = 'Budva';

SELECT * FROM hotel;

--3
DELETE FROM turista_hotel
WHERE turista_id IN (SELECT id FROM turista WHERE drzava = 'Srbija')
AND hotel_id IN (SELECT id FROM hotel WHERE grad = 'Neos Marmaras')