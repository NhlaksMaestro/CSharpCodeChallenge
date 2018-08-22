USE [SchoolApp]
GO

-- =============================================
-- Author:		Nhlakanipho Mbatha
-- Create date: 07/09/2018
-- Description:	Stored procedure that will bring back all the students, the subjects they are taking, and the mark achieved in the last exam.  The principal should see only the child’s name, surname, subject, and mark.
-- =============================================
CREATE PROCEDURE [dbo].[StudentSubjectsAndMarks]
	@StudentNameOrSurname nvarchar(50)
AS
BEGIN
	IF @StudentNameOrSurname is not null
		select stud.StudentName, stud.StudentSurname, subj.Subject, subjMarks.Mark from Students stud
		inner join SubjectMarks subjMarks on subjMarks.StudentID = stud.StudentID
		inner join Subjects subj on subjMarks.SubjectID = subj.SubjectID 
		where stud.StudentName like '%'+ @StudentNameOrSurname +'%' OR stud.StudentSurname like '%'+ @StudentNameOrSurname +'%'
	
END
GO


