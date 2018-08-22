-- =============================================
-- Author:		Nhlakanipho Mbatha
-- Create date: 07/09/2018
-- Description:	The school also wants to see who is doing sports, and what sports they are doing.  The school currently does the following sports: Rugby;Soccer;Cricket;Netball;Hockey; Create the necessary tables to the database to meet the requirements.
-- =============================================

CREATE TABLE [dbo].[Sports](
	[SportID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL
) ON [PRIMARY]
GO

INSERT INTO [SchoolApp].[dbo].[Sports]([Name])
  VALUES('Rugby')
INSERT INTO [SchoolApp].[dbo].[Sports]([Name])
  VALUES('Soccer')
INSERT INTO [SchoolApp].[dbo].[Sports]([Name])
  VALUES('Cricket')
INSERT INTO [SchoolApp].[dbo].[Sports]([Name])
  VALUES('Netball')
INSERT INTO [SchoolApp].[dbo].[Sports]([Name])
  VALUES('Hockey')