-- Successful transaction: student submits + instructor assesses as one unit
BEGIN;

UPDATE student_progress
SET in_lab_submission_link = 'https://example.com/submissions/123',
    polished_submission_link = 'https://example.com/submissions/123-polished'
WHERE progress_id = 1001;  -- use an existing progress_id

UPDATE student_progress
SET instructor_assessment = 5
WHERE progress_id = 1001;

COMMIT;  -- Both updates are committed together, or both would be rolled back on error


-- Failing transaction: bad update that should not change any data
BEGIN;

UPDATE student_progress
SET in_lab_submission_link = 'https://bad.example.com/'
WHERE progress_id = 999999;  -- non-existent id, affects 0 rows

-- No data is actually changed; we explicitly cancel the transaction
ROLLBACK;  -- Discards any changes that might have occurred in this block
