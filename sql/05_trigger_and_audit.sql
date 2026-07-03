USE NHS_Database;

DROP TRIGGER IF EXISTS trg_Appointment_Delete;

DELIMITER //

CREATE TRIGGER trg_Appointment_Delete
BEFORE DELETE ON Appointment
FOR EACH ROW
BEGIN
    INSERT INTO AppointmentAudit (
        AppointmentID,
        DeletedAt,
        DeletedBy
    )
    VALUES (
        OLD.AppointmentID,
        NOW(),
        CURRENT_USER()
    );
END //

DELIMITER ;

-- Test the trigger using a temporary appointment
INSERT INTO Appointment 
(PatientID, DoctorID, ClinicID, AppointmentDate, AppointmentTime, Notes)
VALUES 
('P001', 1, 1, '2024-06-01', '12:00:00', 'Temporary appointment for trigger test');

-- Check appointment before deletion
SELECT * FROM Appointment
WHERE Notes = 'Temporary appointment for trigger test';

-- Delete the temporary appointment
DELETE FROM Appointment
WHERE Notes = 'Temporary appointment for trigger test';

-- Check audit table after deletion
SELECT * FROM AppointmentAudit;
