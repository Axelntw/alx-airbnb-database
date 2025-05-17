# ALX Airbnb Database Project

This project is part of the ALX Airbnb Database Module, focusing on implementing advanced SQL querying and optimization techniques for a simulated Airbnb database.

## Project Overview

The project aims to enhance skills in:
- Writing complex SQL queries
- Optimizing query performance
- Implementing indexing and partitioning
- Monitoring and refining database performance

## Tasks

### 0. Write Complex Queries with Joins

This task focuses on mastering SQL joins by writing complex queries using different types of joins:

1. **INNER JOIN**: Retrieves all bookings and the respective users who made those bookings
2. **LEFT JOIN**: Retrieves all properties and their reviews, including properties that have no reviews
3. **FULL OUTER JOIN**: Retrieves all users and all bookings, even if the user has no booking or a booking is not linked to a user

The implementation can be found in the `database-adv-script/joins_queries.sql` file.

### 1. Write Subqueries

This task focuses on implementing both correlated and non-correlated subqueries:

1. **Non-correlated subquery**: Find all properties where the average rating is greater than 4.0
2. **Correlated subquery**: Find users who have made more than 3 bookings

The implementation can be found in the `database-adv-script/subqueries.sql` file.

## Database Schema

The project works with a simulated Airbnb database that includes tables for:
- Users
- Properties
- Bookings
- Reviews
- Payments

## Learning Objectives

By the end of this project, you will:
- Master advanced SQL techniques
- Optimize query performance
- Implement indexing and partitioning
- Monitor and refine database performance
- Think like a Database Administrator (DBA)