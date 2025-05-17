-- Task 1: Subqueries for ALX Airbnb Database Project

-- 1. Non-correlated subquery to find all properties where the average rating is greater than 4.0
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    p.description,
    p.price_per_night,
    (SELECT AVG(r.rating) FROM reviews r WHERE r.property_id = p.id) AS average_rating
FROM 
    properties p
WHERE 
    (SELECT AVG(r.rating) FROM reviews r WHERE r.property_id = p.id) > 4.0
ORDER BY 
    average_rating DESC;

-- 2. Correlated subquery to find users who have made more than 3 bookings
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    (SELECT COUNT(*) FROM bookings b WHERE b.user_id = u.id) AS booking_count
FROM 
    users u
WHERE 
    (SELECT COUNT(*) FROM bookings b WHERE b.user_id = u.id) > 3
ORDER BY 
    booking_count DESC;