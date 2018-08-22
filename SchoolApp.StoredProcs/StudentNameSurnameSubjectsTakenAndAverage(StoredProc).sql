USE [SchoolApp]
GO
-- =============================================
-- Author:		Nhlakanipho Mbatha
-- Create date: 07/09/2018
-- Description:	Stored procedure that will bring back the students name, surname, the amount of subjects taken, and the average mark to 2 decimals.  Only show results for the students who are taking 5 or more subjects.
-- =============================================
CREATE PROCEDURE [dbo].[StudentNameSurnameSubjectsTakenAndAverage]
AS
BEGIN
	select Students.StudentName, Students.StudentSurname, count(Subjects.SubjectID) AS NumberOfSubjects, ROUND(AVG(SubjectMarks.Mark),2 ) AS Average  
		from (Students
		join SubjectMarks on SubjectMarks.StudentID = Students.StudentID
		join Subjects on Subjects.SubjectID = SubjectMarks.SubjectID)
		GROUP BY Students.StudentName, Students.StudentSurname
		HAVING COUNT(Subjects.SubjectID) > 5;
END
GO


