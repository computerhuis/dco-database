-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE werkzaamheden_log
(
    werkzaamheid_nr BIGINT   NOT NULL,
    datum           DATETIME NOT NULL DEFAULT now(),
    persoon_nr      BIGINT   NOT NULL,
    log             TEXT     NOT NULL,
    CONSTRAINT werkzaamheden_log_pk PRIMARY KEY (werkzaamheid_nr, datum),
    CONSTRAINT werkzaamheden_log_fk_1 FOREIGN KEY (werkzaamheid_nr) REFERENCES werkzaamheden (nr) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT werkzaamheden_log_fk_2 FOREIGN KEY (persoon_nr) REFERENCES personen (nr) ON UPDATE RESTRICT ON DELETE CASCADE
);
