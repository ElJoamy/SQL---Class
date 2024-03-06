-- Tipo de join: INNER JOIN
SELECT o.OrderID, c.CustomerName, o.OrderDate
FROM Orders AS o
INNER JOIN Customers AS c ON o.CustomerID = c.CustomerID;


-- Tipo de join: LEFT JOIN
SELECT c.CustomerName, o.OrderID
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID;


-- Tipo de join: RIGHT JOIN
SELECT e.Name, m.Name AS ManagerName
FROM Employees AS e
LEFT JOIN Employees AS m ON e.ManagerID = m.EmployeeID;


-- Tipo de join: FULL JOIN
SELECT c.CustomerName, o.OrderID
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerName, o.OrderID
FROM Customers AS c
RIGHT JOIN Orders AS o ON c.CustomerID = o.CustomerID;


-- Tipo de join: CROSS JOIN
SELECT e1.Name AS EmployeeName, e2.Name AS ManagerName
FROM Employees AS e1
CROSS JOIN Employees AS e2;