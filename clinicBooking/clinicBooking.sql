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

-- Table: appointment
CREATE TABLE appointment (
    appointmentID INT AUTO_INCREMENT PRIMARY KEY,
    patientID INT NOT NULL,
    doctorID INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('booked','completed','cancelled') NOT NULL DEFAULT 'booked',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (patientID)
      REFERENCES patients(patientID)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (doctorID)
      REFERENCES doctors(doctorID)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
    CONSTRAINT uc_patient_doctor_datetime UNIQUE (patientID, doctorID, appointment_date)
);

-- Table: prescription
CREATE TABLE prescription (
    prescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    appointmentID INT NOT NULL,
    medicine TEXT NOT NULL,
    dosage VARCHAR(50),
    FOREIGN KEY (appointmentID)
      REFERENCES appointments(appointmentID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);


-- ----------------------------
-- Sample Data Inserts
-- ----------------------------

-- Department
INSERT INTO department (name) VALUES
  ('Cardiology'),
  ('Dermatology'),
  ('Pediatrics'),
  ('Neurology'),
  ('Orthopedics');