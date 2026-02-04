--drop table students_class

CREATE TABLE students_class(
    student_id INT,
    student_name VARCHAR(30),
    class VARCHAR(30),
    marks INT,
);

INSERT INTO students_class VALUES
(1, 'student1', 'ClassA', 80),
(2, 'student2', 'ClassA', 70),
(3, 'student3', 'ClassA', 80),
(4, 'student4', 'ClassB', 60),
(5, 'student5', 'ClassB', 70),
(6, 'student4', 'ClassB', 100),
(7, 'student5', 'ClassB', 70),
(8, 'student4', 'ClassB', 40),
(9, 'student4', 'ClassB', 60),
(10, 'student5', 'ClassB', 100);


select * ,

SUM(marks) over (  -- running_totals1
PARTITION BY student_id
) AS Running_Marks

from students_class;


select * ,

SUM(marks) over ( -- running_totals2
PARTITION BY class
) AS Running_Marks

from students_class;






