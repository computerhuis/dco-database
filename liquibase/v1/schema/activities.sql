-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE activities
(
    id        BIGINT                 NOT NULL AUTO_INCREMENT,
    name      VARCHAR(50)            NOT NULL,
    reporting BOOLEAN  DEFAULT FALSE NOT NULL,
    since     DATETIME DEFAULT NOW() NOT NULL,
    until     DATETIME,
    CONSTRAINT activiteiten_pk PRIMARY KEY (id)
);
