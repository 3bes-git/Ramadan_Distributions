CREATE DATABASE Ramadan_Distributions;
USE Ramadan_Distributions;
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    gender VARCHAR(10),
    age INT,
    phone VARCHAR(20),
    address VARCHAR(500),
    role ENUM('Admin','Volunteer','Driver','Beneficiary') NOT NULL
);
CREATE TABLE Warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(500) NOT NULL,
    max_capacity INT,
    current_status ENUM('Open','Full','Maintenance') DEFAULT 'Open',
    supervisor_id INT,

    FOREIGN KEY (supervisor_id) REFERENCES Users(user_id)
);

CREATE TABLE Food_Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(150) NOT NULL,
    required_storage_temperature DECIMAL(5,2)
);

CREATE TABLE Inventory_Items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(150) NOT NULL,
    quantity_kg DECIMAL(10,2),
    warehouse_id INT NOT NULL,
    category_id INT NOT NULL,
    expiry_date DATE,
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id),
    FOREIGN KEY (category_id) REFERENCES Food_Categories(category_id)
);

CREATE TABLE Donations_Log (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_name VARCHAR(255),
    amount_value DECIMAL(12,2),
    donation_type ENUM('Cash','Food'),
    org_type ENUM('Individual','Company','NGO'),
    donation_date DATE 
);

CREATE TABLE Beneficiary_Details (
    beneficiary_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE,
    family_members_count INT,
    poverty_score INT CHECK (poverty_score BETWEEN 1 AND 10),
    last_received_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Volunteer_Skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    volunteer_id INT,
    skill_type ENUM('Cooking','Driving','Data Entry'),
    years_of_experience INT,
    FOREIGN KEY (volunteer_id) REFERENCES Users(user_id)
);

CREATE TABLE Training_Sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    session_name VARCHAR(255),
    trainer_name VARCHAR(255),
    session_date DATE
);
-- N:M Table
CREATE TABLE Driver_Training (
    driver_id INT,
    session_id INT,
    PRIMARY KEY (driver_id, session_id),
    FOREIGN KEY (driver_id) REFERENCES Users(user_id),
    FOREIGN KEY (session_id) REFERENCES Training_Sessions(session_id)
);


SELECT * FROM warehouses;
SELECT * FROM Users;