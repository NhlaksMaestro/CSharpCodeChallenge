USE [SchoolApp]
GO

-- =============================================
-- Author:		Nhlakanipho Mbatha
-- Create date: 07/09/2018
-- Description:	Stored procedure that will display all the students.  We want to see their name, surname, and age.  If they play a sport, show the sport name.  If they play more than one sport, list the other sports below.  If they play no sports, the principal wants them to participate in the school’s big annual dance.  Thus he wants the word ‘Dancing’ to display under SportName if they don’t do any sports
-- =============================================
CREATE PROCEDURE [dbo].[StudentsDoingSportsAndOthersDancing]
AS
BEGIN
	select Students.StudentAge, Students.StudentName, Students.StudentSurname, IsNull(Sports.Name, 'Dancing')  AS SportName
	from Students
	full join StudentSports on StudentSports.StudentID = Students.StudentID
	full join Sports on StudentSports.SportID = Sports.SportID
END
GO


