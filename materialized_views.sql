-- Get amount of post and comment likes in each week
-- Materialized View: Hold table result for improve performance
CREATE MATERIALIZED VIEW weekly_likes AS (
	SELECT 
		date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week,
		COUNT(posts.id) AS num_likes_for_posts,
		COUNT(comments.id) AS num_likes_for_comments
	FROM likes
	LEFT JOIN posts ON posts.id = likes.post_id
	LEFT JOIN comments ON comments.id = likes.comment_id
	GROUP BY week
	ORDER BY week
) WITH DATA;

SELECT * FROM weekly_likes;

-- UPDATE that hold by materialized view
REFRESH MATERIALIZED VIEW weekly_likes;

-- Materialized View if we delete specific table it still get the stale data
DELETE FROM posts
WHERE created_at < '2010-02-01'
