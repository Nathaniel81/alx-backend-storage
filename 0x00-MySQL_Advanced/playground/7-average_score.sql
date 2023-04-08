DELIMITER //
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    -- Declare variables to hold the sum of scores and count of corrections
    DECLARE sum_scores INT DEFAULT 0;
    DECLARE count_corrections INT DEFAULT 0;
    DECLARE average_score DECIMAL(5, 2);

    -- Calculate the sum of scores for the given user_id
    SELECT SUM(score) INTO sum_scores FROM corrections WHERE user_id = user_id;
    
    -- Calculate the count of corrections for the given user_id
    SELECT COUNT(*) INTO count_corrections FROM corrections WHERE user_id = user_id;
    
    -- Calculate the average score, handling division by zero
    IF count_corrections > 0 THEN
        SET average_score = sum_scores / count_corrections;
    ELSE
        SET average_score = 0;
    END IF;
    
    -- Update the average_score column in the users table for the given user_id
    UPDATE users SET average_score = average_score WHERE id = user_id;
END //

DELIMITER ;
