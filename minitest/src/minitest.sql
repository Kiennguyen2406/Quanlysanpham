CREATE DATABASE StudentManagement;

USE StudentManagement;

CREATE TABLE Address(
                        Address_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        address VARCHAR(255)
);
DROP TABLE Address;

CREATE TABLE Class(
                      Class_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(255),
                      language VARCHAR(255),
                      description VARCHAR(255)
);
DROP TABLE Class;

CREATE TABLE Student (
                         Student_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         fullname VARCHAR(255),
                         address_id INT,
                         FOREIGN KEY (address_id) REFERENCES Address(Address_id),
                         age int,
                         phone VARCHAR(255) unique,
                         classes_id int,
                         FOREIGN KEY (classes_id) REFERENCES Class(Class_id)
);
DROP TABLE Student;

CREATE TABLE  Course (
                         Course_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(200),
                         description VARCHAR (200)
);
DROP TABLE Course;
CREATE TABLE  Points (
                         Points_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         course_id int,
                         FOREIGN KEY (course_id) REFERENCES Course(Course_id),
                         student_id int,
                         FOREIGN KEY (student_id) REFERENCES Student(Student_id),
                         points int
);
DROP TABLE Points;

INSERT INTO Address (address) VALUES
                                  ('Hà Đông'),
                                  ('Thanh Xuân'),
                                  ('Cầu Giấy'),
                                  ('Long Biên'),
                                  ('Gia Lâm');

SELECT * FROM Address ;

DELETE FROM Address WHERE id is null;

DELETE FROM Address ;

SET SQL_SAFE_UPDATES=0;

INSERT INTO Class (name, language, description) VALUES
                                                    ('C04','Java','Lop Vip'),
                                                    ('C05','Js','lop thuong'),
                                                    ('C06','C#','lop chon'),
                                                    ('C07','java','lop vip'),
                                                    ('C08','java','lop vip');

DELETE FROM Class;
SELECT * FROM Class;

INSERT INTO Course (name, description) VALUES
                                           ('Khoa học Fulltime Java', 'Sieuvip'),
                                           ('Khoa học Fulltime Python', 'Basic to Advanced'),
                                           ('Khoa học Fulltime C++', 'Comprehensive Course'),
                                           ('Khoa học Fulltime JavaScript', 'Complete Guide'),
                                           ('Khoa học Fulltime Data Science', 'Machine Learning and AI'),
                                           ('Khoa học Fulltime Web Development', 'HTML, CSS, JS'),
                                           ('Khoa học Fulltime Android', 'App Development'),
                                           ('Khoa học Fulltime iOS', 'Swift and Xcode'),
                                           ('Khoa học Fulltime SQL', 'Database Management'),
                                           ('Khoa học Fulltime DevOps', 'CI/CD Pipelines'),
                                           ('Khoa học Fulltime Cloud Computing', 'AWS, Azure, GCP'),
                                           ('Khoa học Fulltime Cyber Security', 'Ethical Hacking'),
                                           ('Khoa học Fulltime Blockchain', 'Decentralized Applications'),
                                           ('Khoa học Fulltime AI', 'Deep Learning'),
                                           ('Khoa học Fulltime Big Data', 'Hadoop and Spark');

DELETE FROM Course;
SELECT * FROM Course;

INSERT INTO Student (fullname, address_id, age, phone, classes_id) VALUES
                                                                       ('Em Tráng', 1, 25, '01345069435', 1),
                                                                       ('Nguyen Kiên', 2, 26, '06656655', 2),
                                                                       ('Em Mạnh', 3, 24, '0123456789', 3),
                                                                       ('Em Khôi', 4, 23, '0987654321', 4),
                                                                       ('Em Hòa', 5, 22, '0912345678', 5),
                                                                       ('Em Tâm', 1, 27, '0923456789', 1),
                                                                       ('Em Ngân', 2, 21, '0934567890', 2),
                                                                       ('Em Anh', 3, 20, '0945678901', 3),
                                                                       ('Em Thanh', 4, 28, '0956789012', 4),
                                                                       ('Em Phúc', 5, 29, '0967890123', 5);

DELETE FROM Student;
SELECT*FROM Student;

INSERT INTO Points (course_id, student_id, points) VALUES
                                                       (1, 1, 90),
                                                       (1, 2, 85),
                                                       (1, 3, 88),
                                                       (2, 1, 92),
                                                       (2, 2, 80),
                                                       (2, 3, 87),
                                                       (3, 1, 95),
                                                       (3, 2, 89),
                                                       (3, 3, 91),
                                                       (4, 1, 78),
                                                       (4, 2, 83),
                                                       (4, 3, 79),
                                                       (5, 1, 85),
                                                       (5, 2, 88),
                                                       (5, 3, 90);

DELETE FROM Points;

SELECT
    *
FROM
    Points;


SET FOREIGN_KEY_CHECKS=1;

SELECT * FROM Student WHERE fullname LIKE 'Nguyen%';

SELECT * FROM student;
SELECT * FROM student where fullname like '%Anh';

SELECT * FROM student WHERE age BETWEEN 18 and 25;

SELECT * FROM student WHERE id = 21 OR id = 25 ;

UPDATE student set age = 25 WHERE id = 42 ;

DELETE FROM student WHERE id =43;

SELECT
    COUNT(student.student_id) AS number_Student,
    Class.name AS NAMEClass
FROM
    student
        INNER JOIN
    Class
    ON
        student.classes_id = Class.Class_id
GROUP BY NAMEClass;

SELECT
    COUNT(student.student_id) AS Number_Student,
    address.address AS address
FROM
    student
        RIGHT JOIN
    address
    ON
        student.address_id = address.address_id
GROUP BY address;

-- Tính điểm trung bình của các khóa học

SELECT
    AVG(points.points) as pointsAVG,
    course.name as Namecourse
FROM
    points
        INNER JOIN
    course
    ON
        points.points_id = course.course_id
GROUP BY Namecourse;

-- Lấy ra điểm cao nhất, thấp nhất.

SELECT
    MAX(points.points) AS pointsMAX,
    MIN(points.points) AS pointsMIN,
    course.name AS Namecourse,
    student.fullname AS namefull
FROM
    points
        INNER JOIN
    course ON points.course_id = course.Course_id
        INNER JOIN
    student ON points.student_id = student.Student_id
GROUP BY
    course.name, student.fullname;

-- Đưa ra khoá học có điểm trung bình cao nhất
SELECT
    AVG(points.points) AS averagePoint, course.name AS CourseName
FROM
    points
        INNER JOIN
    course ON points.points_id = course.course_id
GROUP BY CourseName ORDER BY averagePoint DESC;

SELECT
    MAX(averagePoint) AS result
FROM
    (SELECT
         AVG(points.points) AS averagePoint,
         course.name AS CourseName
     FROM
         points
             INNER JOIN course ON points.points_id = course.course_id
     GROUP BY CourseName) AS maxPoints;

