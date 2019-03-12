DROP TABLE IF EXISTS wanted_list;
CREATE TABLE wanted_list(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
species VARCHAR(255),
danger_level INT,
last_known_location VARCHAR(255)
);
