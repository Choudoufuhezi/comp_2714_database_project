SET search_path TO lab_tracker_group_10;

TRUNCATE TABLE 
  LAB_PROGRESS_LOG,
  LAB_PROGRESS,
  SECTION_LAB,
  LAB,
  SECTION,
  TERM,
  COURSE,
  STUDENT,
  INSTRUCTOR,
  USER_,
  SET_
RESTART IDENTITY CASCADE;

-- INSERT: COURSE
INSERT INTO COURSE (CRS_CODE, CRS_TITLE, CRS_CREDITS) VALUES
  ('COMP2714', 'Relational Database Systems', 3),
  ('COMP2510', 'Procedural Programming in C', 4),
  ('COMP2522', 'Object-Oriented Programming in Java', 4),
  ('COMP2800', 'Agile Software Development Project', 3),
  ('COMP2711', 'Database Fundamentals', 3);

-- INSERT: TERM
INSERT INTO TERM (
  TERM_CODE,
  TERM_NAME,
  TERM_START_DATE,
  TERM_END_DATE
) VALUES
  ('202510', 'Winter 2025', '2025-01-06', '2025-04-11'),
  ('202520', 'Spring/Summer 2025', '2025-04-28', '2025-08-08'),
  ('202530', 'Fall 2025', '2025-09-02', '2025-12-12'),
  ('202440', 'Fall 2024', '2024-09-03', '2024-12-13'),
  ('202610', 'Winter 2026', '2026-01-05', '2026-04-10');

INSERT INTO SET_ (SET_CODE, SET_CAMPUS) VALUES
('A', 'Burnaby'),
('B', 'Burnaby'),
('C', 'Burnaby'),
('D', 'Burnaby'),
('E', 'Downtown'),
('F', 'Downtown');

-- INSERT: SECTION
INSERT INTO SECTION (
  SEC_CODE, SEC_LEVEL, SEC_SET,
  SEC_DAY_OF_WEEK, TERM_CODE, CRS_CODE
) VALUES
  ('L01', 'LAB', 'A', 'Mon', '202530', 'COMP2714'),
  ('L02', 'LAB', 'B', 'Mon', '202530', 'COMP2714'),
  ('L03', 'LAB', 'C', 'Tue', '202530', 'COMP2714'),
  ('L04', 'LAB', 'D', 'Wed', '202530', 'COMP2714'),
  ('L05', 'LAB', 'E', 'Wed', '202530', 'COMP2714'),
  ('L06', 'LAB', 'F', 'Thu', '202530', 'COMP2714');


-- INSERT: LAB
INSERT INTO LAB (LAB_ID, LAB_TITLE, LAB_ASSIGNMENT_ID)
VALUES
  (1, 'Environment Setup & Intro SQL', 'LAB01'),
  (2, 'Conceptual -> Logical Mapping', 'LAB02'),
  (3, 'Logical ERD & Constraints', 'LAB03'),
  (4, 'Normalization to 3NF', 'LAB04'),
  (5, 'DDL Implementation', 'LAB05'),
  (6, 'DML: INSERT/UPDATE/DELETE', 'LAB06'),
  (7, 'SELECT & JOIN Practice', 'LAB07'),
  (8, 'Views & Indexes', 'LAB08');

-- INSERT: SECTION_LAB
INSERT INTO SECTION_LAB (
  EVENT_CODE, SECTION_ID, LAB_ID, SEC_LAB_START, SEC_LAB_END, SEC_LAB_DUE, SEC_LAB_LOCATION
) VALUES
  -- L01
  ('L01-L01', 1, 1, '2025-09-08 09:30', '2025-09-08 11:20', '2025-09-14 23:59', 'BBY-SW01-3460'),
  ('L01-L02', 1, 2, '2025-09-15 09:30', '2025-09-15 11:20', '2025-09-21 23:59', 'BBY-SW01-3460'),
  ('L01-L03', 1, 3, '2025-09-22 09:30', '2025-09-22 11:20', '2025-09-28 23:59', 'BBY-SW01-3460'),

  -- L02
  ('L02-L01', 2, 1, '2025-09-08 13:30', '2025-09-08 15:20', '2025-09-14 23:59', 'BBY-SW01-3465'),
  ('L02-L02', 2, 2, '2025-09-15 13:30', '2025-09-15 15:20', '2025-09-21 23:59', 'BBY-SW01-3465'),
  ('L02-L03', 2, 3, '2025-09-22 13:30', '2025-09-22 15:20', '2025-09-28 23:59', 'BBY-SW01-3465'),

  -- L03
  ('L03-L01', 3, 1, '2025-09-09 18:30', '2025-09-09 20:20', '2025-09-14 23:59', 'BBY-SW03-2605'),
  ('L03-L02', 3, 2, '2025-09-16 18:30', '2025-09-16 20:20', '2025-09-21 23:59', 'BBY-SW03-2605'),
  ('L03-L03', 3, 3, '2025-09-23 18:30', '2025-09-23 20:20', '2025-09-28 23:59', 'BBY-SW03-2605'),

  -- L04
  ('L04-L01', 4, 1, '2025-09-10 09:30', '2025-09-10 11:20', '2025-09-14 23:59', 'BBY-SE12-101'),
  ('L04-L02', 4, 2, '2025-09-17 09:30', '2025-09-17 11:20', '2025-09-21 23:59', 'BBY-SE12-101'),
  ('L04-L03', 4, 3, '2025-09-24 09:30', '2025-09-24 11:20', '2025-09-28 23:59', 'BBY-SE12-101'),

  -- L05
  ('L05-L01', 5, 1, '2025-09-10 13:30', '2025-09-10 15:20', '2025-09-15 09:00', 'DTC-310'),
  ('L05-L02', 5, 2, '2025-09-17 13:30', '2025-09-17 15:20', '2025-09-22 09:00', 'DTC-310'),
  ('L05-L03', 5, 3, '2025-09-24 13:30', '2025-09-24 15:20', '2025-09-29 09:00', 'DTC-310'),

  -- L06
  ('L06-L01', 6, 1, '2025-09-11 18:30', '2025-09-11 20:20', '2025-09-15 09:00', 'DTC-318'),
  ('L06-L02', 6, 2, '2025-09-18 18:30', '2025-09-18 20:20', '2025-09-22 09:00', 'DTC-318'),
  ('L06-L03', 6, 3, '2025-09-25 18:30', '2025-09-25 20:20', '2025-09-29 09:00', 'DTC-318');



-- INSERT: USER_
INSERT INTO USER_ (USER_ID, USER_ROLE, USER_FNAME, USER_LNAME, USER_EMAIL)
VALUES
  ('u_instructor', 'INSTRUCTOR', 'Maryam', 'Khezrzadeh', 'mkhezrzadeh@bcit.ca'),
  ('u_instructor2', 'INSTRUCTOR', 'Chris', 'Thompson', 'cthompson@bcit.ca'),
  ('u_instructor3', 'INSTRUCTOR', 'Frank', 'Chan', 'fchan@bcit.ca'),
  ('u_instructor4', 'INSTRUCTOR', 'David', 'Nguyen', 'dnguyen@bcit.ca'),
  ('u_instructor5', 'INSTRUCTOR', 'Sarah', 'Miller', 'smiller@bcit.ca'),
  ('u_ta1', 'TA', 'Daniel', 'Saavedra', 'dsaavedra@bcit.ca'),
  ('u_system', 'SYSTEM', 'Lab', 'Tracker', 'noreply@labtracker.local'),
  ('A001', 'STUDENT', 'Ava', 'Nguyen', 'ava.nguyen@my.bcit.ca'),
  ('A002', 'STUDENT', 'Noah', 'Kim', 'noah.kim@my.bcit.ca'),
  ('A003', 'STUDENT', 'Oliver', 'Singh', 'oliver.singh@my.bcit.ca'),
  ('B001', 'STUDENT', 'Maya', 'Fischer', 'maya.fischer@my.bcit.ca'),
  ('B002', 'STUDENT', 'Leo', 'Park', 'leo.park@my.bcit.ca'),
  ('B003', 'STUDENT', 'Zoé', 'Martin', 'zoe.martin@my.bcit.ca'),
  ('C001', 'STUDENT', 'Sofia', 'Chen', 'sofia.chen@my.bcit.ca'),
  ('C002', 'STUDENT', 'Arjun', 'Patel', 'arjun.patel@my.bcit.ca'),
  ('C003', 'STUDENT', 'Liam', 'O''Reilly', 'liam.oreilly@my.bcit.ca'),
  ('D001', 'STUDENT', 'Layla', 'Haddad', 'layla.haddad@my.bcit.ca'),
  ('D002', 'STUDENT', 'Ethan', 'Wong', 'ethan.wong@my.bcit.ca'),
  ('D003', 'STUDENT', 'Nora', 'Iverson', 'nora.iverson@my.bcit.ca'),
  ('E001', 'STUDENT', 'Diego', 'Alvarez', 'diego.alvarez@my.bcit.ca'),
  ('E002', 'STUDENT', 'Hana', 'Yamamoto', 'hana.yamamoto@my.bcit.ca'),
  ('E003', 'STUDENT', 'Farah', 'Rahimi', 'farah.rahimi@my.bcit.ca'),
  ('F001', 'STUDENT', 'Marco', 'Russo', 'marco.russo@my.bcit.ca'),
  ('F002', 'STUDENT', 'Amir', 'Kazemi', 'amir.kazemi@my.bcit.ca'),
  ('F003', 'STUDENT', 'Chloe', 'Dubois', 'chloe.dubois@my.bcit.ca');

--INSTRUCTOR
INSERT INTO INSTRUCTOR (user_id, instructor_hire_date)
VALUES
('u_instructor', '2020-09-01'), 
('u_instructor2', '2019-08-15'),
('u_instructor3', '2021-01-10'),
('u_instructor4', '2022-04-25'),
('u_instructor5', '2023-09-05');


-- INSERT: STUDENT
INSERT INTO STUDENT (USER_ID)
VALUES
  ('A001'),
  ('A002'),
  ('A003'),
  ('B001'),
  ('B002'),
  ('B003'),
  ('C001'),
  ('C002'),
  ('C003'),
  ('D001'),
  ('D002'),
  ('D003'),
  ('E001'),
  ('E002'),
  ('E003'),
  ('F001'),
  ('F002'),
  ('F003');


INSERT INTO LAB_PROGRESS (
    PROG_ID, EVENT_ID, STUDENT_ID, PROG_STATUS, PROG_PREPARED, PROG_ATTENDANCE,
    PROG_SUBMISSION_TIMESTAMP, PROG_SUBMISSION_LINK,
    PROG_REEVALUATION_TIMESTAMP, PROG_REEVALUATION_LINK,
    PROG_INSTRUCTOR_ASSESSMENT, PROG_SELF_ASSESSMENT, PROG_LATE
) VALUES
-- L01
('A001-L01-L01', 1, 'A001', 'COMPLETED', TRUE, TRUE,
 '2025-09-08 10:45', 'https://submit.bcit.ca/comp2714/inlab/A001-L01-L01.pdf',
 '2025-09-09 12:45', 'https://submit.bcit.ca/comp2714/polished/A001-L01-L01.pdf',
 8.5, 8.2, FALSE),
('A001-L01-L02', 2, 'A001', 'COMPLETED', TRUE, TRUE,
 '2025-09-15 10:35', 'https://submit.bcit.ca/comp2714/inlab/A001-L01-L02.pdf',
 '2025-09-17 11:35', 'https://submit.bcit.ca/comp2714/polished/A001-L01-L02.pdf',
 7.0, 6.7, FALSE),
('A002-L01-L01', 1, 'A002', 'COMPLETED', TRUE, TRUE,
 '2025-09-08 10:45', 'https://submit.bcit.ca/comp2714/inlab/A002-L01-L01.pdf',
 '2025-09-09 12:45', 'https://submit.bcit.ca/comp2714/polished/A002-L01-L01.pdf',
 8.5, 8.2, FALSE),
('A002-L01-L02', 2, 'A002', 'IN_PROGRESS', TRUE, TRUE,
 '2025-09-15 10:40', 'https://submit.bcit.ca/comp2714/inlab/A002-L01-L02.pdf',
 NULL, NULL, NULL, NULL, FALSE),
('A003-L01-L01', 1, 'A003', 'COMPLETED', TRUE, TRUE,
 '2025-09-08 10:45', 'https://submit.bcit.ca/comp2714/inlab/A003-L01-L01.pdf',
 '2025-09-09 12:45', 'https://submit.bcit.ca/comp2714/polished/A003-L01-L01.pdf',
 8.5, 8.2, FALSE),
('A003-L01-L02', 2, 'A003', 'COMPLETED', FALSE, TRUE,
 '2025-09-15 10:35', 'https://submit.bcit.ca/comp2714/inlab/A003-L01-L02.pdf',
 '2025-09-17 11:35', 'https://submit.bcit.ca/comp2714/polished/A003-L01-L02.pdf',
 7.0, 6.7, FALSE),

-- L02
('B001-L02-L01', 4, 'B001', 'COMPLETED', TRUE, TRUE,
 '2025-09-08 14:45', 'https://submit.bcit.ca/comp2714/inlab/B001-L02-L01.pdf',
 '2025-09-09 16:45', 'https://submit.bcit.ca/comp2714/polished/B001-L02-L01.pdf',
 8.5, 8.2, FALSE),
('B001-L02-L02', 5, 'B001', 'COMPLETED', TRUE, TRUE,
 '2025-09-15 14:35', 'https://submit.bcit.ca/comp2714/inlab/B001-L02-L02.pdf',
 '2025-09-17 15:35', 'https://submit.bcit.ca/comp2714/polished/B001-L02-L02.pdf',
 7.0, 6.7, FALSE),
('B002-L02-L01', 4, 'B002', 'COMPLETED', TRUE, TRUE,
 '2025-09-08 14:45', 'https://submit.bcit.ca/comp2714/inlab/B002-L02-L01.pdf',
 '2025-09-09 16:45', 'https://submit.bcit.ca/comp2714/polished/B002-L02-L01.pdf',
 8.5, 8.2, FALSE),
('B002-L02-L02', 5, 'B002', 'IN_PROGRESS', TRUE, TRUE,
 '2025-09-15 14:40', 'https://submit.bcit.ca/comp2714/inlab/B002-L02-L02.pdf',
 NULL, NULL, NULL, NULL, FALSE),
('B003-L02-L01', 4, 'B003', 'COMPLETED', TRUE, TRUE,
 '2025-09-08 14:45', 'https://submit.bcit.ca/comp2714/inlab/B003-L02-L01.pdf',
 '2025-09-09 16:45', 'https://submit.bcit.ca/comp2714/polished/B003-L02-L01.pdf',
 8.5, 8.2, FALSE),
('B003-L02-L02', 5, 'B003', 'COMPLETED', FALSE, TRUE,
 '2025-09-15 14:35', 'https://submit.bcit.ca/comp2714/inlab/B003-L02-L02.pdf',
 '2025-09-17 15:35', 'https://submit.bcit.ca/comp2714/polished/B003-L02-L02.pdf',
 7.0, 6.7, FALSE),

-- L03
('C001-L03-L01', 7, 'C001', 'COMPLETED', TRUE, TRUE,
 '2025-09-09 19:45', 'https://submit.bcit.ca/comp2714/inlab/C001-L03-L01.pdf',
 '2025-09-10 21:45', 'https://submit.bcit.ca/comp2714/polished/C001-L03-L01.pdf',
 8.5, 8.2, FALSE),
('C001-L03-L02', 8, 'C001', 'COMPLETED', TRUE, TRUE,
 '2025-09-16 19:35', 'https://submit.bcit.ca/comp2714/inlab/C001-L03-L02.pdf',
 '2025-09-18 20:35', 'https://submit.bcit.ca/comp2714/polished/C001-L03-L02.pdf',
 7.0, 6.7, FALSE),
('C002-L03-L01', 7, 'C002', 'COMPLETED', TRUE, TRUE,
 '2025-09-09 19:45', 'https://submit.bcit.ca/comp2714/inlab/C002-L03-L01.pdf',
 '2025-09-10 21:45', 'https://submit.bcit.ca/comp2714/polished/C002-L03-L01.pdf',
 8.5, 8.2, FALSE),
('C002-L03-L02', 8, 'C002', 'IN_PROGRESS', TRUE, TRUE,
 '2025-09-16 19:40', 'https://submit.bcit.ca/comp2714/inlab/C002-L03-L02.pdf',
 NULL, NULL, NULL, NULL, FALSE),
('C003-L03-L01', 7, 'C003', 'COMPLETED', TRUE, TRUE,
 '2025-09-09 19:45', 'https://submit.bcit.ca/comp2714/inlab/C003-L03-L01.pdf',
 '2025-09-10 21:45', 'https://submit.bcit.ca/comp2714/polished/C003-L03-L01.pdf',
 8.5, 8.2, FALSE),
('C003-L03-L02', 8, 'C003', 'COMPLETED', FALSE, TRUE,
 '2025-09-16 19:35', 'https://submit.bcit.ca/comp2714/inlab/C003-L03-L02.pdf',
 '2025-09-18 20:35', 'https://submit.bcit.ca/comp2714/polished/C003-L03-L02.pdf',
 7.0, 6.7, FALSE),

-- L04
('D001-L04-L01', 10, 'D001', 'COMPLETED', TRUE, TRUE,
 '2025-09-10 10:45', 'https://submit.bcit.ca/comp2714/inlab/D001-L04-L01.pdf',
 '2025-09-11 12:45', 'https://submit.bcit.ca/comp2714/polished/D001-L04-L01.pdf',
 8.5, 8.2, FALSE),
('D001-L04-L02', 11, 'D001', 'COMPLETED', TRUE, TRUE,
 '2025-09-17 10:35', 'https://submit.bcit.ca/comp2714/inlab/D001-L04-L02.pdf',
 '2025-09-19 11:35', 'https://submit.bcit.ca/comp2714/polished/D001-L04-L02.pdf',
 7.0, 6.7, FALSE),
('D002-L04-L01', 10, 'D002', 'COMPLETED', TRUE, TRUE,
 '2025-09-10 10:45', 'https://submit.bcit.ca/comp2714/inlab/D002-L04-L01.pdf',
 '2025-09-11 12:45', 'https://submit.bcit.ca/comp2714/polished/D002-L04-L01.pdf',
 8.5, 8.2, FALSE),
('D002-L04-L02', 11, 'D002', 'IN_PROGRESS', TRUE, TRUE,
 '2025-09-17 10:40', 'https://submit.bcit.ca/comp2714/inlab/D002-L04-L02.pdf',
 NULL, NULL, NULL, NULL, FALSE),
('D003-L04-L01', 10, 'D003', 'COMPLETED', TRUE, TRUE,
 '2025-09-10 10:45', 'https://submit.bcit.ca/comp2714/inlab/D003-L04-L01.pdf',
 '2025-09-11 12:45', 'https://submit.bcit.ca/comp2714/polished/D003-L04-L01.pdf',
 8.5, 8.2, FALSE),
('D003-L04-L02', 11, 'D003', 'COMPLETED', FALSE, TRUE,
 '2025-09-17 10:35', 'https://submit.bcit.ca/comp2714/inlab/D003-L04-L02.pdf',
 '2025-09-19 11:35', 'https://submit.bcit.ca/comp2714/polished/D003-L04-L02.pdf',
 7.0, 6.7, FALSE),

-- L05
('E001-L05-L01', 13, 'E001', 'COMPLETED', TRUE, TRUE,
 '2025-09-10 14:45', 'https://submit.bcit.ca/comp2714/inlab/E001-L05-L01.pdf',
 '2025-09-11 16:45', 'https://submit.bcit.ca/comp2714/polished/E001-L05-L01.pdf',
 8.5, 8.2, FALSE),
('E001-L05-L02', 14, 'E001', 'COMPLETED', TRUE, TRUE,
 '2025-09-17 14:35', 'https://submit.bcit.ca/comp2714/inlab/E001-L05-L02.pdf',
 '2025-09-19 15:35', 'https://submit.bcit.ca/comp2714/polished/E001-L05-L02.pdf',
 7.0, 6.7, FALSE),
('E002-L05-L01', 13, 'E002', 'COMPLETED', TRUE, TRUE,
 '2025-09-10 14:45', 'https://submit.bcit.ca/comp2714/inlab/E002-L05-L01.pdf',
 '2025-09-11 16:45', 'https://submit.bcit.ca/comp2714/polished/E002-L05-L01.pdf',
 8.5, 8.2, FALSE),
('E002-L05-L02', 14, 'E002', 'IN_PROGRESS', TRUE, TRUE,
 '2025-09-17 14:40', 'https://submit.bcit.ca/comp2714/inlab/E002-L05-L02.pdf',
 NULL, NULL, NULL, NULL, FALSE),
('E003-L05-L01', 13, 'E003', 'COMPLETED', TRUE, TRUE,
 '2025-09-10 14:45', 'https://submit.bcit.ca/comp2714/inlab/E003-L05-L01.pdf',
 '2025-09-11 16:45', 'https://submit.bcit.ca/comp2714/polished/E003-L05-L01.pdf',
 8.5, 8.2, FALSE),
('E003-L05-L02', 14, 'E003', 'COMPLETED', FALSE, TRUE,
 '2025-09-17 14:35', 'https://submit.bcit.ca/comp2714/inlab/E003-L05-L02.pdf',
 '2025-09-19 15:35', 'https://submit.bcit.ca/comp2714/polished/E003-L05-L02.pdf',
 7.0, 6.7, FALSE),

-- L06
('F001-L06-L01', 16, 'F001', 'COMPLETED', TRUE, TRUE,
 '2025-09-11 19:45', 'https://submit.bcit.ca/comp2714/inlab/F001-L06-L01.pdf',
 '2025-09-12 21:45', 'https://submit.bcit.ca/comp2714/polished/F001-L06-L01.pdf',
 8.5, 8.2, FALSE),
('F001-L06-L02', 17, 'F001', 'COMPLETED', TRUE, TRUE,
 '2025-09-18 19:35', 'https://submit.bcit.ca/comp2714/inlab/F001-L06-L02.pdf',
 '2025-09-20 20:35', 'https://submit.bcit.ca/comp2714/polished/F001-L06-L02.pdf',
 7.0, 6.7, FALSE),
('F002-L06-L01', 16, 'F002', 'COMPLETED', TRUE, TRUE,
 '2025-09-11 19:45', 'https://submit.bcit.ca/comp2714/inlab/F002-L06-L01.pdf',
 '2025-09-12 21:45', 'https://submit.bcit.ca/comp2714/polished/F002-L06-L01.pdf',
 8.5, 8.2, FALSE),
('F002-L06-L02', 17, 'F002', 'IN_PROGRESS', TRUE, TRUE,
 '2025-09-18 19:40', 'https://submit.bcit.ca/comp2714/inlab/F002-L06-L02.pdf',
 NULL, NULL, NULL, NULL, FALSE),
('F003-L06-L01', 16, 'F003', 'COMPLETED', TRUE, TRUE,
 '2025-09-11 19:45', 'https://submit.bcit.ca/comp2714/inlab/F003-L06-L01.pdf',
 '2025-09-12 21:45', 'https://submit.bcit.ca/comp2714/polished/F003-L06-L01.pdf',
 8.5, 8.2, FALSE),
('F003-L06-L02', 17, 'F003', 'COMPLETED', FALSE, TRUE,
 '2025-09-18 19:35', 'https://submit.bcit.ca/comp2714/inlab/F003-L06-L02.pdf',
 '2025-09-20 20:35', 'https://submit.bcit.ca/comp2714/polished/F003-L06-L02.pdf',
 7.0, 6.7, FALSE);

-- INSERT: LAB_PROGRESS_LOG
INSERT INTO LAB_PROGRESS_LOG (
  PROG_CODE, CHANGED_BY, FIELD_NAME, OLD_VALUE, NEW_VALUE, NOTES, CHANGE_TIMESTAMP
) VALUES
  (1, 'u_instructor', 'PROG_INSTRUCTOR_ASSESSMENT', '8.0', '8.5', 'Regraded after resubmission', '2025-09-09 12:10'),
  (6, 'u_ta1', 'PROG_STATUS', 'IN_PROGRESS', 'COMPLETED', 'Student submitted during lab; TA marked as submitted', '2025-09-16 20:45'),
  (15, 'u_system', 'PROG_LATE', 'FALSE', 'TRUE', 'Auto-flagged after set-specific due time', '2025-09-23 23:59'),
  (18, 'u_instructor', 'PROG_LATE', 'TRUE', 'FALSE', 'Instructor approved late submission due to illness documentation', '2025-09-25 10:15'),
  (27, 'u_system', 'PROG_SELF_ASSESSMENT', '6.7', '7.0', 'System recalculated normalized self-assessment after data refresh', '2025-09-26 08:30');

  


