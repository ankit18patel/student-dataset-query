use newdata
SELECT * from student;
ALTER TABLE student RENAME COLUMN `Marks(%)` TO marks;
ALTER TABLE student RENAME COLUMN `Attendance(%)` TO attendance;
ALTER TABLE student RENAME COLUMN `Pass/Fail` TO result;


-- Find all students whose gender is 'Male'.
select  Name from student where Gender ="male";

-- Find all students whose age is greater than 20.
select Name,age from student where Age > 20 order by age asc;

-- Find students who scored more than 80% marks.
SELECT Name , marks FROM student WHERE Marks > 80 order by marks asc;

-- Find students whose attendance is below 75%.
select name, Attendance from student where Attendance <75 order by attendance asc;


-- Display all students who passed the examination.
select name from student where result="pass";

-- Display all students who failed the examination.
select name from student where result="fail";

-- Display the five students with the highest marks.
select name , marks from student 
order by  marks desc limit 5;


-- Count the number of students in each gender category. 
select sum(gender="male") as total_male,
sum(gender="female") as total_female from student;
 
-- Find the highest and lowest marks in the dataset.
select
max(marks) as high_marks,
min(marks) as low_marks from student;

-- Calculate the average marks for each course.

select course, avg(marks) as avg_marks from student group by course;

-- Count the number of students in each branch.

select branch, count(*) as total_student from student group by branch;

-- Count how many students passed and how many failed.
select result, count(*) as total_pass_fail from student group by result;

-- Find the average age of students in each course.

select course, avg(age) as avg_age from student group by course;

--  Display courses having more than 100 students.

select course from student group by course having count(*)>100;

--  Find branches where the average marks are greater than 65%.

select branch, avg(marks) as avg_marks from student group by branch having avg(marks)>65;

-- Find the number of students in each course who passed.
select course,count(result) as total_pass_std from student where result = "pass" group by Course;


-- Display the top 10 students according to marks, including their names, branches, and grades.

SELECT Name, Branch , Grade, Marks FROM Student ORDER BY marks DESC LIMIT 10;

-- Find students whose marks are greater than the overall average marks.

select name,marks from student where marks> (select avg(marks) from student)
order by marks desc;

-- Find students whose attendance is greater than the average attendance of all students.

select name , attendance from student where attendance> (select avg(attendance) from student)
order by attendance desc;


-- Rank students by marks in descending order using RANK().

select name, marks, rank() over (order by marks desc ) as rank_list from student ;


-- Find the top three students in each branch using a window function.
select * from (select name , rank() over (partition by course order by marks desc ) as branch_rank from student) as ranked where branch_rank <=3;