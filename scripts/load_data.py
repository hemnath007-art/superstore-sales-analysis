import pandas as pd

CSV_PATH = r"D:\project1\superstore\Superstore.csv"

# 1. Read and clean raw dataset
df = pd.read_csv(CSV_PATH, encoding="latin-1")
df["Order Date"] = pd.to_datetime(df["Order Date"], format="%d-%m-%Y")
df["Ship Date"] = pd.to_datetime(df["Ship Date"], format="%d-%m-%Y")

text_cols = df.select_dtypes(include="object").columns
df[text_cols] = df[text_cols].apply(lambda s: s.str.strip())
df["Postal Code"] = df["Postal Code"].astype(str).str.zfill(5)

# 2. Split into 4 normalized relational tables
customers = df[["Customer ID", "Customer Name", "Segment"]].drop_duplicates("Customer ID").copy()

names = df.groupby("Product ID")["Product Name"].agg(lambda s: s.mode().iloc[0]).reset_index()
products = df[["Product ID", "Category", "Sub-Category"]].drop_duplicates("Product ID").merge(names, on="Product ID")
products = products[["Product ID", "Product Name", "Category", "Sub-Category"]].copy()

orders = df[["Order ID", "Order Date", "Ship Date", "Ship Mode", "Customer ID",
             "Country", "City", "State", "Postal Code", "Region"]].drop_duplicates("Order ID").copy()

order_items = df[["Row ID", "Order ID", "Product ID", "Sales", "Quantity", "Discount", "Profit"]].copy()

# 3. Format column names to snake_case
for t in (customers, products, orders, order_items):
    t.columns = [c.lower().replace(" ", "_").replace("-", "_") for c in t.columns]

print("Data successfully cleaned and transformed in memory!")