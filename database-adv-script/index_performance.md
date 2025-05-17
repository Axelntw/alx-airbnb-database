# Index Performance Analysis

This document analyzes the performance impact of adding indexes to the Airbnb database.

## Identified High-Usage Columns

Based on our query patterns, we identified the following columns as candidates for indexing:

1. **Users Table**:
   - `email` (for user lookups)

2. **Properties Table**:
   - `price_per_night` (for filtering and sorting)

3. **Bookings Table**:
   - `user_id` (for joins with users)
   - `property_id` (for joins with properties)
   - `check_in_date` and `check_out_date` (for date range queries)

4. **Reviews Table**:
   - `property_id` (for joins with properties)
   - `rating` (for filtering)

## Performance Measurement

### Query 1: Find all bookings for a specific user

**Before Indexing:**
```sql
EXPLAIN SELECT * FROM bookings WHERE user_id = 123;