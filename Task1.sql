CREATE DATABASE TechShop;

USE TechShop;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Addresses VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT  PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT  PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID INT  PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Addresses ) VALUES
(1,'John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St'),
(2,'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Maple St'),
(3,'Michael', 'Johnson', 'michael.johnson@example.com', '555-8765', '789 Oak St'),
(4,'Emily', 'Brown', 'emily.brown@example.com', '555-4321', '321 Pine St'),
(5,'Chris', 'Davis', 'chris.davis@example.com', '555-0000', '654 Cedar St'),
(6,'Sarah', 'Miller', 'sarah.miller@example.com', '555-8888', '987 Walnut St'),
(7,'David', 'Wilson', 'david.wilson@example.com', '555-9999', '246 Birch St'),
(8,'Jessica', 'Taylor', 'jessica.taylor@example.com', '555-7777', '135 Ash St'),
(9,'Daniel', 'Anderson', 'daniel.anderson@example.com', '555-2222', '975 Spruce St'),
(10,'Laura', 'Thomas', 'laura.thomas@example.com', '555-3333', '864 Redwood St');

INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1,'Smartphone', 'Latest model smartphone', 799.99),
(2,'Laptop', 'High-performance laptop', 1199.99),
(3,'Tablet', 'Portable touchscreen tablet', 499.99),
(4,'Smartwatch', 'Wearable smart device', 199.99),
(5,'Headphones', 'Noise-cancelling headphones', 149.99),
(6,'Camera', 'Digital camera with zoom lens', 699.99),
(7,'Gaming Console', 'Next-gen gaming console', 499.99),
(8,'TV', '4K Ultra HD TV', 899.99),
(9,'Speaker', 'Bluetooth portable speaker', 129.99),
(10,'Drone', 'Quadcopter drone with camera', 399.99);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(90, 1, '2024-09-15', 999.98),
(91, 2, '2024-09-16', 499.99),
(92, 3, '2024-09-17', 1499.98),
(93, 4, '2024-09-18', 249.99),
(94, 5, '2024-09-19', 699.99),
(95, 6, '2024-09-20', 399.99),
(96, 7, '2024-09-21', 799.99),
(97, 8, '2024-09-22', 199.99),
(98, 9, '2024-09-23', 1199.99),
(99, 10, '2024-09-24', 129.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(111, 90, 1, 1),
(222, 91, 2, 1),
(333, 92, 3, 1),
(444, 94, 4, 1),
(555 ,94, 5, 1),
(666, 95, 6, 1),
(777, 96, 7, 1),
(888, 97, 8, 1),
(999, 98, 9, 1),
(101, 99, 10, 1);

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(11, 1, 50, '2024-09-10'),
(12, 2, 30, '2024-09-11'),
(13, 3, 20, '2024-09-12'),
(14, 4, 40, '2024-09-13'),
(15, 5, 10, '2024-09-14'),
(16, 6, 25, '2024-09-15'),
(17, 7, 15, '2024-09-16'),
(18, 8, 35, '2024-09-17'),
(19, 9, 50, '2024-09-18'),
(20, 10, 5, '2024-09-19');

