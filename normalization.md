# Database Normalization - AirBnB Clone

## Goal: Achieve Third Normal Form (3NF)

### 1NF (First Normal Form)
- Each table has a primary key.
- All columns contain atomic values (e.g., no multiple phone numbers in a single field).

### 2NF (Second Normal Form)
- All non-key attributes are fully functionally dependent on the primary key.
- E.g., separating booking and payment information into distinct tables.

### 3NF (Third Normal Form)
- No transitive dependencies (non-key attribute depends on another non-key attribute).
- E.g., user information is not stored in the property or booking tables.

✅ The provided schema is normalized to 3NF.