# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "7ee53c92-cf2b-4407-a61f-a7ad64689abe",
# META       "default_lakehouse_name": "Ist_Lab",
# META       "default_lakehouse_workspace_id": "1c761afd-85aa-44d7-a7d9-95bf3b9ff1bf",
# META       "known_lakehouses": [
# META         {
# META           "id": "7ee53c92-cf2b-4407-a61f-a7ad64689abe"
# META         },
# META         {
# META           "id": "bb851c90-4941-42bc-b339-485d4e3ab1e4"
# META         },
# META         {
# META           "id": "d897672f-3dbb-48da-971a-be007fa0d122"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!

df = spark.sql("SELECT * FROM Ist_Lab.products LIMIT 1000")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df = spark.read.format("csv").option("header","true").load("abfss://Pyspark@onelake.dfs.fabric.microsoft.com/Pyspark_practice.Lakehouse/Files/csv/cifar10.csv")
# df now is a Spark DataFrame containing CSV data from "abfss://Pyspark@onelake.dfs.fabric.microsoft.com/Pyspark_practice.Lakehouse/Files/csv/cifar10.csv".
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# With Spark SQL, Please run the query onto the lakehouse which is from the same workspace as the current default lakehouse.
df = spark.sql("SELECT * FROM Pyspark_practice.cifar10 LIMIT 1000")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
