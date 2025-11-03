---COURSE---
PK: CRS_CODE (natural key like COMP2714).
Important constraints: CRS_CODE uses COURSE_CODE domain (^[A-Z]{4}[0-9]{3,4}$); CRS_TITLE NOT NULL; CRS_CREDITS NUMERIC(3,1). Seed: one row COMP2714.
Reference actions: Referenced by SECTION.CRS_CODE (NO ACTION).

---TERM---
PK: TERM_CODE (6-digit natural code, e.g., 202530).
Important constraints: TERM_NAME UNIQUE with TERM_NAME_TYPE (e.g., Fall 2025); TERM_START_DATE/TERM_END_DATE NOT NULL with TERM_END_DATE > TERM_START_DATE. Seed: Winter/Spring-Summer/Fall 2025.
Reference actions: Referenced by SECTION.TERM_CODE (NO ACTION).

---SET_---
PK: SET_CODE (cohort/campus code like A…F).
Important constraints: SET_CAMPUS NOT NULL. Seed provides Burnaby/Downtown sets A–F.
Reference actions: Referenced by SECTION.SEC_SET (NO ACTION).

---SECTION---
PK: SECTION_ID (surrogate SERIAL).
Important constraints: SEC_CODE/SEC_LEVEL/SEC_SET/TERM_CODE/CRS_CODE NOT NULL; UNIQUE(SEC_CODE, CRS_CODE, TERM_CODE) prevents duplicate offerings in a term. Seed: six LAB sections (IDs 1–6).
Reference actions: SEC_SET → SET_(SET_CODE) (NO ACTION); TERM_CODE → TERM(TERM_CODE) (NO ACTION); CRS_CODE → COURSE(CRS_CODE) (NO ACTION); referenced by SECTION_LAB.SECTION_ID (CASCADE).

---LAB---
PK: LAB_ID (surrogate SERIAL).
Important constraints: LAB_TITLE NOT NULL; optional LAB_ASSIGNMENT_ID. Seed: LAB01–LAB08 (IDs 1–8).
Reference actions: Referenced by SECTION_LAB.LAB_ID (CASCADE).

---SECTION_LAB---
PK: EVENT_ID (surrogate SERIAL).
Important constraints: SECTION_ID/LAB_ID/SEC_LAB_START/SEC_LAB_END/SEC_LAB_DUE NOT NULL; UNIQUE(SECTION_ID, LAB_ID) ensures at most one scheduled instance of a given lab per section; optional EVENT_CODE and SEC_LAB_LOCATION. Seed: events 1–17 across sections L01–L06.
Reference actions: SECTION_ID → SECTION(SECTION_ID) ON DELETE CASCADE; LAB_ID → LAB(LAB_ID) ON DELETE CASCADE; referenced by LAB_PROGRESS.EVENT_ID (CASCADE).

---USER_---
PK: USER_ID (natural identifier like A001, u_instructor).
Important constraints: USER_ROLE uses USER_ROLE_TYPE (ADMIN/INSTRUCTOR/STUDENT/TA/SYSTEM); USER_FNAME/USER_LNAME NOT NULL; USER_EMAIL UNIQUE NOT NULL. Seed: 1 instructor, 1 TA, 1 system user, 18 students.
Reference actions: Referenced by INSTRUCTOR.USER_ID, STUDENT.USER_ID (CASCADE), and LAB_PROGRESS_LOG.CHANGED_BY (NO ACTION).

---INSTRUCTOR---
PK: USER_ID (also FK to USER_).
Important constraints: Optional INSTRUCTOR_HIRE_DATE. Seed: u_instructor.
Reference actions: USER_ID → USER_(USER_ID) ON DELETE CASCADE.

---STUDENT---
PK: USER_ID (also FK to USER_).
Important constraints: Optional STUDENT_NUMBER (UNIQUE) and STU_MAJOR. Seed: cohorts A–F with three students each.
Reference actions: USER_ID → USER_(USER_ID) ON DELETE CASCADE; referenced by LAB_PROGRESS.STUDENT_ID (CASCADE).

---LAB_PROGRESS---
PK: PROG_CODE (surrogate SERIAL).
Important constraints: EVENT_ID/ STUDENT_ID NOT NULL; PROG_STATUS constrained by PROGRESS_STATUS (NOT_STARTED/IN_PROGRESS/COMPLETED); booleans default FALSE; timestamps/links nullable; numeric assessments optional; optional business key PROG_ID (e.g., A001-L01-L01). Seed: per-event submissions for each set.
Reference actions: EVENT_ID → SECTION_LAB(EVENT_ID) ON DELETE CASCADE; STUDENT_ID → STUDENT(USER_ID) ON DELETE CASCADE; referenced by LAB_PROGRESS_LOG.PROG_CODE (CASCADE).

---LAB_PROGRESS_LOG---
PK: PROGLOG_ID (surrogate SERIAL).
Important constraints: PROG_CODE NOT NULL; FIELD_NAME NOT NULL; CHANGE_TIMESTAMP defaults CURRENT_TIMESTAMP; OLD_VALUE/NEW_VALUE/NOTES optional (free-text snapshot). Seed: examples include regrade, status update, late flag.
Reference actions: PROG_CODE → LAB_PROGRESS(PROG_CODE) ON DELETE CASCADE; CHANGED_BY → USER_(USER_ID) (NO ACTION).

---DOMAINS---
COURSE_CODE: ^[A-Z]{4}[0-9]{3,4}$ (e.g., COMP2714).

USER_ROLE_TYPE: ADMIN/INSTRUCTOR/STUDENT/TA/SYSTEM (case-insensitive via UPPER(VALUE)).

USERNAME: non-empty string.

LOCATION: free-form label (rooms/campuses used by seed).

PROGRESS_STATUS: NOT_STARTED/IN_PROGRESS/COMPLETED (matches seed values).

TERM_NAME_TYPE: ^(Winter|Spring|Summer|Fall|Spring/Summer) \d{4}$.

TERM_CODE_FORMAT: ^\d{6}$.

---Adujstments---
