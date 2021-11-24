/*
Catherine Nguyen
CSC174 
YING JIN 
11/16/2020
UPDATED: 11/16/2020 */

/* CREATE PROCEDURE Get_TA*/
DELIMITER $$
CREATE PROCEDURE Get_TA (IN instructor_ID INTEGER/*, OUT TA_Name VARCHAR(35)*/)
BEGIN
	SELECT S.StudentName
	FROM Course AS C, TA AS T, Student AS S
	WHERE C.InstructorID=instructor_ID AND C.TASSN=T.SSN AND T.SSN=S.SSN;
	/*INTO TA_Name;*/
END $$

DELIMITER ;

/* CALLING Get_TA with only IN parameter - There are 5 instructors populated giving 5 diff ways to call this procedure. */
CALL Get_TA(111111111);
CALL Get_TA(222222222);
CALL Get_TA(333333333);
CALL Get_TA(444444444);
CALL Get_TA(555555555);
/* Calling Get_TA -had i used and OUT parameter. would need to add more to it if theres nore than one row returned.  
CALL Get_TA(111111111, @TA_Name);
SELECT @TA_Name;
CALL Get_TA(222222222, @TA_Name);
SELECT @TA_Name;
CALL Get_TA(333333333, @TA_Name);
SELECT @TA_Name;
CALL Get_TA(444444444, @TA_Name);
SELECT @TA_Name;
CALL Get_TA(555555555, @TA_Name);
SELECT @TA_Name;
*/


/* CREATE PROCEDURE GetStudentCourse - Chose not to use OUT because its simpler*/
DELIMITER $$
CREATE PROCEDURE GetStudentCourse(IN Course_Number INTEGER)/*, OUT S_SSN INTEGER, OUT Student_Name VARCHAR(35), OUT S_Address VARCHAR(100), OUT S_Email VARCHAR(30)*/
BEGIN
	SELECT S.SSN, S.StudentName, S.Address, S.Email
	FROM Course AS C, Enrolled AS E, Student AS S
	WHERE Course_Number=C.CourseNo AND C.CourseNo=E.CourseNo AND E.SSN=S.SSN ;	
END $$
DELIMITER ;

/* Calling GetStudentCourse - There are 7 courses populated, giving 7 different ways to call this procedure.*/
CALL GetStudentCourse(12345);
CALL GetStudentCourse(23456);
CALL GetStudentCourse(34567);
CALL GetStudentCourse(45678);
CALL GetStudentCourse(56789);
CALL GetStudentCourse(67890);
CALL GetStudentCourse(78901);




