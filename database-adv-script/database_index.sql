-- Creating indexes for high-usage columns in the Airbnb database

-- Users Table Indexes
CREATE INDEX idx_users_email ON users(email);
-- Note: Primary key (id) is already indexed by default

-- Properties Table Indexes
CREATE INDEX idx_properties_price ON properties(price_per_night);
-- Note: Primary key (id) is already indexed by default

-- Bookings Table Indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_dates ON bookings(check_in_date, check_out_date);

-- Reviews Table Indexes
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_rating ON reviews(rating);