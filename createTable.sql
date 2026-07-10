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


-- 2. CREATE MATCHES TABLE
CREATE TABLE Matches (
    match_id int primary key,
    fixture varchar(100) not null,
    tournament_category varchar(50) not null,
    base_ticket_price int not null,
    match_status varchar(20),

    check (base_ticket_price >= 0),

    check (
        match_status in ('Available', 'Selling Fast', 'Sold Out')
    )
);