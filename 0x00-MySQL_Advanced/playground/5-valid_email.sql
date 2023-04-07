DELIMITER //
CREATE TRIGGER trig_users_email_update
BEFORE UPDATE ON users FOR EACH ROW
BEGIN
	IF NEW.email <> OLD.email
		SET NEW.valid_email = 0;
	END IF;
END;
//
DELIMITER;
