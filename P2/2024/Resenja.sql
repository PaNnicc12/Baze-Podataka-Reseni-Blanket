--1
CREATE VIEW statistika_zaposleni
AS
SELECT z.ime, z.prezime, COUNT(DISTINCT rm.pozicija) broj_pozicija, AVG(rm.datumdo-rm.datumod) radno_vreme
FROM zaposleni z INNER JOIN radno_mesto rm ON z.jmbg=rm.zjmbg
WHERE rm.datumdo IS NOT NULL
GROUP BY z.jmbg, z.ime, z.prezime;

SELECT * FROM statistika_zaposleni
WHERE broj_pozicija >= 2 AND radno_vreme > 300;

--2
UPDATE zaposleni z
SET plata = plata * 1.15
WHERE EXISTS (SELECT 1 FROM radno_mesto rm WHERE rm.zjmbg = z.jmbg AND rm.datumdo IS NULL)
AND EXISTS (SELECT 1 FROM radno_mesto rm JOIN kompanija k ON rm.idk = k.idk
            WHERE rm.zjmbg = z.jmbg AND rm.datumdo IS NOT NULL AND k.adresa LIKE '%Nis');
            
--3
DELETE FROM radno_mesto rm
WHERE EXISTS (SELECT 1 FROM kompanija k
              WHERE k.idk = rm.idk AND rm.datumdo IS NULL AND k.godina_osn < 2000)
AND EXISTS (SELECT 1 FROM radno_mesto rm2
            WHERE rm2.zjmbg = rm.zjmbg
            AND rm2.datumdo IS NOT NULL
            GROUP BY rm2.zjmbg
            HAVING SUM(rm2.datumdo - rm2.datumod) > 1000)