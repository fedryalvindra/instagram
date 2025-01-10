-- val stands for value (properties)
-- we can forexample insert (val, created_at, count)
WITH RECURSIVE countdown(val) AS (
	SELECT 3 AS val -- Initial, Non-recursive query
	UNION
	SELECT val - 1 FROM countdown WHERE val > 1 -- Recursive query
)
SELECT *
FROM countdown;