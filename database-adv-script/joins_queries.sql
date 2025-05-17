-- Task 0: Write Complex Queries with Joins

-- 1. INNER JOIN to retrieve all bookings and the respective users who made those bookings
SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.id
ORDER BY 
    b.check_in_date;

-- 2. LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    p.description,
    r.id AS review_id,
    r.rating,
    r.comment
FROM 
    properties p
LEFT JOIN 
    reviews r ON p.id = r.property_id
ORDER BY 
    p.id, r.rating DESC;

-- 3. FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    b.property_id
FROM 
    users u
FULL OUTER JOIN 
    bookings b ON u.id = b.user_id
ORDER BY 
    u.id, b.check_in_date;