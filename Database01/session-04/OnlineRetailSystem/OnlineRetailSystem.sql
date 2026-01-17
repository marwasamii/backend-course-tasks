------------------------------------------------------------------------
----------------------- Online Retail Store ----------------------------
------------------------------------------------------------------------


------------------------ Insert Operations -----------------------------

-- 1.Insert a new Customer (FullName, PhoneNumber, Email, ShippingAddress, RegistrationDate)

INSERT INTO Customers (FullName, PhoneNumber, Email, ShippingAddress, RegistraionDate)
VALUES ('Anas Sami',   '01234567890', 'anassami@gmail.com', '12 Tahrir St, Downtown, Cairo, Egypt', '10/1/2024');

SELECT * FROM Customers;

-- 2.Insert 3 new Suppliers

INSERT INTO Suppliers
VALUES 
(1,'Ali Sami', 'Cairo', 'alisami@gmail.com', '12 Tahrir St, Downtown, Cairo, Egypt', '01234567890'),
(2,'Yaseen Sami', 'Giza',  'yasoo@gmail.com',     '12 Tahrir St, Downtown, Giza, Egypt',  '01134567890'),
(3,'Baraa Sami',  'Giza',  'beroo@gmail.com',     '12 Tahrir St, Downtown, Giza, Egypt',  '33344455566');

SELECT * FROM Suppliers;

-- 3.Insert 2 Categories

INSERT INTO Categories
VALUES
(1, 'Mobiles', 'Smartphones and mobile accessories', 2),
(2, 'Laptops', 'Personal and business laptops', 2);

SELECT * FROM Categories;


-- 4.Insert a Product but only (Name, UnitPrice)

INSERT INTO Products(Name, UnitPrice)
VALUES ('Keyboard', 350);

SELECT * FROM Products;

-- 5.Create table ArchivedStock (TranId, ProductId, QuantityChange, TranDate) Insert into ArchivedStock all StockTransactions before 2023

SELECT * FROM Stock_Transactions;

INSERT INTO Products
(StockQuantity, [Name], AddedDate, [Description], UnitPrice, CategoryID)
VALUES
(100, 'Keyboard',  '2026-01-15', 'Mechanical keyboard', 350.00, 1),
(50,  'Mouse',     '2026-01-16', 'Wireless mouse',     200.00, 1),
(30,  'Laptop HP', '2026-01-17', 'HP Business Laptop', 18500.00, 2);


INSERT INTO Stock_Transactions
VALUES 
('2026-01-15',  100, 'IN',  'Initial Stock',6),
('2026-01-16',  -20, 'OUT', 'Customer Order #105', 6),
('2026-01-17',   50, 'IN',  'Supplier Invoice #77',7);

INSERT INTO Stock_Transactions
VALUES 
('2022-01-15',  100, 'IN',  'Initial Stock',6),
('2020-01-16',  -20, 'OUT', 'Customer Order #105', 6);

CREATE TABLE ArchivedStock
(
	TranId INT PRIMARY KEY,
	ProductId INT FOREIGN KEY REFERENCES Products(ProductID),
	QuantityChange INT,
	TranDate DATE
);

INSERT INTO ArchivedStock (TranId, ProductId, QuantityChange, TranDate)
SELECT TranID, ProductID, QuantityChange, TranDate
FROM Stock_Transactions
WHERE TranDate < '2023';

SELECT * FROM ArchivedStock;


----------------------------- TEMPORARY TABLES -----------------------
--1.Create #CustomerOrders with (OrderId, CustomerId, TotalAmount) Insert customers who made orders above 5000. 

CREATE TABLE #CustomerOrders
(
	OrderId INT,
    CustomerId INT,
    TotalAmount DECIMAL(10,2)
);

SELECT * FROM Orders;

INSERT INTO Orders 
VALUES
('Completed', 6000, '2026-01-10', 6),
('Pending',   4500, '2026-01-12', 6),
('Completed', 7500, '2026-01-13', 6),
('Cancelled', 3000, '2026-01-14', 6),
('Completed', 12000,'2026-01-15', 6);

INSERT INTO #CustomerOrders
SELECT OrderID, CustomerID, TotalAmount
FROM Orders
WHERE TotalAmount > 5000;

SELECT * FROM #CustomerOrders;
--2.Create ##TopRatedProducts with (ProductId, Rating) Insert products with rating ≥ 4.5 

CREATE TABLE ##TopRatedProducts
(
	ProductId INT,
    Rating DECIMAL(2,1),
);

SELECT * FROM Customers;
SELECT * FROM Products;

INSERT INTO Reviews (Rating, [Date], Comment, ProductID, CustomerID)
VALUES
(4.8, '2026-1-10', 'Excellent product, highly recommend!', 1, 6),
(4.5, '2026-01-12', 'Good quality, but a bit expensive.', 6, 6);


INSERT INTO ##TopRatedProducts(ProductId, Rating)
SELECT c.ProductID, r.Rating
FROM Products AS c, Reviews AS r
WHERE r.Rating >= 4.5;

SELECT * FROM ##TopRatedProducts;

--------------------------- UPDATE OPERATIONS -------------------------------- 


--1. Increase all UnitPrice by 10% for products under 100 EGP 
 UPDATE Products
 SET UnitPrice += UnitPrice * 0.1
 WHERE UnitPrice < 100;

 SELECT * FROM Products;

--2. Update Order Status: If TotalAmount > 5000 → “Premium” Else → “Standard”

SELECT * FROM Orders;

UPDATE Orders
SET STATUS = CASE 
	WHEN TotalAmount > 5000 THEN 'Premium'
	ELSE 'Standard'
	END;

SELECT * FROM Orders;

-------------------------------- DELETE OPERATIONS ---------------------------------------
--1. Delete a Review by ReviewId 

SELECT * FROM Reviews;
DELETE Reviews WHERE ReviewID = 5;

--2. Delete all Orders with Status = “Cancelled 

SELECT * FROM Orders;
DELETE Orders WHERE Status = 'Cancelled';

--3. Delete OrderItems for a given OrderId 
SELECT * FROM OrderItems;
DELETE OrderItems WHERE OrderID = 1;

--------------------------------- MERGE OPERATION ------------------------------------------ 
--1. Create table #ProductsUpdate (ProductId, Name, UnitPrice, StockQuantity) 
CREATE TABLE #ProductsUpdate
(
    ProductID INT,
    [Name] VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    StockQuantity INT
);

--2. MERGE logic: If product exists → UPDATE price & stock If new → INSERT DELETE 
INSERT INTO #ProductsUpdate (ProductID, [Name], UnitPrice, StockQuantity)
VALUES
(1, 'Keyboard', 360.00, 120),   
(2, 'Mouse',    210.00, 60),    
(4, 'Webcam',   500.00, 30);   

MERGE INTO Products AS t
USING #ProductsUpdate AS s
ON t.ProductID = s.ProductID
WHEN MATCHED THEN 
    UPDATE SET 
        t.UnitPrice = s.UnitPrice,
        t.StockQuantity = s.StockQuantity
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Name], UnitPrice, StockQuantity)
    VALUES (s.[Name], s.UnitPrice, s.StockQuantity);

SELECT * FROM Products;