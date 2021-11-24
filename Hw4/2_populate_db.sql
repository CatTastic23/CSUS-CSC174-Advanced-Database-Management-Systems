/*
Catherine Nguyen
CSC 174
Ying Jin
11/15/2020
UPDATED: 11/16/2020 */

/* Student */
INSERT INTO Student VALUES
(214407735, 'Seymour Butz', '2727 W March Ln, Stockton, CA 95219', 'seymourbutz@fake.com');
INSERT INTO Student VALUES
(115505525, 'Mike Rotch', '2625 W Kettleman Ln, Lodi, CA 95242', 'mikerotch@fake.com');
INSERT INTO Student VALUES
(123456789, 'Moe Ron', '16514 Golden Valley Pkwy, Lathrop, CA 95330', 'moeron@fake.com');
INSERT INTO Student VALUES
(987654321, 'Oliver Klozoff', '9188 E Stockton Blvd, Elk Grove, CA 95624', 'oliverklozoff@@fake.com');
INSERT INTO Student VALUES
(543216789, 'Amanda Hugginkiss', '2001 Alta Arden Exwy., Sacramento, CA 95825', 'amandahugginkissfake.com');
INSERT INTO Student VALUES
(678954321, 'Hugh Jass', '4600 Madison Ave, Sacramento, CA 95841', 'hughjass@fake.com');
/* These are the students I decided to use for the triggers. */
INSERT INTO Student VALUES
(789012345, 'Ivana Tinkle', '2475 Sunrise Blvd, Rancho Cordova, CA 95670', 'ivanatinkle@@fake.com');
INSERT INTO Student VALUES
(890123456, 'Yuri Nator', '3501 Truxel Rd, Sacramento, CA 95834', 'yurinator@fake.com');


/* Instructor */
INSERT INTO Instructor VALUES
('Professor', 111111111, 'Ying Jin');
INSERT INTO Instructor VALUES
('Professor', 222222222, 'Anna Baynes');
INSERT INTO Instructor VALUES
('Professor', 333333333, 'Michelle Norris');
INSERT INTO Instructor VALUES
('Professor', 444444444, 'Xiaoyan Sun');
INSERT INTO Instructor VALUES
('Professor', 555555555, 'Haiquan Chen');

/* TA */
INSERT INTO TA VALUES
(214407735, 15.55);
INSERT INTO TA VALUES
(123456789, 16.55);
INSERT INTO TA VALUES
(543216789, 16.50);

/* Course */
INSERT INTO Course VALUES
(12345, 'Advanced Database Management Systems', 3, 111111111, 123456789);
INSERT INTO Course VALUES
(23456, 'Data Warehousing and Data Mining', 3, 222222222, 123456789);
INSERT INTO Course VALUES
(34567, 'Introduction to Probability Theory', 3, 333333333, 214407735);
INSERT INTO Course VALUES
(45678, 'Computer Forensics Principles and Practices', 3, 444444444, 214407735);
INSERT INTO Course VALUES
(56789, 'Intelligent Systems', 3, 555555555, NULL);
INSERT INTO Course VALUES
(67890, 'Database Management Systems', 3, 111111111, 214407735);
INSERT INTO Course VALUES
(78901, 'Introduction to Mathematical Statisitcs', 3, 333333333, 543216789);

/* Enrolled */
INSERT INTO Enrolled VALUES
(214407735, 12345, 'A');
INSERT INTO Enrolled VALUES
(214407735, 23456, 'A');
INSERT INTO Enrolled VALUES
(214407735, 34567, 'A');
INSERT INTO Enrolled VALUES
(214407735, 45678, 'A');
INSERT INTO Enrolled VALUES
(214407735, 67890, 'A');
INSERT INTO Enrolled VALUES
(543216789, 56789, 'A');
INSERT INTO Enrolled VALUES
(115505525, 56789, 'D');
INSERT INTO Enrolled VALUES
(115505525, 23456, 'C');
INSERT INTO Enrolled VALUES
(115505525, 67890, 'F');
INSERT INTO Enrolled VALUES
(123456789, 12345, 'C');
INSERT INTO Enrolled VALUES
(123456789, 23456, 'B');
INSERT INTO Enrolled VALUES
(123456789, 78901, 'A');
INSERT INTO Enrolled VALUES
(987654321, 34567, 'D');
INSERT INTO Enrolled VALUES
(987654321, 45678, 'C');
INSERT INTO Enrolled VALUES
(987654321, 67890, 'F');
INSERT INTO Enrolled VALUES
(543216789, 45678, 'A');
INSERT INTO Enrolled VALUES
(543216789, 78901, 'D');
INSERT INTO Enrolled VALUES
(678954321, 56789, 'A');
INSERT INTO Enrolled VALUES
(678954321, 12345, 'F');
INSERT INTO Enrolled VALUES
(678954321, 34567, 'A');
INSERT INTO Enrolled VALUES
(678954321, 78901, 'A');

/* OnlineCourse */
INSERT INTO OnlineCourse VALUES
(12345, 'https://csus.zoom.us/j/97924806971');
INSERT INTO OnlineCourse VALUES
(23456, 'https://csus.zoom.us/j/7043055709');
INSERT INTO OnlineCourse VALUES
(45678, 'https://csus.zoom.us/j/99963148416');

/* Classroom */
INSERT INTO Classroom VALUES
(202, 'SQU', 30);
INSERT INTO Classroom VALUES
(101, 'RVR', 30);

/* TraditionalCourse */
INSERT INTO TraditionalCourse VALUES
(34567, 202, 'SQU', '9:00 am');
INSERT INTO TraditionalCourse VALUES
(56789, 202, 'SQU', '12:00 pm');
INSERT INTO TraditionalCourse VALUES
(67890, 101, 'RVR', '1:30 am');
INSERT INTO TraditionalCourse VALUES
(78901, 101, 'RVR', '2:00 pm');

/* TESTING */
SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM TA;
SELECT * FROM Course;
SELECT * FROM Enrolled;
SELECT * FROM OnlineCourse;
SELECT * FROM Classroom;
SELECT * FROM TraditionalCourse;
SELECT * FROM TAView;
SELECT * FROM OnlineCourseView;
SELECT * FROM TraditionalCourseView;
