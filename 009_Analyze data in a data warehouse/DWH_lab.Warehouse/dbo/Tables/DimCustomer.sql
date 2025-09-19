CREATE TABLE [dbo].[DimCustomer] (

	[CustomerKey] int NOT NULL, 
	[CustomerAltKey] varchar(50) NULL, 
	[Title] varchar(5) NULL, 
	[FirstName] varchar(50) NOT NULL, 
	[LastName] varchar(50) NULL, 
	[AddressLine1] varchar(200) NULL, 
	[City] varchar(50) NULL, 
	[StateProvince] varchar(50) NULL, 
	[CountryRegion] varchar(50) NULL, 
	[PostalCode] varchar(20) NULL
);


GO
ALTER TABLE [dbo].[DimCustomer] ADD CONSTRAINT UQ_0a6b23b1_ad3a_427c_b1bd_cf0931f8b9ce unique NONCLUSTERED ([CustomerKey]);