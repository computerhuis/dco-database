-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE repair_log
(
    repair_nr BIGINT   NOT NULL,
    date      DATETIME NOT NULL DEFAULT now(),
    person_nr BIGINT   NOT NULL,
    log       TEXT     NOT NULL,
    CONSTRAINT repair_log_pk PRIMARY KEY (repair_nr, date),
    CONSTRAINT repair_log_fk_1 FOREIGN KEY (repair_nr) REFERENCES repairs (id) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT repair_log_fk_2 FOREIGN KEY (person_nr) REFERENCES persons (id) ON UPDATE RESTRICT ON DELETE CASCADE
);
