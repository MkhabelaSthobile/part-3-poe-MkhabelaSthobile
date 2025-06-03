--Creating a Database

USE master
If EXISTS (SELECT * FROM sys.databases WHERE name = 'EventDB')
DROP DATABASE EventDB;
CREATE DATABASE EventDB;

USE EventDB;

--TABLE CREATION
CREATE TABLE Venue 
(
    VenueID INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
    VenueName VARCHAR(250) NOT NULL,
    Location VARCHAR(250) NOT NULL,
    Capacity INT NOT NULL,
    ImageURL TEXT NOT NULL,
);




CREATE TABLE Event
(
	EventID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Venue_ID INT NOT NULL REFERENCES Venue(VenueID),
	EventName VARCHAR (250) NOT NULL,
	EventDate date NOT NULL,
	Description VARCHAR (250),
);


CREATE TABLE Booking
(
	BookingID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Event_ID INT NOT NULL REFERENCES Event(EventID),
	Venue_ID INT NOT NULL REFERENCES Venue(VenueID),
	BookingDate date NOT NULL,
	
);


--Inserting

--Venue	Table
INSERT INTO Venue (VenueName, Location, Capacity, ImageURL)
VALUES ('Living Room Jozi', 'Living Room, 5th Floor, 20 Kruger St, Johannesburg, 2094', 200, 'https://1drv.ms/i/c/0507474e9ec05351/EVFTwJ5ORwcggAVXEAAAAAABqbB_680y4PAuSsy62s7XRg?e=pNZ6Aa'),
	   ('Houghton Terrace', '15th Ave, Houghton Estate, Johannesburg, 2041', 150, 'https://1drv.ms/i/c/0507474e9ec05351/EVFTwJ5ORwcggAV0BAAAAAABGk-Rj1Q_n5j8mGl4iS3nqA?e=XIEAPG'),
	   ('Shepstone Gardens', '12 Hope Rd, Mounatin View, Johannesburg, 2192', 200,'https://1drv.ms/u/c/0507474e9ec05351/EVFTwJ5ORwcggAXYAQAAAAABmLXZGn87YARzCQ-hP8Zb2g?e=ixCjOK'),
	   ('Walter Sisulu National Botanical Garden', 'Malcolm Rd, Poortview, Roodepoort, 1724', 300, 'https://1drv.ms/i/c/0507474e9ec05351/EVFTwJ5ORwcggAXZAQAAAAABoxZPKRM_546PmEoMcUI6eQ?e=JnKPnL');



--Event Table
INSERT INTO Event (Venue_ID, EventName, EventDate, Description)
VALUES (1,'Zama Birthday Party', '2025-06-01', 'Zama is turning 12 and all her family and friends will be there. She is using a wheelchais so she will need space'),
	   (2,'Wedding', '2025-06-12', 'It is a very small and intimate ceremony'),
	   (3,'CWP End of year party', '2025-05-22', 'Only for the Finance Department'),
	   (4,'Family Dinner', '2025-05-30', 'Just a family dinner');




--Booking Table
INSERT INTO Booking (Event_ID, venue_ID, BookingDate)
VALUES (1, 1, '2025-07-01');



SELECT * FROM Venue
SELECT * FROM Event
SELECT * FROM Booking

