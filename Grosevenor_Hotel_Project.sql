create schema grosvenor;
use grosvenor;

 -- let's create tables

create table Hotel
(Hotel_No varchar(20) primary key ,
Hotel_name varchar(50) not null,
city varchar(50) not null);

insert into hotel(Hotel_No,Hotel_name,city)
values ( 'H1' , 'grosvenor hotel' , 'london'),
( 'H2' , 'grosvenor house' , 'London'),
( 'H3' , 'The chester grosvenor' , 'Manchester');

-- Here instead of creating a single table , i created two tables Hotel_room  and room_details keeping in mind  of normaliztion

create table Hotel_room
(
Hotel_No varchar(20) not null,
room_no int primary key 
);


insert into hotel_room(Hotel_No, room_no)
values('h1' , 101),
('h1' , 102),
('h1' , 103),
('h1' , 104),
('h1' , 105),
('h1' , 106),
('h1' , 107),
('h1' , 108),
('h1' , 109),
('h1' , 110),
('h2' , 201),
('h2' , 202),
('h2' , 203),
('h2' , 204),
('h2' , 205),
('h2' , 206),
('h2' , 207),
('h2' , 208),
('h2' , 209),
('h2' , 210),
('h3' , 301),
('h3' , 302),
('h3' , 303),
('h3' , 304),
('h3' , 305),
('h3' , 306),
('h3' , 307),
('h3' , 308),
('h3' , 309),
('h3' , 310);

create table room_details
(
room_no int ,
room_type varchar(20) not null,
price int not null,
foreign key (room_no) references hotel_room(room_no)
  ON DELETE cascade 
  ON UPDATE CASCADE
);

insert into room_details (room_no,room_type ,price)
values  ( 101 , 's' , '30.00'),
( 102 , 's' , '30.00'),
( 103 , 's' , '30.00'),
( 104 , 's' , '30.00'),
( 105 , 'd' , '40.00'),
( 106 , 'd' , '40.00'),
( 107 , 'd' , '40.00'),
( 108 , 'f' , '50.00'),
( 109 , 'f' , '50.00'),
( 110 , 'f' , '50.00'),
(201 , 's' , '10.00'),
(202 , 's' , '10.00'),
(203 , 's' , '10.00'),
(204 , 's' , '10.00'),
(205 , 'd' , '20.00'),
(206 , 'd' , '20.00'),
(207 , 'd' , '20.00'),
(208 , 'f' , '30.00'),
(209 , 'f' , '30.00'),
(210 , 'f' , '30.00'),
(301, 's' , '20.00'),
(302, 's' , '20.00'),
(303, 's' , '20.00'),
(304, 's' , '20.00'),
(305, 'd' , '50.00'),
(306, 'd' , '50.00'),
(307, 'd' , '50.00'),
(308, 'f' , '60.00'),
(309, 'f' , '60.00'),
(310, 'f' , '60.00');

-- Here again i created two tables room_guest and guest_details keeping in mind of normaliztion

create table Room_guest
(
Room_no int,
guest_no varchar(20) primary key,
foreign key(Room_no) references hotel_room(room_no)
on delete cascade
on update cascade
);

insert into room_guest( room_no , guest_no)
values ( 101 , 'G11'),
 (105 , 'G15'),
 (107 , 'G17'),
 (104 , 'G14'),
 (103 , 'G13'),
 (108 , 'G18'),
 (201 , 'G21'),
 (205 , 'G25'),
 (206 , 'G26'),
 (204 , 'G24'),
 (209 , 'G29'),
 (210 , 'G210'),
 (301 , 'G31'),
 (306 , 'G36'),
 (307 , 'G37'),
 (303 , 'G33'),
 (305 , 'G35');

create table booking
(
hotel_no varchar(20),
Guest_no varchar(20),
Date_from datetime ,
date_to  datetime,
foreign key(Guest_no) references room_guest(guest_no),
foreign key(hotel_no) references hotel(hotel_no)
on delete cascade
on update cascade
);

insert into booking ( hotel_no, Guest_no , Date_from , Date_to)
values('h1' , 'g11' , '2001-08-12' , '2001-08-13'),
('h1' ,'g15' , '2001-01-12' , '2001-01-13'),
('h1' ,'g17' , '1998-02-14' , '1998-02-15'),
('h1' ,'g14' , current_date , (current_date+1)),
('h1' ,'g13' , current_date , (current_date+1)),
('h1' ,'g18' , '2000-03-03' , '2000-03-09'),
('h2' ,'g21' , '2001-01-15' , '2001-01-16'),
('h2' ,'g25' , '2000-08-17' , '2000-08-18'),
('h2' ,'g26' , '2001-01-16' , '2001-01-17'),
('h2' ,'g24' , '1999-01-13' , '1999-01-14'),
('h2' ,'g29' , '1999-01-12' , '1999-01-13'),
('h2' ,'g210' , '2001-01-11' , '2001-01-12'),
('h3' ,'g31' , '2001-01-13' , '2001-01-19'),
('h3' ,'g36' , '2001-05-14' , '2001-01-19'),
('h3' ,'g37' , '2001-08-15' , '2001-08-19'),
('h3' ,'g33' , '2001-03-16' , '2001-01-19'),
('h3' ,'g35' , '2001-04-17' , '2001-01-19');

create table Guest_details 
( 
Guest_no  varchar(20),
Guest_name varchar(50),
address varchar(50),
foreign key(Guest_no) references room_guest(Guest_no)
);

insert into guest_details( guest_no , guest_name , address)
values ( 'g11' , 'Rohit' , 'London'),
( 'g15' , 'Rohan' , 'Manchester'),
( 'g17' , 'Rahul' , 'Leeds'),
( 'g14' , 'Kunal' , 'Bristol'),
( 'g13' , 'Akshay' , 'London'),
( 'g18' , 'Roshan' , 'London'),
( 'g21' , 'Abhishek' , 'Bristol'),
( 'g25' , 'Aditya' , 'Liverpool'),
( 'G26' , 'Sobhan' , 'Derby'),
( 'G24' , 'Ankita' , 'London'),
( 'g29' , 'Ashok' , 'Manchester'),
('g210' , 'Nikhil' , 'Leeds'),
('g31', 'Somya' , 'Bristol'),
('g36', 'raghu' , 'London'),
('g31', 'amit','Pune'),
('g31', 'Ramanuj' , 'Lucknow'),
('g31', 'Abhijit' , 'Pune');


select * from hotel;
select * from hotel_room;
select * from room_details;
select * from room_guest; 
select * from booking;
select* from guest_details;

SET SQL_SAFE_UPDATES = 0;

-- To update price

update room_details set price = price*1.05;

-- Create a separate table with the same structure as the Booking table to hold archive records.

create table booking_archives
( 
hotel_no varchar(50),
Guest_no varchar(20),
Date_from datetime,
date_to datetime
);

-- Using the INSERT statement, copy the records from the Booking table to the archive table relating to bookings before 1st January 2000.

insert into booking_archives
( select*from Booking
where date_to < '2000-01-01');

-- Delete all bookings before 1st January 2000 from the Booking table.

delete from booking 
where date_to < '2000-01-01';

-- Simple queries

-- 1. List full details of all hotels.

select * from hotel;

-- 2. List full details of all hotels in London

select* from hotel where city = 'london';

-- 3. List the names and addresses of all guests in London, alphabetically ordered by name.

select Guest_name, address from 
Guest_details
where address = 'London'   -- selecting london
order by Guest_name asc;   -- ordered by guest_name in ascending order

-- 4. List all double or family rooms with a price below £40.00 per night, in ascending order of price

select * from
(select * from room_details where room_type = 'd' or room_type= 'f') as X   -- used subqueries in select statement
where X.price < 40                                                          -- selected double rooms and family room in subquery 
order by price asc;                                                         -- used where and ordered by

-- or

SELECT * FROM Room_details WHERE price < 40 AND room_type IN ('d', 'f')  -- here we have used in clause instead of subquery
ORDER BY price asc;

-- 5.List the bookings for which no date_to has been specified.

select * from booking
where date_to is null;  -- used null function

-- Aggregate function

-- 1. How many hotels are there?

select 
count(hotel_no) as No_of_hotel   -- used count function
from hotel; 

-- 2. What is the average price of a room?

select 
room_type,
avg(price) as Average_price   -- used average
from room_details
group by room_type;           -- grouped the room_types so we calculated average price of each room

-- 3.What is the total revenue per night from all double rooms?

select
sum(price) as total_revenue    -- used Sum to find total revenue
from room_details
where room_type = 'd';   

-- 4. How many different guests have made bookings for August?

select
count(distinct guest_no)                    -- used distinct function to avoid duplicate
from booking
where (month(date_from)='08') or (month(date_to)='08');    -- used month function the specify month

-- Subqueries and joins

-- 1. List the price and type of all rooms at the Grosvenor Hotel.

select price , room_type from 
room_details as rd
inner join hotel_room as hr on hr.Room_no = rd.Room_no
where hotel_no = (select hotel_no from hotel where hotel_name = 'Grosvenor Hotel');
#inner joined room_details and hotel_room to get hotel_no of respective rooms and details
# used subquery to find hotel_no of grosvenor hotel and used it in where statement

-- 2. List all guests currently staying at the Grosvenor Hotel.

SELECT * FROM Guest_details as gd
WHERE gd.guest_No in
(
SELECT b.guest_No FROM Booking as b
inner join room_guest as rg on rg.guest_no = b.guest_no
WHERE date_From <= current_date AND
date_To >= current_date AND
hotel_no = 'h1'
);
# used subquery to find the guest number those are staying currently at hotel
# then extracted their details
# used hotel number 'H1' as we know it belongs to grosvenor hotel


-- 3. List the details of all rooms at the Grosvenor Hotel, including the name of the guest staying in the room,
-- if the room is occupied.

select * from room_details as rd
left join
(
SELECT rg.guest_no as guest_number, room_no , guest_name FROM Booking as b
inner join room_guest as rg on rg.guest_no = b.guest_no
inner join guest_details as gd on gd.guest_no=rg.guest_no
WHERE date_From <= current_date AND
date_To >= current_date and 
hotel_no = 'H1'
) as Y
on y.room_no = rd.room_no;
# used subquery to find guest details of all the guest staying in grosvenor hoteln currently by using hotel_no H1 and inner joining 
# three tables booking ,room_guest and guest_details
# used alias where requied
# Used left join as it asked all the information of rooms


-- 4. What is the total income from bookings for the Grosvenor Hotel today?

select 
sum(price) as TotalIncome
from room_details as rd
inner join hotel_room as hr on hr.room_no = rd.room_no
inner join room_guest as rg on rg.room_no = rd.room_no
where rg.Guest_no in ( select b.guest_no from booking as b inner join hotel as h on h.hotel_no = b.hotel_no
					   where (date_from <= current_date and date_to >=current_date) and b.hotel_no = 'h1');
 # used subquery to find Guest number booking in grosvenor hotel today
 # the used it in where in statement to match the guest_number of joined tables with selected guest numbers
 
                    
 --  5.  List the rooms that are currently unoccupied at the Grosvenor Hotel
 
 select room_no from room_guest
 where guest_no not in (select guest_no from booking as b where (date_from = current_date and date_to >=current_date) and b.hotel_no = 'h1');
 
 -- 6. What is the lost income from unoccupied rooms at the Grosvenor Hotel?

select 
sum(price) as LostIncome
from room_details as rd
inner join hotel_room as hr on hr.room_no = rd.room_no
inner join room_guest as rg on rg.room_no = rd.room_no
where rg.Guest_no not in ( select b.guest_no from booking as b inner join hotel as h on h.hotel_no = b.hotel_no
					       where  b.hotel_no = 'h1');
# used subquery to find the guest number that are booked in grosvenor hotel                           
# then used not in statement in innerjoined tables to find the lost income


-- grouping

-- 1. List the number of rooms in each hotel.

select hr.hotel_no , count(room_no) as No_of_rooms , hotel_name as No_of_room from
hotel_room as hr
inner join hotel as h on h.hotel_no = hr.hotel_no 
group by hr.hotel_no;
# inner joined Hotel_room and hotel grouped them by hotel_no
# used count function in columns


-- 2. List the number of rooms in each hotel in London.

select hotel_name ,count(room_no) 
from hotel_room as hr
inner join hotel as h on h.hotel_no = hr.hotel_no
where city = 'London'
group by hr.hotel_no;
# here we followed the same way but we selected particularly london city hotels


-- 3. What is the average number of bookings for each hotel in August?

select hotel_no, avg(c) from
(
select hotel_no , count(hotel_no) as c
from booking
where month(date_from) = '08' or month(date_to) = '08'
group by hotel_no
) as Y
group by hotel_no;
#First used subquery  to find hotel number and count of hotels which are booked in august and grouped them by hotel number
# again used average of the count and group by hotel number

-- 4. What is the most commonly booked room type for each hotel in London?

SELECT hotel_no , MAX(X) ,room_type FROM 
( 
SELECT hotel_no, room_type, COUNT(room_type) AS X               
FROM booking as b                                               
inner join room_guest as rg on rg.guest_no = b.guest_no
inner join  room_details as rd on rd.room_no=rg.room_no
where hotel_no ='H1'
GROUP BY room_type
) as Temp

union

SELECT hotel_no , MAX(X) , room_type FROM 
(
SELECT hotel_no, room_type, COUNT(room_type) AS X
FROM booking as b
inner join room_guest as rg on rg.guest_no = b.guest_no
inner join  room_details as rd on rd.room_no=rg.room_no
where hotel_no ='H2'
GROUP BY room_type
) as Temp
;
-- Used subquery to find the count of booked room type of hotel h1
-- then used it in select statement to find the maximum booked room 
-- same did for h2 as both are in london
-- then used union to get the mamimunm booked rooms in each hotel in london


-- 5. What is the lost income from unoccupied rooms at each hotel today?

select sum(price) as lost_income , hotel_no from room_details as rd
inner join room_guest as rg on rg.room_no = rd.room_no
inner join hotel_room as hr on hr.room_no = rg.room_no
where rg.guest_no not in 
(select guest_no from booking
 where date_from <= current_date and date_to >= current_date)
group by hotel_no;
-- used subquery to find the guest no of booked  guest today then used it in inner joined tables with not in statement
-- also used group by hotel_no so that we can now the loss of each hotel