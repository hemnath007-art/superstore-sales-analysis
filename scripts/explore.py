import pandas as pd

df = pd.read_csv(r"D:\project1\Superstore.csv", encoding="latin-1")
df["Order Date"] = pd.to_datetime(df["Order Date"], format="%d-%m-%Y")
df["Ship Date"] = pd.to_datetime(df["Ship Date"], format="%d-%m-%Y")

print(df.shape)
print(df.head())
df.info()
print(df["Order Date"].min(), df["Order Date"].max())
print(df["Order ID"].nunique(), df["Customer ID"].nunique())