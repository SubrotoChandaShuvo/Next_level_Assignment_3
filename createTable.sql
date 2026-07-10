create database Football_Ticket_Booking_System;


-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS (In my dataBase there is no Bookings, Matches, Users table so I needn't drop any table. I just keep it from the questions)
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;


-- 1. CREATE USERS TABLE
CREATE TABLE Users (
    user_id int primary key,
    full_name varchar(100) not null,
    email varchar(100) unique not null,
    role varchar(20),
    phone_number varchar(20),
    check (role in ('Football Fan', 'Ticket Manager'))
);