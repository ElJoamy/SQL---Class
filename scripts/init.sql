-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS Prueba;
USE Prueba;

-- Crear las tablas
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100), 
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100)
);

-- Insertar datos
INSERT INTO Customers (CustomerName) VALUES 
('Empresa 1'),
('Empresa 2'),
('Empresa 3');

INSERT INTO Orders (CustomerID, OrderDate) VALUES 
(1, '2024-01-01'),
(2, '2024-01-02'),
(1, '2024-01-03'),
(3, '2024-01-04');


INSERT INTO Employees (Name, ManagerID) VALUES 
('Empleado 1', NULL),
('Empleado 2', 1),
('Empleado 3', 1);

INSERT INTO Products (ProductName) VALUES 
('Producto 1'),
('Producto 2'),
('Producto 3');

