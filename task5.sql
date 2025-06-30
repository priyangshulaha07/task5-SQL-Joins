create database JOINS ;
USE JOINS;

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert sample data into Customers
INSERT INTO Customers VALUES
(1, 'Alice', 'Delhi'),
(2, 'Bob', 'Mumbai'),
(3, 'Charlie', 'Kolkata'),
(4, 'Diana', 'Chennai');

-- Insert sample data into Orders
INSERT INTO Orders VALUES
(101, 1, '2025-06-01', 1500.00),
(102, 2, '2025-06-05', 2200.00),
(103, 1, '2025-06-10', 900.00);
 -- Note: customer_id 5 does not exist in Customers

-- INNER JOIN 
SELECT Customers.name, Orders.order_id, Orders.amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- LEFT JOIN
SELECT Customers.name, Orders.order_id, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- RIGHT JOIN 
SELECT Customers.name, Orders.order_id, Orders.amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- FULL OUTER JOIN 
SELECT Customers.name, Orders.order_id, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.name, Orders.order_id, Orders.amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

