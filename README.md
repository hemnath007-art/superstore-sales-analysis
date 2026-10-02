# Superstore Sales Database and Dashboard

A data analysis project that takes the Superstore retail dataset, designs a
normalized relational database, loads it with Python, and visualizes it in
Power BI.

## Tools used
Python (Pandas, SQLAlchemy), MySQL, Power BI

## What I built
1. Designed a 4-table relational database (`customers`, `products`, `orders`,
   `order_items`) from a single flat sales file, with primary and foreign keys.
2. Cleaned the data in Python: fixed text encoding, parsed dates, restored
   leading zeros in postal codes, and resolved 32 products that had more than
   one recorded name (kept the most common name).
3. Loaded the cleaned tables into MySQL using SQLAlchemy.
4. Wrote SQL queries analyzing sales, profit, and profit margin by category,
   region, and customer.
5. Built a 2-page Power BI dashboard: an Executive Overview with KPI cards,
   trend and category charts; and a Product & Customer Detail page with a
   pivot table and bar chart.

## Project files
- `sql/schema.sql` — table design and creation script
- `sql/queries.sql` — the business-question queries
- `scripts/explore.py` — initial data exploration
- `scripts/load_data.py` — cleans the data and loads it into MySQL
- `superstore_analysis.pbix` — the Power BI dashboard

## Author
S. Hemnath — www.linkedin.com/in/hemnath-sivakumar-176062375

GitHub: https://github.com/hemnath007-art
