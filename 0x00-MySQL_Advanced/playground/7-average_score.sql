DELIMITER //
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score DECIMAL(10, 2);
    DECLARE total_count INT;
    DECLARE avg_score DECIMAL(10, 2);
    
    -- Calculate total score and count for the given user
    SELECT SUM(score), COUNT(*) INTO total_score, total_count
    FROM corrections
    WHERE user_id = user_id;
    
    -- Calculate average score
    IF total_count > 0 THEN
        SET avg_score = total_score / total_count - 1;
    ELSE
        SET avg_score = 0;
    END IF;
    
    -- Update average score in users table
    UPDATE users SET average_score = avg_score WHERE id = user_id;
    
END //
DELIMITER ;
