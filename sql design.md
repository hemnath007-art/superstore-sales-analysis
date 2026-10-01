# Database Design

## Tables

| Table       | Columns                                                                                            | Primary key |
|-------------|----------------------------------------------------------------------------------------------------|-------------|
| customers   | customer_id, customer_name, segment                                                                | customer_id |
| products    | product_id, product_name, category, sub_category                                                   | product_id  |
| orders      | order_id, order_date, ship_date, ship_mode, customer_id, country, city, state, postal_code, region | order_id    |
| order_items | row_id, order_id, product_id, sales, quantity, discount, profit                                    | row_id      |

## Relationships (foreign keys)

- orders.customer_id points to customers.customer_id
- order_items.order_id points to orders.order_id
- order_items.product_id points to products.product_id

## Notes

- One customer can place many orders.
- One order can have many product lines.
- One product can appear on many order lines.