EXPLAIN ANALYZE
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
-------------------------------------------------------
"Planning Time: 0.428 ms" "Execution Time: 0.977 ms" -------------------------------------------------------
EXPLAIN ANALYZE
SELECT users.id,
    MIN(posts1_created_by.id) AS first_post_id,
    MAX(posts_last_created_by.id) AS last_post_id
FROM users
    LEFT JOIN posts AS posts1_created_by ON users.id = posts1_created_by.creator_id
    AND (
        posts1_created_by.created_at > NOW() - interval '1 month'
    )
    LEFT JOIN posts AS posts_last_created_by ON users.id = posts_last_created_by.creator_id
    AND (
        posts_last_created_by.created_at > NOW() - interval '1 month'
    )
GROUP BY users.id;
-------------------------------------------------------
"Planning Time: 0.241 ms" "Execution Time: 0.719 ms" -------------------------------------------------------
----------------------------------------------------------
CREATE INDEX posts_creator_id ON posts (creator_id);
"Planning Time: 0.272 ms" "Execution Time: 0.711 ms" ---------------------------------------------------------