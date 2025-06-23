[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = Lakehouse.Contents([EnableFolding = false]){[workspaceId = "1c761afd-85aa-44d7-a7d9-95bf3b9ff1bf"]}[Data]{[lakehouseId = "2b51309f-d966-41c2-abe0-aeea314a0920"]}[Data];
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "orders_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared orders = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/MicrosoftLearning/dp-data/main/orders.csv"), [Delimiter = ",", Columns = 7, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"SalesOrderID", Int64.Type}, {"OrderDate", type date}, {"CustomerID", Int64.Type}, {"LineItem", Int64.Type}, {"ProductID", Int64.Type}, {"OrderQty", Int64.Type}, {"LineItemTotal", type number}}),
  #"Added custom" = Table.TransformColumnTypes(Table.AddColumn(#"Changed column type", "Month", each Month([OrderDate])), {{"Month", Int64.Type}}),
  #"Removed columns" = Table.RemoveColumns(#"Added custom", {"Month"}),
  #"Added custom 1" = Table.AddColumn(#"Removed columns", "Month", each Date.Month([OrderDate]))
in
  #"Added custom 1";
shared orders_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "1c761afd-85aa-44d7-a7d9-95bf3b9ff1bf"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "2b51309f-d966-41c2-abe0-aeea314a0920"]}[Data],
  TableNavigation = Navigation_2{[Id = "orderspipeline", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
