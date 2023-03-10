USE [DSGcontacts]
GO

/****** Object:  Table [dbo].[Contacts]    Script Date: 2023/03/09 20:15:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Contacts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[surname] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[client] [nvarchar](max) NULL,
	[company] [nvarchar](max) NULL,
	[created] [date] NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Contacts] ADD  CONSTRAINT [dateee]  DEFAULT (getdate()) FOR [created]
GO


