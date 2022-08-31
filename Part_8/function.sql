-- Создать функцию, которая по идентификатору группы ищет того, 
-- -- кто написал в группе больше всего постов. В результат нужно 
-- -- вывести идентификатор искомого пользователя.
DROP FUNCTION IF EXISTS posts_in_group_id;
CREATE FUNCTION posts_in_group_id(groups_id INTEGER) RETURNS INTEGER AS $$
SELECT creator_id
FROM posts
WHERE creator_id = groups_id
GROUP BY creator_id
ORDER BY COUNT(*) DESC
LIMIT 1;
$$ LANGUAGE sql;
SELECT posts_in_group_id(7);