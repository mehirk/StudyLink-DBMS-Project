USE StudyLink;

-- Add sample users
INSERT INTO Users (name, email, password) VALUES
('Mehir Kumar', 'mehirk28@gmail.com', SHA2('test', 256)),
('Mantaj Singh', 'mantajsingh@gmail.com', SHA2('qwerty', 256));

-- Add sample courses
INSERT INTO Courses (course_name) VALUES
('COMP 3753 - Database Systems'),
('MATH 1013 - Calculus 1');

-- Add sample resources
INSERT INTO Resources (course_id, user_id, file_path, description) VALUES
(1, 1, 'uploads/db_notes.pdf', 'Lecture 1: Introduction to SQL'),
(2, 2, 'uploads/calculus_cheatsheet.docx', 'Derivatives Rules');