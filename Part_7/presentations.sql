-- Show users with empty posts
CREATE VIEW users_with_no_posts
SELECT users.id,
    users.first_name,
    users.last_name
FROM users
    LEFT JOIN posts ON users.id = posts.creator_id
WHERE posts.id IS NULL;
-- Show events for last month
CREATE VIEW users_with_no_posts
SELECT group_name,
    groups.id
FROM groups
    LEFT JOIN events ON groups.id = events.creator_id
WHERE events.created_at > NOW() - interval '1 month'
GROUP BY groups.id;