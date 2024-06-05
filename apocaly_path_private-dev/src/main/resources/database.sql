
-- Users 테이블 삭제
DROP TABLE users CASCADE CONSTRAINTS;

-- Users 테이블 생성
CREATE TABLE users (
    id VARCHAR2(36 CHAR) NOT NULL,
    email VARCHAR2(255 CHAR) NOT NULL UNIQUE,
    password VARCHAR2(255 CHAR) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL,
    is_delete NUMBER(1) DEFAULT 0 NOT NULL,
    is_activated NUMBER(1) DEFAULT 0 NOT NULL,
    is_email_verified NUMBER(1) DEFAULT 0 NOT NULL,
    is_admin NUMBER(1) DEFAULT 0, 
    CONSTRAINT users_pk PRIMARY KEY (id)
);

-- 유니크 제약 조건 추가
ALTER TABLE users ADD CONSTRAINT users_email_unique UNIQUE (email);

-- Notice Board 테이블 삭제
DROP TABLE notice_board CASCADE CONSTRAINTS;

-- Create Notice Board table
CREATE TABLE notice_board (
    id VARCHAR2(36 CHAR) NOT NULL,
    title VARCHAR2(255 CHAR) NOT NULL,
    content CLOB NOT NULL,
    author_id VARCHAR2(36 CHAR) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    views NUMBER DEFAULT 0,
    status VARCHAR2(50 CHAR),
    comments_count NUMBER DEFAULT 0,
    like_count NUMBER DEFAULT 0,
    is_pinned NUMBER(1) DEFAULT 0,
    category VARCHAR2(50 CHAR),
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Refresh Tokens 테이블 삭제
DROP TABLE refresh_tokens CASCADE CONSTRAINTS;

-- Create Refresh Tokens table
CREATE TABLE refresh_tokens (
    id VARCHAR2(36 CHAR) NOT NULL,
    user_id VARCHAR2(36 CHAR) NOT NULL,
    token_value VARCHAR2(255 CHAR) NOT NULL,
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_in NUMBER NOT NULL,
    expiration_date TIMESTAMP NOT NULL,
    user_agent CLOB,
    status VARCHAR2(50 CHAR),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- User Notice Likes 테이블 삭제
DROP TABLE user_notice_likes CASCADE CONSTRAINTS;

-- Create User Notice Likes table
CREATE TABLE user_notice_likes (
    user_id VARCHAR2(36 CHAR),
    notice_id VARCHAR2(36 CHAR),
    liked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (notice_id) REFERENCES notice_board(id)
);

-- Alter Users table to add new columns
ALTER TABLE users
ADD login_type VARCHAR2(50 CHAR) DEFAULT 'local';

ALTER TABLE users
ADD sns_access_token VARCHAR2(255 CHAR) DEFAULT NULL;

-- Files 테이블 삭제
DROP TABLE files CASCADE CONSTRAINTS;
-- Create Files table
CREATE TABLE files (
    id VARCHAR2(36 CHAR) NOT NULL,
    original_filename VARCHAR2(255 CHAR) NOT NULL,
    file_type VARCHAR2(50 CHAR) NOT NULL,
    file_url VARCHAR2(255 CHAR) NOT NULL,
    file_index NUMBER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Notice Files 테이블 삭제
DROP TABLE notice_files CASCADE CONSTRAINTS;

-- Create Notice Files table
CREATE TABLE notice_files (
    id VARCHAR2(36 CHAR) NOT NULL,
    notice_id VARCHAR2(36 CHAR) NOT NULL,
    file_id VARCHAR2(36 CHAR) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (notice_id) REFERENCES notice_board(id) ON DELETE CASCADE,
    FOREIGN KEY (file_id) REFERENCES files(id) ON DELETE CASCADE
);
