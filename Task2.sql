
-- Retrieve names and emails of all customers
SELECT FirstName, LastName, Email 
FROM Customers;

-- List all orders with their order dates and corresponding customer names
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName 
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Insert a new customer record into the "Customers" table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Addresses) 
VALUES (11,'Mark', 'Williams', 'mark.williams@example.com', '555-5678', '789 Cherry St');

-- Update the prices of all electronic gadgets in the "Products" table by increasing them by 10%
UPDATE Products 
SET Price = Price * 1.10;

-- Delete a specific order and its associated order details
DELETE FROM OrderDetails 
WHERE OrderID = 94;  
DELETE FROM Orders 
WHERE OrderID = 94;

-- Insert a new order into the "Orders" table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) 
VALUES (94, 3, '2024-09-25', 1200.50);

-- Update the contact information of a specific customer
UPDATE Customers 
SET Email = 'new.email@example.com', Addresses = 'New Address, 456 Oak St'
WHERE CustomerID = 8;

-- Recalculate and update the total cost of each order based on prices and quantities
UPDATE Orders 
SET TotalAmount = (
    SELECT SUM(OrderDetails.Quantity * Products.Price) 
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    WHERE OrderDetails.OrderID = Orders.OrderID
);

-- Delete all orders and their associated order details for a specific customer
DELETE FROM OrderDetails 
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 7);
DELETE FROM Orders 
WHERE CustomerID = 7;

-- Insert a new electronic gadget product into the "Products" table
INSERT INTO Products (ProductID, ProductName, Description, Price) 
VALUES (15, 'Smart Speaker', 'Voice-controlled smart speaker', 249.99);

-- Update the status of a specific order
ALTER TABLE Orders 
ADD Status VARCHAR(20);
UPDATE Orders 
SET Status = 'Shipped'
WHERE OrderID = 93;

-- Calculate and update the number of orders placed by each customer in the "Customers" table
ALTER TABLE Customers
ADD NoOfOrders INT
UPDATE Customers 
SET NoOfOrders = (
    SELECT COUNT(*) 
    FROM Orders 
    WHERE Orders.CustomerID = Customers.CustomerID
);
