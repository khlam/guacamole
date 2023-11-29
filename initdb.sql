-- Guacamole Database Initialization Script

-- Create the guacamole schema
CREATE DATABASE IF NOT EXISTS guacamole_db;

-- Use the guacamole schema
USE guacamole_db;

-- Create the guacamole_user table
CREATE TABLE guacamole_user (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(128) NOT NULL,
    password VARCHAR(128) NOT NULL,
    enabled TINYINT(1) NOT NULL,
    UNIQUE(username)
);

-- Create the guacamole_connection table
CREATE TABLE guacamole_connection (
    connection_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    connection_name VARCHAR(128) NOT NULL,
    protocol_name VARCHAR(128) NOT NULL,
    UNIQUE(connection_name)
);

-- Create the guacamole_connection_parameter table
CREATE TABLE guacamole_connection_parameter (
    connection_id INT NOT NULL,
    parameter_name VARCHAR(128) NOT NULL,
    parameter_value TEXT,
    FOREIGN KEY (connection_id) REFERENCES guacamole_connection(connection_id) ON DELETE CASCADE
);

-- Create the guacamole_user_permission table
CREATE TABLE guacamole_user_permission (
    user_id INT NOT NULL,
    connection_id INT NOT NULL,
    permission INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES guacamole_user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (connection_id) REFERENCES guacamole_connection(connection_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, connection_id)
);
