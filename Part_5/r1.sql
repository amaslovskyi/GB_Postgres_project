-- -- Найти, кому принадлежат 10 самых больших документов. В отчёт вывести идентификатор документа, 
-- имя владельца, фамилию владельца, URL пользователя, URL документа, размер.
CREATE TEMPORARY TABLE top_docs (
    id INT,
    url VARCHAR(250),
    size INT,
    owner_id INT
);
INSERT INTO top_docs
SELECT id,
    url,
    size,
    owner_id
FROM docs
ORDER BY size DESC
LIMIT 10;
SELECT top_docs,
    first_name,
    last_name,
    profile_url AS user_url,
    top_docs.url AS docs_url,
    top_docs.size
FROM users
    LEFT JOIN top_docs ON top_docs.owner_id = users.id;