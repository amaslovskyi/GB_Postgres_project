SELECT DISTINCT first_name,
    last_name,
    MAX(size) OVER (PARTITION BY owner_id) AS max_size
FROM users
    JOIN docs ON users.id = docs.owner_id;
--