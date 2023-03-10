USE [DSGcontacts]
GO

/****** Object:  StoredProcedure [dbo].[countNumClient]    Script Date: 2023/03/09 20:16:42 ******/
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


