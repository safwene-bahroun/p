DROP TABLE IF EXISTS etudiant;
DROP TABLE IF EXISTS emplois_du_temps;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS fields;
DROP TABLE IF EXISTS salles;
DROP TABLE IF EXISTS absences;
DROP TABLE IF EXISTS ouvertures_porte;

CREATE TABLE etudiant (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    cin VARCHAR(8) NOT NULL,
    email TEXT NOT NULL,
    classes INTEGER NOT NULL,
    fields INTEGER NOT NULL,
    password TEXT NOT NULL,
    FOREIGN KEY (classes) REFERENCES classes(id),
    FOREIGN KEY (fields) REFERENCES fields(id)
);

CREATE TABLE classes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE fields (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE salles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE emplois_du_temps (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    classe_id INTEGER NOT NULL,
    periode VARCHAR(50) NOT NULL,
    matiére VARCHAR(50) NOT NULL,
    fields_id INTEGER NOT NULL,
    salles_id INTEGER NOT NULL,
    FOREIGN KEY (salles_id) REFERENCES salles(id),
    FOREIGN KEY (fields_id) REFERENCES fields(id),
    FOREIGN KEY (classe_id) REFERENCES classes(id)
);


CREATE TABLE absences (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    etudiant_id INTEGER NOT NULL,
    emploi_du_temps_id INTEGER NOT NULL,
    salle_id INTEGER NOT NULL,
    presence VARCHAR(20) NOT NULL,
    date_absence DATETIME NOT NULL,
    carte_rfid VARCHAR(20) NOT NULL,
    cin VARCHAR(20) NOT NULL,
    FOREIGN KEY (etudiant_id) REFERENCES etudiant(id),
    FOREIGN KEY (emploi_du_temps_id) REFERENCES emplois_du_temps(id),
    FOREIGN KEY (salle_id) REFERENCES salles(id)
);

CREATE TABLE ouvertures_porte (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    carte_rfid VARCHAR(20) NOT NULL,
    date_ouverture DATETIME NOT NULL,
    salles_id INTEGER NOT NULL,
    FOREIGN KEY (salles_id) REFERENCES salles(id)
);


INSERT INTO salles (id, salle_name) VALUES (1, 'Salle A');
INSERT INTO salles (id, salle_name) VALUES (2, 'Salle B');
INSERT INTO salles (id, salle_name) VALUES (3, 'Salle C');
INSERT INTO salles (id, salle_name) VALUES (4, 'Salle D');
INSERT INTO salles (id, salle_name) VALUES (5, 'Salle E');
INSERT INTO salles (id, salle_name) VALUES (6, 'Salle F');
INSERT INTO salles (id, salle_name) VALUES (7, 'Salle G');
INSERT INTO salles (id, salle_name) VALUES (8, 'Salle H');
INSERT INTO salles (id, salle_name) VALUES (9, 'Salle K');
INSERT INTO salles (id, salle_name) VALUES (10, 'Salle L');
INSERT INTO salles (id, salle_name) VALUES (11, 'Salle M');
INSERT INTO salles (id, salle_name) VALUES (12, 'Salle N');


INSERT INTO fields (id, field_name) VALUES (1, 'ISI');
INSERT INTO fields (id, field_name) VALUES (2, 'SI');
INSERT INTO fields (id, field_name) VALUES (3, 'IT');
INSERT INTO fields (id, field_name) VALUES (4, 'IG');

INSERT INTO classes (id, classe_name) VALUES (1, '1');
INSERT INTO classes (id, classe_name) VALUES (2, '2');
INSERT INTO classes (id, classe_name) VALUES (3, '3');



INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Lundi 08:30-10:00', 'Algèbre', 1, 1);


INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Lundi 10:00-11:30', 'Mécanique', 1, 7);


INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Lundi 14:00-15:30', 'base de donné', 1, 4);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Lundi 15:30-17:00', 'Analyse', 1, 8);





INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 08:30-10:00', 'Algorithmique', 1, 2);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 10:00-11:30', 'Électronique', 1, 4);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 14:00-15:30', 'Probabilité', 1, 2);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 15:30-17:00', 'Électromagnétisme', 1, 4);



INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mercredi 08:30-10:00', 'php', 1, 2);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mercredi 10:00-11:30', 'js', 1, 6);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mercredi 14:00-15:30', 'java', 1, 9);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mercredi 15:30-17:00', 'css', 1, 4);




INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Jeudi 08:30-10:00', ' python', 1, 5);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Jeudi 10:00-11:30', 'tp js', 1, 10);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Jeudi 14:00-15:30', 'tp php', 1, 6);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Jeudi 15:30-17:00', 'td analyse', 1, 9);






INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Vendrendi 08:30-10:00', 'tp java', 1, 1);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Vendrendi 10:00-11:30', 'td java', 1, 5);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Vendrendi 14:30-10:00', 'td algebre', 1, 2);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Vendrendi 15:30-17:00', 'tp mecanique', 1, 4);






INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Samedi 08:30-10:00', 'English', 1, 11);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Samedi 10:00-11:30', 'culture', 1, 8);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Samedi 14:00-15:30', '', 1, 9);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Samedi 15:00-17:00', '', 1, 7);