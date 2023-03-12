USE [master]
GO
/****** Object:  Database [DSGcontacts]    Script Date: 2023/03/12 19:59:18 ******/
CREATE DATABASE [DSGcontacts]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DSGcontacts', FILENAME = N'C:\Users\Banele\DSGcontacts.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DSGcontacts_log', FILENAME = N'C:\Users\Banele\DSGcontacts_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DSGcontacts] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DSGcontacts].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DSGcontacts] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DSGcontacts] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DSGcontacts] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DSGcontacts] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DSGcontacts] SET ARITHABORT OFF 
GO
ALTER DATABASE [DSGcontacts] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DSGcontacts] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DSGcontacts] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DSGcontacts] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DSGcontacts] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DSGcontacts] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DSGcontacts] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DSGcontacts] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DSGcontacts] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DSGcontacts] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DSGcontacts] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DSGcontacts] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DSGcontacts] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DSGcontacts] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DSGcontacts] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DSGcontacts] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DSGcontacts] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DSGcontacts] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DSGcontacts] SET  MULTI_USER 
GO
ALTER DATABASE [DSGcontacts] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DSGcontacts] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DSGcontacts] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DSGcontacts] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DSGcontacts] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DSGcontacts] SET QUERY_STORE = OFF
GO
USE [DSGcontacts]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DSGcontacts]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2023/03/12 19:59:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accessRequest]    Script Date: 2023/03/12 19:59:18 ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 2023/03/12 19:59:18 ******/
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
/****** Object:  Table [dbo].[exportData]    Script Date: 2023/03/12 19:59:18 ******/
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
ALTER TABLE [dbo].[accessRequest] ADD  DEFAULT (getdate()) FOR [created]
GO
ALTER TABLE [dbo].[Contacts] ADD  CONSTRAINT [dateee]  DEFAULT (getdate()) FOR [created]
GO
/****** Object:  StoredProcedure [dbo].[countNumClient]    Script Date: 2023/03/12 19:59:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[countNumClient]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT count(*) as numClients from Contacts

	SELECT (count(*)/2) as expData from exportData

	SELECT count(*) as extClients from accessRequest where created between GETDATE()-7 and GETDATE()
	
	SELECT count(*) as impData from Contacts where UPPER(client)='IMPORTED'
	--select *from Contacts

	
	
END
GO
/****** Object:  StoredProcedure [dbo].[returnAPIcontacts]    Script Date: 2023/03/12 19:59:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[returnAPIcontacts]
@fromDate nvarchar(20),@toDate nvarchar(20) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

	SELECT [ID]
      ,[name]
      ,[surname]
      ,[email]
      ,[client]
      ,[company] from Contacts 
	where FORMAT (created, 'dd/MM/yyyy ') between @fromDate and @toDate
	
	

	
END
GO
/****** Object:  StoredProcedure [dbo].[storeAccess]    Script Date: 2023/03/12 19:59:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[storeAccess]
@name nvarchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

	
	
	--select *from Contacts
	if (SELECT count(Access) from accessRequest where Access=@name )   >= 1
	begin
	update accessRequest set num=num+1 where Access=@name;
	end
else
	insert into accessRequest (Access,num) values (@name,1);
	

	
END
GO
USE [master]
GO
ALTER DATABASE [DSGcontacts] SET  READ_WRITE 
GO
