CREATE TABLE IF NOT EXISTS test (
    id BIGSERIAL PRIMARY KEY,
    name varchar(255) NOT NULL,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
