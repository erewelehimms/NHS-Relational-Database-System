USE NHS_Database;

INSERT INTO Clinic (ClinicName, ClinicAddress) VALUES
('Clinic A', '10 Main St'),
('Clinic B', '22 River Rd'),
('Clinic C', '45 Park Lane'),
('Clinic D', '78 Queen Street'),
('Clinic E', '19 King Road'),
('Clinic F', '88 Green Avenue'),
('Clinic G', '12 Station Road'),
('Clinic H', '33 Oak Street'),
('Clinic I', '65 Bridge Road'),
('Clinic J', '91 Church Lane');

INSERT INTO Doctor (DoctorName, Specialty, ClinicID) VALUES
('Dr. Adams', 'Cardiology', 1),
('Dr. Brown', 'General Practice', 2),
('Dr. Clark', 'Orthopaedics', 3),
('Dr. Davis', 'Paediatrics', 4),
('Dr. Evans', 'Neurology', 5),
('Dr. Green', 'Dermatology', 6),
('Dr. Harris', 'ENT', 7),
('Dr. Lewis', 'Radiology', 8),
('Dr. Martin', 'Oncology', 9),
('Dr. Wilson', 'Endocrinology', 10);

INSERT INTO Patient (PatientID, PatientName, PatientAddress, PasswordHash) VALUES
('P001', 'John Smith', '123 Hill Rd', SHA2('securePass001', 256)),
('P002', 'Mary Jones', '456 Lake Ave', SHA2('securePass002', 256)),
('P003', 'Ahmed Khan', '77 Rose Street', SHA2('securePass003', 256)),
('P004', 'Sarah White', '18 New Road', SHA2('securePass004', 256)),
('P005', 'James Brown', '90 West Lane', SHA2('securePass005', 256)),
('P006', 'Fatima Ali', '51 East Road', SHA2('securePass006', 256)),
('P007', 'Robert Green', '34 South Street', SHA2('securePass007', 256)),
('P008', 'Aisha Malik', '62 North Avenue', SHA2('securePass008', 256)),
('P009', 'David Taylor', '27 Market Road', SHA2('securePass009', 256)),
('P010', 'Emma Wilson', '81 Garden Street', SHA2('securePass010', 256));

INSERT INTO Medication (MedicationName) VALUES
('Aspirin'),
('Beta Blocker'),
('Paracetamol'),
('Ibuprofen'),
('Amoxicillin'),
('Metformin'),
('Atorvastatin'),
('Omeprazole'),
('Salbutamol'),
('Lisinopril');

INSERT INTO Appointment 
(PatientID, DoctorID, ClinicID, AppointmentDate, AppointmentTime, Notes) VALUES
('P001', 1, 1, '2024-05-01', '10:00:00', 'Follow-up in 2 weeks'),
('P002', 2, 2, '2024-05-03', '09:00:00', 'First visit'),
('P003', 3, 3, '2024-05-05', '11:00:00', 'Knee pain consultation'),
('P004', 4, 4, '2024-05-07', '13:30:00', 'Child health review'),
('P005', 5, 5, '2024-05-09', '15:00:00', 'Headache assessment'),
('P006', 6, 6, '2024-05-11', '10:30:00', 'Skin rash review'),
('P007', 7, 7, '2024-05-13', '12:00:00', 'Ear infection'),
('P008', 8, 8, '2024-05-15', '14:00:00', 'X-ray review'),
('P009', 9, 9, '2024-05-17', '16:00:00', 'Cancer screening'),
('P010', 10, 10, '2024-05-19', '09:30:00', 'Diabetes review');

INSERT INTO AppointmentMedication (AppointmentID, MedicationID) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 6);

SELECT * FROM Clinic;
SELECT * FROM Doctor;
SELECT * FROM Patient;
SELECT * FROM Medication;
SELECT * FROM Appointment;
SELECT * FROM AppointmentMedication;
