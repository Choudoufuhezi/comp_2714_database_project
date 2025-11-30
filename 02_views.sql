SET search_path TO lab_tracker_group_10;

CREATE OR REPLACE VIEW v_ta_progress_summary AS
SELECT
    sl.SECTION_ID                             AS section_id,
    sl.EVENT_ID                               AS lab_event_id,
    lp.STUDENT_ID                             AS student_id,
    (u.USER_FNAME || ' ' || u.USER_LNAME)     AS student_full_name,
    lp.PROG_ATTENDANCE                        AS attendance,
    lp.PROG_SUBMISSION_LINK                   AS in_lab_submission_link,
    lp.PROG_INSTRUCTOR_ASSESSMENT             AS instructor_assessment
FROM LAB_PROGRESS   AS lp
JOIN SECTION_LAB    AS sl ON sl.EVENT_ID = lp.EVENT_ID
JOIN STUDENT        AS st ON st.USER_ID = lp.STUDENT_ID
JOIN USER_          AS u  ON u.USER_ID  = st.USER_ID;

-- Examples:

SELECT *
FROM v_ta_progress_summary
ORDER BY section_id, lab_event_id, student_id
LIMIT 20;

SELECT *
FROM v_ta_progress_summary
WHERE section_id = 1
ORDER BY lab_event_id, student_id;

CREATE OR REPLACE VIEW v_section_overview AS
SELECT
    s.TERM_CODE                        AS term_code,
    se.SET_CODE                        AS set_name,
    s.CRS_CODE                         AS course_code,
    s.SECTION_ID                       AS section_id,
    COUNT(DISTINCT sl.EVENT_ID)        AS total_events,
    AVG(lp.PROG_INSTRUCTOR_ASSESSMENT) AS avg_instructor_assessment
FROM SECTION      AS s
JOIN COURSE       AS c  ON c.CRS_CODE  = s.CRS_CODE
JOIN TERM         AS t  ON t.TERM_CODE = s.TERM_CODE
JOIN SET_         AS se ON se.SET_CODE = s.SEC_SET
LEFT JOIN SECTION_LAB   AS sl ON sl.SECTION_ID = s.SECTION_ID
LEFT JOIN LAB_PROGRESS  AS lp ON lp.EVENT_ID   = sl.EVENT_ID
GROUP BY
    s.TERM_CODE,
    se.SET_CODE,
    s.CRS_CODE,
    s.SECTION_ID;

-- Examples

SELECT *
FROM v_section_overview
ORDER BY term_code, course_code, section_id;

SELECT *
FROM v_section_overview
WHERE term_code = '202530'
ORDER BY course_code, section_id;