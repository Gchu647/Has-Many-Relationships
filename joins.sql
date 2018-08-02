-- 1)
SELECT * FROM users;

-- 2)
SELECT *
FROM posts
WHERE author_id=100;

-- 3)
SELECT posts.*, users.first_name, users.last_name
FROM posts
INNER JOIN users ON posts.author_id = users.id
WHERE users.id=200;

-- 4)
SELECT posts.*, users.username
FROM posts
INNER JOIN users ON posts.author_id = users.id
WHERE users.first_name='Norene' AND users.last_name='Schmitt';

-- 5)
SELECT users.username, posts.created_at  
FROM posts
INNER JOIN users ON posts.author_id = users.id
WHERE posts.created_at > timestamp '2015-01-25';

-- 6)
SELECT users.created_at, posts.title, posts.content, users.username
FROM users
INNER JOIN posts ON users.id = posts.author_id
WHERE users.created_at < timestamp '2015-01-01';

-- 7)
SELECT posts.title AS "Post Title", comments.*
FROM comments
INNER JOIN posts ON posts.id = comments.post_id;

-- 8)
SELECT posts.created_at, posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
INNER JOIN posts ON posts.id = comments.post_id
WHERE posts.created_at < timestamp '2015-01-01';

-- 9)
SELECT posts.created_at, posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
INNER JOIN posts ON posts.id = comments.post_id
WHERE posts.created_at > timestamp '2015-01-01';

-- 10)
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
INNER JOIN posts ON posts.id = comments.post_id
WHERE comments.body LIKE '%USB%' ;

-- 11)
SELECT posts.title AS post_title, users.first_name, users.last_name, comments.body AS comment_body
FROM posts
INNER JOIN users ON users.id = posts.author_id
INNER JOIN comments ON comments.post_id = posts.id
WHERE comments.body LIKE '%matrix%';

-- 12)
SELECT users.first_name, users.last_name, comments.body AS comment_body, posts.content
FROM comments
INNER JOIN users ON users.id = comments.commenter_id
INNER JOIN posts on posts.id = comments.post_id
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

-- 13)
SELECT 
  users.first_name AS post_author_first_name, 
  users.last_name AS post_author_last_name, 
  posts.title AS post_title,
  users.username AS comment_author_username,
  comments.body AS comment_body
FROM comments
  INNER JOIN users ON users.id = comments.commenter_id
  INNER JOIN posts ON posts.id = comments.post_id
WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%')  AND posts.content LIKE '%nemo%';