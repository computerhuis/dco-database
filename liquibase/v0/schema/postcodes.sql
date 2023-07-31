-- liquibase formatted sql
-- changeset ronlievens:schema-0
CREATE TABLE postcodes
(
    code           CHAR(6)       NOT NULL,
    huisnummer_min INT           NOT NULL,
    huisnummer_max INT           NOT NULL,
    straat         VARCHAR(2048) NOT NULL,
    url            VARCHAR(2048) NOT NULL,
    buurt          VARCHAR(1024) NOT NULL,
    wijk           VARCHAR(1024) NOT NULL,
    plaats         VARCHAR(1024) NOT NULL,
    gemeente       VARCHAR(1024) NOT NULL,
    provincie      VARCHAR(1024) NOT NULL,
    CONSTRAINT postcodes_pk PRIMARY KEY (code)
);
