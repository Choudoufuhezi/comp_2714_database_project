SET search_path TO lab_tracker_group_10;

-- INSERT: COURSE
INSERT INTO COURSE VALUES
  ('COMP2714', 'Relational Database Systems', 3);

-- INSERT: TERM
INSERT INTO TERM VALUES
  (202510, 'Winter 2025', '2025-01-06', '2025-04-11'),
  (202520, 'Spring/Summer 2025', '2025-04-28', '2025-08-08'),
  (202530, 'Fall 2025', '2025-09-02', '2025-12-12');

-- INSERT: SECTION
INSERT INTO SECTION VALUES
  ('L01', 'LAB', 'A', 'BBY-SW01-3460', 'Mon', '09:30', '11:20', '202530', 'COMP2714'),
  ('L02', 'LAB', 'B', 'BBY-SW01-3465', 'Mon', '13:30', '15:20', '202530', 'COMP2714'),
  ('L03', 'LAB', 'C', 'BBY-SW03-2605', 'Tue', '18:30', '20:20', '202530', 'COMP2714'),
  ('L04', 'LAB', 'D', 'BBY-SE12-101', 'Wed', '09:30', '11:20', '202530', 'COMP2714'),
  ('L05', 'LAB', 'E', 'DTC-310', 'Wed', '13:30', '15:20', '202530', 'COMP2714'),
  ('L06', 'LAB', 'F', 'DTC-318', 'Thu', '18:30', '20:20', '202530', 'COMP2714');

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
INSERT INTO SECTION_LAB
  (SEC_CODE, LAB_ID, SEC_LAB_START, SEC_LAB_END, SEC_LAB_DUE, SEC_LAB_LOCATION)
VALUES
  ('L01', 1, '2025-09-08 09:30', '2025-09-08 11:20', '2025-09-14 23:59', 'BBY-SW01-3460'),
  ('L01', 2, '2025-09-15 09:30', '2025-09-15 11:20', '2025-09-21 23:59', 'BBY-SW01-3460'),
  ('L01', 3, '2025-09-22 09:30', '2025-09-22 11:20', '2025-09-28 23:59', 'BBY-SW01-3460'),

  ('L02', 1, '2025-09-08 13:30', '2025-09-08 15:20', '2025-09-14 23:59', 'BBY-SW01-3465'),
  ('L02', 2, '2025-09-15 13:30', '2025-09-15 15:20', '2025-09-21 23:59', 'BBY-SW01-3465'),
  ('L02', 3, '2025-09-22 13:30', '2025-09-22 15:20', '2025-09-28 23:59', 'BBY-SW01-3465'),

  ('L03', 1, '2025-09-09 18:30', '2025-09-09 20:20', '2025-09-14 23:59', 'BBY-SW03-2605'),
  ('L03', 2, '2025-09-16 18:30', '2025-09-16 20:20', '2025-09-21 23:59', 'BBY-SW03-2605'),
  ('L03', 3, '2025-09-23 18:30', '2025-09-23 20:20', '2025-09-28 23:59', 'BBY-SW03-2605'),

  ('L04', 1, '2025-09-10 09:30', '2025-09-10 11:20', '2025-09-14 23:59', 'BBY-SE12-101'),
  ('L04', 2, '2025-09-17 09:30', '2025-09-17 11:20', '2025-09-21 23:59', 'BBY-SE12-101'),
  ('L04', 3, '2025-09-24 09:30', '2025-09-24 11:20', '2025-09-28 23:59', 'BBY-SE12-101'),

  ('L05', 1, '2025-09-10 13:30', '2025-09-10 15:20', '2025-09-15 09:00', 'DTC-310'),
  ('L05', 2, '2025-09-17 13:30', '2025-09-17 15:20', '2025-09-22 09:00', 'DTC-310'),
  ('L05', 3, '2025-09-24 13:30', '2025-09-24 15:20', '2025-09-29 09:00', 'DTC-310'),

  ('L06', 1, '2025-09-11 18:30', '2025-09-11 20:20', '2025-09-15 09:00', 'DTC-318'),
  ('L06', 2, '2025-09-18 18:30', '2025-09-18 20:20', '2025-09-22 09:00', 'DTC-318'),
  ('L06', 3, '2025-09-25 18:30', '2025-09-25 20:20', '2025-09-29 09:00', 'DTC-318');


-- INSERT: USER_
INSERT INTO USER_ (USER_ID, USER_ROLE, USER_FNAME, USER_LNAME, USER_EMAIL)
VALUES
  ('u_instructor', 'INSTRUCTOR', 'Maryam', 'Khezrzadeh', 'mkhezrzadeh@bcit.ca'),
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
("u_instructor", '2020-09-01');


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

-- INSERT: LAB_PROGRESS
INSERT INTO LAB_PROGRESS (
  PROG_ID, SEC_CODE, LAB_ID, STUDENT_ID,
  PROG_ATTENDANCE, PROG_STATUS, PROG_PREPARED,
  PROG_SUBMISSION_LINK, PROG_SUBMISSION_TIMESTAMP,
  PROG_REEVALUATION_LINK, PROG_REEVALUATION_TIMESTAMP,
  PROG_INSTRUCTOR_ASSESSMENT, PROG_SELF_ASSESSMENT, PROG_LATE
) VALUES
  -- L01
  ('A001-L01-L01', 'L01', 1, 'A001', TRUE, 'COMPLETED', TRUE,
   'https://submit.bcit.ca/comp2714/inlab/A001-L01-L01.pdf', '2025-09-08 10:45',
   'https://submit.bcit.ca/comp2714/polished/A001-L01-L01.pdf', '2025-09-09 12:45',
   8.5, 8.2, FALSE),
  ('A001-L01-L02', 'L01', 2, 'A001', TRUE, 'IN_PROGRESS', FALSE,
   'https://submit.bcit.ca/comp2714/inlab/A001-L01-L02.pdf', '2025-09-15 10:35',
   NULL, NULL,
   7.0, 6.7, FALSE),
  ('A002-L01-L01', 'L01', 1, 'A002', TRUE, 'COMPLETED', TRUE,
   'https://submit.bcit.ca/comp2714/inlab/A002-L01-L01.pdf', '2025-09-08 10:45',
   'https://submit.bcit.ca/comp2714/polished/A002-L01-L01.pdf', '2025-09-09 12:45',
   8.5, 8.2, FALSE),
  ('A002-L01-L02', 'L01', 2, 'A002', TRUE, 'IN_PROGRESS', FALSE,
   'https://submit.bcit.ca/comp2714/inlab/A002-L01-L02.pdf', '2025-09-15 10:40',
   NULL, NULL,
   NULL, NULL, FALSE),
  ('A003-L01-L01', 'L01', 1, 'A003', TRUE, 'COMPLETED', TRUE,
   'https://submit.bcit.ca/comp2714/inlab/A003-L01-L01.pdf', '2025-09-08 10:45',
   'https://submit.bcit.ca/comp2714/polished/A003-L01-L01.pdf', '2025-09-09 12:45',
   8.5, 8.2, FALSE),
  ('A003-L01-L02', 'L01', 2, 'A003', TRUE, 'COMPLETED', TRUE,
   'https://submit.bcit.ca/comp2714/inlab/A003-L01-L02.pdf', '2025-09-15 10:35',
   'https://submit.bcit.ca/comp2714/polished/A003-L01-L02.pdf', '2025-09-17 11:35',
   7.0, 6.7, FALSE),

  -- L02
  ('B001-L02-L01', 'L02', 1, 'B001', TRUE, 'COMPLETED', TRUE,
   'https://submit.bcit.ca/comp2714/inlab/B001-L02-L01.pdf', '2025-09-08 14:45',
   'https://submit.bcit.ca/comp2714/polished/B001-L02-L01.pdf', '2025-09-09 16:45',
   8.5, 8.2, FALSE),
  ('B001-L02-L02', 'L02', 2, 'B001', TRUE, 'COMPLETED', TRUE,
   'https://submit.bcit.ca/comp2714/inlab/B001-L02-L02.pdf', '2025-09-15 14:35',
   'https://submit.bcit.ca/comp2714/polished/B001-L02-L02.pdf', '2025-09-17 15:35',
   7.0, 6.7, FALSE),
  ('B002-L02-L01', 'L02', 1, 'B002', TRUE, 'COMPLETED', TRUE,
   'https://submit.bcit.ca/comp2714/inlab/B002-L02-L01.pdf', '2025-09-08 14:45',
   'https://submit.bcit.ca/comp2714/polished/B002-L02-L01.pdf', '2025-09-09 16:45',
   8.5, 8.2, FALSE),
  ('B002-L02-L02', 'L02', 2, 'B002', TRUE, 'IN_PROGRESS', FALSE,
   'https://submit.bcit.ca/comp2714/inlab/B002-L02-L02.pdf', '2025-09-15 14:40',
   NULL, NULL,
   NULL, NULL, FALSE),
  ('B003-L02-L01', 'L02', 1, 'B003', TRUE, 'COMPLETED', TRUE,
   'https://submit.bcit.ca/comp2714/inlab/B003-L02-L01.pdf', '2025-09-08 14:45',
   'https://submit.bcit.ca/comp2714/polished/B003-L02-L01.pdf', '2025-09-09 16:45',
   8.5, 8.2, FALSE),
  ('B003-L02-L02', 'L02', 2, 'B003', TRUE, 'COMPLETED', TRUE,
   'https://submit.bcit.ca/comp2714/inlab/B003-L02-L02.pdf', '2025-09-15 14:35',
   'https://submit.bcit.ca/comp2714/polished/B003-L02-L02.pdf', '2025-09-17 15:35',
   7.0, 6.7, FALSE);


-- INSERT: LAB_PROGRESS_LOG
INSERT INTO LAB_PROGRESS_LOG (
  PROG_ID, CHANGED_BY, FIELD_NAME, OLD_VALUE, NEW_VALUE, NOTES, CHANGE_TIMESTAMP
) VALUES
  ('A001-L01-L01', 'u_instructor', 'PROG_INSTRUCTOR_ASSESSMENT', 8.0, 8.5, 'Regraded after resubmission', '2025-09-09 12:10'),
  ('A003-L01-L02', 'u_ta1', 'PROG_STATUS', NULL, NULL, 'Student submitted during lab; TA marked as submitted', '2025-09-16 20:45'),
  ('B003-L02-L01', 'u_system', 'PROG_LATE', 0, 1, 'Auto-flagged after set-specific due time', '2025-09-23 23:59');


