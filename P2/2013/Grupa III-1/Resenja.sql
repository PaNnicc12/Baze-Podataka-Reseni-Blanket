--1
CREATE VIEW ima_prokletu_avliju
AS
SELECT b.naziv, kolicina
FROM biblioteka b INNER JOIN knjiga_u_biblioteci kub ON kub.id_biblioteke = b.id
INNER JOIN knjiga k ON k.ISBN = kub.isbn_knjige
WHERE k.naslov = 'Prokleta avlija' AND kolicina >= 1;

SELECT naziv FROM ima_prokletu_avliju
ORDER BY kolicina DESC
FETCH FIRST 1 ROW ONLY;

--2
INSERT INTO knjiga(isbn, naslov, datum_objavljivanja)
VALUES(100, 'Ljubav u doba kolere', '01-JAN-10');

SELECT * FROM KNJIGA;
 
 --3
 UPDATE knjiga_u_biblioteci
SET kolicina  = kolicina - 3
WHERE id_biblioteke = (SELECT id FROM biblioteka WHERE naziv = 'Biblioteka Sv.Naum')
AND isbn_knjige = (SELECT isbn FROM knjiga WHERE naslov = 'Prokleta avlija');

INSERT INTO KNJIGA_U_BIBLIOTECI
VALUES((SELECT ID FROM BIBLIOTEKA WHERE NAZIV = 'Biblioteka Krusevac'),
       (SELECT ISBN FROM KNJIGA WHERE NASLOV = 'Prokleta avlija'),
       3);
