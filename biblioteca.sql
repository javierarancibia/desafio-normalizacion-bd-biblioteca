CREATE DATABASE biblioteca;
\c biblioteca;


-- Creacion de tablas
CREATE TABLE lectores(id SERIAL, Nombre VARCHAR(100) NOT NULL, PRIMARY KEY(id));
CREATE TABLE libros(codigo INT, Nombre VARCHAR(100) NOT NULL, PRIMARY KEY(codigo));
CREATE TABLE autores(id SERIAL, nombre VARCHAR(100) NOT NULL, PRIMARY KEY(id));
CREATE TABLE editoriales(id SERIAL, nombre VARCHAR(100) NOT NULL, PRIMARY KEY(id));
CREATE TABLE prestamos(id SERIAL PRIMARY KEY, fecha DATE, lector_id INT NOT NULL, libro_id INT NOT NULL, FOREIGN KEY(lector_id) REFERENCES lectores(id), FOREIGN KEY(libro_id) REFERENCES libros(codigo));
CREATE TABLE autores_libros(libro_cod INT NOT NULL, autor_id INT NOT NULL, FOREIGN KEY(libro_cod) REFERENCES libros(codigo), FOREIGN KEY(autor_id) REFERENCES autores(id)); 
CREATE TABLE editoriales_libros(id SERIAL, libro_cod INT NOT NULL, editorial_id INT NOT NULL, FOREIGN KEY(libro_cod) REFERENCES libros(codigo), FOREIGN KEY(editorial_id) REFERENCES editoriales(id));

-- Insercion de datos
INSERT INTO libros(codigo, nombre)VALUES
(515, 'Ecuaciones diferenciales para ingenieros y cientificos'),
(540, 'Quimica'),
(530, 'Fisica'),
(519, 'Estadistica'),
(512, 'Algebra lineal');

INSERT INTO autores(nombre)VALUES
('Lambe, C.G.'),
('Tranter, C.J.'),
('Christen, Hans Rudolf'),
('Serway, Raymond A'),
('Murray Spiegel'),
('Voevodin, Valentin V');

INSERT INTO editoriales(nombre)VALUES
('UTHEA'),
('Reverte'),
('McGraw-Hill'),
('MIR');

INSERT INTO lectores(nombre)VALUES
('Perez Gomez, Juan'),
('Ortega Pereira, Margarita'),
('Garcia Contreras, Rosa'),
('Lopez Molina, Ana');

INSERT INTO prestamos(fecha, lector_id, libro_id)VALUES
('2019-09-15', 1, 515),
('2019-08-23', 2, 540),
('2019-09-24', 3, 530),
('2019-09-18', 4, 519),
('2019-09-17', 1, 512);

INSERT INTO autores_libros(libro_cod, autor_id)VALUES
(515, 1),
(515, 2),
(540, 3),
(530, 4),
(519, 5),
(512, 6);

INSERT INTO editoriales_libros(libro_cod, editorial_id)VALUES
(515, 1),
(540, 2),
(530, 3),
(519, 3),
(512, 4);
