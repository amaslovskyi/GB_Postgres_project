CREATE TEMPORARY TABLE top_docs (Id INT, size INT, owner_id INT);
INSERT INTO top_docs
SELECT id,
    size,
    owner_id
FROM docs
WHERE size > (
        SELECT AVG(size)
        FROM docs
    );
SELECT top_docs.id AS docs_id,
    top_docs.size,
    first_name AS owner_first_name,
    last_name AS owner_last_name
FROM users
    JOIN top_docs ON top_docs.owner_id = users.id
ORDER BY first_name;