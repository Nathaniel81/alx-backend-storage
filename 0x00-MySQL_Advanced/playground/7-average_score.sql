DELIMITER //
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
	DECLARE sum_scores INT;
	DECLARE count_corrections INT;
	DECLARE average_score FLOAT;

	SELECT SUM(score) INTO sum_scores FROM corrections WHERE user_id = user_id;
	SELECT COUNT(*) INTO count_corrections FROM corrections WHERE user_id = user_id;

	SET average_score = sum_scores / count_corrections;
	UPDATE users SET average_score = average_score WHERE id = user_id;
END //
DELIMITER ;
