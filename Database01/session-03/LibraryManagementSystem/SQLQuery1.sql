-- CREATE DATABASE FOR Library Management System

CREATE DATABASE CityLibraryDB;
USE CityLibraryDB;

--------------------------------------------------------------------------------------------
------------------------------------------ CREATE TABLES -----------------------------------
--------------------------------------------------------------------------------------------

CREATE TABLE Librarians
(
	Id INT PRIMARY KEY,
	FullName VARCHAR(100) NOT NULL,
	Salary DECIMAL(10,2),
	PhoneNumber VARCHAR(20),
	HireDate DATE
);

CREATE TABLE Branches
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(100) NOT NULL,
	Address VARCHAR(100),
	PhoneNumber VARCHAR(20),
	OpenningHours TIME,
	ManagerID INT UNIQUE REFERENCES Librarians(Id) -- UNIQUE Manager for each branch
);

CREATE TABLE Members
(
	MembershipID INT PRIMARY KEY IDENTITY(10,10),
	FullName VARCHAR(100) NOT NULL,
	DateOfBirth DATE,
	Email VARCHAR(50),
	Phone VARCHAR(20),
	MembershipDate DATE
);

CREATE TABLE Authors
(
	Id INT PRIMARY KEY IDENTITY,
	FullName VARCHAR(100) NOT NULL,
	Nationality VARCHAR(20),
	DateOfBirth DATE
);

CREATE TABLE Books
(
	ISBN VARCHAR(20) PRIMARY KEY,
	PublicationYear INT,
	Title VARCHAR(50) NOT NULL,
	Edition VARCHAR(20),
	BookCategory VARCHAR(50)
);

CREATE TABLE Book_Author
(
	BookISBN VARCHAR(20),
	AuthorID INT,
	PRIMARY KEY(BookISBN, AuthorID),
	CONSTRAINT FK_BA_BOOK FOREIGN KEY(BookISBN) REFERENCES Books(ISBN),
	CONSTRAINT FK_BA_AUTHOR FOREIGN KEY(AuthorID) REFERENCES Authors(Id)
);

CREATE TABLE BookCopies
(
	CopyID INT PRIMARY KEY IDENTITY,
	Condition VARCHAR(100),
	CurrentStatus VARCHAR(50),
	BranchID INT REFERENCES Branches(Id),
	BookISBN VARCHAR(20) REFERENCES Books(ISBN)
);

CREATE TABLE BorrowTransactions
(
	TransactionID INT PRIMARY KEY IDENTITY,
	BorrowDate DATE,
	BookCopyID INT NOT NULL REFERENCES BookCopies(CopyID),
	MemberID INT NOT NULL REFERENCES Members(MembershipID)
);

/* DueDate,
	ReturnDate, */


CREATE TABLE Fines
(
	Id INT PRIMARY KEY IDENTITY,
	Amount DECIMAL(10,2),
	IssueDate DATE,
	PaymentStatus VARCHAR(20),
	BorrowTransactionID INT UNIQUE
);

--------------------------------------------------------------------------------------------
------------------------------------------ ALTER TABLES ------------------------------------
--------------------------------------------------------------------------------------------


--ADD COLUMN--

ALTER TABLE BorrowTransactions
ADD DueDate DATE;

ALTER TABLE BorrowTransactions
ADD ReturnDate DATE;

--ADD CONSTRAINT--

ALTER TABLE Fines
ADD CONSTRAINT FK_FINE_TRAN FOREIGN KEY(BorrowTransactionID) REFERENCES BorrowTransactions(TransactionID);

ALTER TABLE Fines
ADD CONSTRAINT UN_BORROWID UNIQUE(BorrowTransactionID);

ALTER TABLE BookCopies
ADD CONSTRAINT DF_CURRENTSTATUS
DEFAULT ('Available') FOR CurrentStatus;

--DROP COLUMN--

ALTER TABLE Books 
ADD TEST INT;

ALTER TABLE Books
DROP COLUMN TEST;

--DROP CONSTRAINT--

ALTER TABLE BorrowTransactions
ADD CONSTRAINT UN_DUEDATE
UNIQUE (DueDate);

ALTER TABLE BorrowTransactions
DROP CONSTRAINT UN_DUEDATE;

--ALTER COLUMN--

ALTER TABLE Books 
ADD TEST INT;

ALTER TABLE Books
ALTER COLUMN TEST BIGINT;

ALTER TABLE Books 
DROP COLUMN TEST;

--DROP DATABASE--

CREATE DATABASE TESTDB;
DROP DATABASE TESTDB;

--DROP TABLE--

CREATE TABLE BBB
(
	ID INT
);

DROP TABLE BBB;

--------------------------------------------------------------------------------------------
------------------------------------------ SCHEMAS -----------------------------------------
--------------------------------------------------------------------------------------------

-- CREATE SCHEMA --
GO
CREATE SCHEMA [Library];
GO

GO
CREATE SCHEMA Management;
GO


CREATE TABLE [Library].TEST01
(
	ID INT
);

CREATE TABLE Management.TEST01
(
	ID INT
);

DROP TABLE Library.TEST01;

DROP TABLE Management.TEST01;


ALTER SCHEMA Library TRANSFER Authors;
ALTER SCHEMA Library TRANSFER BookCopies;
ALTER SCHEMA Library TRANSFER Books;
ALTER SCHEMA Library TRANSFER Book_Author;
ALTER SCHEMA Library TRANSFER BorrowTransactions;
ALTER SCHEMA Library TRANSFER Fines;
ALTER SCHEMA Library TRANSFER Members;


ALTER SCHEMA Management TRANSFER Branches;
ALTER SCHEMA Management TRANSFER Librarians;



