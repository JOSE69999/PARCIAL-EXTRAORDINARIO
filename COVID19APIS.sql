USE covid_19_dbd;
CREATE TABLE regiones (
    iso VARCHAR(10) NOT NULL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE provinciaapi (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    iso VARCHAR(10),
    name VARCHAR(255)
);

INSERT INTO provinciaapi (iso, name) VALUES
('GTM', 'Guatemala'),
('GTM', 'Alta Verapaz'),
('GTM', 'Baja Verapaz'),
('GTM', 'Chimaltenango'),
('GTM', 'Escuintla'),
('GTM', 'Quetzaltenango'),
('GTM', 'Sacatepéquez'),
('GTM', 'San Marcos'),
('GTM', 'Santa Rosa'),
('GTM', 'Sololá');


CREATE TABLE reportes (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date VARCHAR(255),
    region VARCHAR(255),
    province VARCHAR(255),
    confirmed INT,
    deaths INT
);


SELECT * FROM reportes WHERE iso = 'GT' AND date = '2022-04-16';


CREATE TABLE provinciaapi_backup AS SELECT * FROM provinciaapi;

SELECT * FROM provinciaapi;
SELECT * FROM regiones;
SELECT * FROM reportes;
SELECT * FROM executed_reports;

