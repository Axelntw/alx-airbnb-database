# Query Optimization Report for Airbnb Database

This document analyzes the performance of a complex query that retrieves booking information along with related user, property, and payment details. The analysis includes identifying inefficiencies and implementing optimizations to improve query performance.

## Initial Query

The initial query joins multiple tables to retrieve comprehensive booking information:

```sql
SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    b.total_price,
    b.status,
    
    u.id AS user_id,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    
    p.id AS property_id,
    p.name AS property_name,
    p.description AS property_description,
    p.location AS property_location,
    p.price_per_night,
    
    h.id AS host_id,
    h.first_name AS host_first_name,
    h.last_name AS host_last_name,
    h.email AS host_email,
    
    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    users h ON p.host_id = h.id
JOIN 
    payments pay ON pay.booking_id = b.id
ORDER BY 
    b.check_in_date DESC;