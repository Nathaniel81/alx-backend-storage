DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
  DECLARE total_score FLOAT DEFAULT 0;
  DECLARE num_scores INT DEFAULT 0;
  DECLARE avg_score FLOAT DEFAULT 0;

  -- Calculate the total score and number of scores for the given user
  SELECT SUM(score), COUNT(*) INTO total_score, num_scores
  FROM corrections
  WHERE user_id = user_id;

  -- Calculate the average score, handling division by zero case
  IF num_scores > 0 THEN
    SET avg_score = total_score / num_scores;
  END IF;

  -- Update the average_score field in the users table for the given user
  UPDATE users
  SET average_score = avg_score
  WHERE id = user_id;
END;
//

DELIMITER ;
