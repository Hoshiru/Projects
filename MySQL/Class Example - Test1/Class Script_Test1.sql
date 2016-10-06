
# ---------------------- Create Student Table ----------------------
CREATE TABLE student(
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(60) NULL,
street VARCHAR(50) NOT NULL,
city VARCHAR(40) NOT NULL,
state CHAR(2) NOT NULL DEFAULT "PA",
zip MEDIUMINT UNSIGNED NOT NULL,
phone VARCHAR(20) NOT NULL,
birth_date DATE NOT NULL,
sex ENUM('M', 'F') NOT NULL,
date_entered TIMESTAMP,
lunch_cost FLOAT NULL,
student_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);

# --------- Insert into Student Table 
INSERT INTO student VALUES('Dale', 'Cooper', 'dcooper@aol.com', 
	'123 Main St', 'Yakima', 'WA', 98901, '792-223-8901', "1959-2-22",
	'M', NOW(), 3.50, NULL); # student_id is auto_incremented, so fill-in with "null"
INSERT INTO student VALUES('Dale', 'Cooper', 'dcooper@aol.com', 
	'123 Main St', 'Yakima', 'WA', 98901, '792-223-8901', "1959-2-22",
	'M', NOW(), 3.50, NULL);
INSERT INTO student VALUES('Harry', 'Truman', 'htruman@aol.com', 
	'202 South St', 'Vancouver', 'WA', 98660, '792-223-9810', "1946-1-24",
	'M', NOW(), 3.50, NULL);
INSERT INTO student VALUES('Shelly', 'Johnson', 'sjohnson@aol.com', 
	'9 Pond Rd', 'Sparks', 'NV', 89431, '792-223-6734', "1970-12-12",
	'F', NOW(), 3.50, NULL);
INSERT INTO student VALUES('Bobby', 'Briggs', 'bbriggs@aol.com', 
	'14 12th St', 'San Diego', 'CA', 92101, '792-223-6178', "1967-5-24",
	'M', NOW(), 3.50, NULL);
INSERT INTO student VALUES('Donna', 'Hayward', 'dhayward@aol.com', 
	'120 16th St', 'Davenport', 'IA', 52801, '792-223-2001', "1970-3-24",
	'F', NOW(), 3.50, NULL);
INSERT INTO student VALUES('Audrey', 'Horne', 'ahorne@aol.com', 
	'342 19th St', 'Detroit', 'MI', 48222, '792-223-2001', "1965-2-1",
	'F', NOW(), 3.50, NULL);
INSERT INTO student VALUES('James', 'Hurley', 'jhurley@aol.com', 
	'2578 Cliff St', 'Queens', 'NY', 11427, '792-223-1890', "1967-1-2",
	'M', NOW(), 3.50, NULL);
INSERT INTO student VALUES('Lucy', 'Moran', 'lmoran@aol.com', 
	'178 Dover St', 'Hollywood', 'CA', 90078, '792-223-9678', "1954-11-27",
	'F', NOW(), 3.50, NULL);
INSERT INTO student VALUES('Tommy', 'Hill', 'thill@aol.com', 
	'672 High Plains', 'Tucson', 'AZ', 85701, '792-223-1115', "1951-12-21",
	'M', NOW(), 3.50, NULL);
INSERT INTO student VALUES('Andy', 'Brennan', 'abrennan@aol.com', 
	'281 4th St', 'Jacksonville', 'NC', 28540, '792-223-8902', "1960-12-27",
	'M', NOW(), 3.50, NULL);

show tables;    					# Shows tables currently in database
describe student;					# Shows Fields & Columns in student table
select * from test1.student;		# Returns all (*) entries in student table

# ---------------------- Create Class Table ----------------------
create table test1.class(
	name varchar(30) not null,
    class_id INT unsigned NOT NULL auto_increment PRIMARY KEY);

INSERT INTO class VALUES
('English', NULL), ('Speech', NULL), ('Literature', NULL),
('Algebra', NULL), ('Geometry', NULL), ('Trigonometry', NULL),
('Calculus', NULL), ('Earth Science', NULL), ('Biology', NULL),
('Chemistry', NULL), ('Physics', NULL), ('History', NULL),
('Art', NULL), ('Gym', NULL);

show tables;
describe class;						# Can refer to table without databaseName
select * from test1.class;			# Don't have to include databaseName.tableName unless joining 2 different tables

# ---------------------- Create Test Table ----------------------
create table test1.test(
	date DATE NOT NULL,
    type ENUM('T', 'Q') NOT NULL,
    class_id INT unsigned NOT NULL,
    test_id INT unsigned NOT NULL auto_increment PRIMARY KEY);

# -------------- Add new field to test table    
describe test;
ALTER TABLE test
ADD maxscore INT NOT NULL AFTER type;
describe test;
INSERT INTO test VALUES
	('2014-8-25', 'Q', 15, 1, NULL),
	('2014-8-27', 'Q', 15, 1, NULL),
	('2014-8-29', 'T', 30, 1, NULL),
	('2014-8-29', 'T', 30, 2, NULL),
	('2014-8-27', 'Q', 15, 4, NULL),
	('2014-8-29', 'T', 30, 4, NULL);
select * from test1.test;

# ---------------------- Create Score Table ----------------------
CREATE TABLE score(
	student_id INT unsigned NOT NULL,
    event_id INT unsigned NOT NULL,
    score INT NOT NULL,
    PRIMARY KEY(event_id, student_id));

ALTER TABLE score CHANGE event_id test_id
	INT UNSIGNED NOT NULL;
DESCRIBE score;
INSERT INTO score VALUES
	(1, 1, 15),
	(1, 2, 14),
	(1, 3, 28),
	(1, 4, 29),
	(1, 5, 15),
	(1, 6, 27),
	(2, 1, 15),
	(2, 2, 14),
	(2, 3, 26),
	(2, 4, 28),
	(2, 5, 14),
	(2, 6, 26),
	(3, 1, 14),
	(3, 2, 14),
	(3, 3, 26),
	(3, 4, 26),
	(3, 5, 13),
	(3, 6, 26),
	(4, 1, 15),
	(4, 2, 14),
	(4, 3, 27),
	(4, 4, 27),
	(4, 5, 15),
	(4, 6, 27),
	(5, 1, 14),
	(5, 2, 13),
	(5, 3, 26),
	(5, 4, 27),
	(5, 5, 13),
	(5, 6, 27),
	(6, 1, 13),
	(6, 2, 13),
	# Missed this day (6, 3, 24),
	(6, 4, 26),
	(6, 5, 13),
	(6, 6, 26),
	(7, 1, 13),
	(7, 2, 13),
	(7, 3, 25),
	(7, 4, 27),
	(7, 5, 13),
	# Missed this day (7, 6, 27),
	(8, 1, 14),
	# Missed this day (8, 2, 13),
	(8, 3, 26),
	(8, 4, 23),
	(8, 5, 12),
	(8, 6, 24),
	(9, 1, 15),
	(9, 2, 13),
	(9, 3, 28),
	(9, 4, 27),
	(9, 5, 14),
	(9, 6, 27),
	(10, 1, 15),
	(10, 2, 13),
	(10, 3, 26),
	(10, 4, 27),
	(10, 5, 12),
	(10, 6, 22);
SELECT * FROM score;

# ---------------------- Create Absence Table ----------------------
CREATE TABLE test1.absence(
	student_id INT UNSIGNED NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY(student_id, date));

describe absence;
INSERT INTO absence VALUES
	(6, '2014-08-29'),
	(7, '2014-08-29'),
	(8, '2014-08-27');

# ---------------------- Queries & Modifications (Student) ----------------------
describe student;
SELECT * FROM student;
SELECT first_name, last_name FROM student;
DELETE n1 FROM student n1, student n2 				# deletes all duplicates w/ same name from student table, keeping the entry w/ lowest student_id (key)
	WHERE n1.student_id > n2.student_id AND n1.first_name = n2.first_name;    # However, causes gaps in auto_incremented keys for the deleted entries

show tables;
RENAME table
	absence to absences,
	class to classes,
	score to scores,
	student to students,
	test to tests;
show tables;

SELECT first_name, last_name, state
	FROM students
    WHERE state="WA";
SELECT first_name, last_name, birth_date
	FROM students
    WHERE YEAR(birth_date) >= 1965;
SELECT first_name, last_name, birth_date, state
	FROM students
    WHERE MONTH(birth_date) = 2 OR state="CA";
SELECT last_name, state, birth_date
	FROM students
    WHERE DAY(birth_date) >= 12 && (state="CA" || state="NV");
SELECT last_name
	FROM students
    WHERE last_name IS NOT NULL;   # cannot use (&&, ||, AND, OR, >=, etc) with "NULL"
SELECT first_name, last_name
	FROM students
    ORDER BY last_name;			 			# alphabetical order
SELECT first_name, last_name
	FROM students
    ORDER BY last_name DESC;				# reverse order (descending)   
SELECT first_name, last_name, state
	FROM students
    ORDER BY state DESC, last_name ASC;	 	# ASC = alphabetical order
SELECT first_name, last_name
	FROM students
    LIMIT 5;								# show only first 5
SELECT first_name, last_name
	FROM students
    LIMIT 5, 10;							# show entries 6-10
SELECT CONCAT(first_name, " ", last_name) AS 'Name',
	CONCAT(city, ", ", state) AS 'Hometown'
    FROM students;							# concatenate multiple entries under new alias columns
SELECT last_name, first_name
	FROM students							# first name starts w/ D or last name ends with N
    WHERE first_name LIKE 'D%' OR last_name LIKE '%n';
SELECT last_name, first_name
	FROM students
    WHERE first_name LIKE '___y';			# first name ends w/ Y and is 4 lettters long
SELECT DISTINCT state
	FROM students
    ORDER BY state;							# shows all states in table ONCE
SELECT COUNT(DISTINCT state)
	FROM students;							# count of distinct states among students
SELECT COUNT(*)
	FROM students;							# count of all students
SELECT COUNT(*)
	FROM students;
    WHERE sex='M';							# count of all males in class
SELECT sex, COUNT(*)
	FROM students
    GROUP BY sex;							# count of males & females separate
SELECT Month(birth_date) AS 'Month', COUNT(*)
	FROM students
    GROUP BY Month
    ORDER BY Month;
SELECT state, COUNT(state) AS 'Amount'
	FROM students
    GROUP BY state
    HAVING Amount > 1;
SELECT										# math functions of score
	test_id AS 'Test',						# commas between parameters in SELECT statement
    MIN(score) AS min,						# others: ABS(), COS(), ACOS(), EXP(), MOD(), SQRT()
    MAX(score) AS max,
    SUM(score) AS total,
    AVG(score) AS average
    FROM scores
    GROUP BY test_id;

SELECT * FROM scores
	WHERE student_id = 4;
UPDATE scores SET score=25					# change an entry in scores table
	WHERE student_id = 4 && test_id=3;			# change score f/ 27 to 25 for student 4
SELECT * FROM scores 
	WHERE student_id = 4;

SELECT first_name, last_name, birth_date
	FROM students
    WHERE birth_date
    BETWEEN	'1960-1-1' AND '1970-1-1';
SELECT first_name, last_name
	FROM students
    WHERE first_name IN ('Bobby', 'Lucy', 'Andy');

# ---------------------- Joining Data f/ Different Tables ----------------------
SELECT student_id, date, score, maxscore
	FROM tests, scores
    WHERE date='2014-08-25'
    AND tests.test_id = scores.test_id;				# joined by common key
SELECT scores.student_id, tests.date, scores.score, tests.maxscore
	FROM tests, scores
    WHERE date='2014-08-25'
    AND tests.test_id = scores.test_id;				# good practice, specify table names when doing joins
 SELECT CONCAT(students.first_name, " ", students.last_name) AS Name,
	tests.date, scores.score, tests.maxscore
    FROM tests, scores, students
    WHERE date= '2014-08-25'
    AND tests.test_id = scores.test_id
    AND scores.student_id = students.student_id;

SELECT students.student_id, 
	CONCAT(students.first_name, " ", students.last_name) AS Name,
	COUNT(absences.date) AS Absences
	FROM students, absences
	WHERE students.student_id = absences.student_id
	GROUP BY students.student_id;					# absences per student
SELECT students.student_id, 
	CONCAT(students.first_name, " ", students.last_name) AS Name,
	COUNT(absences.date) AS Absences
	FROM students LEFT JOIN absences					# FROM students calculated first b4 absences
	ON students.student_id = absences.student_id
	GROUP BY students.student_id;					# absences per student including 0 absence entries
SELECT students.first_name, 
	students.last_name, scores.test_id, scores.score
	FROM students INNER JOIN scores
	ON students.student_id=scores.student_id
	WHERE scores.score <= 15
	ORDER BY scores.test_id;						# gets all rows and puts them together	
