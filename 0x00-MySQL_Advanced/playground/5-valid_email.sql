DELIMITER //
IF EXISTS (
    SELECT * FROM information_schema.triggers 
    WHERE trigger_name = 'trig_users_email_update' 
    AND trigger_schema = 'holberton'
) THEN
    DROP TRIGGER IF EXISTS trig_users_email_update;
END IF;

CREATE TRIGGER trig_users_email_update
BEFORE UPDATE ON users FOR EACH ROW
BEGIN
    IF NEW.email <> OLD.email THEN
        SET NEW.valid_email = 0;
    END IF;
END;
//
DELIMITER ;
