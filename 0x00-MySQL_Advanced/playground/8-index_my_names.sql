CREATE INDEX idx_name_first ON names(name(1));

-- CREATE INDEX idx_name_first ON names (LEFT(name, 1));

-- Verify the index has been created
-- SHOW INDEX FROM names;
