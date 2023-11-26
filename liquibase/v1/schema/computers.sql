-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE computers
(
    id            BIGINT                 NOT NULL AUTO_INCREMENT,
    check_in      DATETIME DEFAULT NOW() NOT NULL,
    check_out     DATETIME,
    computer_type ENUM ('desktop', 'laptop'),

    manufacturer  VARCHAR(255)           NOT NULL,
    model         VARCHAR(255),
    specification JSON                   NOT NULL,

    person_id  BIGINT,
    company_id BIGINT,

    CONSTRAINT computers_pk PRIMARY KEY (id),
    CONSTRAINT computers_fk_1 FOREIGN KEY (person_id) REFERENCES persons (id) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT computers_fk_2 FOREIGN KEY (company_id) REFERENCES companies (id) ON UPDATE RESTRICT ON DELETE CASCADE
);
CREATE INDEX computers_i_1 ON computers (person_id);
CREATE INDEX computers_i_2 ON computers (company_id);
