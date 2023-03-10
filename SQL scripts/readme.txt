Two Database used:
1.ASP.NET Core Identity which created user tables using migration etc . More info, visit: 
https://learn.microsoft.com/en-us/aspnet/core/security/authentication/identity?view=aspnetcore-7.0&tabs=visual-studio

2. DSGcontacts database which I created and includes stored procedures,tables:
	Tables
	-dbo.accessRequest
	-dbo.Contacts
	-dbo.exportData

	Stored Procedures
	-dbo.countNumClient
	-dbo.returnAPIcontacts
	-dbo.storeAccess

	the scripts are in the folders .