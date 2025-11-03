
# Schema Design Notes — Milestone 3

## COURSE
- **PK:** CRS_CODE is a natural primary key (e.g., COMP2714).
- **Constraints:** The course code follows the domain format `^[A-Z]{4}[0-9]{3,4}$`. Each course must have a non-empty title and a numeric credit value.
- **References:** Referenced by `SECTION.CRS_CODE` with no cascade action.

## TERM
- **PK:** TERM_CODE is a natural six-digit code (e.g., 202530).
- **Constraints:** TERM_NAME is unique and formatted like “Fall 2025.” Start and end dates must be valid, and the end date must be after the start date.
- **References:** Referenced by `SECTION.TERM_CODE` with no cascade action.

## SET
- **PK:** SET_CODE is a short code (e.g., A–F) that identifies a student group or campus.
- **Constraints:** SET_CAMPUS must not be null.
- **References:** Referenced by `SECTION.SEC_SET` with no cascade action.

## SECTION
- **PK:** SECTION_ID is a surrogate serial number.
- **Constraints:** Each section has a unique combination of `SEC_CODE`, `CRS_CODE`, and `TERM_CODE`. All fields such as section level, set, and term must be provided.
- **References:**
  - `SEC_SET` references `SET_(SET_CODE)`.
  - `TERM_CODE` references `TERM(TERM_CODE)`.
  - `CRS_CODE` references `COURSE(CRS_CODE)`.
- **Behavior:** All of these references use default (no cascade) behavior.
- **Referenced by:** `SECTION_LAB.SECTION_ID` with `ON DELETE CASCADE`.

## LAB
- **PK:** LAB_ID is a surrogate serial number.
- **Constraints:** Each lab must have a title, and may include an optional assignment ID.
- **References:** Referenced by `SECTION_LAB.LAB_ID` with `ON DELETE CASCADE`.

## SECTION_LAB
- **PK:** EVENT_ID is a surrogate serial number.
- **Constraints:** Each record must include valid start, end, and due timestamps. Each (`SECTION_ID`, `LAB_ID`) pair must be unique to avoid duplicate scheduling.
- **References:**
  - `SECTION_ID` references `SECTION(SECTION_ID)` with `ON DELETE CASCADE`.
  - `LAB_ID` references `LAB(LAB_ID)` with `ON DELETE CASCADE`.
- **Referenced by:** `LAB_PROGRESS.EVENT_ID` with `ON DELETE CASCADE`.

## USER_
- **PK:** USER_ID is a natural identifier (e.g., A001 or u_instructor).
- **Constraints:**
  - `USER_ROLE` uses the domain `USER_ROLE_TYPE` (ADMIN, INSTRUCTOR, STUDENT, TA, SYSTEM).
  - `USER_EMAIL` must be unique and non-null.
  - First and last names are required.
- **References:** Referenced by `INSTRUCTOR.USER_ID` and `STUDENT.USER_ID` with `ON DELETE CASCADE`, and by `LAB_PROGRESS_LOG.CHANGED_BY` (no cascade).

## INSTRUCTOR
- **PK:** USER_ID is both the primary key and a foreign key referencing `USER_(USER_ID)`.
- **Constraints:** The `INSTRUCTOR_HIRE_DATE` field is optional.
- **References:** Deleting a user cascades to remove their instructor record.

## STUDENT
- **PK:** USER_ID is both the primary key and a foreign key referencing `USER_(USER_ID)`.
- **Constraints:** `STUDENT_NUMBER` is unique if provided, and `STU_MAJOR` is optional.
- **References:** Deleting a user cascades to remove their student record. Referenced by `LAB_PROGRESS.STUDENT_ID` with `ON DELETE CASCADE`.

## LAB_PROGRESS
- **PK:** PROG_CODE is a surrogate serial number.
- **Constraints:** Each record must include a valid `EVENT_ID` and `STUDENT_ID`.
  - `PROG_STATUS` must be one of `NOT_STARTED`, `IN_PROGRESS`, or `COMPLETED`.
  - Boolean fields default to `FALSE`.
  - Submission timestamps and links are optional.
- **References:**
  - `EVENT_ID` references `SECTION_LAB(EVENT_ID)` with `ON DELETE CASCADE`.
  - `STUDENT_ID` references `STUDENT(USER_ID)` with `ON DELETE CASCADE`.
- **Referenced by:** `LAB_PROGRESS_LOG.PROG_CODE` with `ON DELETE CASCADE`.

## LAB_PROGRESS_LOG
- **PK:** PROGLOG_ID is a surrogate serial number.
- **Constraints:** Each record must include a valid `PROG_CODE` and `FIELD_NAME`. `CHANGE_TIMESTAMP` defaults to the current timestamp.
- **References:**
  - `PROG_CODE` references `LAB_PROGRESS(PROG_CODE)` with `ON DELETE CASCADE`.
  - `CHANGED_BY` references `USER_(USER_ID)` with no cascade action.

## DOMAINS (Validation Types)
- `COURSE_CODE` ensures valid course format.
- `USER_ROLE_TYPE` restricts roles to approved values.
- `USERNAME` ensures non-empty names.
- `LOCATION` allows flexible room/campus codes.
- `PROGRESS_STATUS` limits progress to valid states.
- `TERM_NAME_TYPE` and `TERM_CODE_FORMAT` enforce valid term naming and coding patterns.
- 

## Adjustments
- The Term and Set entities were added to align with the milestone requirements. Several attributes were introduced to accommodate the incoming CSV data, such as SEC_DAY_OF_WEEK and PROG_STATUS. Some fields were simply renamed while preserving their original meaning (e.g., EVENT_ID, CRS_CODE). In addition, relationship cardinalities, connectivities, and relationship strength issues identified in the previous milestone were reviewed and corrected to ensure proper referential integrity and logical consistency in the physical schema.
- Surrogate keys: Used for entities with high insertion frequency or composite identifiers (e.g., SECTION_ID, EVENT_ID, PROG_CODE) to simplify foreign key relationships and improve readability.
- Natural keys retained: CRS_CODE and TERM_CODE remain natural keys because they are stable and meaningful in the dataset (e.g., COMP2714 and 202530).
- Cascading actions: Applied only when the child record cannot exist without its parent (e.g., deleting a Section removes its Labs and Lab Progress). No cascade is applied for lookup entities (Course, Term, Set) to preserve historical referential integrity.
- Optional attributes: Some columns (e.g., hire date, submission timestamps) are nullable to reflect incomplete or evolving data in real-world scenarios.
