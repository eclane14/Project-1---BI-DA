/* /* Beaver Gym */
/* Team members: Elizabeth Lane, Christine Regan, Matthew de Marte */

/* Query 1: */
/* Goal: To display all the records from each table. */

USE BeaverGymDb;
GO

SELECT * FROM Instructor;
SELECT * FROM Class;
SELECT * FROM ClassRegistration;
SELECT * FROM Member;
SELECT * FROM MembershipType;

/* Query 2: */
/* Goal: Determine the gender distribution of the gym's members. */

SELECT COUNT(MemberID) AS '# of Members', Gender
FROM Member
GROUP BY Gender;


/* Query 3: */
/* Goal: Determine which membership types are most popular. */
SELECT COUNT(m.MemberID) AS '# of members enrolled', mt.TypeName
FROM Member AS m
INNER JOIN MembershipType as mt ON m.MembershipTypeID = mt.MembershipID
GROUP BY mt.typename
ORDER BY COUNT(m.memberID) DESC;

/* Query 4: */
/* Goal: Find out which members attended a class on Oct. 20, 2017, regardless of whether they've provided their cell phone number or not. */
SELECT m.firstname, m.lastname, m.cellphone, cr.date
FROM Member as m
LEFT OUTER JOIN ClassRegistration as cr ON cr.memberID = m.memberid
WHERE cr.date between '10-20-2017' and '10-20-2017';
/* The outer join is necessary because not all members who attended class that day have registered their cell phone number. */


/* Query 5: */
/* Goal: Show the Membership Types that have monthly due greater than the average of the monthly due of all membership types */
SELECT Typename, MonthlyDue
FROM Membershiptype
WHERE Monthlydue > (SELECT AVG(monthlydue)
FROM Membershiptype)
ORDER BY MonthlyDue DESC;