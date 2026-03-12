-- Prevent adding expired food to inventory

DELIMITER $$
CREATE TRIGGER prevent_expired_food
BEFORE INSERT ON Inventory_Items
FOR EACH ROW
BEGIN
IF NEW.expiry_date < CURDATE() THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Expired food cannot be added';
END IF;
END$$
DELIMITER;

-- Prevent beneficiary from receiving another box within 15 days

DELIMITER $$
CREATE TRIGGER prevent_early_distribution
BEFORE UPDATE ON Beneficiary_Details
FOR EACH ROW
BEGIN
IF NEW.last_received_date < OLD.last_received_date + INTERVAL 15 DAY THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Beneficiary cannot receive another box before 15 days';
END IF;
END$$
DELIMITER;

-- Ensure driver has completed Safety First training

DELIMITER $$
CREATE TRIGGER check_driver_training
BEFORE INSERT ON Driver_Training
FOR EACH ROW
BEGIN
IF NOT EXISTS (
SELECT *
FROM Training_Sessions
WHERE session_id = NEW.session_id
AND session_name = 'Safety First'
) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Driver must complete Safety First training';
END IF;
END$$
DELIMITER;