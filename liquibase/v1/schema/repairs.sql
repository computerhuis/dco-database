-- liquibase formatted sql
-- changeset ronlievens:schema-1

CREATE TABLE repairs
(
    id               BIGINT                         NOT NULL AUTO_INCREMENT,
    repair_type      ENUM ('reparatie', 'uitgifte') NOT NULL,
    status           ENUM ('klant_gebeld', 'in_behandeling', 'in_de_wacht', 'klaar', 'opgehaald'),
    computer_id      BIGINT,
    omschrijving     JSON,

    check_in_by      BIGINT                         NOT NULL,
    check_in_date    DATETIME DEFAULT NOW()         NOT NULL,
    carried_out_by   BIGINT,
    carried_out_date DATETIME,
    check_out_by     BIGINT,
    check_out_date   DATETIME,

    CONSTRAINT repairs_pk PRIMARY KEY (id),
    CONSTRAINT repairs_fk_1 FOREIGN KEY (computer_id) REFERENCES computers (id) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT repairs_fk_2 FOREIGN KEY (check_in_by) REFERENCES persons (id) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT repairs_fk_3 FOREIGN KEY (carried_out_by) REFERENCES persons (id) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT repairs_fk_4 FOREIGN KEY (check_out_by) REFERENCES persons (id) ON UPDATE RESTRICT ON DELETE CASCADE
);
