-- Create the StudyLink Database
CREATE DATABASE IF NOT EXISTS StudyLink;
USE StudyLink;

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Courses Table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

-- Resources Table
CREATE TABLE Resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    user_id INT NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    description TEXT,
    upload_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Links Table
CREATE TABLE Links (
    link_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    user_id INT NOT NULL,
    url VARCHAR(255) NOT NULL,
    description TEXT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- StudyGroups Table
CREATE TABLE StudyGroups (
    group_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    admin_id INT NOT NULL,
    meeting_time DATETIME,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (admin_id) REFERENCES Users(user_id)
);

-- GroupMembers Junction Table (M:M Relationship)
CREATE TABLE GroupMembers (
    group_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES StudyGroups(group_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Deadlines Table
CREATE TABLE Deadlines (
    deadline_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    due_date DATETIME NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- ForumPosts Table
CREATE TABLE ForumPosts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    user_id INT NOT NULL,
    question TEXT NOT NULL,
    answer TEXT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);