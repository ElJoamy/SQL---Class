# Práctica 2: GROUP BY, HAVING, Subconsultas y Vistas
Antes de empezar, necesitamos crear la base de datos, las tablas y los datos de ejemplo. 🚀

- Para ello puedes copiar el siguiente script y pegarlo en tu consola de MySQL para crear la base de datos, las tablas y los datos de ejemplo desde el siguiente archivo 📄 [init.sql](/practicas/practica2/scripts/prac2.sql)

- Debes llenar las respuestas en este README.md y en el siguiente archivo 📄 [queries.sql](/practicas/practica2/scripts/queries.sql)

- En este archivo debes poner los queries entre el campo que dice:
```sql
-- Respuesta
```
# Consultas SQL para Cine
Realiza los siguientes queries en la base de datos de un cine. Para entender mejor puedes ver el modelo ER en el siguiente archivo 📄 
![modeloER.png](/practicas/practica2/imgs/cinedbER.png)

## GROUP BY

`GROUP BY` se utiliza para agrupar filas que tienen los mismos valores en columnas especificadas en el conjunto de resultados. Se suele usar con funciones de agregación (`COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`) para realizar cálculos en cada grupo.

### 1: Cantidad de proyecciones por película:

```sql

```

### 2: Ingresos generados por película, ordenados de mayor a menor:

```sql

```

## HAVING

`HAVING` se utiliza para filtrar los resultados de un `GROUP BY` basado en una condición especificada. Es similar a `WHERE`, pero se aplica a grupos de filas después de la agregación.

### 1: Películas con un precio promedio de entrada mayor a 50:

```sql

```

### 2: Salas que han mostrado un amplio rango de géneros de películas:

```sql

```

## Subconsultas

Las subconsultas son consultas SQL dentro de otra consulta SQL. Permiten realizar operaciones más complejas y dinámicas.

### 1: Películas que no han sido proyectadas:

```sql

```

### 2: Clientes que han asistido a todas las películas de un cierto género:

```sql

```

## Vistas

Las vistas son resultados de consultas guardadas como objetos virtuales en la base de datos. Simplifican las consultas complejas y mejoran la seguridad al limitar el acceso a los datos.

### 1: Vista de detalles de proyecciones:

```sql

```

### 2: Vista de ingresos y popularidad por género de película:

```sql

```

## Guía para Estudiantes

### ¿Por qué usamos estas consultas?
- **GROUP BY:** Para analizar datos agregados por categorías específicas. Es esencial para entender las tendencias y los patrones en grandes conjuntos de datos.
- **HAVING:** Permite filtrar los datos agregados basándonos en condiciones específicas. Es crucial para cuando necesitamos condiciones después de realizar una agregación.
- **Subconsultas:** Aportan flexibilidad a nuestras consultas SQL, permitiendo realizar consultas condicionales más complejas y dinámicas dentro de otras consultas.
- **Vistas:** Simplifican el acceso a los datos y las consultas recurrentes. Las vistas pueden mejorar la legibilidad del código y reducir el riesgo de errores en consultas complejas.