EXPLAIN WITH tags AS (
	SELECT user_id, created_at
	FROM caption_tags
	UNION ALL
	SELECT user_id, created_at
	FROM photo_tags
)
SELECT username, tags.created_at
FROM users
JOIN tags on tags.user_id = users.id
WHERE tags.created_at < '2010-07-01';