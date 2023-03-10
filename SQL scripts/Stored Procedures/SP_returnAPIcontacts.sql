USE [DSGcontacts]
GO

/****** Object:  StoredProcedure [dbo].[returnAPIcontacts]    Script Date: 2023/03/09 20:17:24 ******/
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


