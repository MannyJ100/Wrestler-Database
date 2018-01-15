DROP TABLE IF EXISTS wrestler;

CREATE TABLE wrestlers (

	id SERIAL PRIMARY KEY,
	name TEXT,
	height TEXT,
	weight TEXT,
	origin TEXT,
	finisher TEXT

);

INSERT INTO wrestlers (name, height, weight, origin, finisher) VALUES ('Name', 'Height', 'Weight', 'Origin', 'Finisher');