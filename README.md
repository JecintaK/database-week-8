
-- Project Title
Clinic Booking System 

 -- Description

This project is a full-featured relational database designed to support the operations of a clinic booking system.
It models real-world entities such as doctors, patients, appointments, treatments, prescriptions, and system users.
The database captures relationships and enforces constraints using primary keys, foreign keys, and field constraints.

-- Features:
- Manages patient and doctor information
- Handles appointment scheduling and tracking
- Records treatment history and prescribed medications
- Differentiates system access roles (Admin vs Staff)

-- How to Run the Project
Requirements:
- MySQL Server 
- MySQL Workbench

### Steps:

1. Download the SQL file 
   Obtain `clinic_booking_system.sql` containing all `CREATE TABLE` and sample `INSERT` statements.

2. Open your SQL environment 
   e.g MySQL Workbench

3. Create a new database*
   
   CREATE DATABASE clinic_db;
   USE clinic_db;

4. Import the SQL script
Load and run the contents of clinic_booking_system.sql.

5. Verify tables and data
Use SQL queries to confirm the structure:

SHOW TABLES;
SELECT * FROM Doctors;
