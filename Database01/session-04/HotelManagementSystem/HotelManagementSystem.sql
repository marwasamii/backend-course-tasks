-----------------------------------------------------------------------------------------------------
---------------------------------- Hotel Management System ------------------------------------------
-----------------------------------------------------------------------------------------------------

------------------------------------------ INSERT OPERATIONS ---------------------------------------- 
-- 1. Insert a Guest (FullName, Nationality, PassportNumber, DateOfBirth)
INSERT INTO Guests(FullName, Nationality, PassportNumber, DateOfBirth)
VALUES ('Ahmed Ali', 'Egyptian', 'A1234567', '1995-03-15');
-- 2. Insert multiple Guests in one statement 
INSERT INTO Guests(FullName, Nationality, PassportNumber, DateOfBirth)
VALUES 
	('Sara Mohamed', 'Jordanian', 'J7654321', '1998-11-02'),
	('John Smith', 'British', 'B9988776', '1990-06-25'),
	('Mohamed Hassan', 'Egyptian', 'E1122334', '1992-01-10'),
	('Laila Youssef', 'Egyptian', 'E2233445', '1996-07-22'),
	('Omar Khaled', 'Saudi', 'S3344556', '1989-09-05'),
	('Nour El Din', 'Moroccan', 'M4455667', '1994-12-18'),
	('Hana Ali', 'Emirati', 'U5566778', '1999-04-30'),
	('Youssef Adel', 'Egyptian', 'E6677889', '1987-08-14'),
	('Mariam Fathy', 'Lebanese', 'L7788990', '1993-02-27'),
	('Adam Wilson', 'American', 'A8899001', '1991-10-09'),
	('Emily Brown', 'Canadian', 'C9900112', '1997-05-16'),
	('Daniel Müller', 'German', 'G1011121', '1985-11-28');

SELECT * FROM Guests;
------------------------------------------ UPDATE OPERATIONS ----------------------------------------
-- 1. Increase DailyRate by 15% for all suites 

ALTER TABLE Rooms
ALTER COLUMN DailyRate DECIMAL(6,2);


UPDATE Rooms
SET DailyRate = DailyRate + (DailyRate * 0.15);

SELECT * FROM Rooms;

INSERT INTO Hotels (Name, Address, City, StarRating, ContactNumber, ManageID)
VALUES
('Grand Nile Hotel', '12 Corniche El Nile', 'Cairo', 9.2, '01012345678', NULL),
('Sea View Resort', '45 Beach Road', 'Alexandria', 8.7, '01123456789', NULL),
('Desert Rose Hotel', 'Hurghada Road', 'Hurghada', 8.9, '01234567890', NULL),
('Sunrise Palace', 'El Gouna Street', 'El Gouna', 9.1, '01567891234', NULL),
('Pyramids View Inn', 'Al Haram Street', 'Giza', 8.5, '01098765432', NULL),
('Royal Oasis', 'City Center', 'Sharm El Sheikh', 9.0, '01156789123', NULL);

INSERT INTO Staff (FullName, Position, Salary, HotelID)
VALUES
('Ahmed Salah', 'Hotel Manager', 15000.00, 1),
('Sara Adel', 'Hotel Manager', 14000.00, 2),
('Laila Fathy', 'Hotel Manager', 14500.00, 3),
('Youssef Kamal', 'Hotel Manager', 16000.00, 4);

UPDATE Hotels SET ManageID = 1 WHERE HotelID = 1;
UPDATE Hotels SET ManageID = 2 WHERE HotelID = 2;
UPDATE Hotels SET ManageID = 3 WHERE HotelID = 3;
UPDATE Hotels SET ManageID = 4 WHERE HotelID = 4;

INSERT INTO Staff (FullName, Position, Salary, HotelID)
VALUES
('Mona Ibrahim', 'Receptionist', 6000.00, 1),
('Khaled Hassan', 'Housekeeping Supervisor', 7000.00, 1),

('Omar Youssef', 'Receptionist', 5800.00, 2),
('Hany Mahmoud', 'Chef', 9000.00, 2),

('Mostafa Ali', 'Maintenance Engineer', 8000.00, 3),
('Nour Mohamed', 'Housekeeping', 5000.00, 3),

('Reem Tarek', 'Receptionist', 6200.00, 4),
('Adel Samir', 'Security Officer', 5500.00, 4);

INSERT INTO Rooms (RoomType, Capacity, DailyRate, [Availability], HotelID)
VALUES
-- Hotel 1
('Single', 1, 8.5, 'Available', 1),
('Double', 2, 9.0, 'Available', 1),
('Suite', 4, 9.6, 'Occupied', 1),
('Family', 5, 8.8, 'Available', 1),

-- Hotel 2
('Single', 1, 7.8, 'Available', 2),
('Double', 2, 8.9, 'Maintenance', 2),
('Suite', 3, 9.2, 'Available', 2),

-- Hotel 3
('Single', 1, 6.9, 'Occupied', 3),
('Double', 2, 8.1, 'Available', 3),
('Family', 5, 8.7, 'Available', 3),

-- Hotel 4
('Single', 1, 7.5, 'Available', 4),
('Double', 2, 8.4, 'Available', 4),
('Suite', 4, 9.8, 'Occupied', 4);


SELECT * FROM Staff;

-- 2. Update ReservationStatus: If CheckoutDate < GETDATE() → 'Completed' If CheckinDate > GETDATE() → 'Upcoming' Else → 'Active'
INSERT INTO Reservations (BookingDate, CheckInDate, CheckOutDate, ReservationStatus, TotalPrice, NumberOfAdults, NumberOfChidrens)
VALUES
-- Reservation 1
('2026-01-10', '2026-02-01', '2026-02-05', 'Confirmed', 1500.00, 2, 1),

-- Reservation 2
('2026-01-15', '2026-03-01', '2026-03-07', 'Pending', 3000.00, 4, 2),

-- Reservation 3
('2026-01-20', '2026-02-10', '2026-02-12', 'Cancelled', 800.00, 1, 0),

-- Reservation 4
('2026-01-18', '2026-02-20', '2026-02-25', 'Confirmed', 2200.00, 2, 2),

-- Reservation 5
('2026-01-21', '2026-03-05', '2026-03-10', 'Pending', 1800.00, 2, 0);

UPDATE Reservations
SET ReservationStatus = CASE
	WHEN CheckOutDate < GETDATE() THEN 'Completed'
	WHEN CheckInDate > GETDATE() THEN 'Upcoming'
	ELSE 'Active'
	END;

SELECT * FROM Reservations;
------------------------------------------ DELETE OPERATIONS ---------------------------------------- 
-- 1. Delete Reservation_Guest for a reservation 
DELETE FROM Reservation_Guest
WHERE ReservationID = 3;

------------------------------------------ MERGE OPERATION ------------------------------------------
-- 1. Create table #StaffUpdates (StaffId, FullName, Position, Salary) 
/* MERGE logic: 
   Match → Update Position + Salary 
   Not matched in Hotel DB → Insert 
   Not matched in Update table → Delete */

   CREATE TABLE #StaffUpdates 
   (
   StaffId INT,
   FullName VARCHAR(50), 
   Position VARCHAR(50),
   Salary DECIMAL(10,2)
   ); 

INSERT INTO #StaffUpdates (StaffID, FullName, Position, Salary)
VALUES
(1, 'Ahmed Salah', 'Hotel Manager', 15500.00),  
(2, 'Mona Ibrahim', 'Receptionist', 6200.00),   
(10, 'New Staff', 'Chef', 8000.00);   

MERGE INTO Staff AS Target
USING #StaffUpdates AS Source
ON Target.StaffID = Source.StaffID

-- 1. Match → Update Position + Salary
WHEN MATCHED THEN
    UPDATE SET 
        Target.Position = Source.Position,
        Target.Salary = Source.Salary

-- 2. Not matched in Staff (new staff) → Insert
WHEN NOT MATCHED BY TARGET THEN
    INSERT (FullName, Position, Salary, HotelID)
    VALUES (Source.FullName, Source.Position, Source.Salary, 1) -- عدلي ال HotelID حسب الفندق

-- 3. Not matched in #StaffUpdates → Delete 
WHEN NOT MATCHED BY SOURCE AND Target.StaffID NOT IN (SELECT ManageID FROM Hotels) THEN
    DELETE;





