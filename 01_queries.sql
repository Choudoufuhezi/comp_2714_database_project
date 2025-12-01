set search_path = lab_tracker_group_10;

-- 1) Upcoming Lab Events--
SELECT sl.SECTION_ID, s.SEC_SET, s.CRS_CODE, l.LAB_TITLE, DATE(sl.SEC_LAB_START) as LAB_EVENT_DATE
FROM SECTION_LAB sl
JOIN SECTION s ON sl.SECTION_ID = s.SECTION_ID
JOIN LAB l ON sl.LAB_ID = l.LAB_ID
WHERE s.TERM_CODE = '202530';

-- 2) Student Participation Summary--
SELECT S.USER_ID as STUDENT_ID, COUNT(*) FILTER (WHERE lp.PROG_ATTENDANCE = true) AS TOTAL_LAB_EVENT_ATTENDANCE
FROM student s
JOIN LAB_PROGRESS lp ON lp.STUDENT_ID = s.USER_ID
GROUP BY s.USER_ID;

-- 3) Late Submissions – students who submitted late at least once (prog_late = TRUE),
-- showing their set, section, and count of late submissions

-- Pick a real prog_code first
SELECT prog_code, event_id, student_id
FROM lab_progress
         LIMIT 5;

-- Suppose you pick prog_code = 1
UPDATE lab_progress
SET prog_late = TRUE
WHERE prog_code = 1;

SELECT
    lp.student_id,
    u.user_fname,
    u.user_lname,
    sec.sec_set        AS set_code,
    sec.sec_code       AS section_code,
    COUNT(*)           AS late_submissions_count
FROM lab_progress lp
         JOIN student st     ON lp.student_id = st.user_id
         JOIN user_ u        ON st.user_id = u.user_id
         JOIN section_lab sl ON lp.event_id = sl.event_id
         JOIN section sec    ON sl.section_id = sec.section_id
WHERE lp.prog_late = TRUE
GROUP BY
    lp.student_id, u.user_fname, u.user_lname,
    sec.sec_set, sec.sec_code
HAVING COUNT(*) >= 1
ORDER BY late_submissions_count DESC, u.user_lname, u.user_fname;

-- 4) Instructor Assessment Report – for each section,
-- average instructor assessment across all lab_progress records tied to that section’s lab events
SELECT
    sec.section_id,
    sec.sec_code,
    sec.sec_set,
    sec.term_code,
    sec.crs_code,
    AVG(lp.prog_instructor_assessment) AS avg_instructor_assessment
FROM section sec
         JOIN section_lab sl ON sec.section_id = sl.section_id
         JOIN lab_progress lp ON sl.event_id = lp.event_id
GROUP BY sec.section_id, sec.sec_code, sec.sec_set, sec.term_code, sec.crs_code
ORDER BY sec.term_code, sec.crs_code, sec.sec_code;

-- 5) Unassessed Progress – lab_progress rows where instructor_assessment IS NULL
-- or self_assessment IS NULL, including student name, section, and lab_event
SELECT
    lp.prog_code,
    lp.student_id,
    u.user_fname,
    u.user_lname,
    sec.section_id,
    sec.sec_code,
    sec.sec_set,
    sl.event_id,
    sl.sec_lab_start,
    sl.sec_lab_due
FROM lab_progress lp
         JOIN student st     ON lp.student_id = st.user_id
         JOIN user_ u        ON st.user_id = u.user_id
         JOIN section_lab sl ON lp.event_id = sl.event_id
         JOIN section sec    ON sl.section_id = sec.section_id
WHERE lp.prog_instructor_assessment IS NULL
   OR lp.prog_self_assessment IS NULL
ORDER BY sl.sec_lab_start, u.user_lname, u.user_fname;

-- 6) Top Performers – top students whose average instructor_assessment ≥ 4.5,
-- including their set and course/section info
SELECT
    lp.student_id,
    u.user_fname,
    u.user_lname,
    sec.sec_set        AS set_code,
    sec.sec_code       AS section_code,
    sec.crs_code       AS course_code,
    sec.term_code,
    AVG(lp.prog_instructor_assessment) AS avg_instructor_assessment
FROM lab_progress lp
         JOIN student st     ON lp.student_id = st.user_id
         JOIN user_ u        ON st.user_id = u.user_id
         JOIN section_lab sl ON lp.event_id = sl.event_id
         JOIN section sec    ON sl.section_id = sec.section_id
WHERE lp.prog_instructor_assessment IS NOT NULL
GROUP BY
    lp.student_id, u.user_fname, u.user_lname,
    sec.sec_set, sec.sec_code, sec.crs_code, sec.term_code
HAVING AVG(lp.prog_instructor_assessment) >= 4.5
ORDER BY avg_instructor_assessment DESC, u.user_lname, u.user_fname;



