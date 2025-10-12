CREATE TABLE [dbo].[FactSalesOrder] (

	[SalesOrderKey] int NOT NULL, 
	[SalesOrderDateKey] int NOT NULL, 
	[ProductKey] int NOT NULL, 
	[CustomerKey] int NOT NULL, 
	[Quantity] int NULL, 
	[SalesTotal] decimal(18,0) NULL
);


GO
ALTER TABLE [dbo].[FactSalesOrder] ADD CONSTRAINT UQ_7b939bc0_2aba_4645_9b06_3d609826bf87 unique NONCLUSTERED ([SalesOrderKey]);
GO
ALTER TABLE [dbo].[FactSalesOrder] ADD CONSTRAINT FK_439e5352_56e0_44d9_aedb_3cd7a2c0de1e FOREIGN KEY ([CustomerKey]) REFERENCES [dbo].[DimCustomer]([CustomerKey]);
GO
ALTER TABLE [dbo].[FactSalesOrder] ADD CONSTRAINT FK_be604ca0_3d98_4ce6_80d3_4697fcbd43ca FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct]([ProductKey]);