----------------------------------------------------------------------
---------------- Hotel Reservation Management System -----------------
----------------------------------------------------------------------

CREATE DATABASE HotelDB;

USE HotelDB;


-------------------------------- Tables -------------------------------
CREATE TABLE Hotels
(
	HotelID INT PRIMARY KEY IDENTITY,
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50),
	City VARCHAR(20),
	StarRating DECIMAL(2,1),
	ContactNumber VARCHAR(20),
	ManageID INT
);

CREATE TABLE Staff
(
	StaffID INT PRIMARY KEY IDENTITY,
	FullName VARCHAR(50) NOT NULL,
	Position VARCHAR(50),
	Salary DECIMAL(10,2),
	HotelID INT FOREIGN KEY REFERENCES Hotels(HotelID)
);

ALTER TABLE Hotels
ADD CONSTRAINT Hotel_FK FOREIGN KEY(ManageID) REFERENCES Staff(StaffID);

CREATE TABLE Services
(
	ServiceID INT PRIMARY KEY IDENTITY,
	ServiceName VARCHAR(50),
	Charge DECIMAL(10,2),
	RequestDate DATE,
	StaffID INT FOREIGN KEY REFERENCES Staff(StaffID)
);

CREATE TABLE Rooms
(
	RoomNumber INT PRIMARY KEY IDENTITY,
	RoomType VARCHAR(20),
	Capacity INT,
	DailyRate DECIMAL(2,1),
	[Availability]  VARCHAR(20),
	HotelID INT FOREIGN KEY REFERENCES Hotels(HotelID)
);

CREATE TABLE Amenities
(
	RoomNumber INT,
	Amenity VARCHAR(50),
	PRIMARY KEY(RoomNumber, Amenity),
);

ALTER TABLE Amenities 
ADD CONSTRAINT Amenities_FK FOREIGN KEY(RoomNumber) REFERENCES Rooms(RoomNumber);

CREATE TABLE Reservations
(
	ReservationID INT PRIMARY KEY IDENTITY,
	BookingDate DATE,
	CheckInDate DATE,
	CheckOutDate DATE,
	ReservationStatus VARCHAR(20),
	TotalPrice DECIMAL(10,2),
	NumberOfAdults INT,
	NumberOfChidrens INT

);

CREATE TABLE Guests
(
	GuestID INT PRIMARY KEY IDENTITY,
	FullName VARCHAR(50),
	Nationality VARCHAR(20),
	PassportNumber VARCHAR(50),
	DateOfBirth DATE
);

CREATE TABLE Guest_Contact_Details
(
	GuestID INT,
	Detail VARCHAR(100),
	PRIMARY KEY(GuestID, Detail),
	FOREIGN KEY(GuestID) REFERENCES Guests(GuestID)
);

CREATE TABLE Payment
(
	PaymentID INT PRIMARY KEY IDENTITY,
	Method VARCHAR(30),
	[Date] DATE,
	Amount DECIMAL(10,2),
	ConfirmationNumber INT
);

CREATE TABLE Reservation_Rooms
(
	ReservationID INT,
	RoomNumber INT,
	PRIMARY KEY(ReservationID, RoomNumber),
	FOREIGN KEY(ReservationID) REFERENCES Reservations(ReservationID),
	FOREIGN KEY(RoomNumber) REFERENCES Rooms(RoomNumber)
);

CREATE TABLE Reservation_Service
(
	ServiceID INT ,
	ReservationID INT,
	PRIMARY KEY(ServiceID, ReservationID),
	FOREIGN KEY(ServiceID) REFERENCES Services(ServiceID),
	FOREIGN KEY(ReservationID) REFERENCES ReservationS(ReservationID)
);


CREATE TABLE Reservation_Guest
(
	GuestID INT ,
	ReservationID INT,
	PRIMARY KEY(GuestID, ReservationID),
	FOREIGN KEY(GuestID) REFERENCES Guests(GuestID),
	FOREIGN KEY(ReservationID) REFERENCES ReservationS(ReservationID)
);


CREATE TABLE Reservation_Paymrnt
(
	PaymentID INT ,
	ReservationID INT,
	PRIMARY KEY(PaymentID, ReservationID),
	FOREIGN KEY(PaymentID) REFERENCES Payment(PaymentID),
	FOREIGN KEY(ReservationID) REFERENCES ReservationS(ReservationID)
);