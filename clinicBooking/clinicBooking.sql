-- Create Database
CREATE DATABASE clinicBookingDb;

-- Use Database
USE clinicBookingDb;

-- Table: department
CREATE TABLE department (
    departmentID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Table: doctor
CREATE TABLE doctor (
    doctorID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    departmentID INT NOT NULL,
    FOREIGN KEY (departmentID)
      REFERENCES departments(departmentID)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
);

-- Table: patient
CREATE TABLE patient (
    patientID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);