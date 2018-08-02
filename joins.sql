-- 1)
-- SELECT * FROM users;

-- 2)
-- SELECT *
-- FROM posts
-- WHERE author_id=100;

-- 3)
-- SELECT posts.*, users.first_name, users.last_name
-- FROM posts
-- INNER JOIN users on posts.author_id = users.id
-- WHERE users.id=200;

-- 4)
-- SELECT posts.*, users.username
-- FROM posts
-- INNER JOIN users on posts.author_id = users.id
-- WHERE users.first_name='Norene' AND users.last_name='Schmitt';

-- 5)
-- SELECT users.username, posts.created_at  
-- FROM posts
-- INNER JOIN users on posts.author_id = users.id
-- WHERE posts.created_at >= to_timestamp('2015-01-25', 'yyyy-mm-dd');