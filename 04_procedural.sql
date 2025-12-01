set search_path = lab_tracker_group_10;
DROP TABLE IF EXISTS change_log;

CREATE TABLE IF NOT EXISTS change_log (
    change_id SERIAL PRIMARY KEY, 
    prog_code INT NOT NULL, changed_by TEXT, 
    action TEXT NOT NULL, 
    old_instructor_assessment NUMERIC, 
    new_instructor_assessment NUMERIC, 
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    CONSTRAINT fk_change_progress FOREIGN KEY (prog_code) REFERENCES LAB_PROGRESS(PROG_CODE) 
    ); 

CREATE OR REPLACE FUNCTION fn_log_progress_change()
RETURNS TRIGGER 
LANGUAGE 'plpgsql' AS 
$$
BEGIN 
    IF TG_OP = 'INSERT' THEN
        INSERT INTO change_log(
            prog_code,
            changed_by,
            action, 
            old_instructor_assessment,
            new_instructor_assessment
        )
        VALUES (
            NEW.PROG_CODE,
            current_user, 
            'INSERT',
            NULL,
            NEW.PROG_INSTRUCTOR_ASSESSMENT
        );

        RETURN NEW;
    END IF;

        IF TG_OP = 'UPDATE' THEN
        INSERT INTO change_log(
            prog_code,
            changed_by,
            action, 
            old_instructor_assessment,
            new_instructor_assessment
        )
        VALUES (
            NEW.PROG_CODE,
            current_user, 
            'UPDATE',
            OLD.PROG_INSTRUCTOR_ASSESSMENT,
            NEW.PROG_INSTRUCTOR_ASSESSMENT
        );
        RETURN NEW;
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_log_progress_change
AFTER INSERT OR UPDATE
on LAB_PROGRESS
FOR EACH ROW 
EXECUTE FUNCTION fn_log_progress_change();

INSERT INTO LAB_PROGRESS (
    PROG_ID, EVENT_ID, STUDENT_ID, PROG_STATUS, PROG_PREPARED, PROG_ATTENDANCE,
    PROG_SUBMISSION_TIMESTAMP, PROG_SUBMISSION_LINK,
    PROG_REEVALUATION_TIMESTAMP, PROG_REEVALUATION_LINK,
    PROG_INSTRUCTOR_ASSESSMENT, PROG_SELF_ASSESSMENT, PROG_LATE
) VALUES (
    'F001-L07-L01', 16, 'F001', 'COMPLETED', TRUE, TRUE,
    '2025-09-11 19:45', 'https://submit.bcit.ca/comp2714/inlab/F001-L07-L01.pdf',
    '2025-09-12 21:45', 'https://submit.bcit.ca/comp2714/polished/F001-L08-L01.pdf',
    8.5, 8.2, FALSE
);

UPDATE LAB_PROGRESS
SET PROG_INSTRUCTOR_ASSESSMENT = 9.0
WHERE PROG_CODE = 39;



CREATE OR REPLACE FUNCTION fn_create_lab_event_for_section (
    p_event_code VARCHAR(20),
    p_section_id INT,
    p_lab_id INT,
    p_lab_start TIMESTAMP,
    p_lab_end TIMESTAMP,
    p_lab_due TIMESTAMP,
    p_lab_location VARCHAR(50)
)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
lab_event_id INT;
    everyStudent RECORD;
BEGIN
    -- 1) Create the new lab event
INSERT INTO section_lab (
    event_code,
    section_id,
    lab_id,
    sec_lab_start,
    sec_lab_end,
    sec_lab_due,
    sec_lab_location
)
VALUES (
           p_event_code,
           p_section_id,
           p_lab_id,
           p_lab_start,
           p_lab_end,
           p_lab_due,
           p_lab_location
       )
    RETURNING event_id INTO lab_event_id;

-- 2) Loop over all students in that section (based on existing progress)
FOR everyStudent IN
SELECT DISTINCT sp.student_id
FROM lab_progress sp
         JOIN section_lab sl ON sp.event_id = sl.event_id
WHERE sl.section_id = p_section_id
    LOOP
INSERT INTO lab_progress (
    event_id,
    student_id,
    prog_attendance,
    prog_status,
    prog_prepared,
    prog_submission_link,
    prog_submission_timestamp,
    prog_reevaluation_link,
    prog_reevaluation_timestamp,
    prog_instructor_assessment,
    prog_self_assessment,
    prog_late
)
VALUES (
    lab_event_id,
    everyStudent.student_id,   -- use the column selected in the FOR query
    FALSE,                     -- prog_attendance
    DEFAULT,                   -- prog_status (domain default)
    FALSE,                     -- prog_prepared
    NULL,                      -- submission_link
    NULL,                      -- submission_timestamp
    NULL,                      -- reevaluation_link
    NULL,                      -- reevaluation_timestamp
    NULL,                      -- instructor_assessment
    NULL,                      -- self_assessment
    FALSE                      -- prog_late
    );
END LOOP;

RETURN lab_event_id;
END;
$$;

SELECT fn_create_lab_event_for_section(
    'L07-L02',          
    1,                 
    4,                 
    '2025-01-21 09:00',
    '2025-01-21 11:00',
    '2025-01-26 23:59',
    'BBY-SW01-3460'
);

SELECT *
FROM lab_progress
WHERE event_id = (SELECT MAX(event_id) FROM section_lab);