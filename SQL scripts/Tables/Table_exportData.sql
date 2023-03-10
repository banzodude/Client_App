USE [DSGcontacts]
GO

/****** Object:  Table [dbo].[exportData]    Script Date: 2023/03/09 20:16:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[exportData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[filename] [nvarchar](50) NULL,
	[exportnum] [int] NULL
) ON [PRIMARY]
GO


