-- Retail Store Database SQL Script
-- Tables: Categories, Products, Customers, Orders, OrderItems

-- Drop tables if exist (for easy rerun)
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Categories;

-- CATEGORY TABLE
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

-- PRODUCTS TABLE
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10,2),
    CONSTRAINT fk_category FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- CUSTOMERS TABLE
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    StateName VARCHAR(50)
);

-- ORDERS TABLE
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- ORDER ITEMS TABLE
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    CONSTRAINT fk_order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT fk_product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Sample data: Categories
INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances'),
(4, 'Groceries'),
(5, 'Sports');

-- Sample data: Products
INSERT INTO Products VALUES
(101, 'Smartphone', 1, 15000),
(102, 'Laptop', 1, 55000),
(103, 'Headphones', 1, 1500),
(104, 'T-Shirt', 2, 500),
(105, 'Jeans', 2, 1200),
(106, 'Microwave Oven', 3, 8000),
(107, 'Refrigerator', 3, 30000),
(108, 'Rice (5 Kg)', 4, 250),
(109, 'Milk (1 Litre)', 4, 30),
(110, 'Cricket Bat', 5, 2000);

-- Sample data: Customers
INSERT INTO Customers VALUES
(1, 'Amit Sharma', 'Mumbai', 'Maharashtra'),
(2, 'Priya Verma', 'Delhi', 'Delhi'),
(3, 'Rahul Singh', 'Bengaluru', 'Karnataka'),
(4, 'Sneha Patel', 'Ahmedabad', 'Gujarat'),
(5, 'Arjun Mehta', 'Pune', 'Maharashtra');

-- Sample data: Orders
INSERT INTO Orders VALUES
(201, 1, '2024-01-05'),
(202, 2, '2024-01-12'),
(203, 3, '2024-02-10'),
(204, 4, '2024-02-15'),
(205, 5, '2024-03-01'),
(206, 1, '2024-03-10'),
(207, 3, '2024-03-20');

-- Sample data: OrderItems
INSERT INTO OrderItems VALUES
(1, 201, 101, 1),
(2, 201, 103, 2),
(3, 202, 102, 1),
(4, 203, 104, 3),
(5, 203, 105, 1),
(6, 204, 110, 1),
(7, 205, 108, 2),
(8, 205, 109, 5),
(9, 206, 106, 1),
(10, 207, 101, 1),
(11, 207, 103, 1);
