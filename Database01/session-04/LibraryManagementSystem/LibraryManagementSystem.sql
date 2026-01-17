--------------- INSERT ----------------------


----- Simple insert ----

INSERT INTO Library.Members
VALUES('Marwa Sami', '1/10/2004', 'MarwaSami@gmail.com', '01236667788', '10/1/2024');

INSERT INTO Library.Books
VALUES('123-456-789-1', 1990, 'Database System', '2nd Edition', 'Programming');


---- Multiple Rows Insert ----
INSERT INTO Library.Authors
VALUES 
('Naguib Mahfouz', 'Egyption', '10/2/1990'),
('Mark Zaz', 'American', '11/2/1990'),
('Leo Dafinchi', 'Britich', '1/2/1990');

INSERT INTO Library.Book_Author
VALUES ('123-456-789-1', 5), ('123-456-789-1', 6);

---- Insert using column list ----
INSERT INTO Library.Members(FullName, Phone)
VALUES ('Ahmed Ali', '01119998887');

INSERT INTO Library.Members(Phone, FullName)
VALUES('02223334445','Mohamed Ali'), ('00099988877','Ali Ahmed');


INSERT INTO Library.Members(Phone,FullName,Email)
VALUES ('99900088877','Anas Sami','Anas@gmail.com');

---- Insert based on select ----

CREATE TABLE ArchievedMembers
(
	MembershipID INT PRIMARY KEY,
	FullName VARCHAR(100),
	DateOfBirth DATE,
	Email VARCHAR(100),
	Phone VARCHAR(100),
	MembershipDate DATE
);

INSERT INTO ArchievedMembers(MembershipID,FullName,Phone,Email,MembershipDate)
SELECT MembershipID,FullName,Phone,Email,MembershipDate
FROM Library.Members;

SELECT * FROM ArchievedMembers


--------------------------------------------------------------------------------------------
--------------------------------------Temporary Table---------------------------------------
--------------------------------------------------------------------------------------------

-- Local Temporary Table

CREATE TABLE #ArchievedMembers
(
	MembershipID INT PRIMARY KEY,
	FullName VARCHAR(100),
	DateOfBirth DATE,
	Email VARCHAR(100),
	Phone VARCHAR(100),
	MembershipDate DATE
);

INSERT INTO #ArchievedMembers(MembershipID,FullName,Phone,Email,MembershipDate)
SELECT MembershipID,FullName,Phone,Email,MembershipDate
FROM Library.Members;

select * from #ArchievedMembers;

-- Global Temporary Table

CREATE TABLE ##ArchievedMembers
(
	MembershipID INT PRIMARY KEY,
	FullName VARCHAR(100),
	DateOfBirth DATE,
	Email VARCHAR(100),
	Phone VARCHAR(100),
	MembershipDate DATE
);

INSERT INTO ##ArchievedMembers(MembershipID,FullName,Phone,Email,MembershipDate)
SELECT MembershipID,FullName,Phone,Email,MembershipDate
FROM Library.Members;

select * from ##ArchievedMembers;

--------------- UPDATE ----------------------

-- 1. UPDATE SINGLE RECORD
UPDATE Library.Members
SET Email = 'MohamedAli@gmail.com'
WHERE MembershipID = 30;

UPDATE Library.Members
SET Email = 'AhmedAli@gmail.com'
WHERE MembershipID = 40;

-- 2. update more than one value(record)
UPDATE Management.Branches
SET PhoneNumber = '12344455566' , OpenningHours = 'From 10 AM to 6 PM'
WHERE Name = 'B01';


UPDATE Management.Branches
SET PhoneNumber = '12348899900' , OpenningHours = 'From 10 AM to 6 PM'
WHERE Name = 'B02';

UPDATE Management.Librarians
SET Salary = Salary + (Salary * 0.1)
WHERE Salary < 12000;

UPDATE Library.BorrowTransactions
SET Status = CASE 
	WHEN ReturnDate > DueDate THEN 'LATE'
	WHEN ReturnDate < DueDate THEN 'ON TIME'
	ELSE 'ON TIME'
	END;

--------------- DELETE ----------------------

DELETE Library.Members
WHERE MembershipID = 40;
























