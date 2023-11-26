-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE time_registrations
(
    person_id    BIGINT,
    activity_id  BIGINT                 NOT NULL,
    registered   DATETIME DEFAULT NOW() NOT NULL,
    unregistered DATETIME,
    CONSTRAINT time_registrations_pk PRIMARY KEY (person_id, registered, activity_id),
    CONSTRAINT time_registrations_fk_1 FOREIGN KEY (person_id) REFERENCES persons (id) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT time_registrations_fk_2 FOREIGN KEY (activity_id) REFERENCES activities (id) ON UPDATE RESTRICT ON DELETE CASCADE
);
