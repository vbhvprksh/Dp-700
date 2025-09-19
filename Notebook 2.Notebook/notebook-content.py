# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "d897672f-3dbb-48da-971a-be007fa0d122",
# META       "default_lakehouse_name": "Pyspark_practice",
# META       "default_lakehouse_workspace_id": "f525b094-2cc4-4e1f-b79f-f90bc5df18d2",
# META       "known_lakehouses": [
# META         {
# META           "id": "2b51309f-d966-41c2-abe0-aeea314a0920"
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

df = spark.read.format("csv").option("header","true").load("Files/pipeline_data/sales.csv")
# df now is a Spark DataFrame containing CSV data from "Files/pipeline_data/sales.csv".
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df = spark.sql("SELECT * FROM Ist_Lab.products LIMIT 1000")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df = spark.sql("SELECT * FROM ApacheSpark2.external_products LIMIT 1000")
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

# CELL ********************

# With Spark SQL, Please run the query onto the lakehouse which is from the same workspace as the current default lakehouse.
df = spark.sql("SELECT * FROM Pyspark_practice.cifar10 LIMIT 1000")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
