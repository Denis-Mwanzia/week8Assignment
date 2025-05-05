-- Create Database
CREATE DATABASE clinicBookingDb;

-- Use Database
USE clinicBookingDb;

-- Table: department
CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);