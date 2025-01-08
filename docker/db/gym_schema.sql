CREATE DATABASE gym_crm;

USE gym_crm;

CREATE TABLE user_profile
(
    user_id    BIGINT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)  NOT NULL,
    last_name  VARCHAR(50)  NOT NULL,
    username   VARCHAR(100) NOT NULL UNIQUE,
    password   VARCHAR(100) NOT NULL,
    is_active  BOOLEAN      NOT NULL
);

CREATE TABLE authority
(
    authority_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id      BIGINT      NOT NULL,
    authority    VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_profile (user_id)
);

CREATE TABLE failed_login_attempt
(
    username        varchar(100) PRIMARY KEY,
    failed_attempts INT NOT NULL,
    is_locked       BOOLEAN   DEFAULT FALSE,
    locked_until    TIMESTAMP DEFAULT NULL
);

CREATE TABLE blacklisted_token
(
    jti            varchar(36) PRIMARY KEY,
    blacklist_time TIMESTAMP NOT NULL
);

CREATE TABLE training_type
(
    training_type_id   BIGINT PRIMARY KEY AUTO_INCREMENT,
    training_type_name VARCHAR(50) NOT NULL
);

CREATE TABLE trainee
(
    trainee_id    BIGINT PRIMARY KEY AUTO_INCREMENT,
    date_of_birth DATE,
    address       VARCHAR(50),
    user_id       BIGINT,
    FOREIGN KEY (user_id) REFERENCES user_profile (user_id)
);

CREATE TABLE trainer
(
    trainer_id     BIGINT PRIMARY KEY AUTO_INCREMENT,
    specialization BIGINT,
    user_id        BIGINT,
    FOREIGN KEY (specialization) REFERENCES training_type (training_type_id),
    FOREIGN KEY (user_id) REFERENCES user_profile (user_id)
);

CREATE TABLE training
(
    training_id       BIGINT PRIMARY KEY AUTO_INCREMENT,
    trainee_id        BIGINT,
    trainer_id        BIGINT,
    training_name     VARCHAR(50) NOT NULL,
    training_type_id  BIGINT,
    training_date     DATE        NOT NULL,
    training_duration BIGINT      NOT NULL,
    FOREIGN KEY (trainee_id) REFERENCES trainee (trainee_id),
    FOREIGN KEY (trainer_id) REFERENCES trainer (trainer_id),
    FOREIGN KEY (training_type_id) REFERENCES training_type (training_type_id)
);

CREATE TABLE trainee_trainer
(
    trainee_id BIGINT NOT NULL,
    trainer_id BIGINT NOT NULL,
    PRIMARY KEY (trainee_id, trainer_id),
    FOREIGN KEY (trainee_id) REFERENCES trainee (trainee_id),
    FOREIGN KEY (trainer_id) REFERENCES trainer (trainer_id)
);

INSERT INTO training_type(training_type_id, training_type_name)
values (1, 'Cardio'),
       (2, 'Strength'),
       (3, 'Yoga'),
       (4, 'Pilates'),
       (5, 'HIIT')