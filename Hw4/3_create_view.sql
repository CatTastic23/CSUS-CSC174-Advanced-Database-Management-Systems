/*
Catherine Nguyen
CSC 174
Ying Jin
11/15/2020
UPDATED: 11/16/2020 */

/* TA_Course */ /* ta name, ta email, course name */
CREATE VIEW TA_Course (TA_Name, TA_Email, Course_Name) AS
SELECT S.StudentName, S.Email, C.CourseName  
FROM Student AS S, Course AS C, TA AS T, Enrolled AS E 
WHERE S.SSN=T.SSN AND E.CourseNo=C.CourseNo AND E.SSN=S.SSN AND C.TASSN=T.SSN;
SELECT * FROM TA_Course;


/* Student_Grade_A*/
CREATE VIEW Student_Grade_A (Student_SSN, NumberOfA) As
SELECT S.SSN, COUNT(*)
FROM Student AS S, Enrolled AS E
WHERE S.SSN=E.SSN AND E.Grade='A' 
GROUP BY S.SSN
HAVING COUNT(*) >= 2;
SELECT * FROM Student_Grade_A;
