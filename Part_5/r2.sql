-- Вывести для каждого пользователя первое сообщение которое он создал за последний месяц
-- и первое сообщение которое он получил за месяц. В отчет имя пользователя, id сообщения и само сообщение.
-- Вывести для каждого пользователя первый и последний пост в группах которых он состоит,
-- id поста, заголовок.
SELECT users.id,
    first_post_id,
    last_post_id
FROM users
    LEFT JOIN (
        SELECT users.id AS user_id,
            MIN(posts.id) AS first_post_id
        FROM users
            LEFT JOIN posts ON users.id = posts.creator_id
        WHERE posts.created_at > NOW() - interval '1 month'
        GROUP BY users.id
    ) AS posts1_created_by ON users.id = posts1_created_by.user_id
    LEFT JOIN (
        SELECT users.id AS user_id,
            MAX(posts.id) AS last_post_id
        FROM users
            LEFT JOIN posts ON users.id = posts.creator_id
        WHERE posts.created_at > NOW() - interval '1 month'
        GROUP BY users.id
    ) AS posts_last_created_by ON users.id = posts_last_created_by.user_id;