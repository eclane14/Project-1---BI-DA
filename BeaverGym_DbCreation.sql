/* Beaver Gym */
/* Team members: Elizabeth Lane, Christine Regan, Matthew de Marte */

/* Create Database */
CREATE DATABASE BeaverGymDb;
GO

USE BeaverGymDb;
GO


/* CREATE TABLES */

CREATE TABLE Instructor(
    InstructorID bigint NOT NULL PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    CellPhone tinyint NOT NULL,
    Email varchar(50) NOT NULL,
    Gender varchar(50) NOT NULL,
    Specialty varchar(50) NOT NULL);

CREATE TABLE Class(
    ClassID bigint NOT NULL PRIMARY KEY,
    ClassName varchar(50) NOT NULL,
    RoomNumber bigint NOT NULL,
    InstructorID bigint NOT NULL,
    Day varchar(15) NOT NULL,
    Time time NOT NULL);

CREATE TABLE ClassRegistration(
    RegistrationID bigint NOT NULL PRIMARY KEY,
    ClassID bigint NOT NULL,
    Date date NOT NULL,
    MemberID bigint NOT NULL);
	
CREATE TABLE Member(
    MemberID bigint NOT NULL PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Address varchar (50) NOT NULL,
    City varchar(50) NOT NULL,
    State varchar(50) NOT NULL,
    Zip tinyint NOT NULL, 
    Email varchar(50), 
    CellPhone tinyint NOT NULL,
    Gender varchar(50) NOT NULL,
    MembershipTypeID bigint NOT NULL, 
    DOB date NOT NULL);

CREATE TABLE MembershipType(
    MembershipID bigint NOT NULL PRIMARY KEY,
    TypeName varchar (50) NOT NULL, 
    MonthlyDue bigint NOT NULL, 
    Monthly#Sessions bigint NOT NULL); 

/* Add foreign keys */
ALTER TABLE Class
ADD FOREIGN KEY (InstructorID) REFERENCES Instructor (InstructorID); 

ALTER TABLE ClassRegistration  
ADD FOREIGN KEY (ClassID) REFERENCES Class (ClassID);

ALTER TABLE ClassRegistration  
ADD FOREIGN KEY (MemberID) REFERENCES Member (MemberID); 

ALTER TABLE Member  
ADD FOREIGN KEY (MembershipTypeID) REFERENCES MembershipType (MembershipID);

/* Change cell phone data type to bigint */
ALTER TABLE Instructor ALTER COLUMN CellPhone bigint;

/* Add Values */
/* Inserting Fake Data for Instructor table */	
 INSERT INTO Instructor VALUES (1, 'Matthew', 'de Marte', 
 1234567890, 'instructor1@BeaverGym.com', 'M', 'Baseball') ;	
	
INSERT INTO Instructor VALUES (2, 'Christine', 'Regan', 	
 2345678901, 'instructor2@BeaverGym.com', 'F', 'Lacrosse') ;	
	
INSERT INTO Instructor VALUES (3, 'Elizabeth', 'Lane', 	
 3456789012, 'instructor3@BeaverGym.com', 'F', 'Basketball') ;	
	
 INSERT INTO Instructor VALUES (4, 'Charlie', 'Franklin', 	
 4567890123, 'instructor4@BeaverGym.com', 'M', 'Personal Training') ;	
	
 INSERT INTO Instructor VALUES (5, 'Aretha', 'Simpson', 	
 5678901234, 'instructor5@BeaverGym.com', 'F', 'Fitness Classes') ;	
	
 INSERT INTO Instructor VALUES (6, 'Esteban', 'Loaiza', 	
 6789012345, 'instructor6@BeaverGym.com', 'M', 'Athletic Training') ;	
	
 INSERT INTO Instructor VALUES (7, 'Maria', 'Williams', 	
 7890123456, 'instructor7@BeaverGym.com', 'F', 'Tennis') ;	
	
 INSERT INTO Instructor VALUES (8, 'Steve', 'Novak', 	
 8901234567, 'instructor8@BeaverGym.com', 'M', 'Football') ;	
	
 INSERT INTO Instructor VALUES (9, 'Lauren', 'Latifah', 	
 9012345678, 'instructor9@BeaverGym.com', 'F', 'Swimming') ;	
 	
 INSERT INTO Instructor VALUES (10, 'Al', 'Kaline', 	
 123456789, 'instructor10@BeaverGym.com', 'M', 'Yoga') ;	
	
 /* View table */
 SELECT * FROM Instructor;
	
	
 /* Inserting Fake Data for Class table */	
  INSERT INTO Class VALUES (1, 'Yoga', 1, 10, 	
  'M W F', '8:00 PM');	
	
  INSERT INTO Class VALUES (2, 'Advanced Yoga', 1, 10, 	
  'Tu Th F', '7:00 AM');	
	
  INSERT INTO Class VALUES (3, 'Athletes Yoga', 1, 10, 	
  'M W F', '3:00 PM');	
	
  INSERT INTO Class VALUES (4, 'Zumba', 1, 5, 	
  'M W F S Su', '10:00 AM');	
	
  INSERT INTO Class VALUES (5, 'Spinning', 2, 5, 	
  'M T W F Su', '8:00 AM');	
	
   INSERT INTO Class VALUES (6, 'Cycling', 2, 5, 	
  'M Th F S', '9:00 AM');	
  	
  INSERT INTO Class VALUES (7, 'P90x', 1, 5, 	
  'T Th', '2:00 PM');	
	
  INSERT INTO Class VALUES (8, 'High Intensity Interval Training', 1, 5, 	
  'T Th', '7:00 PM');	
	
  INSERT INTO Class VALUES (9, 'Boxing', 1, 5, 	
  'M Th', '8:00 PM');	
	
  INSERT INTO Class VALUES (10, 'Stretching', 1, 10, 	
  'M T W Th F S Su', '12:00 PM');	
	
/* Change classes with more than one day offered to only one day */
	UPDATE Class SET Day = 'M' WHERE ClassID = 1;
	UPDATE Class SET Day = 'Tu' WHERE ClassID = 2;
	UPDATE Class SET Day = 'W' WHERE ClassID = 3;
	UPDATE Class SET Day = 'F' WHERE ClassID = 4;
	UPDATE Class SET Day = 'Tu' WHERE ClassID = 5;
	UPDATE Class SET Day = 'Sa' WHERE ClassID = 6;
	UPDATE Class SET Day = 'Th' WHERE ClassID = 7;
	UPDATE Class SET Day = 'F' WHERE ClassID = 8;
	UPDATE Class SET Day = 'M' WHERE ClassID = 9;
	UPDATE Class SET Day = 'Su' WHERE ClassID = 10;

	/* View table */
	SELECT * FROM Class;
	
/* Inserting Fake Data for MembershipType table */	
   INSERT INTO MembershipType VALUES (1, 'General', 50, 30); 	
	
   INSERT INTO MembershipType VALUES (2, 'Basketball', 100, 30); 	
	
   INSERT INTO MembershipType VALUES (3, 'Tennis', 100, 30); 	
	
   INSERT INTO MembershipType VALUES (4, 'Swimming', 100, 30); 	
	
   INSERT INTO MembershipType VALUES (5, 'Baseball', 100, 30); 	
	
   INSERT INTO MembershipType VALUES (6, 'Football', 100, 30); 	
	
   INSERT INTO MembershipType VALUES (7, 'Lacrosse', 100, 30); 	
	
   INSERT INTO MembershipType VALUES (8, 'Lesson Plan', 200, 5); 	
	
   INSERT INTO MembershipType VALUES (9, 'Family', 250, 150); 	
	
   INSERT INTO MembershipType VALUES (10, 'XL Lesson Plan', 700, 20); 	

 /* View table */
SELECT * FROM MembershipType;
   	
	
/* Inserting Fake Data for Member table */	
	
	/* Change data types */
	ALTER TABLE Member ALTER COLUMN Zip int;
	ALTER TABLE Member ALTER COLUMN CellPhone bigint null;
	ALTER TABLE Member ALTER COLUMN Email varchar(50) not null;

   INSERT INTO Member VALUES (1, 'Javier', 'Baez', '1 El Mago Drive', 'Wellesley', 'MA', 2457, 'member1@gmail.com', 987654321, 'M', 1, '3/4/1985'); 	
   	
   INSERT INTO Member VALUES (2, 'Robyn', 'Roberts', '2 Derek Jeter Way', 'Newton', 'MA', 2456, 'member2@gmail.com', 0, 'F', 2, '4/20/1998'); 	
	
   INSERT INTO Member VALUES (3, 'Rachel', 'Green', '3 Manhattan Boulevard', 'Needham', 'MA', 2494, 'member3@gmail.com', 8742648562, 'F', 3, '10/25/1976'); 	
	
   INSERT INTO Member VALUES (4, 'Kobe', 'James', '4 Greatness Street', 'Framingham', 'MA', 1701, 'member4@gmail.com', 0, 'M', 4, '11/3/1992'); 	
	
   INSERT INTO Member VALUES (5, 'Marshall', 'Mathers', '5 eight mile court', 'Natick', 'MA', 1760, 'member5@gmail.com', 0, 'M', 5, '1/31/1989'); 	
	
    INSERT INTO Member VALUES (6, 'Katrin', 'Davidstottir', '6 oakside avenue', 'Natick', 'MA', 1760, 'member6@gmail.com', 4834324324, 'F', 6, '2/2/2000'); 	
	
	INSERT INTO Member VALUES (7, 'Christopher', 'Wallace', '7 brooklyn way', 'Wellesley', 'MA', 2457, 'member7@gmail.com', 6542112121, 'M', 7, '5/25/1970'); 
	
	INSERT INTO Member VALUES (8, 'Elliot', 'Lee', '8 garden avenue', 'Wellesley', 'MA', 2457, 'member8@gmail.com', 3235652133, 'M', 8, '9/9/1990'); 
	
	INSERT INTO Member VALUES (9, 'Veronica', 'Reynolds', '9 secaucus drive', 'Wellesley', 'MA', 2457, 'member9@gmail.com', 1265425465, 'F', 9, '4/24/1975'); 
	
	INSERT INTO Member VALUES (10, 'Harold', 'Reynolds', '9 secaucus drive', 'Wellesley', 'MA', 2457, 'member10@gmail.com', 0, 'M', 9, '1/8/1978'); 
	
	INSERT INTO Member VALUES (11, 'Ron', 'Reynolds', '9 secaucus drive', 'Wellesley', 'MA', 2457, 'member11@gmail.com', 0, 'M', 9, '6/17/2007'); 
  	
    INSERT INTO Member VALUES (12, 'Beth', 'Reynolds', '9 secaucus drive', 'Wellesley', 'MA', 2457, 'member12@gmail.com', 0, 'F', 9, '8/2/2005'); 	
  	
    INSERT INTO Member VALUES (13, 'Jyn', 'Orso', '10 galaxy avenue', 'Wellesley', 'MA', 2457, 'member13@gmail.com', 1264325467, 'F', 10, '1/8/1988'); 	
  	
    INSERT INTO Member VALUES (14, 'Randy', 'Johnson', '43 castle court', 'Natick', 'MA', 1760, 'member14@gmail.com', 3477324564, 'M', 9, '3/19/1968'); 	
	
    INSERT INTO Member VALUES (15, 'Julie', 'Johnson', '43 castle court', 'Natick', 'MA', 1760, 'member15@gmail.com', 3478644589, 'F', 9, '8/10/1971'); 	
  	
    INSERT INTO Member VALUES (16, 'Jessica', 'Johnson', '43 castle court', 'Natick', 'MA', 1760, 'member16@gmail.com', 3478760987, 'F', 9, '12/13/1998'); 	
  	
    INSERT INTO Member VALUES (17, 'Sarah', 'Johnson', '43 castle court', 'Natick', 'MA', 1760, 'member17@gmail.com', 0, 'F', 9, '1/29/2005'); 	
  	
    INSERT INTO Member VALUES (18, 'Ernie', 'Banks', '18 roger street', 'Needham', 'MA', 2494, 'member18@gmail.com', 0, 'M', 5, '7/2/1957'); 	
	
    INSERT INTO Member VALUES (19, 'Shannon', 'Sarson', '9 winners way', 'Wellesley', 'MA', 2457, 'member19@gmail.com', 9142345678, 'F', 7, '2/10/1973'); 	
	
    INSERT INTO Member VALUES (20, 'Joel', 'Embiid', '21 process avenue', 'Framingham', 'MA', 1701, 'member20@gmail.com', 3980231234, 'M', 2, '10/12/1994');	
  	
    INSERT INTO Member VALUES (21, 'Joe', 'Arena', '425 swed circle', 'Wellesley', 'MA', 2457, 'member21@gmail.com', 9143451035, 'M', 9, '5/15/1960'); 	
	
    INSERT INTO Member VALUES (22, 'Mary Kay', 'Arena', '425 swed circle', 'Wellesley', 'MA', 2457, 'member22@gmail.com', 9149624825, 'F', 9, '3/13/1962'); 	
	
    INSERT INTO Member VALUES (23, 'Joey', 'Arena', '425 swed circle', 'Wellesley', 'MA', 2457, 'member23@gmail.com', 9140987654, 'M', 9, '1/28/1993'); 	
  	
    INSERT INTO Member VALUES (24, 'Ryan', 'Arena', '425 swed circle', 'Wellesley', 'MA', 2457, 'member 24@gmail.com', 9141230965, 'M', 9, '10/28/1996'); 	
	
    INSERT INTO Member VALUES (25, 'Tony', 'Wein', '12 babo drive', 'Needham', 'MA', 2494, 'member25@gmail.com', 0, 'M', 1, '10/12/1958'); 	
  	
	/* Change cell phone numbers from '0' to null */
	UPDATE Member SET CellPhone = null WHERE CellPhone = 0;

	 /* View table */
 	SELECT * FROM Member;
 	

 /* Inserting Fake Data for ClassRegistration table */	
INSERT INTO ClassRegistration VALUES(1,1, '10/20/2017', 1);	
INSERT INTO ClassRegistration VALUES(2,2, '10/19/2017', 2);	
INSERT INTO ClassRegistration VALUES(3,3, '10/18/2017', 3);	
INSERT INTO ClassRegistration VALUES(4,4, '10/22/2017', 4);	
INSERT INTO ClassRegistration VALUES(5,5, '10/16/2017', 5);	
INSERT INTO ClassRegistration VALUES(6,6, '10/21/2017', 6);	
INSERT INTO ClassRegistration VALUES(7,7, '10/17/2017', 7);	
INSERT INTO ClassRegistration VALUES(8,8, '10/17/2017', 8);	
INSERT INTO ClassRegistration VALUES(9,9, '10/16/2017', 9);	
INSERT INTO ClassRegistration VALUES(10,10, '10/21/2017', 13);	
INSERT INTO ClassRegistration VALUES(11,1, '10/20/2017', 1);	
INSERT INTO ClassRegistration VALUES(12,2, '10/19/2017', 18);	
INSERT INTO ClassRegistration VALUES(13,2, '10/19/2017', 12);	
INSERT INTO ClassRegistration VALUES(14,6, '10/21/2017', 5);	
INSERT INTO ClassRegistration VALUES(15,3, '10/18/2017', 22);	
INSERT INTO ClassRegistration VALUES(16,9, '10/16/2017', 10);	
INSERT INTO ClassRegistration VALUES(17,1, '10/20/2017', 17);	
INSERT INTO ClassRegistration VALUES(18,2, '10/19/2017', 12);	
INSERT INTO ClassRegistration VALUES(19,10, '10/21/2017', 8);	
INSERT INTO ClassRegistration VALUES(20,4, '10/22/2017', 3);	
INSERT INTO ClassRegistration VALUES(21,3, '10/18/2017', 2);	
INSERT INTO ClassRegistration VALUES(22,5, '10/16/2017', 9);	
INSERT INTO ClassRegistration VALUES(23,4, '10/22/2017', 21);	
INSERT INTO ClassRegistration VALUES(24,1, '10/20/2017', 15);	
INSERT INTO ClassRegistration VALUES(25,3, '10/18/2017', 12);	

 /* View table */
SELECT * FROM ClassRegistration;
