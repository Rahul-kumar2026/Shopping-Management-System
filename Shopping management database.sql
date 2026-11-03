drop database if exists Shopping_Management;
create database Shopping_Management;
use Shopping_Management;

create table customers(
Customer_id int primary key auto_increment,
Customer_name varchar(100) not null,
Email varchar(255) not null unique,
Phone_number char(10) unique,
Age tinyint unsigned check(Age>0),
Gender enum('Male','Female','Other'),
Country varchar(50) default 'India',
City varchar(50) not null,
Pincode char(6) default '201301',
Registration_Date date default(current_date),
Registration_Time time default(current_time),
Created_At timestamp default(current_timestamp),
Address varchar(250),
Customer_Status enum('Active','Inactive','Blocked') default 'Active',
Customer_Notes varchar(150));

create table Orders(
Order_Id int primary key auto_increment,
Customer_Id int not null,
Order_Date date default(current_date),
Order_Amount decimal(10,2) not null,
Order_Status enum('Pending','Processing','Shipped','Delivered','Cancelled') default 'Pending',
Payment_Method enum('Cash','Card','UPI', 'Net Banking'),
Payment_Status enum('Pending','Paid','Failed') default 'Pending',
Shipping_Address varchar (250) not null,
Delivery_Pincode char(6),
Quantity int unsigned not null check(Quantity>0),
Discount_Amount decimal(10,2) default(0),
Delivery_Date Date,
Created_At timestamp default(current_timestamp),
Tracking_Number varchar(30) unique not null,
Delivery_Status enum('Not Dispatched','Transit','Delivered','Returned') default 'Not Dispatched',
Order_Notes varchar(50),
Foreign key (Customer_Id) references customers(Customer_id) on delete cascade on update cascade);













