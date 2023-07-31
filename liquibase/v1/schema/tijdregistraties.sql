-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE tijdregistraties
(
    persoon_nr    BIGINT,
    ingeboekt     TIMESTAMP DEFAULT NOW() NOT NULL,
    activiteit_nr BIGINT                  NOT NULL,
    uitboekt      TIMESTAMP,
    CONSTRAINT tijdregistraties_pk PRIMARY KEY (persoon_nr, ingeboekt, activiteit_nr),
    CONSTRAINT tijdregistraties_fk_1 FOREIGN KEY (persoon_nr) REFERENCES personen (nr) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT tijdregistraties_fk_2 FOREIGN KEY (activiteit_nr) REFERENCES activiteiten (nr) ON UPDATE RESTRICT ON DELETE CASCADE
);
