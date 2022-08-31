-- Создать триггер для таблицы docs, который не разрешает внести в
-- столбец docs_id идентификатор фотографии, если данный пользователь не является ее владельцем. 
-- Проверяем работу триггера вставкой записей с корректными и некорректными значениями.
CREATE OR REPLACE FUNCTION update_users_docs_trigger() RETURNS TRIGGER AS $$
DECLARE is_owner_id INTEGER;
BEGIN is_owner_id := (
    SELECT owner_id
    FROM docs
    WHERE id = NEW.docs_id
);
IF NEW.user_id != is_owner_id THEN RAISE EXCEPTION 'There is no docs ID: % for user with ID: %',
NEW.user_id,
NEW.docs_id;
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
DROP TRIGGER IF EXISTS check_users_on_update ON users;
CREATE TRIGGER check_users_on_update BEFORE
UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_users_docs_trigger();
SELECT id
FROM docs
WHERE owner_id = 7;
UPDATE users
SET docs_id = 13
WHERE user_id = 7;
-- Get error
UPDATE users
SET docs_id = 8
WHERE user_id = 7;
-- OK