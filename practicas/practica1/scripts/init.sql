-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS Escuela;

-- Seleccionar la base de datos
USE Escuela;

-- Crear la tabla de grados
CREATE TABLE IF NOT EXISTS Grados (
    GradoID INT AUTO_INCREMENT PRIMARY KEY,
    Nivel VARCHAR(50)
);

-- Crear la tabla de Estudiantes
CREATE TABLE IF NOT EXISTS Estudiantes (
    EstudianteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    GradoID INT,
    FOREIGN KEY (GradoID) REFERENCES Grados(GradoID)
);

-- Crear la tabla de Materias
CREATE TABLE IF NOT EXISTS Materias (
    MateriaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT
);

-- Crear la tabla de Profesores
CREATE TABLE IF NOT EXISTS Profesores (
    ProfesorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    MateriaID INT,
    FOREIGN KEY (MateriaID) REFERENCES Materias(MateriaID)
);

-- Crear la tabla de Inscripciones
CREATE TABLE IF NOT EXISTS Inscripciones (
    InscripcionID INT AUTO_INCREMENT PRIMARY KEY,
    EstudianteID INT,
    MateriaID INT,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (MateriaID) REFERENCES Materias(MateriaID)
);

-- Crear la tabla de Notas
CREATE TABLE IF NOT EXISTS Notas (
    NotaID INT AUTO_INCREMENT PRIMARY KEY,
    EstudianteID INT,
    MateriaID INT,
    Nota DECIMAL(3,2),
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (MateriaID) REFERENCES Materias(MateriaID)
);

-- Insertar datos en la tabla de Grados
INSERT INTO Grados (Nivel) VALUES
('Primero'),
('Segundo'),
('Tercero'),
('Cuarto'),
('Quinto'),
('Sexto'),
('Septimo'),
('Octavo'),
('Noveno'),
('Decimo');

-- Insertar datos en la tabla de Estudiantes
INSERT INTO Estudiantes (Nombre, Apellido, GradoID) VALUES
('Juan', 'Perez', 1),
('Ana', 'Gomez', 2),
('Luis', 'Martinez', 3),
('Sofia', 'Rodriguez', 4),
('Carlos', 'Lopez', 5),
('Maria', 'Gonzalez', 1),
('Jorge', 'Hernandez', 2),
('Elena', 'Ramirez', 3),
('Pedro', 'Alvarez', 4),
('Lucia', 'Fernandez', 5),
('Diego', 'Torres', 6),
('Paula', 'Sanchez', 7),
('Andres', 'Diaz', 8),
('Cristina', 'Vazquez', 9),
('Rosa', 'Nunez', 10),
('Pablo', 'Iglesias', 6),
('Marta', 'Vidal', 7),
('Alberto', 'Cano', 8),
('Teresa', 'Prieto', 9),
('Manuel', 'Vega', 10);

-- Insertar datos en la tabla de Materias
INSERT INTO Materias (Nombre, Descripcion) VALUES
('Matematicas', 'Estudio de las propiedades y las relaciones de los numeros y los simbolos.'),
('Lengua', 'Estudio del idioma espanol, gramatica y literatura.'),
('Ciencias', 'Estudio de las ciencias naturales y biologicas.'),
('Historia', 'Estudio de los hechos pasados de la humanidad.'),
('Geografia', 'Estudio de la tierra y sus caracteristicas.'),
('Ingles', 'Estudio del idioma ingles.'),
('Educacion Fisica', 'Actividades deportivas y conocimiento del cuerpo humano.'),
('Arte', 'Estudio de la historia del arte y practicas artisticas.'),
('Musica', 'Estudio teorico y practico de la musica.'),
('Tecnologia', 'Estudio de la tecnologia y su aplicacion.');

-- Insertar datos en la tabla de Profesores
INSERT INTO Profesores (Nombre, Apellido, MateriaID) VALUES
('Roberto', 'Jimenez', 1),
('Carmen', 'Ruiz', 2),
('Francisco', 'Moreno', 3),
('Isabel', 'Mendez', 4),
('Antonio', 'Dominguez', 5),
('Marta', 'Vidal', 1),
('Alberto', 'Cano', 2),
('Teresa', 'Prieto', 3),
('Manuel', 'Vega', 4),
('Laura', 'Cortes', 5),
('Javier', 'Garcia', 6),
('Maria', 'Sanchez', 7),
('Carlos', 'Gomez', 8),
('Sofia', 'Martinez', 9),
('Luis', 'Rodriguez', 10),
('Elena', 'Hernandez', 6),
('Pedro', 'Ramirez', 7),
('Lucia', 'Alvarez', 8),
('Diego', 'Fernandez', 9),
('Paula', 'Torres', 10);

-- Insertar datos en la tabla de Inscripciones
INSERT INTO Inscripciones (EstudianteID, MateriaID) VALUES
-- Estudiante 1
(1, 1), (1, 2), (1, 3),
-- Estudiante 2
(2, 2), (2, 3), (2, 4), (2, 5),
-- Estudiante 3
(3, 1), (3, 3), (3, 5), (3, 7),
-- Estudiante 4
(4, 2) ,(4, 4), (4, 5), (4, 6), (4, 7),
-- Estudiante 5
(5, 1) ,(5, 5), (5, 6), (5, 7), (5, 8), (5, 10),
-- Estudiante 6
(6, 6), (6, 7), (6, 8),
-- Estudiante 7
(7, 7), (7, 8), (7, 9), (7, 10),
-- Estudiante 8
(8, 8), (8, 9), (8, 10),
-- Estudiante 9
(9, 1), (9, 2), (9, 3), (9, 4),
-- Estudiante 10
(10, 2), (10, 4), (10, 5), (10, 6), (10, 8),
-- Estudiante 11
(11, 3), (11, 5), (11, 7), (11, 9), (11, 10),
-- Estudiante 12
(12, 4), (12, 6), (12, 8), (12, 10),
-- Estudiante 13
(13, 1), (13, 3), (13, 5),
-- Estudiante 14
(14, 2), (14, 4), (14, 6), (14, 8),
-- Estudiante 15
(15, 3), (15, 5), (15, 6), (15, 7), (15, 9), (15, 10),
-- Estudiante 16
(16, 4), (16, 6), (16, 10),
-- Estudiante 17
(17, 1), (17, 3), (17, 5),
-- Estudiante 18
(18, 2), (18, 4), (18, 6), (18, 8),
-- Estudiante 19
(19, 3), (19, 7), (19, 9),
-- Estudiante 20
(20, 1), (20,2), (20, 4), (20, 6), (20, 8), (20, 10);


-- Insertar datos en la tabla de Notas
INSERT INTO Notas (EstudianteID, MateriaID, Nota) VALUES
-- Estudiante 1
(1, 1, 8.5), (1, 2, 7.2), (1, 3, 9.1),
-- Estudiante 2
(2, 2, 8.0), (2, 3, 9.3), (2, 4, 7.5), (2, 5, 6.8),
-- Estudiante 3
(3, 1, 9.2), (3, 3, 8.8), (3, 5, 7.4), (3, 7, 6.9),
-- Estudiante 4
(4, 2, 7.1), (4, 4, 8.2), (4, 5, 9.0), (4, 6, 7.7), (4, 7, 8.4),
-- Estudiante 5
(5, 1, 6.5), (5, 5, 8.6), (5, 6, 7.9), (5, 7, 9.1), (5, 8, 8.3), (5, 10, 7.2),
-- Estudiante 6
(6, 6, 8.4), (6, 7, 7.8), (6, 8, 9.2),
-- Estudiante 7
(7, 7, 7.5), (7, 8, 8.7), (7, 9, 6.8), (7, 10, 9.0),
-- Estudiante 8
(8, 8, 8.0), (8, 9, 7.3), (8, 10, 8.5),
-- Estudiante 9
(9, 1, 9.3), (9, 2, 8.1), (9, 3, 7.6), (9, 4, 8.9),
-- Estudiante 10
(10, 2, 8.4), (10, 4, 7.2), (10, 5, 9.1), (10, 6, 8.3), (10, 8, 7.4),
-- Estudiante 11
(11, 3, 8.5), (11, 5, 7.7), (11, 7, 9.4), (11, 9, 8.6), (11, 10, 7.8),
-- Estudiante 12
(12, 4, 8.2), (12, 6, 7.9), (12, 8, 9.5), (12, 10, 8.1),
-- Estudiante 13
(13, 1, 7.8), (13, 3, 8.4), (13, 5, 9.2),
-- Estudiante 14
(14, 2, 8.0), (14, 4, 7.5), (14, 6, 9.3), (14, 8, 8.7),
-- Estudiante 15
(15, 3, 8.3), (15, 5, 7.4), (15, 6, 9.0), (15, 7, 8.5), (15, 9, 7.7), (15, 10, 8.9),
-- Estudiante 16
(16, 4, 8.8), (16, 6, 9.1), (16, 10, 7.6),
-- Estudiante 17
(17, 1, 8.7), (17, 3, 9.0), (17, 5, 7.5),
-- Estudiante 18
(18, 2, 8.3), (18, 4, 7.9), (18, 6, 8.5), (18, 8, 9.2),
-- Estudiante 19
(19, 3, 8.1), (19, 7, 9.3), (19, 9, 7.8),
-- Estudiante 20
(20, 1, 9.5), (20, 2, 8.4), (20, 4, 7.2), (20, 6, 9.0), (20, 8, 8.7), (20, 10, 7.4);
