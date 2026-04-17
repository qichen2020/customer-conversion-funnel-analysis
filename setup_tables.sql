-- =====================================================
-- Setup Tables from CSV Files
-- =====================================================

-- Drop existing tables (optional, for rerun)
DROP TABLE IF EXISTS user_behavior;
DROP TABLE IF EXISTS item_info;

-- Create user behavior table
CREATE TABLE user_behavior AS
SELECT *
FROM read_csv_auto('data/sample_user_behavior.csv');

-- Create item info table
CREATE TABLE item_info AS
SELECT *
FROM read_csv_auto('data/sample_item_info.csv');

-- =====================================================
-- Data Quality Checks (Optional but recommended)
-- =====================================================

-- Check row counts
SELECT COUNT(*) AS user_behavior_rows FROM user_behavior;
SELECT COUNT(*) AS item_info_rows FROM item_info;

-- Check behavior distribution
SELECT
    behavior_type,
    COUNT(*) AS cnt
FROM user_behavior
GROUP BY behavior_type
ORDER BY behavior_type;
