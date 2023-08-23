-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE werkzaamheden
(
    nr               BIGINT                 NOT NULL AUTO_INCREMENT,
    type             VARCHAR(255)           NOT NULL,
    status           VARCHAR(255),
    computer_nr      BIGINT,
    omschrijving     JSON,

    ingeboekt_door   BIGINT                 NOT NULL,
    ingeboekt_datum  DATETIME DEFAULT NOW() NOT NULL,
    uitgevoerd_door  BIGINT,
    uitgevoerd_datum DATETIME,
    uitgeboekt_door  BIGINT,
    uitgeboekt_datum DATETIME,

    CONSTRAINT werkzaamheden_pk PRIMARY KEY (nr),
    CONSTRAINT werkzaamheden_fk_1 FOREIGN KEY (computer_nr) REFERENCES computers (nr) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT werkzaamheden_fk_2 FOREIGN KEY (ingeboekt_door) REFERENCES personen (nr) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT werkzaamheden_fk_3 FOREIGN KEY (uitgevoerd_door) REFERENCES personen (nr) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT werkzaamheden_fk_4 FOREIGN KEY (uitgeboekt_door) REFERENCES personen (nr) ON UPDATE RESTRICT ON DELETE CASCADE
);
