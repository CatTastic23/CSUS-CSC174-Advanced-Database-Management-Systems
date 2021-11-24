/*
Catherine Nguyen
CSC174 
YING JIN 
11/15/2020
UPDATED: 11/16/2020
CREATE TABLE SQL*/

/* Student */
CREATE TABLE Student 
(SSN INTEGER NOT NULL,
StudentName VARCHAR(35) NOT NULL,
Address VARCHAR(100) NOT NULL, 
Email VARCHAR(30) NOT NULL,
CONSTRAINT StudentPK
	PRIMARY KEY (SSN));
	
/* Instructor */
CREATE TABLE Instructor
(Title VARCHAR(15) NOT NULL,
InstructorID INTEGER NOT NULL,
InstructorName VARCHAR(35) NOT NULL,
CONSTRAINT InstructorPK
	PRIMARY KEY (InstructorID));
	
/* TA */
CREATE TABLE TA
(SSN INTEGER NOT NULL,
Salary DECIMAL(5,2) NOT NULL,
CONSTRAINT TA_PK
	PRIMARY KEY (SSN),
CONSTRAINT TA_FK
	FOREIGN KEY (SSN) REFERENCES Student(SSN));
	
/* Course */
CREATE TABLE Course
(CourseNo INTEGER NOT NULL,
CourseName VARCHAR(50) NOT NULL,
NoOfStudents INTEGER NOT NULL,
InstructorID INTEGER NOT NULL,
TASSN INTEGER,
CONSTRAINT CoursePK
	PRIMARY KEY (CourseNo),
CONSTRAINT Course_InstructorID_FK
	FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
CONSTRAINT Course_TASSN_FK
	FOREIGN KEY (TASSN) REFERENCES TA(SSN));
	
/* Enrolled */
CREATE TABLE Enrolled
(SSN INTEGER NOT NULL,
CourseNo INTEGER NOT NULL,
Grade CHAR NOT NULL,
CONSTRAINT EnrolledPK
	PRIMARY KEY (SSN, CourseNo), 
CONSTRAINT Enrolled_SSN_FK
	FOREIGN KEY (SSN) REFERENCES Student(SSN),
CONSTRAINT Enrolled_CourseNo_FK
	FOREIGN KEY (CourseNo) REFERENCES Course(CourseNo));
	
/* OnlineCourse */
CREATE TABLE OnlineCourse
(CourseNo INTEGER NOT NULL,
URL VARCHAR(1000) NOT NULL,
CONSTRAINT OnlineCoursePK
	PRIMARY KEY (CourseNo),
CONSTRAINT OnlineCourseFK
	FOREIGN KEY (CourseNo) REFERENCES Course(CourseNo));
	
/* Classroom */
CREATE TABLE Classroom
(RoomNo INTEGER NOT NULL,
Building CHAR(3) NOT NULL,
Capacity INTEGER NOT NULL,
CONSTRAINT ClassroomPk
	PRIMARY KEY (RoomNo, Building));
	
/* TraditionalCourse */
CREATE TABLE TraditionalCourse
(CourseNo INTEGER NOT NULL,
RoomNo INTEGER NOT NULL,
Building CHAR(3) NOT NULL,
ClassTime VARCHAR(10) NOT NULL, 
CONSTRAINT TraditionalCoursePK
	PRIMARY KEY (CourseNo),
CONSTRAINT TraditionalCourse_FK
	FOREIGN KEY (RoomNo, Building) REFERENCES Classroom(RoomNo, Building));
	
/* CREATE VIEWS */
/* TAView */
CREATE VIEW TAView AS
SELECT S.SSN, S.StudentName, S.Address, S.Email, T.Salary  
FROM Student AS S, TA AS T 
WHERE S.SSN=T.SSN;

/*OnlineView*/
CREATE VIEW OnlineCourseView AS
SELECT C.CourseNo, C.CourseName, C.InstructorID, C.NoOfStudents, C.TASSN, W.URL
FROM Course AS C, OnlineCourse AS W
WHERE C.CourseNo = W.CourseNo;

/*TraditionalCourseView*/
CREATE VIEW TraditionalCourseView AS
SELECT C.CourseNo, C.CourseName, C.InstructorID, C.NoOfStudents, C.TASSN, T.ClassTime, T.RoomNo, T.Building
FROM Course AS C, TraditionalCourse AS T
WHERE C.CourseNo = T.CourseNo;

/* DESC */
/* TESTER INPUT
DESC Student;
DESC Instructor;
DESC TA;
DESC Course;
DESC Enrolled;
DESC OnlineCourse;
DESC Classroom;
DESC TraditionalCourse;
*/	
