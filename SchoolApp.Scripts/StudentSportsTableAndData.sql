-- =============================================
-- Author:		Nhlakanipho Mbatha
-- Create date: 07/09/2018
-- Description:	The school also wants to see who is doing sports, and what sports they are doing.  The school currently does the following sports: Rugby;Soccer;Cricket;Netball;Hockey; Create the necessary tables to the database to meet the requirements.
-- =============================================

CREATE TABLE [dbo].[StudentSports](
	[StudentID] [int] NULL,
	[SportID] [int] NULL
) ON [PRIMARY]

GO

INSERT INTO [SchoolApp].[dbo].[StudentSports]
([StudentID],[SportID]) VALUES(1,1)
INSERT INTO [SchoolApp].[dbo].[StudentSports]
([StudentID],[SportID]) VALUES(1,3)
INSERT INTO [SchoolApp].[dbo].[StudentSports]
([StudentID],[SportID]) VALUES(2,2)
INSERT INTO [SchoolApp].[dbo].[StudentSports]
([StudentID],[SportID]) VALUES(5,3)
INSERT INTO [SchoolApp].[dbo].[StudentSports]
([StudentID],[SportID]) VALUES(5,4)
INSERT INTO [SchoolApp].[dbo].[StudentSports]
([StudentID],[SportID]) VALUES(5,5)
INSERT INTO [SchoolApp].[dbo].[StudentSports]
([StudentID],[SportID]) VALUES(7,1)
INSERT INTO [SchoolApp].[dbo].[StudentSports]
([StudentID],[SportID]) VALUES(7,2)
INSERT INTO [SchoolApp].[dbo].[StudentSports]
([StudentID],[SportID]) VALUES(7,3)
