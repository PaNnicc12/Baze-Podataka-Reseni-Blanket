--1
CREATE VIEW statistika_radnih_mesta
AS
SELECT z.ime, z.prezime, COUNT(DISTINCT irm.id_r_mesto) broj_radnih_mesta, SUM(irm.datum_kraja-irm.datum_poc) broj_radnih_dana
FROM zaposleni z INNER JOIN istorija_radnih_mesta irm ON z.id=irm.id_zap
GROUP BY z.id, z.ime, z.prezime;

SELECT * FROM statistika_radnih_mesta
WHERE broj_radnih_mesta >= 2 AND broj_radnih_dana > 100;

--2
UPDATE zaposleni z
SET plata = (plata * 1.15)
WHERE EXISTS (SELECT 1 FROM radno_mesto rm 
              WHERE z.id_r_mesto = rm.id AND 
              rm.max_plata < 70000 AND z.id_odeljenje IN (SELECT z2.id_odeljenje FROM zaposleni z2
                                                          GROUP BY z2.id_odeljenje
                                                          HAVING COUNT(z2.id) >= 2));

--3
DELETE FROM istorija_radnih_mesta irm
WHERE NOT EXISTS (
    SELECT 1
    FROM zaposleni z
    WHERE z.id_r_mesto = irm.id_r_mesto
);