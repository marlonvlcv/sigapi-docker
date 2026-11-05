-- =========================================================
-- PROYECTO SIGAPI - BASE DE DATOS DE PRUEBA
-- Motor: PostgreSQL 15
-- Tabla: estudiantes
-- =========================================================

-- 1. Creación de la tabla
CREATE TABLE IF NOT EXISTS estudiantes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL UNIQUE,
    carrera VARCHAR(100) NOT NULL,
    semestre INT NOT NULL CHECK (semestre BETWEEN 1 AND 12),
    edad INT NOT NULL CHECK (edad > 0),
    ciudad VARCHAR(50) NOT NULL
);

-- 2. Inserción de 10 estudiantes ficticios
-- ON CONFLICT evita duplicar documentos o correos si se ejecuta
-- nuevamente el script.
INSERT INTO estudiantes
    (nombre, apellido, documento, correo, carrera, semestre, edad, ciudad)
VALUES
    ('Daniel', 'Rodriguez', '100000001', 'daniel.rodriguez@uni.edu', 'Ingenieria de Sistemas', 3, 20, 'Bogota'),
    ('Laura', 'Martinez', '100000002', 'laura.martinez@uni.edu', 'Ingenieria Industrial', 5, 22, 'Medellin'),
    ('Andres', 'Gomez', '100000003', 'andres.gomez@uni.edu', 'Administracion de Empresas', 2, 19, 'Cali'),
    ('Camila', 'Torres', '100000004', 'camila.torres@uni.edu', 'Ingenieria de Sistemas', 6, 23, 'Bogota'),
    ('Sebastian', 'Ramirez', '100000005', 'sebastian.ramirez@uni.edu', 'Contaduria Publica', 4, 21, 'Bucaramanga'),
    ('Valentina', 'Perez', '100000006', 'valentina.perez@uni.edu', 'Psicologia', 3, 20, 'Cartagena'),
    ('Juan', 'Hernandez', '100000007', 'juan.hernandez@uni.edu', 'Ingenieria de Sistemas', 1, 18, 'Bogota'),
    ('Isabella', 'Castro', '100000008', 'isabella.castro@uni.edu', 'Derecho', 7, 24, 'Medellin'),
    ('Mateo', 'Morales', '100000009', 'mateo.morales@uni.edu', 'Ingenieria Industrial', 2, 19, 'Cali'),
    ('Sofia', 'Vargas', '100000010', 'sofia.vargas@uni.edu', 'Diseno Grafico', 5, 22, 'Pereira')
ON CONFLICT DO NOTHING;

-- 3. Sincronización de la secuencia SERIAL
-- El siguiente registro recibirá un ID posterior al máximo existente.
SELECT setval(
    pg_get_serial_sequence('estudiantes', 'id'),
    COALESCE((SELECT MAX(id) FROM estudiantes), 1),
    EXISTS (SELECT 1 FROM estudiantes)
);

-- 4. Consulta de verificación
SELECT *
FROM estudiantes
ORDER BY id;
