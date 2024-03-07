# Práctica 1: Consultas SQL
## SQL JOINs 🤝
### 2 INNER JOIN

**Ejercicio 1:**
Encuentra los nombres de los estudiantes y las materias en las que están inscritos.

```sql

```

**Ejercicio 2:**
Encuentra los nombres de los profesores y las materias que enseñan.

```sql

```

### 2 LEFT JOIN

**Ejercicio 1:**
Lista todos los estudiantes y sus notas en Matemáticas, incluidos aquellos que no están inscritos en Matemáticas.

```sql

```

**Ejercicio 2:**
Lista todos los estudiantes y las materias a las que no están inscritos.

```sql

```

### 2 RIGHT JOIN

Dado que MySQL no implementa `RIGHT JOIN` de manera que sea directamente invertible al `LEFT JOIN` sin ajustar la lógica, estos ejercicios son más conceptuales y dependen de la estructura de tu consulta.

**Ejercicio 1:**
Listar todas las materias junto con los estudiantes inscritos, incluyendo materias sin estudiantes.

```sql

```

**Ejercicio 2:**
Listar todos los profesores junto con las materias que enseñan, incluso si no tienen una materia asignada.

```sql

```

### 1 FULL JOIN

**Ejercicio:**
Lista todos los estudiantes y todas las materias, mostrando quién está inscrito en qué, incluyendo estudiantes sin materias y materias sin estudiantes.

Dado que MySQL no soporta `FULL JOIN` directamente, simulamos este comportamiento:

```sql

```

### 1 CROSS JOIN

**Ejercicio:**
Genera una lista de todas las posibles combinaciones de estudiantes y profesores.

```sql

```

### 1 SELF JOIN

**Ejercicio:**
Encuentra pares de estudiantes que compartan el mismo grado.

```sql

```

