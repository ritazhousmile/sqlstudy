-- =============================================
-- HighSystems Developer Cheatsheet
-- =============================================

-- USER INFORMATION
-- ---------------------------------------------
-- Get user's full name by user ID
return (hsUsers()->rvn('Changed By')->>'firstName') || ' ' || (hsUsers()->rvn('Changed By')->>'lastName');

-- Get user's email by user ID
return hsUsers()->rvn('Changed By')->>'email';

-- Get current user's role ID
return hs_current_user->>'role';

-- Get current user's email
return hs_current_user->>'email';

-- Get current user's ID
return hs_current_user->>'id';

-- BASIC RECORD OPERATIONS
-- ---------------------------------------------
-- Get single record
return hsGetRecord('table_name', record_id);

-- Get multiple records
return hsGetRecords('table_name', conditions);

-- Insert new record
return hsInsertRecord('table_name', {field1: value1, field2: value2});

-- Update record
return hsUpdateRecord('table_name', record_id, {field1: new_value1});

-- Delete record
return hsDeleteRecord('table_name', record_id);

-- RELATIONSHIPS
-- ---------------------------------------------
-- Get related records
return hsGetRelatedRecords('table_name', record_id, 'relationship_name');

-- Add relationship
return hsAddRelationship('table_name', record_id, 'relationship_name', related_record_id);

-- Remove relationship
return hsRemoveRelationship('table_name', record_id, 'relationship_name', related_record_id);

-- DATE AND TIME
-- ---------------------------------------------
-- Get current timestamp
return current_timestamp;

-- Timestamp Format Patterns
-- Full timestamp formats
return to_char(timestamp_column, 'YYYY-MM-DD HH24:MI:SS.MS');     -- 2024-03-14 13:45:30.123
return to_char(timestamp_column, 'YYYY-MM-DD HH24:MI:SS');        -- 2024-03-14 13:45:30
return to_char(timestamp_column, 'DD-MON-YYYY HH24:MI:SS');       -- 14-MAR-2024 13:45:30
return to_char(timestamp_column, 'MM/DD/YYYY HH12:MI:SS AM');     -- 03/14/2024 01:45:30 PM
return to_char(timestamp_column, 'Month DD, YYYY HH12:MI AM');    -- March 14, 2024 01:45 PM
return to_char(timestamp_column, 'FMMonth DD, YYYY');             -- March 14, 2024

-- ISO 8601 formats
return to_char(timestamp_column, 'YYYY-MM-DD"T"HH24:MI:SS"Z"');   -- 2024-03-14T13:45:30Z
return to_char(timestamp_column, 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'); -- 2024-03-14T13:45:30.123Z

-- Date only formats
return to_char(timestamp_column, 'YYYY-MM-DD');                    -- 2024-03-14
return to_char(timestamp_column, 'MM/DD/YYYY');                    -- 03/14/2024
return to_char(timestamp_column, 'DD-MON-YYYY');                   -- 14-MAR-2024
return to_char(timestamp_column, 'Month DD, YYYY');               -- March 14, 2024
return to_char(timestamp_column, 'DD Month YYYY');                -- 14 March 2024
return to_char(timestamp_column, 'Mon DD, YYYY');                 -- Mar 14, 2024

-- Time only formats
return to_char(timestamp_column, 'HH24:MI:SS');                   -- 13:45:30
return to_char(timestamp_column, 'HH12:MI:SS AM');                -- 01:45:30 PM
return to_char(timestamp_column, 'HH24:MI');                      -- 13:45
return to_char(timestamp_column, 'HH12:MI AM');                   -- 01:45 PM

-- Custom formats with day names
return to_char(timestamp_column, 'Day, DD Month YYYY');           -- Thursday, 14 March 2024
return to_char(timestamp_column, 'Dy, DD Mon YYYY');              -- Thu, 14 Mar 2024
return to_char(timestamp_column, 'Day');                          -- Thursday
return to_char(timestamp_column, 'Dy');                           -- Thu

-- Week formats
return to_char(timestamp_column, 'WW');                           -- Week of year (1-53)
return to_char(timestamp_column, 'W');                            -- Week of month (1-5)
return to_char(timestamp_column, 'IW');                           -- ISO week of year

-- Quarter formats
return to_char(timestamp_column, 'Q');                            -- Quarter (1-4)
return to_char(timestamp_column, '"Q"Q YYYY');                    -- Q1 2024

-- Format with ordinal indicators
return to_char(timestamp_column, 'DDth "of" Month, YYYY');        -- 14th of March, 2024
return to_char(timestamp_column, 'FMDDth "of" FMMonth, YYYY');    -- 14th of March, 2024

-- Common Format Elements:
-- YYYY or IYYY - 4-digit year
-- MM - month (01-12)
-- MON - abbreviated month name (JAN-DEC)
-- Month - full month name
-- DD - day of month (01-31)
-- HH24 - hour (00-23)
-- HH12 - hour (01-12)
-- MI - minute (00-59)
-- SS - second (00-59)
-- MS - millisecond
-- AM or PM - meridian indicator
-- TZ - timezone offset
-- Day - full day name
-- Dy - abbreviated day name
-- W - week of month
-- WW - week of year
-- Q - quarter
-- FM - removes padding (e.g., 1 instead of 01)

-- Remove leading zeros (use FM prefix)
return to_char(timestamp_column, 'FMMM/FMDD/YYYY');               -- 3/14/2024 (no leading zeros)

-- Add interval to date
return timestamp_column + interval '1 day';

-- Time Manipulations
-- Add intervals
return timestamp_column + interval '1 year';
return timestamp_column + interval '2 months';
return timestamp_column + interval '7 days';
return timestamp_column + interval '24 hours';
return timestamp_column + interval '30 minutes';

-- Subtract intervals
return timestamp_column - interval '1 day';

-- Combine intervals
return timestamp_column + interval '1 year' + interval '3 months';

-- Extract parts from timestamp
-- Basic extractions
return extract(year from timestamp_column);      -- Get year (e.g., 2024)
return extract(month from timestamp_column);     -- Get month (1-12)
return extract(day from timestamp_column);       -- Get day (1-31)
return extract(hour from timestamp_column);      -- Get hour (0-23)
return extract(minute from timestamp_column);    -- Get minute (0-59)
return extract(second from timestamp_column);    -- Get second (0-59)
return extract(milliseconds from timestamp_column); -- Get milliseconds

-- Additional date extractions
return extract(quarter from timestamp_column);   -- Get quarter (1-4)
return extract(week from timestamp_column);      -- Get week of year (1-53)
return extract(dow from timestamp_column);       -- Get day of week (0-6, Sunday=0)
return extract(isodow from timestamp_column);    -- Get ISO day of week (1-7, Monday=1)
return extract(doy from timestamp_column);       -- Get day of year (1-365/366)
return extract(century from timestamp_column);   -- Get century

-- Combined extractions
-- Get date components
return extract(year from timestamp_column) as year,
       extract(month from timestamp_column) as month,
       extract(day from timestamp_column) as day;

-- Get time components
return extract(hour from timestamp_column) as hour,
       extract(minute from timestamp_column) as minute,
       extract(second from timestamp_column) as second;

-- Common date calculations
-- Age in years
return extract(year from age(timestamp_column));

-- Age in months
return extract(year from age(timestamp_column)) * 12 + 
       extract(month from age(timestamp_column));

-- Days between dates
return extract(day from age(timestamp2, timestamp1));

-- Extract with formatting
-- Get month name
return to_char(timestamp_column, 'Month');       -- March
return to_char(timestamp_column, 'Mon');         -- Mar

-- Get day name
return to_char(timestamp_column, 'Day');         -- Thursday
return to_char(timestamp_column, 'Dy');          -- Thu

-- Extract for comparisons
-- Check if weekend
return extract(isodow from timestamp_column) in (6,7);

-- Check if end of month
return extract(day from timestamp_column) = 
       extract(day from date_trunc('month', timestamp_column) + interval '1 month - 1 day');

-- Check if leap year
return extract(day from 
    date_trunc('year', timestamp_column) + interval '2 months - 1 day') = 29;

-- Date/Time Calculations
-- Get difference between dates
return age(timestamp1, timestamp2);              -- Returns interval
return extract(day from age(timestamp1, timestamp2)); -- Returns number of days

-- Beginning/End of Period
return date_trunc('year', timestamp_column);     -- Start of year
return date_trunc('month', timestamp_column);    -- Start of month
return date_trunc('day', timestamp_column);      -- Start of day
return date_trunc('hour', timestamp_column);     -- Start of hour

-- Check if timestamp is within range
return timestamp_column BETWEEN timestamp1 AND timestamp2;

-- Convert timezone
return timestamp_column AT TIME ZONE 'UTC';
return timestamp_column AT TIME ZONE 'America/New_York';

-- STRING OPERATIONS
-- ---------------------------------------------
-- Concatenate strings
return string1 || ' ' || string2;

-- Convert to uppercase/lowercase
return upper(string_column);
return lower(string_column);

-- Trim whitespace
return trim(string_column);

-- UTILITY FUNCTIONS
-- ---------------------------------------------
-- Check if value is null
return coalesce(nullable_column, 'default_value');

-- Cast values
return cast(numeric_string as integer);
return cast(integer_value as text);

-- Generate UUID
return gen_random_uuid();

-- SECURITY AND PERMISSIONS
-- ---------------------------------------------
-- Check if user has permission
return hsHasPermission('permission_name');

-- Check if user is in role
return hsUserInRole('role_name');

-- Get current user's permissions
return hsGetUserPermissions();

-- ERROR HANDLING
-- ---------------------------------------------
-- Raise custom error
return hsRaiseError('Custom error message');

-- Try-catch pattern
begin
    -- Your code here
exception when others then
    return hsRaiseError(SQLERRM);
end;

-- COMMON PATTERNS
-- ---------------------------------------------
-- Conditional logic
if (condition) then
    return 'true case';
else
    return 'false case';
end if;

-- CASE statements
-- Simple CASE
CASE column_name
    WHEN 'value1' THEN 'result1'
    WHEN 'value2' THEN 'result2'
    ELSE 'default_result'
END;

-- Searched CASE
CASE
    WHEN condition1 THEN 'result1'
    WHEN condition2 THEN 'result2'
    WHEN condition3 THEN 'result3'
    ELSE 'default_result'
END;

-- CASE in SELECT
SELECT 
    column_name,
    CASE 
        WHEN amount > 1000 THEN 'High'
        WHEN amount > 500 THEN 'Medium'
        ELSE 'Low'
    END as amount_category
FROM table_name;

-- Loop through records
for record in select * from table_name loop
    -- Process each record
end loop;

-- POSTGRESQL ADVANCED OPERATIONS
-- ---------------------------------------------
-- Common Table Expressions (CTE)
WITH ranked_records AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY created_at DESC) as rank
    FROM table_name
)
SELECT * FROM ranked_records WHERE rank = 1;

-- Recursive CTE
WITH RECURSIVE subordinates AS (
    -- Base case: direct reports
    SELECT employee_id, manager_id, name, 1 as level
    FROM employees
    WHERE manager_id = 123
    
    UNION ALL
    
    -- Recursive case: employees reporting to direct reports
    SELECT e.employee_id, e.manager_id, e.name, s.level + 1
    FROM employees e
    INNER JOIN subordinates s ON s.employee_id = e.manager_id
)
SELECT * FROM subordinates;

-- Window Functions
-- Row number
SELECT *,
    ROW_NUMBER() OVER (ORDER BY created_at) as row_num
FROM table_name;

-- Running total
SELECT *,
    SUM(amount) OVER (ORDER BY created_at) as running_total
FROM transactions;

-- Moving average
SELECT *,
    AVG(value) OVER (
        ORDER BY date_column
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) as moving_avg
FROM measurements;

-- Rank and Dense Rank
SELECT *,
    RANK() OVER (PARTITION BY category ORDER BY score DESC) as rank,
    DENSE_RANK() OVER (PARTITION BY category ORDER BY score DESC) as dense_rank
FROM scores;

-- First/Last Value
SELECT *,
    FIRST_VALUE(price) OVER (PARTITION BY product_id ORDER BY date) as initial_price,
    LAST_VALUE(price) OVER (
        PARTITION BY product_id 
        ORDER BY date
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) as final_price
FROM product_prices;

-- Advanced Aggregations
-- Array aggregation
SELECT category,
    ARRAY_AGG(product_name ORDER BY price DESC) as products,
    STRING_AGG(product_name, ', ' ORDER BY price DESC) as product_list
FROM products
GROUP BY category;

-- JSON aggregation
SELECT 
    project_id,
    JSON_AGG(JSON_BUILD_OBJECT(
        'task_id', task_id,
        'name', task_name,
        'status', status
    )) as tasks
FROM tasks
GROUP BY project_id;

-- Conditional aggregation
SELECT 
    department,
    COUNT(*) as total_employees,
    COUNT(*) FILTER (WHERE age < 30) as young_employees,
    AVG(salary) FILTER (WHERE position = 'Senior') as avg_senior_salary
FROM employees
GROUP BY department;

-- Advanced Joins
-- Self join
SELECT 
    e.name as employee,
    m.name as manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- Lateral join
SELECT 
    d.department_name,
    e.name,
    e.salary
FROM departments d,
LATERAL (
    SELECT name, salary 
    FROM employees 
    WHERE department_id = d.id 
    ORDER BY salary DESC 
    LIMIT 3
) e;

-- Full Text Search
-- Create search vector
SELECT to_tsvector('english', title || ' ' || description) as document
FROM articles;

-- Search query
SELECT *
FROM articles
WHERE to_tsvector('english', title || ' ' || description) @@ 
      to_tsquery('english', 'search & terms');

-- Search with ranking
SELECT *,
    ts_rank(
        to_tsvector('english', title || ' ' || description),
        to_tsquery('english', 'search & terms')
    ) as rank
FROM articles
WHERE to_tsvector('english', title || ' ' || description) @@ 
      to_tsquery('english', 'search & terms')
ORDER BY rank DESC;

-- Date/Time Operations
-- Date range queries
SELECT *
FROM events
WHERE event_date <@ DATERANGE('2024-01-01', '2024-12-31');

-- Extract parts of interval
SELECT 
    EXTRACT(EPOCH FROM duration) as seconds,
    EXTRACT(DAYS FROM duration) as days
FROM (
    SELECT end_time - start_time as duration 
    FROM sessions
) sub;

-- Generate series
SELECT generate_series(
    '2024-01-01'::date,
    '2024-12-31'::date,
    '1 month'::interval
) as month_start;

-- Advanced Data Types
-- Arrays
SELECT 
    ARRAY[1,2,3] as numbers,
    ARRAY['a','b','c'] as letters,
    ARRAY[1,2,3] && ARRAY[2,3,4] as has_overlap;

-- JSON operations
SELECT 
    data->>'name' as name,
    (data->'address'->>'city') as city,
    jsonb_array_elements(data->'phones') as phone
FROM profiles;

-- Range types
SELECT 
    int4range(1, 4) * int4range(2, 5) as overlap,
    int4range(1, 4) + int4range(4, 7) as union,
    int4range(1, 4) - int4range(2, 5) as difference;

-- Performance Optimization
-- Parallel query
SELECT *
FROM large_table
WHERE expensive_function(column)
ORDER BY other_column;

-- Materialized view
CREATE MATERIALIZED VIEW summary AS
SELECT 
    category,
    COUNT(*) as count,
    AVG(amount) as avg_amount
FROM transactions
GROUP BY category
WITH DATA;

REFRESH MATERIALIZED VIEW summary;

-- Partitioning
CREATE TABLE measurements (
    id SERIAL,
    time_stamp TIMESTAMP,
    value NUMERIC
) PARTITION BY RANGE (time_stamp);

CREATE TABLE measurements_2024 PARTITION OF measurements
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- PRODUCTIVITY TIPS AND PATTERNS
-- ---------------------------------------------
-- Quick Debugging
-- Log values to console
return hsLog('Debug message');
return hsLog({
    value1: someValue,
    value2: anotherValue,
    context: 'debugging section'
});

-- Performance logging
return hsLogPerformance('Operation name', () => {
    -- Your code here
});

-- Common Reusable Functions
-- Format currency
CREATE OR REPLACE FUNCTION format_currency(amount numeric) 
RETURNS text AS $$
BEGIN
    return to_char(amount, 'FM$999,999,999.00');
END;
$$;

-- Format phone numbers
CREATE OR REPLACE FUNCTION format_phone(phone text) 
RETURNS text AS $$
BEGIN
    return regexp_replace(phone, '(\d{3})(\d{3})(\d{4})', '(\1) \2-\3');
END;
$$;

-- Validate email
CREATE OR REPLACE FUNCTION is_valid_email(email text) 
RETURNS boolean AS $$
BEGIN
    return email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
END;
$$;

-- Common Data Transformations
-- Convert array to rows
SELECT unnest(ARRAY['a', 'b', 'c']) as item;

-- Convert rows to array
SELECT array_agg(column_name) FROM table_name;

-- Convert JSON to rows
SELECT * FROM jsonb_array_elements(data->'items');

-- Quick Data Cleanup
-- Remove duplicates
SELECT DISTINCT ON (key_column) *
FROM table_name
ORDER BY key_column, created_at DESC;

-- Clean whitespace
UPDATE table_name
SET column_name = trim(regexp_replace(column_name, '\s+', ' ', 'g'));

-- Development Shortcuts
-- Template for API endpoints
{
    "type": "endpoint",
    "method": "GET",
    "path": "/api/resource",
    "handler": () => {
        try {
            -- Your code here
            return hsResponse(200, { success: true, data: result });
        } catch (error) {
            return hsResponse(500, { success: false, error: error.message });
        }
    }
}

-- Quick form validation
const validateForm = (data) => {
    const errors = {};
    
    if (!data.name) errors.name = 'Name is required';
    if (!is_valid_email(data.email)) errors.email = 'Invalid email';
    
    return Object.keys(errors).length === 0 ? null : errors;
};

-- Useful Code Snippets
-- Generate sequential numbers
SELECT generate_series(1, 10) as num;

-- Get first day of month
SELECT date_trunc('month', current_date);

-- Get last day of month
SELECT (date_trunc('month', current_date) + interval '1 month - 1 day')::date;

-- Get business days between dates
SELECT count(*) 
FROM generate_series(start_date, end_date, '1 day'::interval) d
WHERE extract(dow from d) NOT IN (0, 6);

-- Development Environment Setup
-- Create test data
CREATE OR REPLACE FUNCTION generate_test_data() 
RETURNS void AS $$
BEGIN
    INSERT INTO users (name, email)
    SELECT 
        'User ' || n,
        'user' || n || '@example.com'
    FROM generate_series(1, 100) n;
END;
$$;

-- Backup before changes
CREATE OR REPLACE FUNCTION backup_table(table_name text) 
RETURNS void AS $$
BEGIN
    EXECUTE format(
        'CREATE TABLE %I_backup AS SELECT * FROM %I',
        table_name,
        table_name
    );
END;
$$;

-- Error Handling Patterns
-- Comprehensive error handling
CREATE OR REPLACE FUNCTION safe_operation()
RETURNS json AS $$
BEGIN
    BEGIN
        -- Your code here
        return json_build_object('success', true, 'data', result);
    EXCEPTION 
        WHEN unique_violation THEN
            return json_build_object('success', false, 'error', 'Duplicate entry');
        WHEN check_violation THEN
            return json_build_object('success', false, 'error', 'Invalid data');
        WHEN OTHERS THEN
            return json_build_object('success', false, 'error', SQLERRM);
    END;
END;
$$;

-- Useful Development Queries
-- Find slow queries
SELECT query, calls, total_time, rows, mean_time
FROM pg_stat_statements
ORDER BY mean_time DESC
LIMIT 10;

-- Table sizes
SELECT 
    table_name,
    pg_size_pretty(pg_total_relation_size(quote_ident(table_name))) as total_size
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY pg_total_relation_size(quote_ident(table_name)) DESC;

-- Development Best Practices
-- 1. Use meaningful names for variables and functions
-- 2. Add comments for complex logic
-- 3. Handle errors appropriately
-- 4. Use transactions for multiple operations
-- 5. Log important operations
-- 6. Validate input data
-- 7. Use prepared statements for security
-- 8. Keep functions small and focused
-- 9. Use consistent formatting
-- 10. Document API endpoints and functions

-- DATA TRANSFORMATIONS
-- ---------------------------------------------
-- String Transformations
-- Split string to array
SELECT string_to_array('apple,banana,orange', ',') as fruit_array;

-- Join array to string
SELECT array_to_string(ARRAY['apple', 'banana', 'orange'], ', ') as fruit_list;

-- Extract substring
SELECT substring('Hello World' from 1 for 5);                -- 'Hello'
SELECT substring('Hello World' from '([A-Za-z]+)') as word;  -- 'Hello'

-- Replace text
SELECT replace('Hello World', 'World', 'PostgreSQL');
SELECT regexp_replace('Hello   World', '\s+', ' ', 'g');     -- Remove extra spaces

-- Number Transformations
-- Round numbers
SELECT 
    round(3.14159, 2),          -- 3.14
    ceil(3.14159),              -- 4
    floor(3.14159),             -- 3
    trunc(3.14159, 2);          -- 3.14

-- Format numbers
SELECT 
    to_char(1234.56, '999,999.99'),          -- 1,234.56
    to_char(1234.56, '999G999D99'),          -- 1,234.56
    to_char(1234.56, 'L999,999.99');         -- $1,234.56

-- Convert text to number
SELECT 
    '123'::integer,
    cast('123.45' as numeric),
    to_number('1,234.56', '999,999.99');

-- Date/Time Transformations
-- Convert string to date
SELECT 
    to_date('2024-03-14', 'YYYY-MM-DD'),
    to_timestamp('2024-03-14 13:45:30', 'YYYY-MM-DD HH24:MI:SS');

-- Convert epoch to timestamp
SELECT 
    to_timestamp(1647259530),                -- Unix timestamp to date
    extract(epoch from current_timestamp);    -- Date to Unix timestamp

-- Boolean Transformations
SELECT 
    'yes'::boolean,                          -- Convert text to boolean
    case when boolean_col then 1 else 0 end, -- Boolean to number
    case when value > 0 then true else false end; -- Number to boolean

-- Array Transformations
-- Create array from values
SELECT 
    ARRAY[1, 2, 3],                         -- Integer array
    ARRAY['a', 'b', 'c'],                   -- Text array
    array_fill(0, ARRAY[3]);                -- [0,0,0]

-- Array operations
SELECT 
    array_append(ARRAY[1, 2], 3),           -- Add element
    array_remove(ARRAY[1, 2, 3], 2),        -- Remove element
    array_cat(ARRAY[1, 2], ARRAY[3, 4]);    -- Concatenate arrays

-- JSON Transformations
-- Create JSON
SELECT 
    json_build_object('name', 'John', 'age', 30),
    json_build_array(1, 2, 'three'),
    row_to_json(row('John', 30));

-- Extract from JSON
SELECT 
    data->>'name' as name,                  -- Get text
    (data->>'age')::integer as age,         -- Get number
    jsonb_array_elements(data->'items');    -- Expand array

-- Complex Transformations
-- Pivot data (rows to columns)
SELECT *
FROM crosstab(
    'SELECT row_name, category, value 
     FROM source_table 
     ORDER BY 1,2'
) AS ct(row_name text, category1 numeric, category2 numeric);

-- Unpivot data (columns to rows)
SELECT customer_id,
       unnest(array['email', 'phone', 'address']) as contact_type,
       unnest(array[email, phone, address]) as contact_value
FROM customers;

-- Type Casting Examples
SELECT 
    cast('123' as integer),                 -- String to integer
    cast('true' as boolean),                -- String to boolean
    cast(12345 as text),                    -- Integer to string
    cast('2024-03-14' as date),            -- String to date
    cast(now() as time),                    -- Timestamp to time
    cast('{"key": "value"}' as json);       -- String to JSON

-- Custom Type Transformations
CREATE TYPE user_status AS ENUM ('active', 'inactive', 'pending');

-- Convert string to enum
SELECT 'active'::user_status;

-- Convert number to custom type
CREATE FUNCTION int_to_status(v integer) 
RETURNS user_status AS $$
BEGIN
    CASE v
        WHEN 1 THEN RETURN 'active'::user_status;
        WHEN 0 THEN RETURN 'inactive'::user_status;
        ELSE RETURN 'pending'::user_status;
    END CASE;
END;
$$ LANGUAGE plpgsql;

-- Data Cleanup Transformations
-- Clean phone numbers
SELECT regexp_replace(
    regexp_replace(phone, '[^0-9]', '', 'g'),
    '(\d{3})(\d{3})(\d{4})',
    '(\1) \2-\3'
);

-- Clean email addresses
SELECT lower(trim(regexp_replace(email, '\s+', '', 'g')));

-- Normalize names
SELECT initcap(lower(trim(regexp_replace(name, '\s+', ' ', 'g'))));

-- Unit Conversions
CREATE OR REPLACE FUNCTION convert_units(
    value numeric,
    from_unit text,
    to_unit text
) RETURNS numeric AS $$
BEGIN
    CASE 
        WHEN from_unit = 'km' AND to_unit = 'mi' THEN
            RETURN value * 0.621371;
        WHEN from_unit = 'mi' AND to_unit = 'km' THEN
            RETURN value * 1.60934;
        -- Add more conversions as needed
    END CASE;
END;
$$ LANGUAGE plpgsql;

-- DEVELOPER ESSENTIALS
-- ---------------------------------------------
-- API Rate Limiting
-- Implement basic rate limiting
{
    "type": "middleware",
    "name": "rateLimit",
    "config": {
        "windowMs": 15 * 60 * 1000,  -- 15 minutes
        "max": 100                    -- limit each IP to 100 requests per windowMs
    }
}

-- Performance Optimization
-- Index optimization
CREATE INDEX CONCURRENTLY idx_name ON table_name (column_name);
CREATE INDEX CONCURRENTLY idx_partial ON table_name (column_name) WHERE condition;
ANALYZE table_name;

-- Query optimization
EXPLAIN ANALYZE SELECT * FROM table_name WHERE condition;
SET enable_seqscan = OFF;  -- Force index usage for testing

-- Caching Strategies
-- Cache expensive queries
CREATE MATERIALIZED VIEW cached_data AS
SELECT * FROM expensive_query;

-- Refresh cache
REFRESH MATERIALIZED VIEW CONCURRENTLY cached_data;

-- Security Best Practices
-- Input validation
const sanitizeInput = (input) => {
    return input.replace(/[<>]/g, ''); -- Basic XSS prevention
};

-- SQL injection prevention
return hsQuery('SELECT * FROM users WHERE id = $1', [userId]);

-- Password hashing
CREATE OR REPLACE FUNCTION hash_password(password text)
RETURNS text AS $$
BEGIN
    return crypt(password, gen_salt('bf', 8));
END;
$$ LANGUAGE plpgsql;

-- Versioning and Documentation
-- API versioning
{
    "type": "endpoint",
    "path": "/api/v1/resource",
    "version": "1.0.0",
    "deprecated": false,
    "documentation": {
        "description": "Resource endpoint",
        "params": {
            "id": "Resource identifier"
        }
    }
}

-- Error Codes and Messages
const ERROR_CODES = {
    VALIDATION_ERROR: 'E001',
    NOT_FOUND: 'E002',
    UNAUTHORIZED: 'E003',
    DATABASE_ERROR: 'E004'
};

-- Standardized error response
return hsResponse(400, {
    success: false,
    error: {
        code: ERROR_CODES.VALIDATION_ERROR,
        message: 'Invalid input',
        details: errors
    }
});

-- Testing Patterns
-- Unit test template
{
    "type": "test",
    "name": "Test description",
    "setup": () => {
        -- Setup test data
    },
    "test": () => {
        -- Run test
        const result = someFunction();
        assert(result === expected);
    },
    "teardown": () => {
        -- Clean up test data
    }
}

-- Integration testing
CREATE OR REPLACE FUNCTION test_integration()
RETURNS void AS $$
BEGIN
    -- Test database operations
    -- Test API endpoints
    -- Test workflows
END;
$$;

-- Monitoring and Logging
-- Application logging
return hsLog({
    level: 'INFO',
    message: 'Operation completed',
    metadata: {
        user: currentUser,
        action: 'update',
        timestamp: now()
    }
});

-- Performance monitoring
CREATE TABLE performance_logs (
    id SERIAL PRIMARY KEY,
    operation TEXT,
    duration INTERVAL,
    timestamp TIMESTAMP DEFAULT current_timestamp
);

-- Deployment Checklist
-- 1. Backup database
SELECT pg_dump_all();

-- 2. Check dependencies
SELECT * FROM pg_depend;

-- 3. Validate configurations
SELECT current_setting('parameter_name');

-- 4. Update documentation
-- 5. Run tests
-- 6. Deploy with rollback plan

-- Common Debugging Patterns
-- Transaction debugging
BEGIN;
SAVEPOINT debug_point;
-- Test changes
ROLLBACK TO debug_point;
-- or
COMMIT;

-- Query debugging
SELECT 
    query,
    calls,
    total_time / calls as avg_time,
    rows
FROM pg_stat_statements
WHERE query ILIKE '%your_table%';

-- Development Environment
-- Local development settings
{
    "environment": "development",
    "debug": true,
    "logLevel": "debug",
    "database": {
        "maxConnections": 10,
        "idleTimeoutMillis": 30000
    }
}

-- Code Organization
-- Modular function structure
CREATE OR REPLACE FUNCTION module_name__function_name(
    param1 type1,
    param2 type2
) RETURNS return_type AS $$
DECLARE
    -- Variable declarations
BEGIN
    -- Function logic
END;
$$ LANGUAGE plpgsql;

-- Naming Conventions
-- 1. Use snake_case for database objects
-- 2. Use camelCase for JavaScript
-- 3. Use UPPERCASE for constants
-- 4. Use prefix for related functions

-- Git Workflow
-- 1. Feature branches
-- 2. Meaningful commit messages
-- 3. Pull request template
-- 4. Code review checklist
-- 5. Version tagging

-- Common Pitfalls to Avoid
-- 1. N+1 query problems
-- 2. Missing indexes on foreign keys
-- 3. Unhandled edge cases
-- 4. Insufficient error handling
-- 5. Lack of input validation
-- 6. Poor performance monitoring
-- 7. Inadequate logging
-- 8. Missing documentation
-- 9. Tight coupling
-- 10. Insufficient testing

-- Development Tools
-- 1. PostgreSQL extensions
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- 2. Development utilities
CREATE OR REPLACE FUNCTION dev_reset_sequence(
    sequence_name text
) RETURNS void AS $$
BEGIN
    EXECUTE format(
        'ALTER SEQUENCE %I RESTART WITH 1',
        sequence_name
    );
END;
$$ LANGUAGE plpgsql;

-- STRING CONCATENATION
-- ---------------------------------------------
-- Basic String Concatenation
-- Using ||
SELECT 'Hello' || ' ' || 'World';                    -- Hello World
SELECT first_name || ' ' || last_name as full_name;  -- John Doe

-- Multiple concatenation
SELECT 
    first_name || ' ' || middle_name || ' ' || last_name as full_name,
    street || ', ' || city || ', ' || state as address;

-- Concat with CONCAT() function
SELECT CONCAT('Hello', ' ', 'World');                -- Hello World
SELECT CONCAT(first_name, ' ', last_name);           -- John Doe

-- Concat with separator using CONCAT_WS()
SELECT CONCAT_WS(' ', 'Hello', 'World');            -- Hello World
SELECT CONCAT_WS(', ', street, city, state);        -- 123 Main St, Boston, MA

-- Concat with NULL handling
-- || treats NULL as empty string
SELECT 'Hello' || NULL || 'World';                  -- HelloWorld

-- CONCAT treats NULL as empty string
SELECT CONCAT('Hello', NULL, 'World');              -- HelloWorld

-- CONCAT_WS skips NULL values
SELECT CONCAT_WS(',', 'a', NULL, 'b', NULL, 'c');  -- a,b,c

-- Array to String
SELECT array_to_string(ARRAY['a', 'b', 'c'], ', ');         -- a, b, c
SELECT array_to_string(ARRAY['a', 'b', 'c'], ', ', '*');    -- a, b, c (with NULL replacement)

-- String Aggregation
SELECT STRING_AGG(column_name, ', ') 
FROM table_name;                                    -- value1, value2, value3

-- String aggregation with ordering
SELECT STRING_AGG(column_name, ', ' ORDER BY other_column) 
FROM table_name;

-- Common Use Cases
-- Building CSV strings
SELECT STRING_AGG(
    CONCAT_WS(',', id::text, name, email),
    E'\n' ORDER BY id
) FROM users;

-- Building JSON strings
SELECT CONCAT(
    '{"name":"', name, '","email":"', email, '"}'
) FROM users;

-- Building HTML
SELECT CONCAT(
    '<div class="user">',
    '<h2>', name, '</h2>',
    '<p>', email, '</p>',
    '</div>'
) FROM users;

-- Building SQL
SELECT CONCAT(
    'SELECT * FROM users WHERE id IN (',
    STRING_AGG(id::text, ','),
    ')'
) FROM selected_users;

-- Dynamic Column Concatenation
SELECT CONCAT_WS(' ',
    CASE WHEN title IS NOT NULL THEN title END,
    first_name,
    CASE WHEN middle_name IS NOT NULL THEN middle_name END,
    last_name
) as full_name;

-- Conditional Concatenation
SELECT 
    CASE 
        WHEN middle_name IS NOT NULL THEN
            first_name || ' ' || middle_name || ' ' || last_name
        ELSE
            first_name || ' ' || last_name
    END as full_name;

-- Format Strings
SELECT FORMAT('%s %s', first_name, last_name);      -- John Doe
SELECT FORMAT('%I.%I', schema_name, table_name);    -- public.users
SELECT FORMAT('%L', value);                         -- Safely quoted literal

-- Common Patterns
-- Phone number formatting
SELECT CONCAT(
    '(',
    SUBSTRING(phone FROM 1 FOR 3),
    ') ',
    SUBSTRING(phone FROM 4 FOR 3),
    '-',
    SUBSTRING(phone FROM 7)
);

-- Address formatting
SELECT CONCAT_WS(', ',
    street_address,
    NULLIF(apartment, ''),
    city,
    state,
    zip_code
);

-- URL building
SELECT CONCAT(
    'https://',
    domain,
    '/users/',
    user_id,
    CASE 
        WHEN query_params IS NOT NULL THEN CONCAT('?', query_params)
        ELSE ''
    END
);

-- File path construction
SELECT CONCAT_WS('/',
    base_path,
    year,
    month,
    CONCAT(filename, '.', extension)
);

-- Error message formatting
SELECT CONCAT_WS(' - ',
    error_code,
    error_message,
    CASE 
        WHEN details IS NOT NULL THEN CONCAT('Details: ', details)
        ELSE NULL
    END
);

-- STRING FORMATTING
-- ---------------------------------------------
-- Basic Format Function
-- %s - string, %I - identifier, %L - literal, %n - newline
SELECT format('Hello, %s', 'World');                         -- Hello, World
SELECT format('Table: %I', 'my_table');                      -- Table: my_table
SELECT format('Value: %L', 'text with ''quotes''');          -- Value: 'text with ''quotes'''

-- Multiple Parameters
SELECT format('%s %s %s', 'Hello', 'Beautiful', 'World');    -- Hello Beautiful World
SELECT format('Name: %s, Age: %s', 'John', 25);             -- Name: John, Age: 25

-- Named Parameters
SELECT format('Hello %(name)s, you are %(age)s years old', 
    name := 'John', age := 25);                             -- Hello John, you are 25 years old

-- Number Formatting
-- Zero padding
SELECT format('%03d', 7);                                    -- 007
SELECT format('%05d', 123);                                  -- 00123

-- Decimal places
SELECT format('%.2f', 123.456);                             -- 123.46
SELECT format('%6.2f', 123.456);                            -- 123.46 (width 6)

-- Currency Formatting
SELECT format('$%s', to_char(amount, 'FM999,999,999.00'));  -- $1,234.56
SELECT format('EUR %s', to_char(amount, 'FM999,999,999.00')); -- EUR 1,234.56

-- Date Formatting
SELECT format('Date: %s', to_char(current_date, 'YYYY-MM-DD'));
SELECT format('Time: %s', to_char(current_timestamp, 'HH24:MI:SS'));

-- Complex Formatting
-- Table-like output
SELECT format(
    '| %-20s | %-10s | %10s |',
    'Name',
    'Role',
    'Salary'
);

-- JSON formatting
SELECT format(
    '{"name":"%s","age":%s,"email":"%s"}',
    name,
    age,
    email
);

-- HTML formatting
SELECT format(
    '<div class="%s"><h1>%s</h1><p>%s</p></div>',
    'user-card',
    username,
    description
);

-- URL formatting
SELECT format(
    'https://%s/%s?id=%s&type=%s',
    domain,
    path,
    id,
    type
);

-- Error Message Formatting
SELECT format(
    'Error %s: %s (Details: %s)',
    error_code,
    error_message,
    error_details
);

-- Conditional Formatting
SELECT format(
    'Status: %s',
    CASE 
        WHEN status = 1 THEN 'Active'
        WHEN status = 0 THEN 'Inactive'
        ELSE 'Unknown'
    END
);

-- List Formatting
SELECT format(
    'Items: %s',
    array_to_string(ARRAY['apple', 'banana', 'orange'], ', ')
);

-- Path Formatting
SELECT format(
    '%s/%s/%s.%s',
    directory,
    filename,
    version,
    extension
);

-- Common Patterns
-- Phone number
SELECT format(
    '(%s) %s-%s',
    substring(phone from 1 for 3),
    substring(phone from 4 for 3),
    substring(phone from 7)
);

-- Address
SELECT format(
    '%s%s, %s, %s %s',
    street,
    CASE WHEN apt IS NOT NULL THEN format(' Apt %s', apt) ELSE '' END,
    city,
    state,
    zip
);

-- SQL Query Building
SELECT format(
    'SELECT * FROM %I WHERE %I = %L',
    table_name,
    column_name,
    value
);

-- Email Template
SELECT format(
    'Dear %s,%n%nThank you for your %s.%n%nBest regards,%n%s',
    customer_name,
    message_type,
    sender_name
);

-- Report Formatting
SELECT format(
    'Report: %s%nDate: %s%nTotal Items: %s%nTotal Value: $%s',
    report_name,
    to_char(report_date, 'YYYY-MM-DD'),
    item_count,
    to_char(total_value, 'FM999,999,999.00')
);

-- Logging Format
SELECT format(
    '[%s] %s: %s (User: %s)',
    to_char(log_timestamp, 'YYYY-MM-DD HH24:MI:SS'),
    log_level,
    message,
    user_name
);

-- Best Practices
-- 1. Use %L for user input to prevent SQL injection
-- 2. Use %I for table/column names
-- 3. Use named parameters for complex strings
-- 4. Consider NULL values
-- 5. Use appropriate width specifiers
-- 6. Handle special characters

-- HTML TABLE GENERATION
-- ---------------------------------------------
-- Basic Table Structure
SELECT format(
    '<table class="data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            %s
        </tbody>
    </table>',
    STRING_AGG(
        format(
            '<tr>
                <td>%s</td>
                <td>%s</td>
                <td>%s</td>
            </tr>',
            id,
            name,
            email
        ),
        E'\n'
        ORDER BY id
    )
) FROM users;

-- Styled Table with Classes
SELECT format(
    '<table class="table table-striped">
        <thead class="thead-dark">
            <tr>
                <th scope="col">%s</th>
                <th scope="col">%s</th>
                <th scope="col">%s</th>
            </tr>
        </thead>
        <tbody>
            %s
        </tbody>
    </table>',
    'Product',
    'Price',
    'Status',
    STRING_AGG(
        format(
            '<tr class="%s">
                <td>%s</td>
                <td class="text-right">$%s</td>
                <td><span class="badge badge-%s">%s</span></td>
            </tr>',
            CASE 
                WHEN status = 'active' THEN 'table-success'
                WHEN status = 'pending' THEN 'table-warning'
                ELSE 'table-danger'
            END,
            product_name,
            to_char(price, 'FM999,999.00'),
            CASE status
                WHEN 'active' THEN 'success'
                WHEN 'pending' THEN 'warning'
                ELSE 'danger'
            END,
            status
        ),
        E'\n'
        ORDER BY product_name
    )
) FROM products;

-- Responsive Table with Data Attributes
SELECT format(
    '<div class="table-responsive">
        <table class="table" data-table-id="%s">
            <thead>
                <tr>
                    %s
                </tr>
            </thead>
            <tbody>
                %s
            </tbody>
        </table>
    </div>',
    'user-table',
    STRING_AGG(
        format(
            '<th data-column="%s">%s</th>',
            column_name,
            column_title
        ),
        E'\n'
        ORDER BY column_order
    ),
    STRING_AGG(
        format(
            '<tr data-row-id="%s">
                %s
            </tr>',
            id,
            STRING_AGG(
                format(
                    '<td data-label="%s">%s</td>',
                    column_name,
                    column_value
                ),
                E'\n'
                ORDER BY column_order
            )
        ),
        E'\n'
        ORDER BY id
    )
) FROM table_data;

-- Table with Custom Formatting
SELECT format(
    '<table class="report-table">
        <thead>
            <tr>
                <th colspan="4" class="table-header">%s</th>
            </tr>
            <tr>
                <th>Date</th>
                <th>Description</th>
                <th>Amount</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            %s
        </tbody>
        <tfoot>
            <tr>
                <td colspan="2" class="text-right">Total:</td>
                <td class="total-amount">$%s</td>
                <td></td>
            </tr>
        </tfoot>
    </table>',
    'Monthly Transaction Report',
    STRING_AGG(
        format(
            '<tr class="%s">
                <td>%s</td>
                <td>%s</td>
                <td class="amount">$%s</td>
                <td><span class="status-%s">%s</span></td>
            </tr>',
            CASE 
                WHEN amount < 0 THEN 'negative'
                ELSE 'positive'
            END,
            to_char(transaction_date, 'YYYY-MM-DD'),
            description,
            ABS(amount)::text,
            lower(status),
            status
        ),
        E'\n'
        ORDER BY transaction_date
    ),
    SUM(amount)::text
) FROM transactions;

-- Table with Row Groups
SELECT format(
    '<table class="grouped-table">
        <thead>
            <tr>
                <th>Category</th>
                <th>Item</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
        </thead>
        %s
    </table>',
    STRING_AGG(
        format(
            '<tbody class="category-group">
                <tr class="category-header">
                    <td colspan="4">%s</td>
                </tr>
                %s
                <tr class="category-footer">
                    <td colspan="3">Category Total:</td>
                    <td>$%s</td>
                </tr>
            </tbody>',
            category_name,
            STRING_AGG(
                format(
                    '<tr>
                        <td></td>
                        <td>%s</td>
                        <td>%s</td>
                        <td>$%s</td>
                    </tr>',
                    item_name,
                    quantity,
                    to_char(price, 'FM999,999.00')
                ),
                E'\n'
                ORDER BY item_name
            ),
            to_char(SUM(price * quantity), 'FM999,999.00')
        ),
        E'\n'
        ORDER BY category_name
    )
) FROM inventory
GROUP BY category_name;

-- Common CSS for Tables
/*
.data-table {
    width: 100%;
    border-collapse: collapse;
    margin: 1em 0;
}

.data-table th,
.data-table td {
    padding: 8px;
    border: 1px solid #ddd;
}

.data-table thead th {
    background-color: #f5f5f5;
    font-weight: bold;
}

.data-table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

.data-table tbody tr:hover {
    background-color: #f5f5f5;
}

.amount {
    text-align: right;
}

.status-active {
    color: green;
}

.status-pending {
    color: orange;
}

.status-inactive {
    color: red;
}
*/

-- HTML TABLE WITH INLINE STYLES
-- ---------------------------------------------
-- Basic Table with Inline Styles
SELECT format(
    '<table style="width: 100%%; border-collapse: collapse; margin: 20px 0; font-family: Arial, sans-serif;">
        <thead>
            <tr style="background-color: #f8f9fa;">
                <th style="padding: 12px; border: 1px solid #dee2e6; text-align: left;">ID</th>
                <th style="padding: 12px; border: 1px solid #dee2e6; text-align: left;">Name</th>
                <th style="padding: 12px; border: 1px solid #dee2e6; text-align: left;">Email</th>
            </tr>
        </thead>
        <tbody>
            %s
        </tbody>
    </table>',
    STRING_AGG(
        format(
            '<tr style="border-bottom: 1px solid #dee2e6;">
                <td style="padding: 12px; border: 1px solid #dee2e6;">%s</td>
                <td style="padding: 12px; border: 1px solid #dee2e6;">%s</td>
                <td style="padding: 12px; border: 1px solid #dee2e6;">%s</td>
            </tr>',
            id,
            name,
            email
        ),
        E'\n'
        ORDER BY id
    )
) FROM users;

-- Professional Report Table with Inline Styles
SELECT format(
    '<table style="width: 100%%; border-collapse: collapse; margin: 20px 0; font-family: Arial, sans-serif; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
        <thead>
            <tr>
                <th colspan="4" style="background-color: #2c3e50; color: white; padding: 15px; text-align: center; font-size: 18px;">%s</th>
            </tr>
            <tr style="background-color: #f8f9fa;">
                <th style="padding: 12px; border: 1px solid #dee2e6; text-align: left;">Date</th>
                <th style="padding: 12px; border: 1px solid #dee2e6; text-align: left;">Description</th>
                <th style="padding: 12px; border: 1px solid #dee2e6; text-align: right;">Amount</th>
                <th style="padding: 12px; border: 1px solid #dee2e6; text-align: center;">Status</th>
            </tr>
        </thead>
        <tbody>
            %s
        </tbody>
        <tfoot>
            <tr style="background-color: #f8f9fa; font-weight: bold;">
                <td colspan="2" style="padding: 12px; border: 1px solid #dee2e6; text-align: right;">Total:</td>
                <td style="padding: 12px; border: 1px solid #dee2e6; text-align: right;">$%s</td>
                <td style="padding: 12px; border: 1px solid #dee2e6;"></td>
            </tr>
        </tfoot>
    </table>',
    'Monthly Transaction Report',
    STRING_AGG(
        format(
            '<tr style="border-bottom: 1px solid #dee2e6; %s">
                <td style="padding: 12px; border: 1px solid #dee2e6;">%s</td>
                <td style="padding: 12px; border: 1px solid #dee2e6;">%s</td>
                <td style="padding: 12px; border: 1px solid #dee2e6; text-align: right;">$%s</td>
                <td style="padding: 12px; border: 1px solid #dee2e6; text-align: center;">
                    <span style="padding: 4px 8px; border-radius: 4px; font-size: 12px; %s">%s</span>
                </td>
            </tr>',
            CASE 
                WHEN amount < 0 THEN 'background-color: #fff3f3;'
                ELSE 'background-color: #f8fff8;'
            END,
            to_char(transaction_date, 'YYYY-MM-DD'),
            description,
            ABS(amount)::text,
            CASE status
                WHEN 'active' THEN 'background-color: #28a745; color: white;'
                WHEN 'pending' THEN 'background-color: #ffc107; color: black;'
                ELSE 'background-color: #dc3545; color: white;'
            END,
            status
        ),
        E'\n'
        ORDER BY transaction_date
    ),
    SUM(amount)::text
) FROM transactions;

-- Responsive Table with Inline Styles
SELECT format(
    '<div style="overflow-x: auto;">
        <table style="width: 100%%; min-width: 600px; border-collapse: collapse; margin: 20px 0; font-family: Arial, sans-serif;">
            <thead>
                <tr style="background-color: #343a40; color: white;">
                    %s
                </tr>
            </thead>
            <tbody>
                %s
            </tbody>
        </table>
    </div>',
    STRING_AGG(
        format(
            '<th style="padding: 12px; text-align: left; border-bottom: 2px solid #dee2e6;">%s</th>',
            column_title
        ),
        E'\n'
        ORDER BY column_order
    ),
    STRING_AGG(
        format(
            '<tr style="border-bottom: 1px solid #dee2e6; transition: background-color 0.3s ease;" onmouseover="this.style.backgroundColor=''#f5f5f5''" onmouseout="this.style.backgroundColor=''transparent''">
                %s
            </tr>',
            STRING_AGG(
                format(
                    '<td style="padding: 12px; border-bottom: 1px solid #dee2e6;">%s</td>',
                    column_value
                ),
                E'\n'
                ORDER BY column_order
            )
        ),
        E'\n'
        ORDER BY id
    )
) FROM table_data;

-- Grouped Table with Inline Styles and Hover Effects
SELECT format(
    '<table style="width: 100%%; border-collapse: collapse; margin: 20px 0; font-family: Arial, sans-serif; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
        <thead>
            <tr style="background-color: #343a40; color: white;">
                <th style="padding: 12px; text-align: left;">Category</th>
                <th style="padding: 12px; text-align: left;">Item</th>
                <th style="padding: 12px; text-align: right;">Quantity</th>
                <th style="padding: 12px; text-align: right;">Price</th>
            </tr>
        </thead>
        %s
    </table>',
    STRING_AGG(
        format(
            '<tbody>
                <tr style="background-color: #f8f9fa;">
                    <td colspan="4" style="padding: 12px; font-weight: bold; border-bottom: 2px solid #dee2e6;">%s</td>
                </tr>
                %s
                <tr style="background-color: #f8f9fa; font-weight: bold;">
                    <td colspan="3" style="padding: 12px; text-align: right; border-top: 2px solid #dee2e6;">Category Total:</td>
                    <td style="padding: 12px; text-align: right; border-top: 2px solid #dee2e6;">$%s</td>
                </tr>
            </tbody>',
            category_name,
            STRING_AGG(
                format(
                    '<tr style="border-bottom: 1px solid #dee2e6; transition: background-color 0.3s ease;" onmouseover="this.style.backgroundColor=''#f5f5f5''" onmouseout="this.style.backgroundColor=''transparent''">
                        <td style="padding: 12px;"></td>
                        <td style="padding: 12px;">%s</td>
                        <td style="padding: 12px; text-align: right;">%s</td>
                        <td style="padding: 12px; text-align: right;">$%s</td>
                    </tr>',
                    item_name,
                    quantity,
                    to_char(price, 'FM999,999.00')
                ),
                E'\n'
                ORDER BY item_name
            ),
            to_char(SUM(price * quantity), 'FM999,999.00')
        ),
        E'\n'
        ORDER BY category_name
    )
) FROM inventory
GROUP BY category_name;

-- Data Grid with Advanced Inline Styles
SELECT format(
    '<div style="padding: 20px;">
        <table style="width: 100%%; border-collapse: separate; border-spacing: 0; margin: 20px 0; font-family: Arial, sans-serif; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
            <thead>
                <tr style="background: linear-gradient(135deg, #2c3e50, #3498db);">
                    <th style="padding: 15px; color: white; font-weight: 600; text-align: left; border-bottom: 2px solid rgba(255,255,255,0.1);">Name</th>
                    <th style="padding: 15px; color: white; font-weight: 600; text-align: left; border-bottom: 2px solid rgba(255,255,255,0.1);">Position</th>
                    <th style="padding: 15px; color: white; font-weight: 600; text-align: right; border-bottom: 2px solid rgba(255,255,255,0.1);">Salary</th>
                    <th style="padding: 15px; color: white; font-weight: 600; text-align: center; border-bottom: 2px solid rgba(255,255,255,0.1);">Status</th>
                </tr>
            </thead>
            <tbody>
                %s
            </tbody>
        </table>
    </div>',
    STRING_AGG(
        format(
            '<tr style="background-color: white; transition: all 0.3s ease;" onmouseover="this.style.backgroundColor=''#f8f9fa''" onmouseout="this.style.backgroundColor=''white''">
                <td style="padding: 12px 15px; border-bottom: 1px solid #e9ecef;">
                    <div style="display: flex; align-items: center;">
                        <div style="width: 40px; height: 40px; border-radius: 50%%; background-color: #e9ecef; margin-right: 10px; display: flex; align-items: center; justify-content: center; font-weight: bold; color: #495057;">%s</div>
                        <div>
                            <div style="font-weight: 500;">%s</div>
                            <div style="font-size: 12px; color: #6c757d;">%s</div>
                        </div>
                    </div>
                </td>
                <td style="padding: 12px 15px; border-bottom: 1px solid #e9ecef;">%s</td>
                <td style="padding: 12px 15px; border-bottom: 1px solid #e9ecef; text-align: right;">$%s</td>
                <td style="padding: 12px 15px; border-bottom: 1px solid #e9ecef; text-align: center;">
                    <span style="padding: 6px 12px; border-radius: 20px; font-size: 12px; font-weight: 500; %s">%s</span>
                </td>
            </tr>',
            SUBSTRING(name FROM 1 FOR 1),
            name,
            email,
            position,
            to_char(salary, 'FM999,999.00'),
            CASE status
                WHEN 'active' THEN 'background-color: #d4edda; color: #155724;'
                WHEN 'pending' THEN 'background-color: #fefce8; color: #85640e; border: 1px solid #fef08a;'
                ELSE 'background-color: #fef2f2; color: #991b1b; border: 1px solid #fecaca;'
            END,
            status,
            to_char(salary, 'FM999,999.00'),
            CASE status
                WHEN 'active' THEN 'background-color: #d4edda; color: #155724;'
                WHEN 'pending' THEN 'background-color: #fefce8; color: #85640e; border: 1px solid #fef08a;'
                ELSE 'background-color: #fef2f2; color: #991b1b; border: 1px solid #fecaca;'
            END,
            status
        ),
        E'\n'
        ORDER BY name
    )
) FROM employees;

-- MODERN INTERACTIVE TABLE WITH ADVANCED FEATURES
-- ---------------------------------------------
SELECT format(
    '<div style="padding: 24px; background: linear-gradient(135deg, #f6f9fc, #eef2f7);">
        <div style="max-width: 1200px; margin: 0 auto;">
            <!-- Table Header with Search and Filters -->
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                <h2 style="margin: 0; color: #1a202c; font-family: system-ui, -apple-system, sans-serif; font-size: 24px;">
                    Data Overview
                </h2>
                <div style="display: flex; gap: 12px;">
                    <input type="text" placeholder="Search..." 
                           style="padding: 8px 12px; border: 1px solid #e2e8f0; border-radius: 6px; outline: none; font-size: 14px;">
                    <select style="padding: 8px 12px; border: 1px solid #e2e8f0; border-radius: 6px; outline: none; font-size: 14px;">
                        <option>Filter by Status</option>
                        <option>Active</option>
                        <option>Pending</option>
                        <option>Inactive</option>
                    </select>
                </div>
            </div>

            <!-- Main Table -->
            <div style="background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -2px rgba(0,0,0,0.05);">
                <table style="width: 100%%; border-collapse: separate; border-spacing: 0; font-family: system-ui, -apple-system, sans-serif;">
                    <thead>
                        <tr style="background: linear-gradient(135deg, #2d3748, #4a5568);">
                            <th style="padding: 16px; color: white; font-weight: 500; text-align: left;">
                                <div style="display: flex; align-items: center; gap: 8px;">
                                    <span>Name</span>
                                    <svg style="width: 12px; height: 12px;" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                                    </svg>
                                </div>
                            </th>
                            <th style="padding: 16px; color: white; font-weight: 500; text-align: center;">Status</th>
                            <th style="padding: 16px; color: white; font-weight: 500; text-align: right;">Progress</th>
                            <th style="padding: 16px; color: white; font-weight: 500; text-align: right;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        %s
                    </tbody>
                </table>

                <!-- Table Footer with Pagination -->
                <div style="padding: 16px; background-color: #f8fafc; border-top: 1px solid #e2e8f0; display: flex; justify-content: space-between; align-items: center;">
                    <div style="color: #64748b; font-size: 14px;">
                        Showing %s of %s items
                    </div>
                    <div style="display: flex; gap: 8px;">
                        <button style="padding: 8px 12px; border: 1px solid #e2e8f0; border-radius: 6px; background: white; color: #64748b; cursor: pointer;">Previous</button>
                        <button style="padding: 8px 12px; border: 1px solid #e2e8f0; border-radius: 6px; background: #3b82f6; color: white; cursor: pointer;">Next</button>
                    </div>
                </div>
            </div>
        </div>
    </div>',
    STRING_AGG(
        format(
            '<tr style="border-bottom: 1px solid #e2e8f0; transition: all 0.2s ease;" 
                onmouseover="this.style.backgroundColor=''#f8fafc''" 
                onmouseout="this.style.backgroundColor=''transparent''">
                <td style="padding: 16px;">
                    <div style="display: flex; align-items: center; gap: 12px;">
                        <div style="width: 40px; height: 40px; background: %s; border-radius: 8px; display: flex; align-items: center; justify-content: center; color: white; font-weight: 600;">%s</div>
                        <div>
                            <div style="font-weight: 500; color: #1e293b;">%s</div>
                            <div style="font-size: 13px; color: #64748b; margin-top: 2px;">%s</div>
                        </div>
                    </div>
                </td>
                <td style="padding: 16px; text-align: center;">
                    <span style="display: inline-flex; align-items: center; gap: 6px; padding: 6px 12px; border-radius: 9999px; font-size: 13px; font-weight: 500; %s">
                        <span style="width: 6px; height: 6px; border-radius: 50%%; background-color: currentColor;"></span>
                        %s
                    </span>
                </td>
                <td style="padding: 16px; text-align: right;">
                    <div style="display: flex; align-items: center; justify-content: flex-end; gap: 12px;">
                        <div style="flex-grow: 1; max-width: 150px; height: 6px; background-color: #e2e8f0; border-radius: 9999px; overflow: hidden;">
                            <div style="width: %s%%; height: 100%%; background-color: %s; transition: width 0.3s ease;"></div>
                        </div>
                        <span style="font-size: 13px; color: #64748b;">%s%%</span>
                    </div>
                </td>
                <td style="padding: 16px; text-align: right;">
                    <div style="display: flex; gap: 8px; justify-content: flex-end;">
                        <button style="padding: 8px; border: none; border-radius: 6px; background-color: #f1f5f9; color: #475569; cursor: pointer; transition: all 0.2s ease;"
                                onmouseover="this.style.backgroundColor=''#e2e8f0''"
                                onmouseout="this.style.backgroundColor=''#f1f5f9''">
                            <svg style="width: 16px; height: 16px;" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                            </svg>
                        </button>
                        <button style="padding: 8px; border: none; border-radius: 6px; background-color: #f1f5f9; color: #475569; cursor: pointer; transition: all 0.2s ease;"
                                onmouseover="this.style.backgroundColor=''#e2e8f0''"
                                onmouseout="this.style.backgroundColor=''#f1f5f9''">
                            <svg style="width: 16px; height: 16px;" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                            </svg>
                        </button>
                        <div class="dropdown" style="position: relative;">
                            <button style="padding: 8px; border: none; border-radius: 6px; background-color: #f1f5f9; color: #475569; cursor: pointer; transition: all 0.2s ease;"
                                    onmouseover="this.style.backgroundColor=''#e2e8f0''"
                                    onmouseout="this.style.backgroundColor=''#f1f5f9''">
                                <svg style="width: 16px; height: 16px;" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </td>
            </tr>',
            -- Generate random background color for item icon
            format('#%s', substring(md5(random()::text) from 1 for 6)),
            substring(name from 1 for 1),
            name,
            description,
            CASE status
                WHEN 'active' THEN 'background-color: #f0fdf4; color: #166534; border: 1px solid #bbf7d0;'
                WHEN 'pending' THEN 'background-color: #fefce8; color: #85640e; border: 1px solid #fef08a;'
                ELSE 'background-color: #fef2f2; color: #991b1b; border: 1px solid #fecaca;'
            END,
            status,
            progress,
            CASE 
                WHEN progress >= 80 THEN '#22c55e'
                WHEN progress >= 50 THEN '#eab308'
                ELSE '#ef4444'
            END,
            progress
        ),
        E'\n'
    ),
    shown_items,
    total_items
) FROM items;

-- FANCY TABLE FEATURES
-- ---------------------------------------------
-- Table with Animated Loading State
SELECT format(
    '<div style="position: relative;">
        <!-- Loading Overlay -->
        <div class="loading-overlay" style="position: absolute; inset: 0; background: rgba(255,255,255,0.9); display: flex; align-items: center; justify-content: center; z-index: 10;">
            <div style="width: 40px; height: 40px; border: 3px solid #f3f3f3; border-top: 3px solid #3498db; border-radius: 50%%; animation: spin 1s linear infinite;"></div>
        </div>
        
        <!-- Table Content -->
        <table style="width: 100%%; border-collapse: separate; border-spacing: 0; font-family: system-ui, -apple-system, sans-serif; opacity: 0.5; transition: opacity 0.3s ease;">
            %s
        </table>
        
        <style>
            @keyframes spin {
                0%% { transform: rotate(0deg); }
                100%% { transform: rotate(360deg); }
            }
        </style>
    </div>',
    table_content
);

-- Table with Expandable Rows
SELECT format(
    '<tr style="cursor: pointer; transition: all 0.3s ease;" 
        onclick="this.nextElementSibling.style.display = this.nextElementSibling.style.display === ''none'' ? ''table-row'' : ''none''">
        <td style="padding: 16px;">%s</td>
        <td style="padding: 16px;">%s</td>
    </tr>
    <tr style="display: none; background-color: #f8fafc;">
        <td colspan="2" style="padding: 20px;">
            <div style="animation: slideDown 0.3s ease-out;">
                <!-- Expanded Content -->
                %s
            </div>
        </td>
    </tr>',
    title,
    summary,
    detailed_content
);

-- Table with Floating Action Menu
SELECT format(
    '<div style="position: relative;">
        <div style="position: fixed; bottom: 24px; right: 24px; display: flex; flex-direction: column; gap: 8px; z-index: 100;">
            <button style="width: 48px; height: 48px; border-radius: 50%%; background: #3b82f6; color: white; border: none; cursor: pointer; box-shadow: 0 4px 6px rgba(0,0,0,0.1); display: flex; align-items: center; justify-content: center; transition: transform 0.2s ease;"
                    onmouseover="this.style.transform=''scale(1.1)''"
                    onmouseout="this.style.transform=''scale(1)''">
                <svg style="width: 24px; height: 24px;" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                </svg>
            </button>
        </div>
        %s
    </div>',
    table_content
);

-- Table with Inline Editing
SELECT format(
    '<td style="padding: 16px;">
        <div class="editable" style="position: relative; display: inline-block;"
             onclick="this.querySelector(''input'').style.display=''block''; this.querySelector(''span'').style.display=''none'';">
            <span style="cursor: pointer;">%s</span>
            <input type="text" value="%s" 
                   style="display: none; position: absolute; top: 0; left: 0; width: 100%%; padding: 4px; border: 1px solid #3b82f6; border-radius: 4px; outline: none;"
                   onblur="this.style.display=''none''; this.previousElementSibling.style.display=''inline''; this.previousElementSibling.textContent=this.value;">
        </div>
    </td>',
    value,
    value
);

-- Table with Color-Coded Priority Levels
SELECT format(
    '<td style="padding: 16px;">
        <div style="display: flex; align-items: center; gap: 8px;">
            <div style="width: 12px; height: 12px; border-radius: 50%%; background: %s;"></div>
            <span style="font-weight: 500; color: %s;">%s</span>
        </div>
    </td>',
    CASE priority
        WHEN 'high' THEN '#ef4444'
        WHEN 'medium' THEN '#f59e0b'
        ELSE '#10b981'
    END,
    CASE priority
        WHEN 'high' THEN '#991b1b'
        WHEN 'medium' THEN '#92400e'
        ELSE '#065f46'
    END,
    priority
);

-- Table with Progress Timeline
SELECT format(
    '<div style="display: flex; align-items: center; gap: 16px; padding: 20px;">
        %s
    </div>',
    STRING_AGG(
        format(
            '<div style="flex: 1; position: relative;">
                <div style="width: 24px; height: 24px; border-radius: 50%%; background: %s; color: white; display: flex; align-items: center; justify-content: center; position: relative; z-index: 1;">%s</div>
                <div style="position: absolute; top: 12px; left: 24px; right: 0; height: 2px; background: %s;"></div>
                <div style="margin-top: 8px; font-size: 12px;">%s</div>
            </div>',
            CASE 
                WHEN status = 'completed' THEN '#10b981'
                WHEN status = 'current' THEN '#3b82f6'
                ELSE '#e5e7eb'
            END,
            step_number,
            CASE 
                WHEN status = 'completed' THEN '#10b981'
                ELSE '#e5e7eb'
            END,
            step_name
        ),
        ''
        ORDER BY step_number
    )
);

-- Table with Animated Statistics
SELECT format(
    '<div style="padding: 24px; background: white; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
        <div style="font-size: 24px; font-weight: 600; color: #1e293b; margin-bottom: 4px;">
            <span style="display: inline-block; animation: countUp 2s ease-out forwards;">%s</span>
            <span style="font-size: 14px; color: #64748b;">%s</span>
        </div>
        <div style="height: 4px; background: #e2e8f0; border-radius: 2px; overflow: hidden;">
            <div style="width: %s%%; height: 100%%; background: %s; animation: slideRight 2s ease-out;"></div>
        </div>
    </div>
    <style>
        @keyframes countUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        @keyframes slideRight {
            from { width: 0; }
        }
    </style>',
    value,
    label,
    percentage,
    color
);

-- Table with Kanban-style Cards
SELECT format(
    '<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 24px; padding: 24px;">
        %s
    </div>',
    STRING_AGG(
        format(
            '<div style="background: white; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); overflow: hidden;">
                <div style="padding: 16px; background: %s; color: white;">
                    <h3 style="margin: 0; font-size: 16px;">%s</h3>
                    <div style="font-size: 12px; opacity: 0.8;">%s items</div>
                </div>
                <div style="padding: 16px;">
                    %s
                </div>
            </div>',
            column_color,
            column_title,
            item_count,
            items_html
        ),
        ''
    )
);

-- Table with Interactive Filters
SELECT format(
    '<div style="padding: 16px; background: white; border-radius: 8px; margin-bottom: 16px;">
        <div style="display: flex; gap: 12px; flex-wrap: wrap;">
            %s
        </div>
    </div>',
    STRING_AGG(
        format(
            '<button style="padding: 8px 16px; border-radius: 9999px; border: 1px solid #e2e8f0; background: %s; color: %s; cursor: pointer; transition: all 0.2s ease;"
                    onclick="this.classList.toggle(''active'')">
                %s
                <span style="margin-left: 4px; font-size: 12px; opacity: 0.7;">%s</span>
            </button>',
            CASE WHEN is_active THEN '#3b82f6' ELSE 'white' END,
            CASE WHEN is_active THEN 'white' ELSE '#1e293b' END,
            filter_name,
            count
        ),
        ''
    )
);

-- MODERN FANCY FORM STYLES
-- ---------------------------------------------
-- Modern Form with Floating Labels and Animations
SELECT format(
    '<div style="max-width: 600px; margin: 40px auto; padding: 30px; background: white; border-radius: 16px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -2px rgba(0,0,0,0.06);">
        <h2 style="margin: 0 0 30px; color: #1e293b; font-size: 24px; font-weight: 600;">%s</h2>
        <form style="display: flex; flex-direction: column; gap: 24px;">
            <!-- Floating Label Input -->
            <div style="position: relative;">
                <input type="text" id="name" required
                    style="width: 100%%; padding: 16px; font-size: 16px; border: 2px solid #e2e8f0; border-radius: 8px; outline: none; transition: all 0.3s ease;
                           background: transparent; position: relative; z-index: 1;"
                    onFocus="this.style.borderColor=''#3b82f6''; this.previousElementSibling.style.color=''#3b82f6''"
                    onBlur="this.style.borderColor=''#e2e8f0''; this.previousElementSibling.style.color=''#64748b''">
                <label for="name" 
                    style="position: absolute; left: 16px; top: 50%%; transform: translateY(-50%%); 
                           background: white; padding: 0 4px; color: #64748b; transition: all 0.3s ease;
                           pointer-events: none;">Full Name</label>
            </div>

            <!-- Custom Select Dropdown -->
            <div style="position: relative;">
                <select style="width: 100%%; padding: 16px; font-size: 16px; border: 2px solid #e2e8f0; 
                             border-radius: 8px; outline: none; appearance: none; cursor: pointer;
                             background: white;">
                    <option value="" disabled selected>Select Option</option>
                    <option value="1">Option 1</option>
                    <option value="2">Option 2</option>
                </select>
                <div style="position: absolute; right: 16px; top: 50%%; transform: translateY(-50%%); pointer-events: none;">
                    <svg style="width: 20px; height: 20px; color: #64748b;" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                </div>
            </div>

            <!-- Modern Radio Buttons -->
            <div style="display: flex; gap: 16px;">
                <label style="flex: 1; position: relative; cursor: pointer;">
                    <input type="radio" name="option" style="display: none;">
                    <div style="padding: 16px; border: 2px solid #e2e8f0; border-radius: 8px; text-align: center;
                               transition: all 0.3s ease;"
                         onMouseOver="this.style.borderColor=''#3b82f6''"
                         onMouseOut="this.style.borderColor=''#e2e8f0''">
                        <span style="font-weight: 500;">Option 1</span>
                    </div>
                </label>
                <label style="flex: 1; position: relative; cursor: pointer;">
                    <input type="radio" name="option" style="display: none;">
                    <div style="padding: 16px; border: 2px solid #e2e8f0; border-radius: 8px; text-align: center;
                               transition: all 0.3s ease;"
                         onMouseOver="this.style.borderColor=''#3b82f6''"
                         onMouseOut="this.style.borderColor=''#e2e8f0''">
                        <span style="font-weight: 500;">Option 2</span>
                    </div>
                </label>
            </div>

            <!-- Toggle Switch -->
            <label style="display: flex; align-items: center; gap: 12px; cursor: pointer;">
                <div style="position: relative; width: 50px; height: 28px;">
                    <input type="checkbox" style="display: none;">
                    <div style="position: absolute; inset: 0; background: #e2e8f0; border-radius: 999px; transition: all 0.3s ease;"
                         onClick="this.style.background=this.style.background===''rgb(59, 130, 246)''?''#e2e8f0'':''#3b82f6''">
                        <div style="position: absolute; left: 2px; top: 2px; width: 24px; height: 24px; 
                                  background: white; border-radius: 50%%; transition: all 0.3s ease;"
                             onClick="this.style.transform=this.style.transform===''translateX(22px)''?'''':''translateX(22px)''"></div>
                    </div>
                </div>
                <span style="font-weight: 500;">Enable Feature</span>
            </label>

            <!-- File Upload with Preview -->
            <div style="border: 2px dashed #e2e8f0; border-radius: 8px; padding: 20px; text-align: center;
                        transition: all 0.3s ease;" 
                 onDragOver="event.preventDefault(); this.style.borderColor=''#3b82f6''; this.style.background=''#f8fafc''"
                 onDragLeave="this.style.borderColor=''#e2e8f0''; this.style.background=''transparent''"
                 onDrop="event.preventDefault(); this.style.borderColor=''#e2e8f0''; this.style.background=''transparent''">
                <svg style="width: 40px; height: 40px; color: #64748b; margin: 0 auto 12px;" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM6.293 6.707a1 1 0 010-1.414l3-3a1 1 0 011.414 0l3 3a1 1 0 01-1.414 1.414L11 5.414V13a1 1 0 11-2 0V5.414L7.707 6.707a1 1 0 01-1.414 0z" clip-rule="evenodd" />
                </svg>
                <div style="font-weight: 500; color: #1e293b; margin-bottom: 4px;">Drop files here or click to upload</div>
                <div style="font-size: 14px; color: #64748b;">Maximum file size: 10MB</div>
            </div>

            <!-- Modern Submit Button -->
            <button type="submit" 
                style="padding: 16px; background: linear-gradient(135deg, #3b82f6, #2563eb); color: white; 
                       border: none; border-radius: 8px; font-weight: 500; font-size: 16px; cursor: pointer;
                       transition: all 0.3s ease; position: relative; overflow: hidden;"
                onMouseOver="this.style.transform=''translateY(-2px)''; this.style.boxShadow=''0 4px 12px rgba(59, 130, 246, 0.5)''"
                onMouseOut="this.style.transform=''translateY(0)''; this.style.boxShadow=''none''">
                <span>Submit Form</span>
                <div style="position: absolute; inset: 0; background: white; opacity: 0; transition: opacity 0.3s ease;"
                     onMouseOver="this.style.opacity=''0.1''"
                     onMouseOut="this.style.opacity=''0''"></div>
            </button>
        </form>
    </div>

    <style>
        /* Floating Label Animation */
        input:focus + label, input:not(:placeholder-shown) + label {
            transform: translateY(-130%%) scale(0.85);
            color: #3b82f6;
        }

        /* Radio Button Selected State */
        input[type="radio"]:checked + div {
            border-color: #3b82f6;
            background: #eff6ff;
        }

        /* File Upload Drag State */
        .drag-over {
            border-color: #3b82f6;
            background: #f8fafc;
        }
    </style>',
    'Modern Form Example'
);

-- Additional Form Elements
-- Password Input with Strength Indicator
SELECT format(
    '<div style="position: relative;">
        <input type="password" 
               style="width: 100%%; padding: 16px; padding-right: 48px; font-size: 16px; 
                      border: 2px solid #e2e8f0; border-radius: 8px; outline: none;">
        <div style="position: absolute; right: 16px; top: 50%%; transform: translateY(-50%%);">
            <div style="width: 24px; height: 3px; background: %s; border-radius: 999px;"></div>
        </div>
        <div style="margin-top: 8px; font-size: 14px; color: %s;">%s</div>
    </div>',
    CASE 
        WHEN password_strength >= 80 THEN '#22c55e'
        WHEN password_strength >= 50 THEN '#eab308'
        ELSE '#ef4444'
    END,
    CASE 
        WHEN password_strength >= 80 THEN '#166534'
        WHEN password_strength >= 50 THEN '#854d0e'
        ELSE '#991b1b'
    END,
    password_message
);

-- Search Input with Autocomplete
SELECT format(
    '<div style="position: relative;">
        <input type="search" placeholder="Search..."
               style="width: 100%%; padding: 16px 48px; font-size: 16px; border: 2px solid #e2e8f0; 
                      border-radius: 8px; outline: none;">
        <svg style="position: absolute; left: 16px; top: 50%%; transform: translateY(-50%%);
                   width: 20px; height: 20px; color: #64748b;" 
             viewBox="0 0 20 20" fill="currentColor">
            <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd" />
        </svg>
        <div style="position: absolute; left: 0; right: 0; top: 100%%; margin-top: 8px;
                    background: white; border-radius: 8px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
                    display: none;">
            %s
        </div>
    </div>',
    STRING_AGG(
        format(
            '<div style="padding: 12px 16px; cursor: pointer; transition: background 0.3s ease;"
                 onMouseOver="this.style.background=''#f8fafc''"
                 onMouseOut="this.style.background=''transparent''">
                %s
            </div>',
            suggestion
        ),
        ''
    )
);

-- Date Range Picker
SELECT format(
    '<div style="display: flex; gap: 16px;">
        <div style="flex: 1; position: relative;">
            <input type="date" 
                   style="width: 100%%; padding: 16px; font-size: 16px; border: 2px solid #e2e8f0;
                          border-radius: 8px; outline: none; cursor: pointer;">
            <label style="position: absolute; left: 16px; top: 0; transform: translateY(-50%%);
                         background: white; padding: 0 4px; color: #64748b; font-size: 14px;">
                Start Date
            </label>
        </div>
        <div style="flex: 1; position: relative;">
            <input type="date"
                   style="width: 100%%; padding: 16px; font-size: 16px; border: 2px solid #e2e8f0;
                          border-radius: 8px; outline: none; cursor: pointer;">
            <label style="position: absolute; left: 16px; top: 0; transform: translateY(-50%%);
                         background: white; padding: 0 4px; color: #64748b; font-size: 14px;">
                End Date
            </label>
        </div>
    </div>'
);

-- Multi-step Form Progress
SELECT format(
    '<div style="margin-bottom: 40px;">
        <div style="display: flex; justify-content: space-between; position: relative;">
            <div style="position: absolute; top: 50%%; left: 0; right: 0; height: 2px; background: #e2e8f0; z-index: 0;"></div>
            %s
        </div>
    </div>',
    STRING_AGG(
        format(
            '<div style="position: relative; z-index: 1; display: flex; flex-direction: column; align-items: center; gap: 8px;">
                <div style="width: 40px; height: 40px; border-radius: 50%%; background: %s; color: white;
                           display: flex; align-items: center; justify-content: center; font-weight: 500;">
                    %s
                </div>
                <div style="font-size: 14px; color: %s; font-weight: 500;">%s</div>
            </div>',
            CASE 
                WHEN step_status = 'completed' THEN '#22c55e'
                WHEN step_status = 'current' THEN '#3b82f6'
                ELSE '#e2e8f0'
            END,
            step_number,
            CASE 
                WHEN step_status = 'completed' THEN '#166534'
                WHEN step_status = 'current' THEN '#1e40af'
                ELSE '#64748b'
            END,
            step_name
        ),
        ''
    )
);

-- =============================================
-- END OF CHEATSHEET
-- ============================================= 