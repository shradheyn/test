-- JAVA FULL STACK ASSIGNMENT-1


CREATE DATABASE collageDB;
USE collageDB;

-- 1. COURSE TABLE
CREATE TABLE course (
    courseID INT PRIMARY KEY,
    cName VARCHAR(30) NOT NULL,
    Fees DECIMAL(10,2) NOT NULL
);

-- 2. STUDENT TABLE
CREATE TABLE student (
    rollNo INT PRIMARY KEY,
    fName VARCHAR(30) NOT NULL,
    lName VARCHAR(30) NOT NULL,
    PhoneNo VARCHAR(15) UNIQUE,
    cId INT,
    email VARCHAR(50) UNIQUE,
    CONSTRAINT fk_student_course
    FOREIGN KEY (cId) REFERENCES course(courseID)
);

-- 3. FACULTY TABLE
CREATE TABLE faculty (
    fId INT PRIMARY KEY,
    fName VARCHAR(30) NOT NULL,
    Desig VARCHAR(30),
    Qualification VARCHAR(50),
    PhoneNo VARCHAR(15) UNIQUE,
    cId INT,
    CONSTRAINT fk_faculty_course
    FOREIGN KEY (cId) REFERENCES course(courseID)
);

-- 4. BOOK TABLE
CREATE TABLE book (
    Bid INT PRIMARY KEY,
    Bname VARCHAR(50) UNIQUE,
    Author VARCHAR(50),
    Publisher VARCHAR(50),
    Price DECIMAL(10,2),
    Qty INT
);

-- 5. LIBRARY TABLE
CREATE TABLE library (
    LID INT PRIMARY KEY,
    BookId INT,
    IssueDate DATE,
    ReturnDate DATE,
    rollNo INT,
    CONSTRAINT fk_library_book
    FOREIGN KEY (BookId) REFERENCES book(bId),
    CONSTRAINT fk_library_student
    FOREIGN KEY (rollNo) REFERENCES student(rollNo)
);

-- 6. ADDRESS TABLE
CREATE TABLE address (
    aId INT PRIMARY KEY,
    houseNo VARCHAR(20),
    street VARCHAR(20),
    city VARCHAR(20),
    state VARCHAR(20),
    pincode VARCHAR(10),
    rNo INT,
    CONSTRAINT fk_address_student
    FOREIGN KEY (rNo) REFERENCES student(rollNo)
);

-- DATA POPULATION

-- 1. COURSE DATA
INSERT INTO course (courseID, cName, Fees) VALUES
(101, 'CSE', 100000.00),
(102, 'EE', 75000.00),
(103, 'ME', 80000.00);

-- 2. STUDENT DATA
INSERT INTO student (rollNo, fName, lName, PhoneNo, cId, email) VALUES
(1, 'SpongeBob', 'SquarePants', '9998887770', 101, 'spongebob@bikinibottom.com'),
(2, 'Patrick', 'Star', '9998887771', 101, 'patrick@bikinibottom.com'),
(3, 'Sandy', 'Cheeks', '9998887772', 102, 'sandy@bikinibottom.com'),
(4, 'Squidward', 'Tentacles', '9998887773', 103, 'squidward@bikinibottom.com'),
(5, 'Pearl', 'Krabs', '9998887774', 102, 'pearl@bikinibottom.com');

-- 3. FACULTY DATA
INSERT INTO faculty (fId, fName, Desig, Qualification, PhoneNo, cId) VALUES
(1, 'Poppy Puff', 'Professor', 'MSc Marine Studies', '8887776661', 101),
(2, 'Larry Lobster', 'Trainer', 'MSc Phys Ed', '8887776662', 102),
(3, 'Karen Computer', 'Assistant', 'PhD AI', '8887776663', 103),
(4, 'Bubble Bass', 'Lecturer', 'MPhil Food Science', '8887776664', 101);

-- 4. BOOK DATA
INSERT INTO book (bId, bName, Author, Publisher, Price, Qty) VALUES
(1, 'Boating 101', 'Mrs. Puff', 'BB Publications', 299.99, 5),
(2, 'Jellyfishing Guide', 'SpongeBob', 'BB Publications', 149.99, 3),
(3, 'Clarinet for Beginners', 'Squidward', 'BB Publications', 399.99, 4),
(4, 'Science of Karate', 'Sandy', 'BB Publications', 249.99, 2);

-- 5. LIBRARY DATA
INSERT INTO library (lId, BookId, IssueDate, ReturnDate, rollNo) VALUES
(1, 1, '2025-08-01', '2025-08-15', 1),
(2, 2, '2025-08-02', '2025-08-18', 2),
(3, 3, '2025-08-03', '2025-08-20', 4),
(4, 4, '2025-08-04', '2025-08-19', 3);

-- 6. ADDRESS DATA
INSERT INTO address (aId, houseNo, street, city, state, pincode, rNo) VALUES
(1, '124', 'Conch Street', 'Bikini Bottom', 'Pacific', '00001', 1),
(2, '125', 'Conch Street', 'Bikini Bottom', 'Pacific', '00001', 2),
(3, 'TreeDome', 'Acorn Ave', 'Bikini Bottom', 'Pacific', '00002', 3),
(4, 'TentacleHouse', 'Clarinet Ln', 'Bikini Bottom', 'Pacific', '00003', 4),
(5, 'Krusty', 'Crab Rd', 'Bikini Bottom', 'Pacific', '00004', 5);
