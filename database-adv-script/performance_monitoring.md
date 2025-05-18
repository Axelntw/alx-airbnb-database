# Table Partitioning Performance Analysis

This document analyzes the performance improvements achieved by implementing table partitioning on the Airbnb Booking table.

## Partitioning Strategy

The Booking table was partitioned using RANGE partitioning based on the `check_in_date` column. This approach was chosen because:

1. Booking queries are frequently filtered by date ranges
2. Data naturally segments by time periods (quarters, months)
3. Older booking data is accessed less frequently than recent or future bookings

The partitioning scheme divides the data into the following partitions:
- Past bookings (before 2023)
- Q1 2023 (Jan-Mar)
- Q2 2023 (Apr-Jun)
- Q3 2023 (Jul-Sep)
- Q4 2023 (Oct-Dec)
- Future bookings (2024 and beyond)

## Performance Measurements

### Query 1: Retrieving Bookings for Q1 2023

**Before Partitioning:**