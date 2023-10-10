'''
QL Schema
Pandas Schema
Table: Students

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+
student_id is the primary key (column with unique values) for this table.
Each row of this table contains the ID and the name of one student in the school.
 

Table: Subjects

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+
subject_name is the primary key (column with unique values) for this table.
Each row of this table contains the name of one subject in the school.
 

Table: Examinations

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| subject_name | varchar |
+--------------+---------+
There is no primary key (column with unique values) for this table. It may contain duplicates.
Each student from the Students table takes every course from the Subjects table.
Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
 

Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.
'''
#code:
SELECT
    Students.student_id,
    Students.student_name,
    Subjects.subject_name,
    count(Examinations.subject_name) AS attended_exams
 FROM Students
     JOIN Subjects
     LEFT JOIN Examinations
         ON Students.student_id = Examinations.student_id
        AND Subjects.subject_name = Examinations.subject_name
GROUP BY Students.student_id,
         Subjects.subject_name
ORDER BY student_id,
         subject_name;
