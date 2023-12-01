# Databricks notebook source
import pandas as pd
import pyflakes
# Dummy data
data = {
    'Name': ['John', 'Jane', 'Bob'],
    'Age': [25, 30, 22],
    'City': ['New York', 'San Francisco', 'Los Angeles']
}

# Create a DataFrame
df = pd.DataFrame(data)

df

# Specify the desired path for the CSV file
#csv_file_path = 'C:\Users\ShyamKumarR\Downloads\test_cicd_output'

# Write the DataFrame to a CSV file
#df.to_csv(csv_file_path, index=False)

#print(f"CSV file created at: {csv_file_path}")

