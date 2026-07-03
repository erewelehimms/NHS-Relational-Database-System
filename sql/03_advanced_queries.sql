USE NHS_Database;

-- Query 1: Show all database tables
SHOW TABLES;

-- Query 2: Display all patient records
SELECT 
    PatientID,
    PatientName,
    PatientAddress,
    PasswordHash
FROM Patient;

-- Query 3: Display all appointments with patient, doctor, and clinic details
SELECT 
    a.AppointmentID,
    p.PatientName,
    d.DoctorName,
    d.Specialty,
    c.ClinicName,
    a.AppointmentDate,
    a.AppointmentTime,
    a.Notes
FROM Appointment a
INNER JOIN Patient p ON a.PatientID = p.PatientID
INNER JOIN Doctor d ON a.DoctorID = d.DoctorID
INNER JOIN Clinic c ON a.ClinicID = c.ClinicID
ORDER BY a.AppointmentDate;

-- Query 4: Count total appointments by doctor specialty
SELECT 
    d.Specialty,
    COUNT(a.AppointmentID) AS TotalAppointments
FROM Doctor d
LEFT JOIN Appointment a ON d.DoctorID = a.DoctorID
GROUP BY d.Specialty
ORDER BY TotalAppointments DESC;

-- Query 5: Count total patients by clinic
SELECT 
    c.ClinicName,
    COUNT(DISTINCT a.PatientID) AS TotalPatients
FROM Clinic c
LEFT JOIN Appointment a ON c.ClinicID = a.ClinicID
GROUP BY c.ClinicName
ORDER BY TotalPatients DESC;

-- Query 6: Show patient medication history
SELECT 
    p.PatientName,
    d.DoctorName,
    c.ClinicName,
    m.MedicationName,
    a.AppointmentDate,
    a.Notes
FROM AppointmentMedication am
INNER JOIN Appointment a ON am.AppointmentID = a.AppointmentID
INNER JOIN Patient p ON a.PatientID = p.PatientID
INNER JOIN Doctor d ON a.DoctorID = d.DoctorID
INNER JOIN Clinic c ON a.ClinicID = c.ClinicID
INNER JOIN Medication m ON am.MedicationID = m.MedicationID
ORDER BY p.PatientName;

-- Query 7: Find appointments after 1 May 2024
SELECT 
    p.PatientName,
    d.DoctorName,
    c.ClinicName,
    a.AppointmentDate,
    a.AppointmentTime
FROM Appointment a
INNER JOIN Patient p ON a.PatientID = p.PatientID
INNER JOIN Doctor d ON a.DoctorID = d.DoctorID
INNER JOIN Clinic c ON a.ClinicID = c.ClinicID
WHERE a.AppointmentDate > '2024-05-01'
ORDER BY a.AppointmentDate;

-- Query 8: Update appointment note
UPDATE Appointment
SET Notes = 'Updated follow-up appointment note'
WHERE AppointmentID = 1;

-- Query 9: Check updated appointment record
SELECT 
    AppointmentID,
    PatientID,
    DoctorID,
    ClinicID,
    AppointmentDate,
    AppointmentTime,
    Notes
FROM Appointment
WHERE AppointmentID = 1;

-- Query 10: Count number of medications per patient
SELECT 
    p.PatientName,
    COUNT(m.MedicationID) AS TotalMedications
FROM Patient p
INNER JOIN Appointment a ON p.PatientID = a.PatientID
INNER JOIN AppointmentMedication am ON a.AppointmentID = am.AppointmentID
INNER JOIN Medication m ON am.MedicationID = m.MedicationID
GROUP BY p.PatientName
ORDER BY TotalMedications DESC;
