CREATE DATABASE IF NOT EXISTS NHS_Database;
USE NHS_Database;

DROP TABLE IF EXISTS AppointmentMedication;
DROP TABLE IF EXISTS AppointmentAudit;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Medication;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Clinic;

CREATE TABLE Clinic (
    ClinicID INT AUTO_INCREMENT PRIMARY KEY,
    ClinicName VARCHAR(100) NOT NULL UNIQUE,
    ClinicAddress VARCHAR(200) NOT NULL
);

CREATE TABLE Doctor (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    ClinicID INT NOT NULL,
    FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID)
);

CREATE TABLE Patient (
    PatientID VARCHAR(10) PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    PatientAddress VARCHAR(200) NOT NULL,
    PasswordHash VARCHAR(256)
);

CREATE TABLE Medication (
    MedicationID INT AUTO_INCREMENT PRIMARY KEY,
    MedicationName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Appointment (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID VARCHAR(10) NOT NULL,
    DoctorID INT NOT NULL,
    ClinicID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID)
);

CREATE TABLE AppointmentMedication (
    AppointmentID INT NOT NULL,
    MedicationID INT NOT NULL,
    PRIMARY KEY (AppointmentID, MedicationID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
    FOREIGN KEY (MedicationID) REFERENCES Medication(MedicationID)
);

CREATE TABLE AppointmentAudit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT,
    DeletedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    DeletedBy VARCHAR(100)
);
