# 1.Query the existence of 1 course
select * from course where id = 1;
# 2.Query the presence of both 1 and 2 courses
select * from course where id in (1,2);
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select id,name,avg(score) as avg_score from student join student_course on id=studentId  group by id having avg(score)>=60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where id not in (select distinct(studentId) from student_course); 
# 5.Query all SQL with grades
select * from student where id in (select distinct(studentId) from student_course); 
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select * from student join student_course on id=studentId where id=1 and courseId=2;
# 7.Retrieve 1 student score with less than 60 scores in descending order
select id,name,score from student join student_course on id=studentId where score<60 order by score desc limit 1;
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select id,name,avg(score) as avg_score from course join student_course on id = courseId group by id order by avg_score desc , id asc;
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select student.name,score from student join student_course on student.id = studentId join course on course.id = courseId where course.name = 'Math' and score < 60;
