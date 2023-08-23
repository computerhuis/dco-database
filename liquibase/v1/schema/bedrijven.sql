-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE bedrijven
(
    nr            BIGINT                 NOT NULL AUTO_INCREMENT,
    naam          VARCHAR(255)           NOT NULL,
    email                VARCHAR(255),
    telefoon             VARCHAR(10),

    straat               VARCHAR(1024),
    postcode             VARCHAR(6),
    huisnummer           INT,
    huisnummertoevoeging VARCHAR(4),
    woonplaats           VARCHAR(1024),

    kvk_nummer           VARCHAR(255),
    btw_nummer           VARCHAR(255),
    website              VARCHAR(2048),

    opmerkingen          TEXT,
    ingeschreven  DATETIME DEFAULT NOW() NOT NULL,
    uitgeschreven DATETIME,
    msaccess             JSON,
    CONSTRAINT bedrijven_pk PRIMARY KEY (nr),
    CONSTRAINT bedrijven_fk_1 FOREIGN KEY (postcode) REFERENCES postcodes (code) ON UPDATE RESTRICT ON DELETE CASCADE
);
CREATE INDEX bedrijven_i_1 ON bedrijven (postcode);
