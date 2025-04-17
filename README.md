-- Pride Tutoring Services Database --

This project is a relational database design for a fictional tutoring service called Pride Tutoring Services. The goal of the database is to manage tutors, students, subjects, tutoring sessions, and payments efficiently using a normalized structure and meaningful relationships.

--  Project Overview --

The database was created using MySQL Workbench and consists of several interrelated tables to reflect real-world operations of a tutoring business.

Key features of the project include:
- Well-structured tables for students, tutors, subjects, sessions, and payments.
- Many-to-many relationships (e.g., tutors and subject levels) handled through join tables.
- Realistic sample data populated across all tables.
- Visual EER diagram to showcase table relationships.
- Fully normalized schema with foreign key constraints.



--  Tables and Their Purpose --

- students table – Stores student information like name, phone number, grade, and registration date.
- tutors table – Stores tutor details, including the subject they teach.
- subjects table – A list of subjects offered by the tutoring center.
- subject_levels table– Maps subjects to specific grade levels (e.g., Math Grade 8, 9, etc.).
- tutor_subject_levels table – A junction table linking tutors to the levels they can teach.
- sessions table – Records details of each tutoring session, including the date, time, subject, tutor, and student.
- payments table – Tracks payments made by students for sessions.


-- Technologies Used --

- MySQL
- MySQL Workbench
- SQL (DDL + DML)
- EER Diagram


--  Learning Goals --

This project was designed as a personal learning experience to practice:
- Relational database design
- Normalization and data modeling
- Creating and enforcing relationships with foreign keys
- Populating realistic sample data
- Writing and testing SQL queries



--  Author --

Rethabile Reuben Kwagile 
Final-year Systems Development Student  
www.linkedin.com/in/rethabile-kwagile-226822249



-- Future Improvements --

- Add stored procedures or views for reporting
- Connect to a front-end for admin access or student booking
- Add validations and user roles for advanced management



-- License --

This project is open for learning and showcasing purposes.






