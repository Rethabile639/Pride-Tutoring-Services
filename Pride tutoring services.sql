CREATE DATABASE pride_tutoring_services;
	
CREATE TABLE students(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    phone_number INT,
    registration_date DATE,
    grade INT
    );
    
CREATE TABLE subjects(
		subject_id INT PRIMARY KEY,
        subject_name VARCHAR(60)
        );
        
CREATE TABLE tutors(
		tutor_id INT PRIMARY KEY,
		first_name VARCHAR(30),
		last_name VARCHAR(30),
		email VARCHAR(50),
		phone_number INT,
		subject_id INT,
		FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
		);

CREATE TABLE sessions(
	sessions_id INT PRIMARY KEY AUTO_INCREMENT,
    date_of_session DATE,
    start_time TIME,
    end_time TIME,
    subject_id INT,
    student_id INT,
    tutor_id INT,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
	FOREIGN KEY (student_id) REFERENCES students(students_id),
    FOREIGN KEY (tutor_id) REFERENCES tutors(tutor_id)
   );

CREATE TABLE payments(
	payment_id INT PRIMARY KEY,
    student_id INT,
    amount_paid DECIMAL,
    date_paid DATE,
    FOREIGN KEY (student_id) REFERENCES students(students_id)
    );
    
CREATE TABLE subject_levels (
		subject_level_id INT PRIMARY KEY,
		subject_id INT,
		grade INT,
		FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
	);

CREATE TABLE tutor_subject_levels (
    tutor_id INT,
    subject_level_id INT,
    PRIMARY KEY (tutor_id, subject_level_id),
    FOREIGN KEY (tutor_id) REFERENCES tutors(tutor_id),
    FOREIGN KEY (subject_level_id) REFERENCES subject_levels(subject_level_id)
);

ALTER TABLE students
	MODIFY phone_number VARCHAR(20);

ALTER TABLE tutors
	MODIFY phone_number VARCHAR(20); 
            
ALTER TABLE students
	CHANGE grade grade_level INT;

            
/*
  Insert 10 students for testing
*/

INSERT INTO students (first_name, last_name, phone_number, registration_date, grade_level)
VALUES
		('Lerato', 'Mokoena', '0712345678', '2024-01-15', 10),
		('Thabo', 'Nkosi', '0723456789', '2024-01-16', 12),
		('Naledi', 'Dlamini', '0734567890', '2024-02-01', 9),
		('Kabelo', 'Moloi', '0745678901', '2024-02-10', 11),
		('Ayanda', 'Mthembu', '0756789012', '2024-03-01', 8),
		('Sizwe', 'Khumalo', '0767890123', '2024-03-02', 10),
		('Boitumelo', 'Mahlangu', '0789012345', '2024-03-05', 12),
		('Karabo', 'Ngwenya', '0790123456', '2024-03-10', 11),
		('Tshepo', 'Zwane', '0701234567', '2024-04-01', 9),
		('Precious', 'Sithole', '0698765432', '2024-04-05', 8);

INSERT INTO subjects (subject_id, subject_name)
VALUES
	(1, 'Mathematics'),
	(2, 'English'),
	(3, 'Physical Science'),
	(4, 'Life Sciences'),
	(5, 'Accounting'),
	(6, 'Geography'),
	(7, 'Economics'),
	(8, 'Business Studies'),
	(9, 'History'),
	(10, 'Computer Applications Technology');

INSERT INTO tutors (tutor_id, first_name, last_name, email, phone_number, subject_id)
VALUES
	(1, 'Dineo', 'Mahlangu', 'dineo.mahlangu@email.com', 0612345678, 1), -- Mathematics
	(2, 'Thabiso', 'Pule', 'thabiso.pule@email.com', 0623456789, 2),     -- English
	(3, 'Amanda', 'Nkosi', 'amanda.nkosi@email.com', 0634567890, 1),     -- Mathematics
	(4, 'Sibongile', 'Mokoena', 'sibongile.m@email.com', 0645678901, 3), -- Physical Science
	(5, 'Tshepo', 'Mahlatsi', 'tshepo.m@email.com', 0656789012, 4),      -- Life Sciences
	(6, 'Lebo', 'Dlamini', 'lebo.d@email.com', 0667890123, 5),           -- Accounting
	(7, 'Siyabonga', 'Khumalo', 'siya.k@email.com', 0678901234, 6),      -- Geography
	(8, 'Nokuthula', 'Zwane', 'n.zwane@email.com', 0689012345, 7),       -- Economics
	(9, 'Kagiso', 'Ngcobo', 'k.ngcobo@email.com', 0690123456, 8),        -- Business Studies
	(10, 'Nomsa', 'Mbatha', 'nomsa.m@email.com', 0601234567, 10);        -- CAT

  INSERT INTO sessions (date_of_session, start_time, end_time, subject_id, student_id, tutor_id)
VALUES
	('2025-04-01', '14:00:00', '15:00:00', 1, 1, 1),   -- Math, student 1 with tutor 1
	('2025-04-02', '15:00:00', '16:00:00', 2, 2, 2),   -- English
	('2025-04-03', '09:00:00', '10:30:00', 1, 3, 3),   -- Math again with different tutor
	('2025-04-04', '10:00:00', '11:00:00', 3, 4, 4),   -- Physical Science
	('2025-04-05', '13:00:00', '14:00:00', 4, 5, 5),   -- Life Sciences
	('2025-04-06', '14:30:00', '15:30:00', 5, 6, 6),   -- Accounting
	('2025-04-07', '15:30:00', '16:30:00', 6, 7, 7),   -- Geography
	('2025-04-08', '08:30:00', '09:30:00', 7, 8, 8),   -- Economics
	('2025-04-09', '11:00:00', '12:00:00', 8, 9, 9),   -- Business Studies
	('2025-04-10', '12:00:00', '13:30:00', 10, 10, 10);-- CAT
    
INSERT INTO payments (payment_id, student_id, amount_paid, date_paid)
VALUES
	(1, 1, 250.00, '2025-04-01'),
	(2, 2, 300.00, '2025-04-02'),
	(3, 3, 150.00, '2025-04-03'),
	(4, 4, 400.00, '2025-04-04'),
	(5, 5, 200.00, '2025-04-05'),
	(6, 6, 500.00, '2025-04-06'),
	(7, 7, 350.00, '2025-04-07'),
	(8, 8, 275.00, '2025-04-08'),
	(9, 9, 320.00, '2025-04-09'),
	(10, 10, 290.00, '2025-04-10');


INSERT INTO subject_levels (subject_level_id, subject_id, grade)
VALUES
		-- Mathematics (1)
		(1, 1, 8),
		(2, 1, 9),
		(3, 1, 10),
		(4, 1, 11),
		(5, 1, 12),

		-- English (2)
		(6, 2, 8),
		(7, 2, 9),
		(8, 2, 10),
		(9, 2, 11),
		(10, 2, 12),

		-- Physical Science (3)
		(11, 3, 10),
		(12, 3, 11),
		(13, 3, 12),

		-- Life Sciences (4)
		(14, 4, 10),
		(15, 4, 11),
		(16, 4, 12),

		-- Accounting (5)
		(17, 5, 10),
		(18, 5, 11),
		(19, 5, 12),

		-- Geography (6)
		(20, 6, 8),
		(21, 6, 9),
		(22, 6, 10),
		(23, 6, 11),
		(24, 6, 12),

		-- Economics (7)
		(25, 7, 10),
		(26, 7, 11),
		(27, 7, 12),

		-- Business Studies (8)
		(28, 8, 10),
		(29, 8, 11),
		(30, 8, 12),

		-- History (9)
		(31, 9, 10),
		(32, 9, 11),
		(33, 9, 12),

		-- CAT (10)
		(34, 10, 10),
		(35, 10, 11),
		(36, 10, 12);

INSERT INTO tutor_subject_levels (tutor_id, subject_level_id)
VALUES
	(1, 1),  (1, 2),  (1, 3),   -- Tutor 1: Mathematics (Grades 8-10)
	(2, 6),  (2, 7),  (2, 8),   -- Tutor 2: English (Grades 8-10)
	(3, 11), (3, 12), (3, 13),  -- Tutor 3: Physical Science (Grades 10-12)
	(4, 14), (4, 15), (4, 16),  -- Tutor 4: Life Sciences (Grades 10-12)
	(5, 17), (5, 18), (5, 19),  -- Tutor 5: Accounting (Grades 10-12)
	(6, 20), (6, 21), (6, 22),  -- Tutor 6: Geography (Grades 8-10)
	(7, 25), (7, 26),           -- Tutor 7: Economics (Grades 10-11)
	(8, 28), (8, 29), (8, 30),  -- Tutor 8: Business Studies (Grades 10-12)
	(9, 31), (9, 32), (9, 33),  -- Tutor 9: History (Grades 10-12)
	(10, 34), (10, 35), (10, 36), -- Tutor 10: CAT (Grades 10-12)

	-- Some tutors teaching multiple subjects or levels
	(1, 4),   -- Tutor 1 also teaches Math Grade 11
	(2, 9),   -- Tutor 2 also teaches English Grade 11
	(6, 23),  -- Tutor 6 also teaches Geography Grade 11
	(7, 27);  -- Tutor 7 also teaches Economics Grade 12
    
    
    
