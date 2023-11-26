-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE companies
(
    id                    BIGINT                 NOT NULL AUTO_INCREMENT,
    name                  VARCHAR(255)           NOT NULL,
    email                 VARCHAR(255),
    telephone             VARCHAR(10),

    postal_code           VARCHAR(6),
    street                VARCHAR(1024),
    house_number          INT,
    house_number_addition VARCHAR(4),
    city                  VARCHAR(1024),

    kvk_number            VARCHAR(255),
    btw_number            VARCHAR(255),
    website               VARCHAR(2048),

    comments              TEXT,
    registered            DATETIME DEFAULT NOW() NOT NULL,
    unregistered          DATETIME,
    msaccess              JSON,
    CONSTRAINT companies_pk PRIMARY KEY (id),
    CONSTRAINT companies_fk_1 FOREIGN KEY (postal_code) REFERENCES postal_codes (code) ON UPDATE RESTRICT ON DELETE CASCADE
);
CREATE INDEX companies_i_1 ON companies (postal_code);
