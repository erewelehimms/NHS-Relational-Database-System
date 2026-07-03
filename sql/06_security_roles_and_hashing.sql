USE NHS_Database;

-- Create user roles
CREATE ROLE IF NOT EXISTS nhs_admin;
CREATE ROLE IF NOT EXISTS nhs_doctor;
CREATE ROLE IF NOT EXISTS nhs_receptionist;
CREATE ROLE IF NOT EXISTS nhs_patient;

-- Administrator role: full access
GRANT ALL PRIVILEGES ON NHS_Database.* TO nhs_admin;

-- Doctor role: read patient, appointment, medication, and clinic information
GRANT SELECT ON NHS_Database.Patient TO nhs_doctor;
GRANT SELECT ON NHS_Database.Appointment TO nhs_doctor;
GRANT SELECT ON NHS_Database.AppointmentMedication TO nhs_doctor;
GRANT SELECT ON NHS_Database.Medication TO nhs_doctor;
GRANT SELECT ON NHS_Database.Clinic TO nhs_doctor;

-- Receptionist role: appointment management access
GRANT SELECT ON NHS_Database.Patient TO nhs_receptionist;
GRANT SELECT ON NHS_Database.Doctor TO nhs_receptionist;
GRANT SELECT ON NHS_Database.Clinic TO nhs_receptionist;
GRANT SELECT, INSERT, UPDATE ON NHS_Database.Appointment TO nhs_receptionist;

-- Patient role: view-only access
GRANT SELECT ON NHS_Database.Patient TO nhs_patient;
GRANT SELECT ON NHS_Database.Appointment TO nhs_patient;

-- Show SHA2 password hashing result
SELECT 
    PatientID,
    PatientName,
    PasswordHash
FROM Patient;

-- Demonstrate new password hashing
SELECT SHA2('NewPatientPassword123', 256) AS ExamplePasswordHash;

-- SQL injection prevention example using prepared statement
PREPARE stmt FROM 'SELECT PatientID, PatientName, PatientAddress FROM Patient WHERE PatientID = ?';

SET @patient_id = 'P001';

EXECUTE stmt USING @patient_id;

DEALLOCATE PREPARE stmt;

-- Show granted role information
SHOW GRANTS FOR nhs_admin;
SHOW GRANTS FOR nhs_doctor;
SHOW GRANTS FOR nhs_receptionist;
SHOW GRANTS FOR nhs_patient;
