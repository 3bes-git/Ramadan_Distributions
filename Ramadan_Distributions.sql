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


INSERT INTO Users (full_name, gender, age, phone, address, role)
VALUES
('Ahmed Abbas','Male',20,'01012345678','Bilbeis','Admin'),
('Ali Mahmoud','Male',35,'01055555555','Zagazig','Driver'),
('Sara Adel','Female',28,'01099999999','Zagazig','Volunteer'),
('Fatma Mohamed','Female',45,'01077777777','Minya Al-Qamh','Beneficiary');

INSERT INTO Warehouses (name, location, max_capacity, supervisor_id)
VALUES
('Zagazig Warehouse','Zagazig',5000,1),
('Bilbeis Warehouse','Bilbeis',8000,1);

INSERT INTO Food_Categories (category_name, required_storage_temperature)
VALUES
('Dry',25.00),
('Fresh',4.00),
('Cooked',5.00);

INSERT INTO Inventory_Items (item_name, quantity_kg, warehouse_id, category_id, expiry_date)
VALUES
('Rice',1000,1,1,'2026-04-10'),
('Potatoes',500,1,2,'2026-03-15'),
('Cooked Chicken',200,2,3,'2026-03-12');

INSERT INTO Donations_Log (donor_name, amount_value, donation_type, org_type, donation_date)
VALUES
('Ahmed Ali',5000,'Cash','Individual','2026-03-01'),
('Pepsi Company',20000,'Cash','Company','2026-03-05'),
('Red Crescent',10000,'Cash','NGO','2026-03-07');


INSERT INTO Beneficiary_Details (user_id, family_members_count, poverty_score, last_received_date)
VALUES
(4,5,9,'2026-02-20');


INSERT INTO Training_Sessions (session_name, trainer_name, session_date)
VALUES
('Safety First','Mohamed Ali','2026-02-10'),
('Emergency Driving','Ahmed Nabil','2026-02-15');


INSERT INTO Driver_Training (driver_id, session_id)
VALUES
(2,1),
(2,2);

SELECT * FROM Users;
SELECT * FROM warehouses;
SELECT * FROM Inventory_Items;
SELECT * FROM Food_Categories;
SELECT * FROM Donations_Log;
SELECT * FROM Beneficiary_Details;
SELECT * FROM Training_Sessions;
SELECT * FROM Driver_Training;
