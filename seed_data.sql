SET search_path TO project_schema;

--TERM
INSERT INTO TERM (term_code, name, start_date, end_date)
VALUES
(202510, 'Winter 2025', '2025-01-06', '2025-04-11'),
(202520, 'Spring/Summer 2025', '2025-04-28', '2025-08-08'),
(202530, 'Fall 2025', '2025-09-02', '2025-12-12');

--COURSE
INSERT INTO COURSE (course_code, title)
VALUES
('COMP2714', 'Relational Database Systems'),
('COMP2510', 'Procedural Programming'),
('COMP2522', 'OOP1');

--LAB
INSERT INTO LAB (lab_title)
VALUES
('Java Object-Oriented Programming Basics'),
('C Pointers and Memory Management'),
('SQL Joins and Query Optimization'),
('Java Exception Handling and File I/O'),
('Database Normalization and Constraints');

--SECTION
INSERT INTO SECTION (
    sec_code,
    sec_level,
    sec_set,
    sec_location,
    crs_code
)
VALUES
('L01', '202530', 'A', 'BBY-SW01-3460', 'COMP2714'),
('L02', '202530', 'B', 'BBY-SW01-3465', 'COMP2714'),
('L03', '202530', 'C', 'BBY-SW03-2605', 'COMP2714'),
('L04', '202530', 'D', 'BBY-SE12-101', 'COMP2714'),
('L05', '202530', 'E', 'DTC-310', 'COMP2714'),
('L06', '202530', 'F', 'DTC-318', 'COMP2714');

--SECTION_LAB
INSERT INTO SECTION_LAB (sec_code, lab_id, sec_lab_date, sec_lab_location)
VALUES
('L01', 1, '2025-09-09', 'BBY-SW01-3460'),
('L01', 2, '2025-09-16', 'BBY-SW01-3460'),
('L01', 3, '2025-09-23', 'BBY-SW01-3460'),
('L01', 4, '2025-09-30', 'BBY-SW01-3460'),
('L01', 5, '2025-10-07', 'BBY-SW01-3460'),
('L02', 1, '2025-09-10', 'BBY-SW01-3465'),
('L02', 2, '2025-09-17', 'BBY-SW01-3465'),
('L02', 3, '2025-09-24', 'BBY-SW01-3465'),
('L02', 4, '2025-10-01', 'BBY-SW01-3465'),
('L02', 5, '2025-10-08', 'BBY-SW01-3465'),
--USER
INSERT INTO USER (user_role, user_fname, user_lname, user_email)
VALUES
('INSTRUCTOR', 'Maryam', 'Khezrzadeh', 'mkhezrzadeh@bcit.ca'),
('ADMIN', 'Lab', 'Tracker System', 'noreply@labtracker.local'),
('STUDENT', 'Ava', 'Nguyen', 'ava.nguyen@my.bcit.ca'),
('STUDENT', 'Noah', 'Kim', 'noah.kim@my.bcit.ca'),
('STUDENT', 'Oliver', 'Singh', 'oliver.singh@my.bcit.ca'),
('STUDENT', 'Maya', 'Fischer', 'maya.fischer@my.bcit.ca'),
('STUDENT', 'Leo', 'Park', 'leo.park@my.bcit.ca'),
('STUDENT', 'Zoé', 'Martin', 'zoe.martin@my.bcit.ca'),
('STUDENT', 'Sofia', 'Chen', 'sofia.chen@my.bcit.ca'),
('STUDENT', 'Arjun', 'Patel', 'arjun.patel@my.bcit.ca'),
('STUDENT', 'Liam', 'O’Reilly', 'liam.oreilly@my.bcit.ca'),
('STUDENT', 'Layla', 'Haddad', 'layla.haddad@my.bcit.ca'),
('STUDENT', 'Ethan', 'Wong', 'ethan.wong@my.bcit.ca'),
('STUDENT', 'Nora', 'Iverson', 'nora.iverson@my.bcit.ca'),
('STUDENT', 'Diego', 'Alvarez', 'diego.alvarez@my.bcit.ca'),
('STUDENT', 'Hana', 'Yamamoto', 'hana.yamamoto@my.bcit.ca'),
('STUDENT', 'Farah', 'Rahimi', 'farah.rahimi@my.bcit.ca'),
('STUDENT', 'Marco', 'Russo', 'marco.russo@my.bcit.ca'),
('STUDENT', 'Amir', 'Kazemi', 'amir.kazemi@my.bcit.ca'),
('STUDENT', 'Chloe', 'Dubois', 'chloe.dubois@my.bcit.ca');

--INSTRUCTOR
INSERT INTO INSTRUCTOR (user_id, instructor_hire_date)
VALUES
(1, '2020-09-01');

--STUDENT
INSERT INTO STUDENT (user_id, student_number)
VALUES
(3, 'A001'),
(4, 'A002'),
(5, 'A003'),
(6, 'B001'),
(7, 'B002'),
(8, 'B003'),
(9, 'C001'),
(10, 'C002'),
(11, 'C003'),
(12, 'D001'),
(13, 'D002'),
(14, 'D003'),
(15, 'E001'),
(16, 'E002'),
(17, 'E003'),
(18, 'F001'),
(19, 'F002'),
(20, 'F003');

--LAB_PROGRESS
INSERT INTO LAB_PROGRESS
  (sec_code, lab_id, student_id, prog_attendance, prog_status, prog_score,
   prog_submission_link, prog_submission_timestamp,
   prog_reevaluation_link, prog_reevaluation_timestamp)
VALUES
-- A001
('L01', 1, 3, TRUE, 'SUBMITTED', 8.5, 'https://submit.bcit.ca/comp2714/inlab/A001-L01-L01.pdf',
 TIMESTAMP '2025-09-09 10:45', 'https://submit.bcit.ca/comp2714/polished/A001-L01-L01.pdf', TIMESTAMP '2025-09-10 12:45'),
('L01', 2, 3, TRUE, 'SUBMITTED', 7.0, 'https://submit.bcit.ca/comp2714/inlab/A001-L01-L02.pdf',
 TIMESTAMP '2025-09-16 10:35', 'https://submit.bcit.ca/comp2714/polished/A001-L01-L02.pdf', TIMESTAMP '2025-09-17 11:35'),

-- A002
('L01', 1, 4, TRUE, 'SUBMITTED', 8.5, 'https://submit.bcit.ca/comp2714/inlab/A002-L01-L01.pdf',
 TIMESTAMP '2025-09-09 12:45', 'https://submit.bcit.ca/comp2714/polished/A002-L01-L01.pdf', TIMESTAMP '2025-09-10 12:45'),
('L01', 2, 4, TRUE, 'IN_PROGRESS', NULL, 'https://submit.bcit.ca/comp2714/inlab/A002-L01-L02.pdf',
 TIMESTAMP '2025-09-16 10:40', '', NULL),

-- A003
('L01', 1, 5, TRUE, 'SUBMITTED', 8.5, 'https://submit.bcit.ca/comp2714/inlab/A003-L01-L01.pdf',
 TIMESTAMP '2025-09-09 10:45', 'https://submit.bcit.ca/comp2714/polished/A003-L01-L01.pdf', TIMESTAMP '2025-09-10 12:45'),
('L01', 2, 5, TRUE, 'SUBMITTED', 7.0, 'https://submit.bcit.ca/comp2714/inlab/A003-L01-L02.pdf',
 TIMESTAMP '2025-09-16 10:35', 'https://submit.bcit.ca/comp2714/polished/A003-L01-L02.pdf', TIMESTAMP '2025-09-17 11:35');

--LAB_PROGRESS_LOG
INSERT INTO LAB_PROGRESS_LOG
  (prog_id, field_name, old_value, new_value, notes, change_timestamp)
VALUES
(2, 'PROG_SCORE', 6.5, 7.0, 'Rubric tweak on problem 3', TIMESTAMP '2025-09-17 12:00'),
(3, 'PROG_SCORE', 8.0, 8.5, 'Bonus question awarded', TIMESTAMP '2025-09-10 17:00');