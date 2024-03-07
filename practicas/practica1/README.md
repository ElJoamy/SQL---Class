# Práctica 1: Consultas SQL 
Antes de empezar, necesitamos crear la base de datos, las tablas y los datos de ejemplo. 🚀

- Para ello puedes copiar el siguiente script y pegarlo en tu consola de MySQL para crear la base de datos, las tablas y los datos de ejemplo desde el siguiente archivo 📄 [init.sql](/practicas/practica1/scripts/init.sql)

- Debes llenar las respuestas en este README.md y en el siguiente archivo 📄 [queries.sql](/practicas/practica1/scripts/queries.sql)

- En este archivo debes poner los queries entre el campo que dice:
```sql
-- Respuesta
```

## SQL JOINs 🤝
Para entender un poco aca esta el `modelo ER` de la base de datos que vamos a usar:

![Modelo ER](/practicas/practica1/imgs/escuelaER.png)

### 2 INNER JOIN

**Ejercicio 1:**
Encuentra los nombres de los estudiantes y las materias en las que están inscritos.

```sql
-- Respuesta
```

**Ejercicio 2:**
Encuentra los nombres de los profesores y las materias que enseñan.

```sql
-- Respuesta
```

### 2 LEFT JOIN

**Ejercicio 1:**
Lista todos los estudiantes y sus notas en Matemáticas, incluidos aquellos que no están inscritos en Matemáticas.

```sql
-- Respuesta
```

**Ejercicio 2:**
Lista todos los estudiantes y las materias a las que no están inscritos.

```sql
-- Respuesta
```

### 2 RIGHT JOIN

Dado que MySQL no implementa `RIGHT JOIN` de manera que sea directamente invertible al `LEFT JOIN` sin ajustar la lógica, estos ejercicios son más conceptuales y dependen de la estructura de tu consulta.

**Ejercicio 1:**
Listar todas las materias junto con los estudiantes inscritos, incluyendo materias sin estudiantes.

```sql
-- Respuesta
```

**Ejercicio 2:**
Listar todos los profesores junto con las materias que enseñan, incluso si no tienen una materia asignada.

```sql
-- Respuesta
```

### 1 FULL JOIN

**Ejercicio:**
Lista todos los estudiantes y todas las materias, mostrando quién está inscrito en qué, incluyendo estudiantes sin materias y materias sin estudiantes.

Dado que MySQL no soporta `FULL JOIN` directamente, simulamos este comportamiento:

```sql
-- Respuesta
```

### 1 CROSS JOIN

**Ejercicio:**
Genera una lista de todas las posibles combinaciones de estudiantes y profesores.

```sql
-- Respuesta
```

### 1 SELF JOIN

**Ejercicio:**
Encuentra pares de estudiantes que compartan el mismo grado.

```sql
-- Respuesta
```