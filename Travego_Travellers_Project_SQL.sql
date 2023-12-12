--  1. (Easy) Creating the schema and required tables using MySQL workbench

--  a. Create a schema named Travego and create the tables mentioned above with the mentioned column names. 
--  Also, declare the relevant datatypes for each feature/column in the dataset. 

#  CREATING A DATABASE Travego	
create database Travego;
use Travego;

# CREATING A TABLE WITH NAME PASSENGER AND PRICE 
create table Passenger(
Passenger_iD int primary key,
Passenger_name varchar(20),
Category varchar(20),
Gender varchar(20),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(20));


create table Price(
id int primary key,
Bus_Type varchar(20),
Distance int,
Price int);

describe table Passenger;
describe table Price;

-- b. Insert the data in the newly created tables.

insert into Passenger (Passenger_id,Passenger_name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type)
values
(1, 'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
(2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
(3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
(4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
(5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
(6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
(7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
(8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
(9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

select*from Passenger;

insert into Price (id , Bus_Type, Distance, Price)
values
(1, 'Sleeper', 350, 770),
(2, 'Sleeper', 500, 1100),
(3, 'Sleeper', 600, 1320),
(4, 'Sleeper', 700, 1540),
(5, 'Sleeper', 1000, 2200),
(6, 'Sleeper', 1200, 2640),
(7, 'Sleeper', 1500, 2700),
(8, 'Sitting', 500, 620),
(9, 'Sitting', 600, 744),
(10, 'Sitting', 700, 868),
(11, 'Sitting', 1000, 1240),
(12, 'Sitting', 1200, 1488),
(13, 'Sitting', 1500, 1860);

select* from Price;

-- 2.Perform read operation on the designed table created in the above task.

-- a. How many female passengers traveled a minimum distance of 600 KMs?
 
 select count(Gender) as Female_Passenger from Passenger
 where Gender='F' and Distance >=600;
 
-- b. Write a query to display the passenger details whose travel distance is greater than 500 and
-- who are traveling in a sleeper bus. 

select* from Passenger
where Distance > 500 and Bus_Type = 'Sleeper';

-- c. Select passenger names whose names start with the character 'S'.

select Passenger_name from Passenger 
where Passenger_name like 's%';

-- d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,
-- Destination City, Bus type, and Price in the output. 

select P.Passenger_name, P.Boarding_city, P.Destination_City, P.Bus_Type, PR.Price
from Passenger P join Price PR
on P.Bus_Type = PR.Bus_Type and P.Distance = PR.Distance;

-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in
-- a bus?

select P.Passenger_name, PR.Price as Ticket_price from Passenger P join Price PR
on P.Bus_Type = PR.Bus_Type and P.Distance = PR.Distance
where P.Bus_Type = "Sitting" and PR.Distance = 1000; 

-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
 
 SELECT P.Passenger_name, PR.Bus_Type, PR.Price as Bus_Charge FROM Passenger P
 JOIN Price PR On P.Distance = PR.Distance 
 WHERE P.Passenger_name = 'Pallavi';
 
-- g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper?

update Passenger
set Category = 'Non-AC'
where Bus_Type = 'Sleeper';
set sql_safe_updates = 0 ; # It was not showing me output, So I used Sql safe update...
select * from passenger;

-- h. Delete an entry from the table where the passenger name is Piyush and commit this change in
-- the database. 

set autocommit = 0; # By default in sql is commit, So i set auto commit = 0.
delete from Passenger
where Passenger_name = "Piyush";
commit; # I used commit here, because The name piyush was deleted permanantely.

-- i. Truncate the table passenger and comment on the number of rows in the table (explain if
-- required).

truncate table Passenger;
select*From Passenger;

# After truncating the table Passenger, all rows in the "Passenger" table will be deleted
# But the structure of the table will remain same
# and the table will have zero rows.

-- j. Delete the table passenger from the database?

drop table Passenger;
# The table Passenger was deleted and no more structure will be there.

select*from Passenger;  # The table Passenger does not exist after deleting.





