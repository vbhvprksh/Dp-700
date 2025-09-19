[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "orders_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared orders = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/MicrosoftLearning/dp-data/main/orders.csv"), [Delimiter = ",", Columns = 7, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"SalesOrderID", Int64.Type}, {"OrderDate", type date}, {"CustomerID", Int64.Type}, {"LineItem", Int64.Type}, {"ProductID", Int64.Type}, {"OrderQty", Int64.Type}, {"LineItemTotal", type number}}),
  #"Filtered rows" = Table.SelectRows(#"Changed column type", each ([OrderDate] = #date(2022, 6, 2)))
in
  #"Filtered rows";
shared orders_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "1c761afd-85aa-44d7-a7d9-95bf3b9ff1bf"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "bb851c90-4941-42bc-b339-485d4e3ab1e4"]}[Data],
  TableNavigation = Navigation_2{[Id = "orders", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
