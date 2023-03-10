# Client_App
manage and store our client’s contacts details in the cloud where we are able to manage and maintain our client list on an address book type of application

Two Database used: 

1.ASP.NET Core Identity which created user tables using migration etc . 
 - On the package manager console ,run the following command:
 
   Update-Database -context ApplicationDbContext
 

More info, visit: 
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
