--Tabele i insert into sam pravio rucno pa mozda ima gresaka, ali je dovoljno dobro da se testiraju resenja
CREATE TABLE TURISTA
(
    ID NUMBER(10) NOT NULL CONSTRAINT TURISTA_PK PRIMARY KEY,
    IME VARCHAR(30),
    PREZIME VARCHAR(30),
    POL CHAR,
    ADRESA VARCHAR(100),
    GRAD VARCHAR(50),
    DRZAVA VARCHAR(50)
);

INSERT INTO TURISTA VALUES (1, 'Marko', 'Markovic', 'M', 'Nemanjina 10', 'Beograd', 'Srbija');
INSERT INTO TURISTA VALUES (2, 'Jelena', 'Petrovic', 'Z', 'Bulevar 5', 'Novi Sad', 'Srbija');
INSERT INTO TURISTA VALUES (3, 'Ivan', 'Horvat', 'M', 'Ilica 20', 'Zagreb', 'Hrvatska');
INSERT INTO TURISTA VALUES (4, 'Ana', 'Popescu', 'Z', 'Strada Mare 3', 'Bukurest', 'Rumunija');
INSERT INTO TURISTA VALUES (5, 'Nikola', 'Jovanovic', 'M', 'Cara Dusana 7', 'Nis', 'Srbija');

CREATE TABLE HOTEL
(
    ID NUMBER(10) NOT NULL CONSTRAINT HOTEL_PK PRIMARY KEY,
    NAZIV VARCHAR(30),
    KAPACITET NUMBER(5),
    BROJ_ZVEZDICA NUMBER(1),
    NA_OBALI CHAR(1),
    ADRESA VARCHAR(100),
    GRAD VARCHAR(50),
    DRZAVA VARCHAR(50)
);

INSERT INTO HOTEL VALUES (1, 'Hotel Adriatic', 120, 4, 'D', 'Obala 1', 'Budva', 'Crna Gora');
INSERT INTO HOTEL VALUES (2, 'Hotel Riviera', 200, 5, 'D', 'Obala 5', 'Budva', 'Crna Gora');
INSERT INTO HOTEL VALUES (3, 'Hotel Olympus', 150, 4, 'D', 'Beach Road', 'Neos Marmaras', 'Grcka');
INSERT INTO HOTEL VALUES (4, 'Hotel Central', 80, 3, 'N', 'Main Street 10', 'Bec', 'Austrija');
INSERT INTO HOTEL VALUES (5, 'Hotel Sunny', 100, 4, 'D', 'Sunset Ave', 'Neos Marmaras', 'Grcka');

CREATE TABLE TURISTA_HOTEL
(
    TURISTA_ID NUMBER(10) CONSTRAINT TURISTA_FK REFERENCES TURISTA(ID),
    HOTEL_ID NUMBER(10) CONSTRAINT HOTEL_FK REFERENCES HOTEL(ID),
    CONSTRAINT TURISTAHOTEL_PK PRIMARY KEY(TURISTA_ID, HOTEL_ID)
);

INSERT INTO TURISTA_HOTEL VALUES (1, 1);
INSERT INTO TURISTA_HOTEL VALUES (1, 2);
INSERT INTO TURISTA_HOTEL VALUES (1, 3);
INSERT INTO TURISTA_HOTEL VALUES (2, 1);
INSERT INTO TURISTA_HOTEL VALUES (2, 3);
INSERT INTO TURISTA_HOTEL VALUES (3, 3);
INSERT INTO TURISTA_HOTEL VALUES (3, 4);
INSERT INTO TURISTA_HOTEL VALUES (4, 2);
INSERT INTO TURISTA_HOTEL VALUES (5, 3);
INSERT INTO TURISTA_HOTEL VALUES (5, 5);

