USE NHS_Database;

DROP PROCEDURE IF EXISTS GetDoctorSummary;

DELIMITER //

CREATE PROCEDURE GetDoctorSummary(
    IN inputDoctorID INT
)
BEGIN
    SELECT 
        d.DoctorID,
        d.DoctorName,
        d.Specialty,
        c.ClinicName,
        COUNT(a.AppointmentID) AS TotalAppointments,
        COUNT(DISTINCT a.PatientID) AS UniquePatients,
        MIN(a.AppointmentDate) AS FirstAppointment,
        MAX(a.AppointmentDate) AS LatestAppointment
    FROM Doctor d
    INNER JOIN Clinic c ON d.ClinicID = c.ClinicID
    LEFT JOIN Appointment a ON d.DoctorID = a.DoctorID
    WHERE d.DoctorID = inputDoctorID
    GROUP BY 
        d.DoctorID,
        d.DoctorName,
        d.Specialty,
        c.ClinicName;
END //

DELIMITER ;

-- Execute stored procedure
CALL GetDoctorSummary(1);
