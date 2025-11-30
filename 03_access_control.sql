SET search_path TO lab_tracker_group_10;

-- CREATE ROLE ta_role;
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_roles WHERE rolname = 'ta_role'
    ) THEN
        CREATE ROLE ta_role;
    END IF;
END;
$$;

-- GRANT SELECT ON v_ta_progress_summary, v_section_overview TO ta_role;
GRANT SELECT ON v_ta_progress_summary TO ta_role;
GRANT SELECT ON v_section_overview TO ta_role;

-- CREATE USER ta_demo WITH PASSWORD 'ta_demo123'; (if allowed on server)
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_roles WHERE rolname = 'ta_demo'
    ) THEN
        CREATE USER ta_demo WITH PASSWORD 'ta_demo123';
    END IF;
END;
$$;

-- GRANT ta_role TO ta_demo;
GRANT ta_role TO ta_demo;

-- Tests

-- Verify the role was created
SELECT rolname FROM pg_roles WHERE rolname = 'ta_role';

-- Verify the user was created
SELECT usename FROM pg_user WHERE usename = 'ta_demo';

-- Verify the permissions were granted
SELECT table_schema, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE grantee = 'ta_role' 
AND table_name IN ('v_ta_progress_summary', 'v_section_overview');