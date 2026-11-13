-- Use Hotel System Database
use HotelDB;
-- Question 01
--The appropriate rule is ON DELETE CASCADE
--When a hotel is deleted from the Hotels table, all rooms associated with that hotel should be automatically deleted from the Rooms table.
--I choose CASCADE because a room cannot logically exist independently of its hotel.
SELECT name
FROM sys.foreign_keys
WHERE parent_object_id = OBJECT_ID('Rooms');

alter table Rooms
drop constraint FK__Rooms__HotelID__403A8C7D;

alter table Rooms
add constraint FK_Hotel_Room
foreign key(HotelID) references Hotels(HotelID)
on delete cascade;

delete from Hotels
where HotelID = 1;

-- Question 02
--The appropriate rule is ON DELETE CASCADE.
--When a room is deleted from the Rooms table, all related records in the Amenities table should be automatically deleted.
--I choose ON DELETE CASCADE because amenities are dependent on the room they belong to. If the room no longer exists, its associated amenities should also be removed.
alter table Amenities
drop constraint Amenities_FK;

alter table Amenities
add constraint Amenities_FK foreign key(RoomNumber) references Rooms(RoomNumber)
on delete cascade;

delete from Rooms
where RoomNumber = 1;

-- Question 03
--The most suitable rule is ON UPDATE CASCADE.
--If a staff member's ID changes in the Staff table, all related records in the Services table should automatically update their StaffID to the new value.
--I choose ON UPDATE CASCADE because it maintains referential integrity and ensures that all services remain linked to the correct staff member without manually updating each related record.
SELECT name
FROM sys.foreign_keys
WHERE parent_object_id = OBJECT_ID('Services');

alter table Services
drop constraint FK__Services__StaffI__3D5E1FD2;

alter table Services
add constraint FK_Staff_Service
foreign key(StaffID) references Staff(StaffID)
on update cascade;

update Staff
set StaffID = 30
where StaffID = 24;

