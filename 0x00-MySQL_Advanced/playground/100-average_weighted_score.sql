DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score FLOAT;
    DECLARE total_weight INT;
    DECLARE weighted_avg FLOAT;
    
    SELECT SUM(c.score * p.weight) INTO total_score, SUM(p.weight) INTO total_weight
    FROM corrections c
    INNER JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;
    
    IF total_weight > 0 THEN
        SET weighted_avg = total_score / total_weight;
    ELSE
        SET weighted_avg = 0;
    END IF;
    
    UPDATE users SET average_score = weighted_avg WHERE id = user_id;
END //
DELIMITER ;
