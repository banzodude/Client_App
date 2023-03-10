USE [DSGcontacts]
GO

/****** Object:  StoredProcedure [dbo].[storeAccess]    Script Date: 2023/03/09 20:17:57 ******/
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


