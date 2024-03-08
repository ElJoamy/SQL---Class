CREATE DATABASE IF NOT EXISTS banco;
USE banco;

-- 1 Obtenga los nombres de los clientes que tienen préstamos con garantía de
-- inmuebles que se encuentran en la zona “sur”
SELECT c.nombre
FROM cliente c
JOIN
    prestamo p ON c.CI = p.CI
JOIN
    garantia g ON p.COD_P = g.COD_P
JOIN
    tipo_garantia tg ON g.COD_tipo_garantia = tg.COD_tipo_garantia
WHERE g.zona_garantia = 'Sur' AND tg.tipo = 'Inmueble';

-- Obtenga los nombres de clientes que tengan “NULL” en el atributo fecha de
-- nacimiento
SELECT c.nombre
FROM cliente c
WHERE c.fecha_nacimiento IS NULL;

-- Obtenga los nombres de los clientes para los cuales su nombre concluye con una
-- “A”
SELECT c.apellido
FROM cliente c
WHERE c.apellido LIKE '%A';

-- Obtenga los nombres de clientes que son de la misma ciudad
Select c1.nombre, c1.apellido, c2.nombre AS nombre_companero, c2 .apellido AS apellido_companero,c1.ciudad
FROM cliente c1
JOIN
    cliente c2 ON c1.ciudad = c2.ciudad AND c1.CI <> c2.CI;
-- <> es desigualdad

-- Obtenga el total de pagos por préstamo de “Juan Pérez”
SELECT c.nombre, c.apellido, p.COD_P, COUNT(pg.COD_pagos) AS total_pagos
FROM cliente c
JOIN
    prestamo p ON c.CI = p.CI
JOIN
    pagos pg ON p.COD_P = pg.COD_P
WHERE c.nombre = 'Juan' AND c.apellido = 'Pérez'
GROUP BY c.nombre, c.apellido, p.COD_P;

-- Obtenga los nombres de clientes que tienen préstamos mayores al promedio de
-- monto de préstamos.
SELECT c.nombre, c.apellido
FROM cliente c
JOIN
    prestamo p ON c.CI = p.CI
WHERE p.monto > (SELECT AVG(monto) FROM prestamo);


-- EXTRA
-- Obtenga el detalle de pagos por cada préstamo que ha realizado el cliente "Juan Pérez".
SELECT c.nombre, c.apellido, p.COD_P, pa.COD_pagos, pa.cantidad_pago, pa.fecha_pagos
FROM cliente c
JOIN
    prestamo p ON c.CI = p.CI
JOIN
    pagos pa ON p.COD_P = pa.COD_P
WHERE c.nombre = 'Juan' AND c.apellido = 'Pérez';