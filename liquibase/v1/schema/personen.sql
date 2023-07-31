-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE personen
(
    nr                   BIGINT                  NOT NULL AUTO_INCREMENT,
    voorletters          VARCHAR(255),
    voornaam             VARCHAR(255)            NOT NULL,
    tussenvoegsels       VARCHAR(255),
    achternaam           VARCHAR(255)            NOT NULL,
    geboortedatum        DATE,

    email                VARCHAR(255),
    mobile               CHAR(10),
    telefoon             CHAR(10),

    postcode             VARCHAR(6),
    straat               VARCHAR(1024),
    huisnummer           INT,
    huisnummertoevoeging VARCHAR(4),
    woonplaats           VARCHAR(1024),

    opmerkingen          TEXT,
    ingeschreven         TIMESTAMP DEFAULT now() NOT NULL,
    uitgeschreven        TIMESTAMP,
    msaccess             JSON,
    CONSTRAINT personen_pk PRIMARY KEY (nr),
    CONSTRAINT personen_fk_1 FOREIGN KEY (postcode) REFERENCES postcodes (code) ON UPDATE RESTRICT ON DELETE CASCADE
);
CREATE INDEX personen_i_1 ON personen (postcode);
