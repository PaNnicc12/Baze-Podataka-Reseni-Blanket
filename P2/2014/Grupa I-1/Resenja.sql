--1
CREATE VIEW iznajmljivanje_vozila
AS
SELECT k.id, k.ime, k.prezime, k.drzava, COUNT(*) broj_vozila
FROM klijent k INNER JOIN klijent_vozilo kv ON k.id = kv.klijent_id
GROUP BY k.id, k.ime, k.prezime, k.drzava;

SELECT * FROM iznajmljivanje_vozila
ORDER BY broj_vozila DESC
FETCH FIRST 1 ROW ONLY;

--2
UPDATE klijent
SET adresa = '3115 Central Mall Drive', drzava = 'Holandija'
WHERE ime = 'Ivan' AND prezime = 'Ivanovic';

--3
DELETE FROM klijent_vozilo
WHERE vozilo_id IN(SELECT id FROM vozilo WHERE proizvodjac = 'Fiat' AND vmodel = 'Punto')
AND klijent_id IN(SELECT id FROM klijent WHERE drzava = 'Srbija');
