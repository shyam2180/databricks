# Databricks notebook source
# Import the pandas library as pd
import pandas as pd

# Dummy data
data = {
    'Name': ['John', 'Jane', 'Bob'],
    'Age': [25, 30, 22],
    'City': ['New York', 'San Francisco', 'Los Angeles']
}

# Create a DataFrame using pandas
df = pd.DataFrame(data)

# Print the DataFrame
print(df)
