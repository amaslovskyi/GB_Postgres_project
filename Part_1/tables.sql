-- Users Table
create table users (
    id SERIAL primary key,
    first_name VARCHAR(50) not null,
    last_name VARCHAR(50) not null,
    email VARCHAR(120) not null unique,
    job_position VARCHAR(150) not null,
    company VARCHAR(150) not null,
    location VARCHAR(150) not null,
    profile_photo_id INT,
    profile_url VARCHAR(250) not null unique,
    visibility BOOLEAN,
    created_at DATE not null
);
-- Experience Table
create table experiencies (
    id SERIAL primary key,
    skill VARCHAR(150) not null,
    body text,
    skill_level VARCHAR(150) not null
);
-- Education Table
create table educations (
    id SERIAL primary key,
    title VARCHAR(150) not null,
    kind VARCHAR(150) not null,
    degree VARCHAR(150) not null,
    started_at DATE not null,
    finished_at DATE not null
);
-- Docs Table
create table docs (
    id SERIAL primary key,
    name VARCHAR(50) not null,
    url VARCHAR(250) not null unique,
    owner_id INT not null,
    description VARCHAR(250) not null,
    uploaded_at DATE not null,
    size INT not null
);
-- Messages Table
create table messages (
    id SERIAL primary key,
    from_user_id INT not null,
    to_user_id INT not null,
    body text,
    is_read BOOLEAN,
    is_unread BOOLEAN,
    created_at DATE not null
);
-- Contacts Table
create table contacts (
    id SERIAL primary key,
    first_name VARCHAR(50) not null,
    last_name VARCHAR(50) not null,
    email VARCHAR(120) not null unique,
    created_at DATE not null
);
-- Connections Table
create table connections (
    id SERIAL primary key,
    requested_by_user_id INT not null,
    requested_to_user_id INT not null,
    status_id INT not null,
    requested_at DATE not null,
    confirmed_at DATE not null
);
-- Groups Table
create table groups (
    id SERIAL primary key,
    group_name VARCHAR(120) unique,
    creator_id INT not null,
    created_at DATE not null
);
-- Posts Table
create table posts (
    id SERIAL primary key,
    post_title VARCHAR(200) unique,
    body TEXT,
    creator_id INT not null,
    created_at DATE not null
);
-- Events Table
create table events (
    id SERIAL primary key,
    event_name VARCHAR(120) not null,
    creator_id INT not null,
    created_at DATE not null,
    started_at DATE not null
);
-- News Table
create table news (
    id SERIAL primary key,
    is_read BOOLEAN,
    is_unread BOOLEAN,
    from_user_id INT not null,
    from_groups_id INT not null
);
-- Companies Table
create table companies (
    id SERIAL primary key,
    name VARCHAR(120) not null,
    location VARCHAR(100) not null,
    employees INT not null,
    email VARCHAR(120) not null unique,
    company_url VARCHAR(1000) not null unique
);
-- Jobs from companies Table
create table jobs (
    id SERIAL primary key,
    job_name VARCHAR(120) not null,
    company_id VARCHAR(100) not null,
    location VARCHAR(100) not null,
    format VARCHAR(15) not null,
    skills_requirement VARCHAR(750) not null,
    salary VARCHAR(15) not null
);
-- Skills Learning
create table learnings (
    id SERIAL primary key,
    skill VARCHAR(120) not null,
    company_id VARCHAR(150) not null,
    location VARCHAR(150) not null,
    format VARCHAR(150) not null,
    kind VARCHAR(150),
    started_at DATE not null
);