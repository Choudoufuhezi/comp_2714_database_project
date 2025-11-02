SET search_path TO lab_tracker_group_10;

--List all tables:

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'lab_tracker_group_10';

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


-- These should all return 0 rows if the FKs are intact

-- LAB_PROGRESS should reference valid SECTION_LAB rows
SELECT lp.*
FROM LAB_PROGRESS lp
LEFT JOIN SECTION_LAB sl ON lp.event_id = sl.event_id
WHERE sl.event_id IS NULL;

-- LAB_PROGRESS should reference valid STUDENT rows
SELECT lp.*
FROM LAB_PROGRESS lp
LEFT JOIN STUDENT s ON lp.student_id = s.user_id
WHERE s.user_id IS NULL;

-- SECTION should reference valid COURSE and TERM
SELECT s.*
FROM SECTION s
LEFT JOIN COURSE c ON s.crs_code = c.crs_code
LEFT JOIN TERM t ON s.term_code = t.term_code
WHERE c.crs_code IS NULL OR t.term_code IS NULL;


-- Domain definitions and formats

-- Test USER_ROLE domain
SELECT DISTINCT user_role FROM USER_;

-- Test COURSE_CODE format
SELECT crs_code FROM COURSE WHERE crs_code !~ '^[A-Z]{4}[0-9]{3,4}$';

-- Test TERM_NAME format
SELECT term_name
FROM TERM
WHERE term_name !~ '^(Winter|Spring|Summer|Fall|Spring/Summer) [0-9]{4}$';


-- Test PROGRESS_STATUS values
SELECT DISTINCT prog_status FROM LAB_PROGRESS;

-- List all students with their enrolled labs
SELECT lp.prog_id, u.user_fname, u.user_lname, sl.sec_code, sl.lab_id, lp.prog_status
FROM LAB_PROGRESS lp
JOIN SECTION_LAB sl ON sl.event_id = lp.event_id
JOIN STUDENT st ON st.user_id = lp.student_id
JOIN USER_ u ON u.user_id = st.user_id
ORDER BY sl.sec_code, sl.lab_id, u.user_lname;

-- Show labs per section to validate SECTION_LAB mapping
SELECT s.sec_code, COUNT(sl.lab_id) AS num_labs
FROM SECTION s
JOIN SECTION_LAB sl USING (sec_code)
GROUP BY s.sec_code
ORDER BY s.sec_code;


-- Number of students who completed Lab across all sections
SELECT sl.lab_id, COUNT(*) AS completed_count
FROM LAB_PROGRESS lp
JOIN SECTION_LAB sl ON lp.event_id = sl.event_id
WHERE lp.prog_status = 'COMPLETED'
GROUP BY sl.lab_id
ORDER BY sl.lab_id;

-- Average instructor score per section
SELECT sl.sec_code, AVG(lp.prog_instructor_assessment) AS avg_assessment
FROM LAB_PROGRESS lp
JOIN SECTION_LAB sl ON lp.event_id = sl.event_id
GROUP BY sl.sec_code
ORDER BY sl.sec_code;