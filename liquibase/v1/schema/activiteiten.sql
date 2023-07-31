-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE activiteiten
(
    nr         BIGINT                  NOT NULL AUTO_INCREMENT,
    naam       VARCHAR(50)             NOT NULL,
    rapportage BOOLEAN   DEFAULT FALSE NOT NULL,
    vanaf      TIMESTAMP DEFAULT NOW() NOT NULL,
    tot        TIMESTAMP,
    CONSTRAINT activiteiten_pk PRIMARY KEY (nr)
);
