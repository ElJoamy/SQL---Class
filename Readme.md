# SQL Queries for Beginners
- SQL es un lenguaje de programación que se utiliza para gestionar y manipular bases de datos.

## Scripts
### COMO CREAR NUESTRO AMBIENTE DE TRABAJO
- Para crear nuestro ambiente de trabajo primero debemos crear una base de datos.
```sql
CREATE DATABASE IF NOT EXISTS mydatabase;
```
- Luego, debemos seleccionar la base de datos que acabamos de crear.
```sql
USE mydatabase;
```
- Ahora, podemos crear una tabla en nuestra base de datos.
```sql
CREATE TABLE IF NOT EXISTS mytable (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  age INT
);
```
- Finalmente, podemos insertar algunos datos en nuestra tabla.
```sql
INSERT INTO mytable (name, age) VALUES
  ('John Doe', 25),
  ('Jane Doe', 30),
  ('Janet Doe', 20);
```

## SQL JOINs
- Para poder usar los querys de ejemplo, primero debemos crear las tablas y los datos de ejemplo.

- Puedes copiar el siguiente script y pegarlo en tu consola de MySQL para crear la base de datos, las tablas y los datos de ejemplo desde el siguiente archivo [script.sql](/init.sql).

- Puedes consultar tambien los querys de ejemplo desde el siguiente archivo [queries.sql](/queries.sql).

### INNER JOIN
-- **Tipo de join**: INNER JOIN
-- **Explicación**: El `INNER JOIN` es el tipo de join más común. Este tipo de join devuelve los registros que tienen un valor coincidente en ambas tablas.
-- **Ejemplo Simulado**: Imagina que quieres encontrar todos los pedidos realizados por los clientes, mostrando la ID del pedido, el nombre del cliente y la fecha del pedido.
-- **Query**:
```sql
SELECT o.OrderID, c.CustomerName, o.OrderDate
FROM Orders AS o
INNER JOIN Customers AS c ON o.CustomerID = c.CustomerID;
```
-- **Explicación del resultado**: Este query muestra una lista de todas las órdenes junto con el nombre del cliente que las realizó y la fecha del pedido. Solo se incluyen las órdenes que tienen un `CustomerID` coincidente en la tabla `Customers`.


### LEFT JOIN
-- **Tipo de join**: LEFT JOIN
-- **Explicación**: El `LEFT JOIN` devuelve todos los registros de la tabla de la izquierda (Customers), y los registros coincidentes de la tabla de la derecha (Orders). Si no hay coincidencia, el resultado de la derecha será NULL.
-- **Ejemplo Simulado**: Supongamos que deseas listar todos los clientes y cualquier pedido que hayan hecho, si es que hicieron alguno.
-- **Query**:
```sql
SELECT c.CustomerName, o.OrderID
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID;
```
-- **Explicación del resultado**: Este query muestra todos los clientes, incluso aquellos que no han hecho ningún pedido. Para los clientes que no tienen pedidos, el `OrderID` aparecerá como NULL.


### RIGHT JOIN
-- **Tipo de join**: RIGHT JOIN
-- **Explicación**: El `RIGHT JOIN` se ha equivocado en la explicación inicial; debería ser un ejemplo de un `SELF JOIN` que muestra la relación entre empleados y sus managers.
-- **Ejemplo Simulado** (Corregido para `SELF JOIN`): Imagina que quieres listar a todos los empleados y sus respectivos managers por nombre.
-- **Query**:
```sql
SELECT e.Name, m.Name AS ManagerName
FROM Employees AS e
LEFT JOIN Employees AS m ON e.ManagerID = m.EmployeeID;
```
-- **Explicación del resultado**: Este query muestra todos los empleados junto con el nombre de su manager. Si un empleado no tiene manager, el nombre del manager será NULL.


### FULL JOIN
-- **Tipo de join**: FULL JOIN (Simulado para MySQL)
-- **Explicación**: Un `FULL JOIN` combina los resultados de un `LEFT JOIN` y un `RIGHT JOIN`, mostrando todos los registros cuando hay una coincidencia en cualquiera de las tablas.
-- **Ejemplo Simulado**: Imagina que deseas obtener una lista completa de todos los clientes y sus pedidos, incluyendo aquellos clientes sin pedidos y pedidos sin clientes.
-- **Query**:
```sql
SELECT c.CustomerName, o.OrderID
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerName, o.OrderID
FROM Customers AS c
RIGHT JOIN Orders AS o ON c.CustomerID = o.CustomerID;
```
-- **Explicación del resultado**: Este query simula un `FULL JOIN` en MySQL, mostrando todos los clientes y todos los pedidos, incluyendo aquellos sin coincidencia directa entre cliente y pedido.


### CROSS JOIN
-- **Tipo de join**: CROSS JOIN
-- **Explicación**: El `CROSS JOIN` realiza un producto cartesiano entre las dos tablas, combinando cada fila de una tabla con todas las filas de la otra tabla.
-- **Ejemplo Simulado**: Considera que deseas ver todas las posibles combinaciones de empleados y managers, independientemente de su relación real.
-- **Query** (Ajustado para CROSS JOIN):
```sql
SELECT e1.Name AS EmployeeName, e2.Name AS ManagerName
FROM Employees AS e1
CROSS JOIN Employees AS e2;
```
-- **Explicación del resultado**: Este query muestra todas las posibles combinaciones de empleados como si uno fuera el manager del otro, lo que resulta en un número total de filas igual al cuadrado del número de empleados.

## Author
