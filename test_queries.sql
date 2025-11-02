SET search_path TO lab_tracker_group_10;

--List all tables:

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'lab_tracker_group_10';

-- Counting tests:
-- Count the number of rows in the tables

SELECT 'COURSE' AS table, COUNT(*) FROM COURSE UNION ALL
SELECT 'TERM', COUNT(*) FROM TERM UNION ALL
SELECT 'SECTION', COUNT(*) FROM SECTION UNION ALL
SELECT 'LAB', COUNT(*) FROM LAB UNION ALL
SELECT 'SECTION_LAB', COUNT(*) FROM SECTION_LAB UNION ALL
SELECT 'USER_', COUNT(*) FROM USER_ UNION ALL
SELECT 'INSTRUCTOR', COUNT(*) FROM INSTRUCTOR UNION ALL
SELECT 'STUDENT', COUNT(*) FROM STUDENT UNION ALL
SELECT 'LAB_PROGRESS', COUNT(*) FROM LAB_PROGRESS UNION ALL
SELECT 'LAB_PROGRESS_LOG', COUNT(*) FROM LAB_PROGRESS_LOG;

-- JOIN tests:
-- These should all return 0 rows if the FKs are intact

-- LAB_PROGRESS should reference valid SECTION_LAB rows
SELECT *
FROM LAB_PROGRESS lp 
LEFT JOIN SECTION_LAB sl ON lp.sec_code = sl.sec_code AND lp.lab_id = sl.lab_id
WHERE sl.sec_code IS NULL;

-- LAB_PROGRESS should reference valid STUDENT rows
SELECT *
FROM LAB_PROGRESS lp
LEFT JOIN STUDENT s ON lp.student_id = s.user_id
WHERE s.user_id IS NULL;

-- SECTION should reference valid COURSE and TERM
SELECT *
FROM SECTION s
LEFT JOIN COURSE c ON s.crs_code = c.crs_code
LEFT JOIN TERM t ON s.term_code = t.term_code
WHERE c.crs_code IS NULL OR t.term_code IS NULL;