--1
CREATE VIEW pristup_dokumentima
AS
SELECT d.id_dokumenta, d.naziv, z.ime, z.prezime
FROM dokument d INNER JOIN pravo_pristupa pp ON pp.dokument = d.id_dokumenta
INNER JOIN zaposleni z ON z.mbr = pp.zaposleni

SELECT naziv, COUNT(*) BROJ_ZAPOSLENIH FROM pristup_dokumentima
GROUP BY naziv
ORDER BY  BROJ_ZAPOSLENIH DESC;

--2
INSERT INTO pravo_pristupa (dokument, zaposleni, datum, pravo)
VALUES((SELECT id_dokumenta FROM dokument WHERE naziv = 'Odrzavanje'), 
       (SELECT mbr FROM zaposleni WHERE ime = 'Milan' AND prezime = 'Milanovic'),
       SYSDATE, 'C');
       
SELECT * FROM pravo_pristupa;

--3
DELETE FROM pravo_pristupa
WHERE dokument = (SELECT id_dokumenta FROM dokument WHERE naziv = 'Statut');

SELECT * FROM pravo_pristupa
