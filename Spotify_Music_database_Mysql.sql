CREATE DATABASE Spotify_Music_Database1;
Show databases;
use Spotify_music_database1;
-- drop database Spotify_Music_Database1;
CREATE TABLE User (
    user_ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    FirstName varchar(25) NOT NULL,
    LastName varchar(25),
    Age int,
    Address varchar(20)
);
show tables;
-- ALTER TABLE user
-- RENAME COLUMN ID TO user_ID; 
desc user;
INSERT INTO user (user_ID, FirstName, LastName, Age, address) VALUES (1,"Venktesh", "Mane", '25', "pune"),(2,"Vamshi", "Krishna", '24', "banglore"), ('3',"Vijaya", "Kadiyala", '22', "Vijaywada"), ('4', "kalpesh", "Kadam", '26', "delhi");
select * from user;

-- delete from user where id=4;
INSERT INTO user values('5', "Dinkar", "Mane", '25', "Mumbai");
INSERT INTO user values('6', "Mahesh", "Mane", '25', "Pune");
select Lastname, age from user where Lastname="Mane";
update user set age=24 where lastname="Mane";
CREATE TABLE playlist (
    user_id int default 0,
    Playlist_ID INT NOT NULL AUTO_INCREMENT,
    Playlist_Name varchar(25) NOT NULL,
    Description varchar(25),
	Total_Songs varchar(25),
    FOREIGN KEY (Playlist_ID)
	REFERENCES user(user_ID)
);
select * from playlist;
INSERT INTO playlist (Playlist_ID, Playlist_Name, Description, Total_Songs) VALUES (1001,"Remix", "All remix Songs",15),(1002,"Devotional", "All devotional God Songs",17), ('1003',"Rap", "All rap songs",45), ('1004', "Punjabi", "All kind of Punjabi songs",22);

-- UPDATE playlist set Playlist_ID = 1001 where User_ID = 1;
-- UPDATE playlist set Playlist_ID = 1002 where User_ID = 2;
-- UPDATE playlist set Playlist_ID = 1003 where User_ID = 3;
-- UPDATE playlist set Playlist_ID = 1004 where User_ID = 4;

CREATE TABLE track (
    Track_ID INT NOT NULL AUTO_INCREMENT,
    user_ID INT not null default 0,
    Playlist_ID INT not null default 0,
    Track_Name varchar(25) NOT NULL,
    Singer_Name varchar(25),
    Type varchar(30),
    FOREIGN KEY (Track_ID)  
	REFERENCES user(user_ID)
);
select * from Track;
desc track;
INSERT INTO Track (Track_ID, Track_Name, Singer_Name, Type) VALUES (1001,"Ranjha", "B_Prak", "Album"),(1002,"Lungi_Dance", "Hone_Sing", "Album"), (1003,"Kalchahma", "Neha_Kakkar", "Album"), (1004,"Taro Ke Shahar", "Neha_Kakkar", "Album");
UPDATE Track set Singer_Name="Honey_Sing" where Track_ID = '2';

-- ALTER table track add User_ID int not null ;
-- ALTER table track add playlist_ID int not null ;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/track.csv'  
INTO TABLE track 
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\n'   
IGNORE 1 ROWS;

UPDATE track set Track_ID = '6rkqqLPg9Lbsdh26JMqfp0' where user_ID = 1;
UPDATE track set Track_ID = '16XEVyPh5NT31CAAqPbxQF' where user_id = 2;
UPDATE track set Track_ID = '1t87LHCpCB30IkBlMOmXvT' where user_id = 3;
UPDATE track set Track_ID = '3Dynm9FulpKmgcoeYoe8Tp' where user_id = 4;

CREATE TABLE Venktesh (
    Track_ID INT NOT NULL AUTO_INCREMENT,
    Track_Name varchar(25) NOT NULL,
    Singer_Name varchar(25),
    Type varchar(30),
    FOREIGN KEY (Track_ID)  
	REFERENCES user(ID)
);
show tables;
-- rename table venktesh to venky18;

						-- Constraints (Not null, UniqueKey, PrimaryKey, Foren Key, Default, Check)-- 
CREATE TABLE Persons (  
    ID int NOT NULL,  
    Name varchar(45) NOT NULL,  
    Age int CHECK (Age>=18)  
);
INSERT INTO Persons(Id, Name, Age)   
VALUES (1,'Venktesh', 28), (2, 'Vamshi', 35), (3, 'Neeta', 40);
select * from persons;
INSERT INTO Persons(Id, Name, Age) VALUES (4,'Rajnikant', 15); -- check that age
CREATE TABLE Shirts (    
    id INT PRIMARY KEY AUTO_INCREMENT,     
    name VARCHAR(35),     
    size ENUM('small', 'medium', 'large', 'x-large')    
); 
INSERT INTO Shirts(id, name, size)     
VALUES (1,'t-shirt', 'medium'),     
(2, 'casual-shirt', 'small'),     
(3, 'formal-shirt', 'large'); 
select * from shirts;

									-- clauses (Where, As, Distinct, From, and, or, with)-- 
select Lastname, age from user where Lastname="Mane";     					-- Where clause--
SELECT DISTINCT Firstname,age 
FROM user; 																	-- Distinct Clause-- 
select Lastname, age from user where Lastname="Mane"; 						-- From Clause--
SELECT *  
FROM user  
WHERE LastName = 'Mane'  
ORDER BY Firstname DESC;													-- Order By Clause--
SELECT age, COUNT(*)  
FROM user   
GROUP BY age;															-- Group By Clause--	
SELECT Firstname, SUM(age) AS "Total age"  
FROM user  
GROUP BY FirstName;  
SELECT FirstName, MIN(age) AS "Minimum age"  
FROM user 
Group BY Firstname;
SELECT Firstname, MAX(age) AS"Maximum age"  
FROM user 
Group BY user_ID;
SELECT user_ID, AVG(age) AS "Average age"  
FROM User  
Group BY age;
SELECT Firstname, SUM(age) AS "age"  
FROM user  
GROUP BY Firstname  
HAVING SUM(age) > 25;														-- Having Clause--

SELECT FIRST(LastName) as first_user FROM User;
select * from playlist;  
									-- Conditions-- 
SELECT *  																-- AND --
FROM user  
WHERE Lastname = 'Mane'  
AND user_ID < 7; 
SELECT *  																-- OR --
FROM user  
WHERE Lastname = 'Mane'  
OR user_ID > 100; 
SELECT *  																-- AND OR --
FROM user  
WHERE (LastName = 'Mane' AND FirstName = 'Venktesh')  
OR (user_id > 7);
SELECT *  																-- Between -- 
FROM user  
WHERE id BETWEEN 1 AND 3;  

SELECT FIRST(total_songs) FROM playlist;								-- First--  

SELECT Last(user_ID) FROM user;												-- Last-- 
select * from track;

SELECT UPPER(TYPE) FROM Track;											-- UPPER CASE --

select * from track;
SELECT Lower(TYPE) FROM Track;											-- Lower CASE --

CREATE TABLE student (  
    studentid INT,  
    name VARCHAR(40) NOT NULL,  
    age VARCHAR(3),  
    pass BOOLEAN  
); 
select * from student;
INSERT INTO student(studentid, name, age, pass) VALUES(1,'Venktesh',25,true), (2,'Vamshi',30,false);  
SELECT  studentid, name, pass FROM student;
INSERT INTO student(name, pass) VALUES('Vijaya',2);
SELECT  studentid, name, IF(pass, 'true', 'false') completed FROM student;
SELECT studentid, name, pass FROM student WHERE pass is TRUE;

										-- Joins-- 
SELECT user.user_ID, track.track_ID, track.Playlist_ID  
FROM user   
INNER JOIN track
ON user.user_ID = track.User_ID;

SELECT user.user_ID, user.age, track.Playlist_ID  
FROM user   
LEFT JOIN track
ON user.user_ID = track.Playlist_ID;

SELECT user.user_ID, user.address, Playlist.Playlist_ID  
FROM user   
RIGHT JOIN playlist  
ON user.user_ID = Playlist.Playlist_ID;

SELECT *  
FROM user   
FULL JOIN playlist  
ON user.user_ID = Playlist.playlist_ID;

SELECT *  
FROM user  
CROSS JOIN playlist;

SELECT user.user_ID, user.address, Playlist.user_ID, track.user_ID
FROM user 
INNER JOIN playlist ON user.user_ID = Playlist.user_ID
INNER JOIN track ON Playlist.user_ID = track.user_ID
ORDER BY user.user_ID;
SELECT user.user_ID, user.address, Playlist.user_ID, track.user_ID
FROM user 
Right JOIN playlist ON user.user_ID = Playlist.user_ID
Right JOIN track ON Playlist.user_ID = track.user_ID
ORDER BY user.user_ID;
SELECT user.user_ID, user.address, Playlist.user_ID, track.user_ID
FROM user 
left JOIN playlist ON user.user_ID = Playlist.user_ID
left JOIN track ON Playlist.user_ID = track.user_ID
ORDER BY user.user_ID;

												-- Upload Data -- 
show tables;
CREATE TABLE Employee (  
    Emp_ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,   
    Emp_Name varchar(35) NOT NULL,   
    Email varchar(35),  
    Mobile varchar(15),   
    Address varchar(45)
); 
select * from employee;
select * from employee;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Upload1.csv'  
INTO TABLE Employee  
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\n'   
IGNORE 1 ROWS;
select * from employee;
-- truncate table Employee;

SELECT *
INTO OUTFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/download5.csv"
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
FROM employee;
select * from employee;

									-- SavePoint and Commit -- 
CREATE TABLE College
(ID int NOT NULL PRIMARY KEY AUTO_INCREMENT, College_Name VARCHAR(40), Number_Of_Students INT, Number_Of_Teachers INT, Number_Of_Classrooms INT, Email_ID VARCHAR(40));
select * from college;
START TRANSACTION;
INSERT INTO College(ID, College_Name, Number_Of_Students, Number_Of_Teachers, Number_Of_Classrooms, Email_ID) 
VALUES(1, "Govt.Polytechnic", 1000, 80, 12, "GPP18@gmail.com"), 
(2, "Guru Govind Singh Public College", 800, 35, 15, "ggpc25@gmail.com"), 
(3, "GSM College", 1200, 30, 10, "GSM101@gmail.com"), 
(4, "JSPM College of Engineering", 1110, 40, 40, "JSPM17@gmail.com"), 
(5, "College of Engineering", 900, 31, 50, "coep@gmail.com");
select * from college;
commit;
SAVEPOINT College;

										-- Rollback-- 
show databases;
use spotify_music_database;
select * from college;
START TRANSACTION;
SAVEPOINT Insertion;
select * from college;
UPDATE college SET Number_Of_Students = 1010 WHERE ID = 5;
select * from college;
SAVEPOINT Updation;
ROLLBACK TO Insertion;
select * from college;
commit;
START TRANSACTION;
SAVEPOINT rollback1;
DELETE FROM college WHERE ID = 5; 
select * from college;
-- SAVEPOINT Deletion; -- 
ROLLBACK to rollback1;
select * from college;

----------------------------------- Sub Queries -------------------------------
use Spotify_music_database;
select * from user;
SELECT * 
FROM user 
   WHERE user_ID IN (SELECT user_ID 
         FROM user 
         WHERE age > 24) ;

select * from Track;
SELECT * 
FROM track 
   WHERE user_ID IN (SELECT track_ID 
         FROM track 
         WHERE user_ID=1) ;