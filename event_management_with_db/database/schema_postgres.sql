
-- PostgreSQL Schema for Event Management Project
CREATE DATABASE event_management;

\c event_management

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    date DATE,
    location VARCHAR(200),
    organizer_id INT REFERENCES users(user_id)
);

CREATE TABLE registrations (
    registration_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    event_id INT REFERENCES events(event_id),
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
