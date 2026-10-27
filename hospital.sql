-- CREAR BASE DE DATOS

CREATE DATABASE hospital;
USE hospital;

CREATE TABLE pacientes(
   id_paciente INT AUTO_INCREMENT PRIMARY KEY,
   documento VARCHAR(10) NOT NULL UNIQUE,
   nombre VARCHAR(50) NOT NULL,
   apellido VARCHAR(50) NOT NULL,
   fecha_nacimiento DATE NOT NULL,
   telefono VARCHAR(10),
   correo VARCHAR(100),
   ciudad VARCHAR(20)
);


CREATE TABLE especialidades(
   id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
   nombre_especialidad VARCHAR(100) NOT NULL,
   descripcion VARCHAR(200)
);


CREATE TABLE medicos(
   id_medico INT AUTO_INCREMENT PRIMARY KEY,
   documento VARCHAR(10) NOT NULL UNIQUE,
   nombre VARCHAR(50) NOT NULL,
   apellido VARCHAR(50) NOT NULL,
   telefono VARCHAR(10),
   correo VARCHAR(100),
   id_especialidad INT NOT NULL,

   -- llave foranea
   FOREIGN KEY (id_especialidad) REFERENCES especialidades(id_especialidad)
);


CREATE TABLE citas(
   id_cita INT AUTO_INCREMENT PRIMARY KEY,
   id_paciente INT NOT NULL,
   id_medico INT NOT NULL,
   fecha_cita DATE NOT NULL,
   hora_cita TIME NOT NULL,
   motivo VARCHAR(200),
   estado VARCHAR(30) DEFAULT 'Programada',

   FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
   FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);


CREATE TABLE historial_medico(
   id_historial INT AUTO_INCREMENT PRIMARY KEY,
   id_paciente INT NOT NULL,
   id_medico INT NOT NULL,
   fecha_atencion DATE NOT NULL,
   diagnostico VARCHAR(200),
   tratamiento VARCHAR(300),
   observaciones VARCHAR(300),

   FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
   FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

-- INSERTAR DATOS

INSERT INTO especialidades (nombre_especialidad, descripcion) VALUES
('Medico General', 'Atencion medica general'),
('Cardiologia', 'Especialidad relacionada con el corazon'),
('Pediatria', 'Atencion medica a niños');

SELECT * FROM especialidades;

INSERT INTO pacientes (documento, nombre, apellido, fecha_nacimiento, telefono, correo, ciudad) VALUES
('123458721', 'juan', 'perez', '1995-03-15', '3154521478', 'juanperez@gmail.com', 'ibague');

SELECT * FROM pacientes;

INSERT INTO medicos (documento, nombre, apellido, telefono, correo, id_especialidad) VALUES
('4523698745', 'luis', 'suarez', '3145265478', 'luissuarez@gmail.com', 2);

SELECT * FROM medicos;

INSERT INTO citas (id_paciente, id_medico, fecha_cita, hora_cita, motivo, estado) VALUES
(1, 1, '2026-09-24', '12:00', 'dolor de cabeza', 'Programada');

SELECT * FROM citas;

INSERT INTO historial_medico (id_paciente, id_medico, fecha_atencion, diagnostico, tratamiento, observaciones) VALUES
(1, 1, '2026-09-24', 'gripa', 'acetaminofen', 'hubo mejoria a los pocos dias');

SELECT * FROM historial_medico;