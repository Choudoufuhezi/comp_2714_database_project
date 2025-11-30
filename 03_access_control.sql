SET search_path TO lab_tracker_group_10;

--CREATE ROLE ta_role;
CREATE ROLE ta_role;

--GRANT SELECT ON v_ta_progress_summary, v_section_overview TO ta_role;
GRANT SELECT ON v_ta_progress_summary TO ta_role;
GRANT SELECT ON v_section_overview TO ta_role;

--CREATE USER ta_demo WITH PASSWORD 'ta_demo123'; (if allowed on server)
CREATE USER ta_demo WITH PASSWORD 'ta_demo123';

--GRANT ta_role TO ta_demo;
GRANT ta_role TO ta_demo;