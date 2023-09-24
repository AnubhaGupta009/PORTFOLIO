-- Database Creation - Step 1
create database SQL_WORKING;

-- Creating connection with the database -- Step -2
use SQL_WORKING;
-- DROP DATABASE SQL_WORKING;

-- Creating a table in Mysql
create table Customer_table (Customer_ID int not null Primary key, Name text , Age int);
-- Modify the table 
alter table Customer_table add Column Sale int ;

-- Step - 3 (DQL - Data Query Language)
select * from Customer_table;

-- Inserting Values in the table
insert into Customer_Table values (1,"Ram",43,77000);
insert into Customer_table values (2,"Ravinder",23,50000);
insert into Customer_table values (3,"Rohit",65,23400);
insert into Customer_table values (4,"Ravinder",23,57300);
insert into Customer_table values (5,"Ravinder",23,40000);
insert into Customer_table values (6,"Ravinder",23,40060);
--- MODIFY COLUMN
delete from Customer_table where Customer_ID = 1;
Describe Customer_table;
-- Exercise - 1
create table movies (Id int not null primary key auto_increment, Title text, Director text, Year int, Length_minutes int);

-- Checking the table
select * from movies;

-- Inserting Values into the table
insert into movies values (1,"Toy Story","John Lasseter",1995,81);
insert into movies values (2,"A Bug's Life","John Lasseter",1998,95);
insert into movies values (3,"Toy Story 2","John Lasseter",1999,93);
insert into movies values (4,"Monsters","Peter Docter",2001,92);
insert into movies values (5,"Nemo","Andrew Stanton",2003,107);
insert into movies values (6,"The Incredibles","Brad Bird",2004,116);
insert into movies values (7,"Cars","John Lasseter",2006,117);
insert into movies values (8,"Ratatoullie","Brad Bird",2007,115);
insert into movies values (9,"Andrew Statnton","John Lasseter",1995,81);
insert into movies values (10,"Peter Docter","John Lasseter",1998,95);
insert into movies values (11,"Lee Unkrich","John Lasseter",1999,93);
insert into movies values (12,"Monsters","Peter Docter",2001,92);
insert into movies values (13,"Toy Story7","John Lasseter",1995,81);
insert into movies values (14,"A Bug's Life","John Lasseter",1998,95);

-- 1st Question
select title from movies;

-- 2nd Question
select director from movies;

-- 3rd Question
select title,director from movies;

-- 4th Question
select title,year from movies;

-- 5th Question
select * from movies;

-- Excercise  - 2
-- Question -1
select title from movies where id = 6;
-- Q2
select title,year from movies where year between 2000 and 2010;
-- Q3
select title,year from movies where year not between 2000 and 2010;
-- Q4
select title, year from movies limit 5; 

-- Exercise - 3
-- Q1
select title from movies where title like "Toy%";
-- Q2
select title, director from movies where director = "John Lasseter";
-- Q3
select title, director from movies where director != "John Lasseter";
-- Q4 
select year ,count(title) as TOT_Movies 
from movies 
group by year 
order by count(title) desc;
-- Q5 
select year ,count(title) as TOT_Movies 
from movies 
group by year 
having AVG(Length_minutes) > "100"
order by count(title) desc;


