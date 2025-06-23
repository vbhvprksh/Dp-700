CREATE TABLE [dbo].[FactSalesOrder] (

	[SalesOrderKey] int NOT NULL, 
	[SalesOrderDateKey] int NOT NULL, 
	[ProductKey] int NOT NULL, 
	[CustomerKey] int NOT NULL, 
	[Quantity] int NULL, 
	[SalesTotal] decimal(18,0) NULL
);


GO
ALTER TABLE [dbo].[FactSalesOrder] ADD CONSTRAINT UQ_73057611_d3d8_4f5f_964f_6fefa3104dab unique NONCLUSTERED ([ProductKey]);
GO
ALTER TABLE [dbo].[FactSalesOrder] ADD CONSTRAINT UQ_75ef437f_ebd3_42a6_b175_5754419d3be9 unique NONCLUSTERED ([CustomerKey]);
GO
ALTER TABLE [dbo].[FactSalesOrder] ADD CONSTRAINT UQ_7b939bc0_2aba_4645_9b06_3d609826bf87 unique NONCLUSTERED ([SalesOrderKey]);