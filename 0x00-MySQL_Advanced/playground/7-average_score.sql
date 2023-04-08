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
    
	UPDATE users
        SET users.average_score = IF(projects_count = 0, 0, total_score / projects_count)
        WHERE users.id = user_id;
    
    -- Update average score in users table
    -- UPDATE users SET average_score = avg_score WHERE id = user_id;
    
END //
DELIMITER ;
