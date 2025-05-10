INSERT INTO User (user_id, first_name, last_name, email, password_hash, role) VALUES
(UUID(), 'Alice', 'Smith', 'alice@example.com', 'hash1', 'guest'),
(UUID(), 'Bob', 'Johnson', 'bob@example.com', 'hash2', 'host');

INSERT INTO Property (property_id, host_id, name, description, location, pricepernight) VALUES
(UUID(), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Cozy Apartment', 'A nice place in the city.', 'New York', 120.00);

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
(UUID(), (SELECT property_id FROM Property LIMIT 1), (SELECT user_id FROM User WHERE email = 'alice@example.com'), '2024-07-01', '2024-07-03', 240.00, 'confirmed');

INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
(UUID(), (SELECT booking_id FROM Booking LIMIT 1), 240.00, 'credit_card');

INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
(UUID(), (SELECT property_id FROM Property LIMIT 1), (SELECT user_id FROM User WHERE email = 'alice@example.com'), 5, 'Amazing stay!');

INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
(UUID(), (SELECT user_id FROM User WHERE email = 'alice@example.com'), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Hi Bob, is the apartment available in August?');