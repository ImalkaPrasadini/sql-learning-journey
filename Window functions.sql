CREATE TABLE students(
    student_id INT,
    student_name VARCHAR(30),
    class VARCHAR(30),
    marks INT,
);

INSERT INTO students VALUES
(1, 'student1', 'ClassA', 80),
(2, 'student2', 'ClassA', 70),
(3, 'student3', 'ClassA', 80),
(4, 'student4', 'ClassB', 60),
(5, 'student5', 'ClassB', 70);

SELECT * FROM students


SELECT *, 
       AVG(marks) OVER( PARTITION BY class) AS Avg_Marks
 FROM students;

SELECT *, 
       SUM(marks) OVER( PARTITION BY class) AS Sum_Marks
 FROM students;




SELECT *,
       RANK() OVER(PARTITION BY Class ORDER BY Marks DESC) AS student_rank
FROM students;

SELECT *,
       DENSE_RANK() OVER(PARTITION BY Class ORDER BY Marks DESC) AS student_dense_rank
FROM students;



SELECT *,
       ROW_NUMBER() OVER(PARTITION BY Class ORDER BY Marks DESC) AS student_dense_rank
FROM students;

SELECT *,
       PERCENT_RANK() OVER(PARTITION BY Class ORDER BY Marks DESC) AS student_percent_rank
FROM students;
