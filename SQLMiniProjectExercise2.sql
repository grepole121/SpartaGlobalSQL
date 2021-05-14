/*2.1 Write the correct SQL statement to create the following table: 

Spartans Table – include details about all the Spartans on this course. 
Separate Title, First Name and Last Name into separate columns, 
and include University attended, course taken and mark achieved.
Add any other columns you feel would be appropriate.  */


USE georgeRepole_db;

-- IDENTITY is autoincremented operator (1,1) means starts at 1 and increments by 1
CREATE TABLE spartan_table(
    person_id INT IDENTITY(1,1),
    PRIMARY KEY(person_id),
    title VARCHAR(5),
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    university VARCHAR(50),
    course VARCHAR(50),
    mark_achieved VARCHAR(5)
);

-- 2.2 Write SQL statements to add the details of the Spartans 
-- in your course to the table you have created.	

INSERT INTO spartan_table VALUES 
    ('Mr.', 'Alexander', 'Legon', 'Uni', 'Course', '1st'),
    ('Mr.', 'Jian', 'Cruz', 'Uni', 'Course', '1st'),
    ('Mr.', 'Alex', 'Barber-Lynch', 'Uni', 'Course', '1st'),
    ('Mr.', 'Alex', 'Chang', 'Uni', 'Course', '1st'),
    ('Mr.', 'Sotiris', 'Loizou', 'Uni', 'Course', '1st'),
    ('Mr.', 'Adrian', 'Wong', 'Uni', 'Course', '1st'),
    ('Mr.', 'Thomas', 'Canfield', 'Uni', 'Course', '1st'),
    ('Mr.', 'Thomas', 'Kirkwood', 'Uni', 'Course', '1st'),
    ('Mr.', 'Karim', 'Wohler', 'Uni', 'Course', '1st');

SELECT * FROM spartan_table

SP_HELP spartan_table