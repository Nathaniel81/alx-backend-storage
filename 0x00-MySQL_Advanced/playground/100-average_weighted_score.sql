DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score FLOAT;
    DECLARE total_weight INT;
    DECLARE weighted_avg FLOAT;
    
    -- SELECT SUM(c.score * p.weight), SUM(p.weight) 
	-- INTO total_weight, total_score
    -- FROM corrections c
    -- INNER JOIN projects p ON c.project_id = p.id
    -- WHERE c.user_id = user_id;
	SELECT SUM(corrections.score * projects.weight)
        INTO total_score
        FROM corrections
            INNER JOIN projects
                ON corrections.project_id = projects.id
        WHERE corrections.user_id = user_id;

    SELECT SUM(projects.weight)
        INTO total_weight
        FROM corrections
            INNER JOIN projects
                ON corrections.project_id = projects.id
        WHERE corrections.user_id = user_id;
    
    IF total_weight > 0 THEN
        SET weighted_avg = total_score / total_weight;
    ELSE
        SET weighted_avg = 0;
    END IF;
    
    UPDATE users SET average_score = weighted_avg WHERE id = user_id;
END //
DELIMITER ;
