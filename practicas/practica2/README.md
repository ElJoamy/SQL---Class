# GROUP BY, HAVING, Subconsultas y Vistas
Antes de empezar, necesitamos crear la base de datos, las tablas y los datos de ejemplo. 🚀

- Para ello puedes copiar el siguiente script y pegarlo en tu consola de MySQL para crear la base de datos, las tablas y los datos de ejemplo desde el siguiente archivo 📄 [init.sql](/practicas/practica2/scripts/init.sql)

- Debes llenar las respuestas en este README.md y en el siguiente archivo 📄 [queries.sql](/practicas/practica2/scripts/queries.sql)

- En este archivo debes poner los queries entre el campo que dice:
```sql
-- Respuesta
```

## SQL 🤝
Para entender un poco aca esta el `modelo ER` de la base de datos que vamos a usar:

![Modelo ER](/practicas/practica2/imgs/escuelaER.png)

## NUEVAS CONSULTAS
### GROUP BY
- El `GROUP BY` se utiliza para agrupar filas que tienen el mismo valor en una o más columnas.
- Se lo utiliza en conjunto con funciones de agregación (como `COUNT()`, `SUM()`, `AVG()`, `MAX()`, `MIN()`).

1. **Calcular el promedio de notas por materia**:
   Este ejemplo muestra cómo usar `GROUP BY` para agrupar las notas por materia y calcular el promedio de cada una.

   ```sql
   SELECT M.MateriaID, M.Nombre, AVG(N.Nota) AS PromedioNota
   FROM Notas N
   JOIN Materias M ON N.MateriaID = M.MateriaID
   GROUP BY M.MateriaID, M.Nombre;
   ```
    - ¿Qué hace el `GROUP BY` en este caso?
        - Agrupa las notas por materia.
    - ¿Qué hace la función `AVG()`?
        - Calcula el promedio de las notas ya que `AVG()` es una función de agregación que calcula el promedio de un conjunto de valores.


2. **Contar el número de estudiantes por grado**:
   Aquí, usamos `GROUP BY` para contar cuántos estudiantes hay en cada grado.

   ```sql
   SELECT G.Nivel, COUNT(E.EstudianteID) AS NumeroEstudiantes
   FROM Estudiantes E
   JOIN Grados G ON E.GradoID = G.GradoID
   GROUP BY G.Nivel;
   ```
    - ¿Qué hace el `GROUP BY` en este caso?
        - Agrupa los estudiantes por grado.
    - ¿Qué hace la función `COUNT()`?
        - Cuenta el número de estudiantes en cada grado.

### HAVING
- El `HAVING` se utiliza para filtrar los resultados de un `GROUP BY`.
- Se lo utiliza para aplicar condiciones a los grupos creados con `GROUP BY`.

1. **Materias con más de 5 estudiantes inscritos**:
   Utilizamos `GROUP BY` junto con `HAVING` para filtrar las materias que tienen más de 5 estudiantes inscritos.

   ```sql
   SELECT M.Nombre, COUNT(I.EstudianteID) AS TotalEstudiantes
   FROM Inscripciones I
   JOIN Materias M ON I.MateriaID = M.MateriaID
   GROUP BY M.Nombre
   HAVING COUNT(I.EstudianteID) > 5;
   ```
    - ¿Por qué no podemos usar `WHERE` en lugar de `HAVING` en este caso?
        - No podemos usar `WHERE` en lugar de `HAVING` porque `HAVING` se utiliza para filtrar los resultados de un `GROUP BY`, mientras que `WHERE` se utiliza para filtrar filas antes de que se agrupen.
    - ¿Qué hace el `HAVING` en este caso?
        - Filtra las materias que tienen más de 5 estudiantes inscritos.

2. **Profesores que dictan más de una materia**:
   Este ejemplo muestra cómo identificar a los profesores que están a cargo de más de una materia usando `HAVING`.

   ```sql
   SELECT P.Nombre, P.Apellido, COUNT(P.MateriaID) AS MateriasDictadas
   FROM Profesores P
   GROUP BY P.Nombre, P.Apellido
   HAVING COUNT(P.MateriaID) > 1;
   ```
    - ¿Por qué no podemos usar `WHERE` en lugar de `HAVING` en este caso?
        - No podemos usar `WHERE` en lugar de `HAVING` en este caso porque `HAVING` se utiliza para filtrar los resultados de un `GROUP BY`, mientras que `WHERE` se utiliza para filtrar filas antes de que se agrupen.
    - ¿Qué hace el `HAVING` en este caso?
        - Filtra los profesores que están a cargo de más de una materia.

### Subconsultas
- Las subconsultas son consultas anidadas dentro de otras consultas.
- Se pueden utilizar en la cláusula `SELECT`, `FROM`, `WHERE`, `HAVING`, `INSERT`, `UPDATE` y `DELETE`.

1. **Estudiantes inscritos en todas las materias**:
   Usando subconsultas, podemos encontrar estudiantes que están inscritos en todas las materias disponibles.

   ```sql
   SELECT E.Nombre, E.Apellido
   FROM Estudiantes E
   WHERE (SELECT COUNT(DISTINCT MateriaID) FROM Inscripciones WHERE EstudianteID = E.EstudianteID) = (SELECT COUNT(*) FROM Materias);
   ```
    - ¿Qué hace la subconsulta en este caso?
        - La subconsulta cuenta el número de materias en las que está inscrito cada estudiante.
    - ¿Por qué se utiliza `DISTINCT` en la subconsulta?
        - Se utiliza `DISTINCT` para contar el número de materias únicas en las que está inscrito cada estudiante.
    - ¿Por qué se compara con el número total de materias?
        - Se compara con el número total de materias para identificar a los estudiantes que están inscritos en todas las materias disponibles.

2. **Materias sin estudiantes inscritos**:
   Este ejemplo identifica materias a las que no se ha inscrito ningún estudiante.

   ```sql
   SELECT M.Nombre
   FROM Materias M
   WHERE NOT EXISTS (SELECT * FROM Inscripciones I WHERE I.MateriaID = M.MateriaID);
   ```
    - ¿Qué hace la subconsulta en este caso?
        - La subconsulta verifica si hay alguna inscripción para cada materia.
    - ¿Por qué se utiliza `NOT EXISTS` en la subconsulta?
        - Se utiliza `NOT EXISTS` para verificar si no hay ninguna inscripción para cada materia.

### Vistas
- Las vistas son consultas predefinidas que se almacenan en la base de datos y se pueden consultar como si fueran tablas.
- Se utilizan para simplificar consultas complejas y para reutilizar consultas comunes.

1. **Vista de promedio de notas por estudiante**:
   Creamos una vista que facilita la consulta del promedio de notas de cada estudiante.

   ```sql
   CREATE VIEW VistaPromedioNotas AS
   SELECT E.EstudianteID, E.Nombre, E.Apellido, AVG(N.Nota) AS Promedio
   FROM Estudiantes E
   JOIN Notas N ON E.EstudianteID = N.EstudianteID
   GROUP BY E.EstudianteID, E.Nombre, E.Apellido;
   ```
   - ¿Por qué es útil crear una vista para esto?
       - Es útil crear una vista para facilitar la consulta del promedio de notas de cada estudiante sin tener que escribir la consulta compleja cada vez.
    - ¿Cómo se consulta la vista?
        - Para consultar la vista, simplemente usamos la siguiente consulta: `SELECT * FROM VistaPromedioNotas;`.

2. **Vista de profesores y las materias que enseñan**:
   Creamos una vista para ver fácilmente qué materias enseña cada profesor.

   ```sql
   CREATE VIEW VistaProfesoresMaterias AS
   SELECT P.Nombre, P.Apellido, M.Nombre AS Materia
   FROM Profesores P
   JOIN Materias M ON P.MateriaID = M.MateriaID;
   ```
    - ¿Por qué es útil crear una vista para esto?
        - Es útil crear una vista para ver fácilmente qué materias enseña cada profesor sin tener que escribir la consulta compleja cada vez.
    - ¿Cómo se consulta la vista?
        - Para consultar la vista, simplemente usamos la siguiente consulta: `SELECT * FROM VistaProfesoresMaterias;`.