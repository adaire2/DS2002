-- SQL Exercises (With Answers)

-- 1. Retrieve all students who enrolled in 2023.
select *
from Students 
where year(EnrollmentDate) =2023; 

#select count(*) as students_2023
#from Students
#where year(EnrollmentDate) = 2023;

-- 2. Find students whose email contains 'gmail.com'.
select Email, count(*)as EmailCount
from Students
where Email like '%gmail.com'
group by Email; 

-- 3. Count how many students are enrolled in the database.
select count(*) as total_students
from Students;

-- 4. Find students born between 2000 and 2005.
select *
from Students
where DateOfBirth between '2000-01-01' and '2005-12-31';

-- 5. List students sorted by last name in descending order.
select * 
from Students
order by LastName;

-- 6. Find the names of students and the courses they are enrolled in.
Select Students.StudentID, Students.FirstName, Students.LastName, Courses.CourseName
from Students
inner join Enrollments on Students.StudentID = Enrollments.StudentID
inner join Courses on Enrollments.CourseID = Courses.CourseID;

-- 7. List all students and their courses, ensuring students without courses are included (LEFT JOIN).
Select Students.StudentID, Students.FirstName, Students.LastName, Courses.CourseName
from Students
left join Enrollments on Students.StudentID = Enrollments.StudentID
left join Courses on Enrollments.CourseID = Courses.CourseID;

-- 8. Find all courses with no students enrolled (LEFT JOIN).
Select Courses.CourseName
from Courses
left join Enrollments on Courses.CourseID = Enrollments.CourseID
where Enrollments.CourseID is null;



-- 10. List courses and show the number of students enrolled in each course.
select Courses.CourseName, count(Enrollments.StudentID) AS TotalStudents
from Enrollments
inner join Courses ON Enrollments.CourseID = Courses.CourseID
group by Courses.CourseName;



