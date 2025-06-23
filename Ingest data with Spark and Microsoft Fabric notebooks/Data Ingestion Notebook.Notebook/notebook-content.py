# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "2b51309f-d966-41c2-abe0-aeea314a0920",
# META       "default_lakehouse_name": "Data_ingestion_process",
# META       "default_lakehouse_workspace_id": "1c761afd-85aa-44d7-a7d9-95bf3b9ff1bf",
# META       "known_lakehouses": [
# META         {
# META           "id": "2b51309f-d966-41c2-abe0-aeea314a0920"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!
# Azure Blob Storage access info
blob_account_name = "azureopendatastorage"
blob_container_name = "nyctlc"
blob_relative_path = "yellow"

# Construct connection path
wasbs_path = f'wasbs://{blob_container_name}@{blob_account_name}.blob.core.windows.net/{blob_relative_path}'
print(wasbs_path)

# Read parquet data from Azure Blob Storage path
blob_df = spark.read.parquet(wasbs_path)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Declare file name    
file_name = "yellow_taxi"

# Construct destination path
output_parquet_path = f"abfss://1c761afd-85aa-44d7-a7d9-95bf3b9ff1bf@onelake.dfs.fabric.microsoft.com/2b51309f-d966-41c2-abe0-aeea314a0920/Files/Parquet/{file_name}"
print(output_parquet_path)
    
# Load the first 1000 rows as a Parquet file
blob_df.limit(1000).write.mode("overwrite").parquet(output_parquet_path)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

from pyspark.sql.functions import col, to_timestamp, current_timestamp, year, month

# Read the parquet data from the specified path
raw_df = spark.read.parquet(output_parquet_path)   

# Add dataload_datetime column with current timestamp
filtered_df = raw_df.withColumn("dataload_datetime", current_timestamp())

# Filter columns to exclude any NULL values in storeAndFwdFlag
filtered_df = filtered_df.filter(col("storeAndFwdFlag").isNotNull())

# Load the filtered data into a Delta table
table_name = "ordersnotebook"
filtered_df.write.format("delta").mode("append").saveAsTable(table_name)

# Display results
display(filtered_df.limit(1))

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
