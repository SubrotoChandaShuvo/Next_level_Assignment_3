CREATE DATABASE Football_Ticket_Booking_System;


-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS (In my dataBase there is no Bookings, Matches, Users table so I needn't drop any table. I just keep it from the questions)
DROP TABLE IF EXISTS Bookings;


DROP TABLE IF EXISTS Matches;


DROP TABLE IF EXISTS Users;


-- 1. CREATE USERS TABLE
CREATE TABLE Users (
  user_id int PRIMARY KEY,
  full_name varchar(100) NOT NULL,
  email varchar(100) UNIQUE NOT NULL,
  role varchar(20),
  phone_number varchar(20),
  CHECK (role IN ('Football Fan', 'Ticket Manager'))
);


-- 2. CREATE MATCHES TABLE
CREATE TABLE Matches (
  match_id int PRIMARY KEY,
  fixture varchar(100) NOT NULL,
  tournament_category varchar(50) NOT NULL,
  base_ticket_price decimal(10, 2) NOT NULL,
  match_status varchar(20),
  CHECK (base_ticket_price >= 0),
  CHECK (
    match_status IN (
      'Available',
      'Selling Fast',
      'Sold Out',
      'Postponed'
    )
  )
);


-- 3. CREATE BOOKINGS TABLE
CREATE TABLE Bookings (
  booking_id int PRIMARY KEY,
  user_id int,
  match_id int,
  seat_number varchar(20),
  payment_status varchar(20),
  total_cost decimal(10, 2),
  FOREIGN key (user_id) REFERENCES Users (user_id),
  FOREIGN key (match_id) REFERENCES Matches (match_id),
  CHECK (total_cost >= 0),
  CHECK (
    payment_status IN ('Confirmed', 'Pending', 'Cancelled', 'Refunded')
    OR payment_status IS NULL
  )
);