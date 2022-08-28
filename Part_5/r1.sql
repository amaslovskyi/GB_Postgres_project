-- Создать два сложных (многотабличных) запроса с использованием подзапросов.
SELECT id,
    url,
    (
        SELECT first_name
        FROM users
        WHERE users.id = docs.owner_id
    ) AS first_name,
    (
        SELECT last_name
        FROM users
        WHERE users.id = docs.owner_id
    ) AS last_name,
    (
        SELECT (
                SELECT url
                FROM companies
                WHERE companies.id = users.profile_photo_id
            )
        FROM users
        WHERE users.id = docs.owner_id
    ) AS docs_url,
    size
FROM docs
ORDER BY size DESC
LIMIT 7;