/*
Catherine Nguyen
CSC174 
YING JIN 
11/16/2020
UPDATED: 11/16/2020 */

/* CREATE TRIGGER Inc_enrollment_number */
DELIMITER $$
CREATE TRIGGER Inc_enrollment_number 
AFTER INSERT ON Enrolled
FOR EACH ROW
BEGIN
	IF(NEW.CourseNo IS NOT NULL) THEN
		UPDATE Course 
		SET NoOfStudents = NoOfStudents + 1 
		WHERE CourseNo = NEW.CourseNo;
	END IF;
END $$
DELIMITER ;

/* VALIDATION: checks current NoOfStudents in the Course, shows all students before trigger is created, should be 3.*/
CALL GetStudentCourse(12345);
SELECT * FROM Course WHERE CourseNo=12345; 

/* INSERT CLAUSES - enrolls 2 students into advanced db Course.*/
INSERT INTO Enrolled VALUES
(789012345, 12345, 'B');
INSERT INTO Enrolled VALUES
(890123456, 12345, 'B');

/*VALIDATION: NoOfStudents should be updated to 5.*/
CALL GetStudentCourse(12345);
SELECT * FROM Course WHERE CourseNo=12345; 




/* CREATE TRIGGER Del_enrollment_number */
DELIMITER $$
CREATE TRIGGER Del_enrollment_number
AFTER DELETE ON Enrolled
FOR EACH ROW
BEGIN
	IF(OLD.CourseNo IS NOT NULL) THEN
		UPDATE Course
		SET NoOfStudents = NoOfStudents - 1
		WHERE CourseNo = OLD.CourseNo;
	END IF;
END $$
DELIMITER ;

/* VALIDATION: checks current NoOfStudents in the Course, shows all students before trigger is created, should be 5.*/
CALL GetStudentCourse(12345);
SELECT * FROM Course WHERE CourseNo=12345; 

/* DELETE CLAUSES - drops 2 students from advanced db Course.*/
DELETE FROM Enrolled WHERE SSN=789012345 AND CourseNo=12345;
DELETE FROM Enrolled WHERE SSN=890123456 AND CourseNo=12345;

/*VALIDATION: NoOfStudents should be updated to 3.*/
CALL GetStudentCourse(12345);
SELECT * FROM Course WHERE CourseNo=12345; 

