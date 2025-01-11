-- 1). View for 2 separate tags
CREATE VIEW tags AS (
	SELECT id, created_at, user_id, post_id, 'photo_tag' AS type FROM photo_tags
	UNION ALL
	SELECT id, created_at, user_id, post_id, 'caption_tag' AS type FROM caption_tags
);

SELECT username, COUNT(*)
FROM users
JOIN tags AS tags ON tags.user_id = users.id
GROUP BY username
ORDER BY COUNT(*) DESC;

-- 2). View for 10 recent posts
CREATE VIEW recent_posts AS (
	SELECT *
	FROM posts
	ORDER BY created_at DESC
	LIMIT 10
);

SELECT * FROM recent_posts;

-- 3). Update requirement of the view
CREATE OR REPLACE VIEW recent_posts AS (
	SELECT *
	FROM posts
	ORDER BY created_at DESC
	LIMIT 15
);

-- 4). Delete view
DROP VIEW recent_posts;










