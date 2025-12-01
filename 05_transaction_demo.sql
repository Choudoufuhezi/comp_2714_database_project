-- Task 5: transaction demo --

-- sets the path to the schema
set search_path = lab_tracker_group_10;


-- Successful transaction, we attempt to update the submission, resubmission, and instructor assessment grade of an existent PROG_CODE, information should be successfully updated --
BEGIN;
UPDATE LAB_PROGRESS
   SET PROG_SUBMISSION_LINK = 'https://example.com/submissions/123',
       PROG_REEVALUATION_LINK = 'https://example.com/submissions/123-polished'
 WHERE PROG_CODE = 12;  -- use an existing progress_id
UPDATE LAB_PROGRESS
   SET PROG_INSTRUCTOR_ASSESSMENT = 5
 WHERE PROG_CODE = 12;
COMMIT;


-- Failing transaction, we attempt update the submission link of an non-existent existent PROG_CODE, nothing should be affected --
BEGIN;
UPDATE LAB_PROGRESS
   SET PROG_SUBMISSION_LINK = 'https://bad.example.com'
 WHERE PROG_CODE = 9999999;  -- non-existent, will affect 0 rows
-- or attempt an insert with bad FK into change_log
ROLLBACK;


-- Query to test the successful transaction, PROG_SUBMISSION_LINK,  PROG_REEVALUATION_LINK, and PROG_INSTRUCTOR_ASSESSMENT should be updated to above --
SELECT PROG_CODE, PROG_INSTRUCTOR_ASSESSMENT, PROG_SUBMISSION_LINK, PROG_REEVALUATION_LINK
FROM LAB_PROGRESS
WHERE PROG_CODE = 12;

-- Query to test the failing transaction, an empty table should be the output--
SELECT PROG_CODE, PROG_INSTRUCTOR_ASSESSMENT, PROG_SUBMISSION_LINK, PROG_REEVALUATION_LINK
FROM LAB_PROGRESS
WHERE PROG_CODE = 9999999;
