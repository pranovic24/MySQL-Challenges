-- Challenges

-- 1. Finding 5 Oldest Users
SELECT * 
FROM users
ORDER BY created_at LIMIT 5;

-- 2. Most Popular Registration Date
SELECT
	# username,
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;

-- 3. Identify Inactive Users (users with no photos)
SELECT
    username
    # image_url
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
# WHERE image_url IS NULL;
WHERE photos.id IS NULL;

-- 4. Identify most popular photo (and user who created it)
SELECT
	users.username,
    photos.id,
    photos.image_url,
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON photos.id = likes.photo_id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- 5. Calculate Avg number of photos per user
-- total number of photos / total number of users
SELECT
	(SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS AVG;
    
-- 6. Five Most popular hashtags
SELECT
	tags.tag_name,
    COUNT(*) AS total
FROM tags
INNER JOIN photo_tags
	ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- 7. Finding Bots - users who have liked every single photo_tags
SELECT
	username,
    COUNT(*) AS num_likes
FROM users
INNER JOIN likes
	ON users.id = likes.user_id
GROUP BY users.id
HAVING num_likes = (SELECT COUNT(*) FROM photos);