-- Task 2: Aggregations and Window Functions for ALX Airbnb Database Project

-- 1. Find the total number of bookings made by each user using COUNT function and GROUP BY clause
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.id = b.user_id
GROUP BY 
    u.id, u.first_name, u.last_name, u.email
ORDER BY 
    total_bookings DESC;

-- 2. Rank properties based on the total number of bookings they have received using window functions
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    p.price_per_night,
    COUNT(b.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank_with_ties
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.id = b.property_id
GROUP BY 
    p.id, p.name, p.price_per_night
ORDER BY 
    total_bookings DESC;