-- Users
ALTER TABLE users
ADD CONSTRAINT users_id_fk FOREIGN KEY (id) REFERENCES companies (id);
-- Experience
ALTER TABLE experiencies
ADD CONSTRAINT experiencies_id_fk FOREIGN KEY (id) REFERENCES users (id);
-- Education
ALTER TABLE educations
ADD CONSTRAINT educations_id_fk FOREIGN KEY (id) REFERENCES experiencies (id);
-- Docs
ALTER TABLE docs
ADD CONSTRAINT docs_owner_id_fk FOREIGN KEY (owner_id) REFERENCES users (id) ON DELETE CASCADE;
-- Messages
ALTER TABLE messages
ADD CONSTRAINT messages_from_user_id_fk FOREIGN KEY (from_user_id) REFERENCES users (id) ON DELETE CASCADE;
-- Messages
ALTER TABLE messages
ADD CONSTRAINT messages_to_user_id_fk FOREIGN KEY (to_user_id) REFERENCES users (id) ON DELETE CASCADE;
-- Contacts
ALTER TABLE contacts
ADD CONSTRAINT contacts_id_fk FOREIGN KEY (id) REFERENCES users (id);
-- Connections
ALTER TABLE connections
ADD CONSTRAINT connections_requested_by_user_id FOREIGN KEY (requested_by_user_id) REFERENCES users (id);
-- Connections
ALTER TABLE connections
ADD CONSTRAINT connections_requested_to_user_id FOREIGN KEY (requested_to_user_id) REFERENCES users (id);
-- Groups
ALTER TABLE groups
ADD CONSTRAINT groups_creator_id FOREIGN KEY (creator_id) REFERENCES users (id);
-- Posts
ALTER TABLE posts
ADD CONSTRAINT posts_creator_id FOREIGN KEY (creator_id) REFERENCES users (id) ON DELETE CASCADE;
-- Posts
ALTER TABLE posts
ADD CONSTRAINT posts_id FOREIGN KEY (id) REFERENCES groups (id);
-- Events
ALTER TABLE events
ADD CONSTRAINT events_id FOREIGN KEY (id) REFERENCES groups (id);
-- News
ALTER TABLE news
ADD CONSTRAINT news_from_user_id FOREIGN KEY (from_user_id) REFERENCES users (id);
-- News
ALTER TABLE news
ADD CONSTRAINT news_from_groups_id FOREIGN KEY (from_groups_id) REFERENCES users (id);
-- Companies
ALTER TABLE companies
ADD CONSTRAINT companies_id FOREIGN KEY (id) REFERENCES jobs (id);
-- Jobs
ALTER TABLE jobs
ADD CONSTRAINT jobs_id FOREIGN KEY (id) REFERENCES users (id);
-- Skills Learning
ALTER TABLE learnings
ADD CONSTRAINT learnings_id FOREIGN KEY (id) REFERENCES companies (id);