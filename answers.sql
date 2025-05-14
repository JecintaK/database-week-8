CREATE DATABASE CLINIC;
USE CLINIC;

--  Specializations Table
CREATE TABLE Specializations (
    specialization_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO Specializations (name) VALUES 
('Cardiology'),
('Dermatology'),
('General Practice');

-- Doctors Table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    specialization_id INT,
    FOREIGN KEY (specialization_id) REFERENCES Specializations(specialization_id)
);

INSERT INTO Doctors (full_name, email, phone, specialization_id) VALUES 
('Dr. Jess Doe', 'john@clinic.com', '0712345678', 1),
('Dr. Alice Wanyoike', 'alice@clinic.com', '0723456789', 2);

-- Patients Table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20) UNIQUE,
    address TEXT
);

INSERT INTO Patients (full_name, date_of_birth, gender, email, phone, address) VALUES 
('Mary Wanjiku', '1990-05-12', 'Female', 'mary@gmail.com', '0700111222', 'Nairobi, Kenya'),
('James Kariuki', '1985-11-23', 'Male', 'james@gmail.com', '0799887766', 'Thika, Kenya');

-- Appointments Table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, notes) VALUES 
(1, 1, '2025-05-20 10:00:00', 'Scheduled', 'Regular check-up'),
(2, 2, '2025-05-21 14:30:00', 'Scheduled', 'Skin irritation');

-- Treatments Table
CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    treatment_description TEXT NOT NULL,
    treatment_date DATETIME NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

INSERT INTO Treatments (appointment_id, treatment_description, treatment_date) VALUES 
(1, 'Blood pressure and cholesterol check', '2025-05-20 10:30:00'),
(2, 'Topical cream application and allergy test', '2025-05-21 14:45:00');

--  Prescriptions Table
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    treatment_id INT NOT NULL,
    medicine_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50) NOT NULL,
    duration VARCHAR(50) NOT NULL,
    instructions TEXT,
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

INSERT INTO Prescriptions (treatment_id, medicine_name, dosage, duration, instructions) VALUES 
(1, 'Atorvastatin', '10mg', '30 days', 'Take once daily after dinner'),
(2, 'Hydrocortisone cream', 'Apply small amount', '7 days', 'Apply to affected area twice daily');

-- Create Users Table (for system admins/staff)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Staff') NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO Users (username, password, role, email) VALUES 
('admin', 'admin 123', 'Admin', 'admin@clinic.com'),
('staff1', 'staff 456', 'Staff', 'staff1@clinic.com');
