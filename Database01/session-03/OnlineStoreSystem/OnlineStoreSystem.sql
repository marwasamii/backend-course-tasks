--------------------------------------------------------------------------
---------------- Online Retail Store Management System -------------------
--------------------------------------------------------------------------

CREATE DATABASE OnlineSoteDB;
USE  OnlineSoteDB;

----------------------------------- Tables -------------------------------

CREATE TABLE Suppliers
(
	SupplierID INT PRIMARY KEY,
	[Name] VARCHAR(50),
	Country VARCHAR(50),
	Email VARCHAR(50),
	[Address] VARCHAR(50),
	ContactNumber VARCHAR(50)
);
ALTER TABLE Suppliers
ALTER COLUMN [Address] VARCHAR(100);

CREATE TABLE Products
(
	ProductID INT PRIMARY KEY IDENTITY,
	StockQuantity INT,
	[Name] VARCHAR(50),
	AddedDate DATE,
	[Description] VARCHAR(100),
	UnitPrice DECIMAL(10,2),
	CategoryID INT
);

CREATE TABLE Categories
(
	CategoryID INT PRIMARY KEY,
	[Name] VARCHAR(50),
	[Description] VARCHAR(100),
	MainCategory INT 
);

ALTER TABLE Categories 
ADD CONSTRAINT Categories_FK FOREIGN KEY (MainCategory) REFERENCES Categories(CategoryID);

ALTER TABLE Products
ADD CONSTRAINT Products_FK FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID);

CREATE TABLE Products_Suppliers
(
	SupplierID INT,
	ProductID INT,
	PRIMARY KEY(SupplierID, ProductID),
	FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID),
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Stock_Transactions
(
	TranID INT PRIMARY KEY IDENTITY,
	TranDate DATE,
	QuantityChange INT,
	[Type] VARCHAR(20),
	Referece VARCHAR(50),
	ProductID INT FOREIGN KEY REFERENCES Products(ProductID)
);

CREATE TABLE Customers
(
	CustomerID INT PRIMARY KEY IDENTITY,
	FullName VARCHAR(100),
	PhoneNumber VARCHAR(20),
	Email VARCHAR(50),
	ShippingAddress VARCHAR(50),
	RegistraionDate DATE
);


CREATE TABLE Payment
(
	PaymentID INT PRIMARY KEY IDENTITY,
	PaymentDate DATE,
	Amount DECIMAL(10,2),
	[Status] VARCHAR(20),
	Method VARCHAR(20)
);

CREATE TABLE Reviews
(
	ReviewID INT PRIMARY KEY IDENTITY,
	Rating DECIMAL(2,1),
	[Date] DATE,
	Comment VARCHAR(100),
	ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)

);

CREATE TABLE OrderItems
(
	OrderItemID INT PRIMARY KEY IDENTITY,
	Quantity INT,
	UnitPrice DECIMAL(10,2),
	ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
	OrderID INT
);

CREATE TABLE Orders
(
	OrderID INT PRIMARY KEY IDENTITY,
	[Status] VARCHAR(20),
	TotalAmount INT,
	OrderDate DATE,
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)
);

ALTER TABLE OrderItems
ADD CONSTRAINT OrderItems_FK FOREIGN KEY(OrderID) REFERENCES Orders(OrderID);

CREATE TABLE Order_Payments
(
	OrderID INT,
	PaymentID INT,
	PRIMARY KEY(OrderID, PaymentID),
	FOREIGN KEY(PaymentID) REFERENCES Payment(PaymentID),
	FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Shipments
(
	ShipmentID INT PRIMARY KEY IDENTITY,
	ShipmentDate DATE,
	[Status] VARCHAR(20),
	DeliveryDate DATE,
	CarrierName VARCHAR(50),
	TrackingNumber INT,
	OrderID INT FOREIGN KEY REFERENCES Orders(OrderID)
);



