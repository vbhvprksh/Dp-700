CREATE TABLE [dbo].[DimProduct] (

	[ProductKey] int NOT NULL, 
	[ProductAltKey] varchar(25) NULL, 
	[ProductName] varchar(50) NOT NULL, 
	[Category] varchar(50) NULL, 
	[ListPrice] decimal(18,0) NULL
);


GO
ALTER TABLE [dbo].[DimProduct] ADD CONSTRAINT FK_aa3ffa91_392d_4ed2_93bc_37c33881bbf4 FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[FactSalesOrder]([ProductKey]);