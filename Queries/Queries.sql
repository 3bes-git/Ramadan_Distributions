-- Query 1
-- Fresh food items expiring within 48 hours in Zagazig Warehouse
SELECT i.item_name, i.expiry_date
FROM Inventory_Items i
JOIN Food_Categories c 
ON i.category_id = c.category_id
JOIN Warehouses w 
ON i.warehouse_id = w.warehouse_id
WHERE c.category_name = 'Fresh'
AND w.name = 'Zagazig Warehouse'
AND i.expiry_date <= NOW() + INTERVAL 2 DAY;

-- Query 2
-- Drivers who did NOT complete Safety First training
SELECT u.full_name
FROM Users u
WHERE u.role = 'Driver'
AND u.user_id NOT IN (
    SELECT dt.driver_id
    FROM Driver_Training dt
    JOIN Training_Sessions ts
    ON dt.session_id = ts.session_id
    WHERE ts.session_name = 'Safety First'
);
-- Query 3
-- Families in Minya Al-Qamh with poverty_score > 8 and did not receive a box in last 15 days
SELECT u.full_name
FROM Users u
JOIN Beneficiary_Details b
ON u.user_id = b.user_id
WHERE u.address = 'Minya Al-Qamh'
AND b.poverty_score > 8
AND (
    b.last_received_date IS NULL
    OR b.last_received_date < NOW() - INTERVAL 15 DAY
);

-- Query 4
-- Total cash donations grouped by organization type
SELECT org_type, SUM(amount_value) AS total_cash
FROM Donations_Log
WHERE donation_type = 'Cash'
GROUP BY org_type;