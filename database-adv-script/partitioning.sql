-- Table Partitioning for Airbnb Booking Table
-- This script implements partitioning on the Booking table based on check_in_date

-- First, let's measure the performance before partitioning
EXPLAIN ANALYZE
SELECT * FROM bookings 
WHERE check_in_date BETWEEN '2023-01-01' AND '2023-03-31';

-- Create a new partitioned table structure
CREATE TABLE bookings_partitioned (
    id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, check_in_date)
) PARTITION BY RANGE (check_in_date);

-- Create partitions by quarter
CREATE PARTITION bookings_q1_2023 OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2023-04-01');

CREATE PARTITION bookings_q2_2023 OF bookings_partitioned
    FOR VALUES FROM ('2023-04-01') TO ('2023-07-01');

CREATE PARTITION bookings_q3_2023 OF bookings_partitioned
    FOR VALUES FROM ('2023-07-01') TO ('2023-10-01');

CREATE PARTITION bookings_q4_2023 OF bookings_partitioned
    FOR VALUES FROM ('2023-10-01') TO ('2024-01-01');

-- Create a partition for future bookings
CREATE PARTITION bookings_future OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO (MAXVALUE);

-- Create a partition for past bookings
CREATE PARTITION bookings_past OF bookings_partitioned
    FOR VALUES FROM (MINVALUE) TO ('2023-01-01');

-- Copy data from the original table to the partitioned table
INSERT INTO bookings_partitioned 
SELECT * FROM bookings;

-- Create indexes on the partitioned table
CREATE INDEX idx_bookings_part_user_id ON bookings_partitioned(user_id);
CREATE INDEX idx_bookings_part_property_id ON bookings_partitioned(property_id);

-- Measure performance after partitioning
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned 
WHERE check_in_date BETWEEN '2023-01-01' AND '2023-03-31';

-- Test query for specific partition (Q1 2023)
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned 
WHERE check_in_date BETWEEN '2023-01-01' AND '2023-03-31';

-- Test query spanning multiple partitions
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned 
WHERE check_in_date BETWEEN '2023-03-15' AND '2023-04-15';

-- Test query with additional filters
EXPLAIN ANALYZE
SELECT b.*, u.first_name, u.last_name, p.name AS property_name
FROM bookings_partitioned b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.check_in_date BETWEEN '2023-01-01' AND '2023-03-31'
AND b.status = 'confirmed';