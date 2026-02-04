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


select * from students_class; 


-- without null - LAG_Q1
select * , LAG(marks, 1, 0) OVER (PARTITION BY class order by class) as PerStudentMarks
from students_class;

--with null - LAG_Q2
select * , LAG(marks) OVER (PARTITION BY class order by class) as PerStudentMarks
from students_class;

--grow marks - LAG_Q3
select * , LAG(marks) OVER(PARTITION BY class order by class) as LAGMarks, marks - LAG(marks) OVER(PARTITION BY class order by class) as MarkByMark
from students_class;


-- reference

https://www.datacamp.com/tutorial/sql-lag?utm_cid=19589720824&utm_aid=157156376591&utm_campaign=230119_1-ps-other~dsa-tofu~all_2-b2c_3-apac_4-prc_5-na_6-na_7-le_8-pdsh-go_9-nb-e_10-na_11-na&utm_loc=1009919-&utm_mtd=-c&utm_kw=&utm_source=google&utm_medium=paid_search&utm_content=ps-other~apac-en~dsa~tofu~tutorial~sql&gad_source=1&gad_campaignid=19589720824&gbraid=0AAAAADQ9WsH3r__FceSJGMwcgPMQ_4DOt&gclid=Cj0KCQiA-YvMBhDtARIsAHZuUzJ_5hzmJ0Xoy0rM5OEx0rSx8jhilWKxOWGFdMbu72M5KiRHBwfnUvsaAnUBEALw_wcB
https://www.geeksforgeeks.org/sql/sql-server-lag-function-overview/





