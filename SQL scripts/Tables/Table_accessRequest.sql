USE [DSGcontacts]
GO

/****** Object:  Table [dbo].[accessRequest]    Script Date: 2023/03/09 20:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[accessRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Access] [nvarchar](50) NULL,
	[num] [int] NULL,
	[created] [date] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[accessRequest] ADD  DEFAULT (getdate()) FOR [created]
GO


