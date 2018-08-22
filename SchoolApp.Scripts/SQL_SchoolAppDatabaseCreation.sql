USE [master]
GO

CREATE DATABASE [SchoolApp]
 ON  PRIMARY 
( NAME = N'SchoolApp', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SchoolApp.mdf' , SIZE = 13312KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'SchoolApp_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SchoolApp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

USE [SchoolApp]
GO


CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](50) NULL,
	[StudentSurname] [varchar](50) NULL,
	[StudentSex] [char](1) NULL,
	[StudentAge] [int] NULL
) ON [PRIMARY]

GO

  INSERT INTO [SchoolApp].[dbo].[Students]([StudentName],[StudentSurname],[StudentSex],[StudentAge])
  VALUES('Johnny','Walker','M',	15)
    INSERT INTO [SchoolApp].[dbo].[Students]([StudentName],[StudentSurname],[StudentSex],[StudentAge])
  VALUES('Lucas','Radebe','M',	16)
    INSERT INTO [SchoolApp].[dbo].[Students]([StudentName],[StudentSurname],[StudentSex],[StudentAge])
  VALUES('Charles','Glass','M',	15)
    INSERT INTO [SchoolApp].[dbo].[Students]([StudentName],[StudentSurname],[StudentSex],[StudentAge])
  VALUES('Sally','Williams','F',16)
    INSERT INTO [SchoolApp].[dbo].[Students]([StudentName],[StudentSurname],[StudentSex],[StudentAge])
  VALUES('Mary','Smith','F',	15)
    INSERT INTO [SchoolApp].[dbo].[Students]([StudentName],[StudentSurname],[StudentSex],[StudentAge])
  VALUES('Jenny','Lopez','F',	15)
    INSERT INTO [SchoolApp].[dbo].[Students]([StudentName],[StudentSurname],[StudentSex],[StudentAge])
  VALUES('Daniel','Steele','M',	16)


CREATE TABLE [dbo].[SubjectMarks](
	[StudentID] [int] NULL,
	[SubjectID] [int] NULL,
	[Mark] [decimal](5, 2) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](50) NULL
) ON [PRIMARY]
GO

  INSERT INTO [SchoolApp].[dbo].[Subjects]([Subject])
  VALUES('Maths')
    INSERT INTO [SchoolApp].[dbo].[Subjects]([Subject])
  VALUES('Geometry')
    INSERT INTO [SchoolApp].[dbo].[Subjects]([Subject])
  VALUES('Science')
    INSERT INTO [SchoolApp].[dbo].[Subjects]([Subject])
  VALUES('English')
    INSERT INTO [SchoolApp].[dbo].[Subjects]([Subject])
  VALUES('Life Orientation')
    INSERT INTO [SchoolApp].[dbo].[Subjects]([Subject])
  VALUES('Woodwork')
    INSERT INTO [SchoolApp].[dbo].[Subjects]([Subject])
  VALUES('Computer Science')

GO

INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(1,1,50.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(1,2,55.70)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(1,3,61.50)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(1,4,70.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(1,5,35.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(2,1,25.50)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(2,3,45.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(2,4,75.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(2,6,76.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(3,2,80.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(3,3,82.50)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(3,4,89.40)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(3,5,56.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(3,7,78.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(4,1,65.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(4,2,65.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(4,4,66.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(4,5,68.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(4,6,74.50)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(5,2,55.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(5,3,56.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(5,5,79.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(5,6,24.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(6,1,78.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(6,4,36.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(6,5,90.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(6,6,45.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(7,1,78.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(7,3,76.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(7,4,71.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(7,5,69.00)
INSERT INTO [SchoolApp].[dbo].[SubjectMarks]([StudentID],[SubjectID],[Mark]) VALUES(7,7,55.00)
GO


