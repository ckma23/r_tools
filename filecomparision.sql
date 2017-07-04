# This SQL script compares two CSV files by loading the files up
DROP SCHEMA Test;
CREATE SCHEMA Test;
CREATE TABLE Test.BaseFile (
Number INT Auto_Increment,
Firstname VARCHAR(100) NOT NULL,
Lastname VARCHAR(100) NOT NULL,
Age INT NOT NULL,
Datey Date NOT NULL,
Primary Key(Number));

desc BaseFile;

Load Data Local INFILE 'C:/users/curtis/Desktop/a.csv'
INTO Table Test.Basefile
Fields Terminated by ','
Lines terminated by '\n'
Ignore 1 rows
(@col1,@col2,@col3,@col4,@col5)
set Firstname=@col1, Lastname=@col2, Age=@col3, Datey=@col5;

Select * from Test.Basefile;


CREATE TABLE Test.CompFile (
Number INT Auto_Increment,
Firstname VARCHAR(100) NOT NULL,
Lastname VARCHAR(100) NOT NULL,
Age INT NOT NULL,
Datey Date Not NULL,
Primary Key(Number));

desc Compfile;

Load Data Local INFILE 'C:/users/curtis/Desktop/b.csv'
INTO Table Test.Compfile
Fields Terminated by ','
Lines terminated by '\n'
Ignore 1 rows
(@col1,@col2,@col3,@dummy,@col5)
set Firstname=@col1, Lastname=@col2, Age=@col3, Datey=@col5;

Select * from Test.Compfile;

USE Test;
Select B.Firstname, B.Lastname, B.Age, C.Firstname, C.Lastname, C.Age
from Basefile B
left join Compfile C on B.Firstname =  C.Firstname
					and B.Lastname = C.Lastname
						and B.Age = C.Age limit 10;
