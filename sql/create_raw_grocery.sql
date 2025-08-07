CREATE SCHEMA raw;

CREATE TABLE raw.grocery_sales (
    customer_id INTEGER,
    store_name TEXT,
    transaction_date DATE,
    aisle TEXT,
    product_name TEXT,
    quantity NUMERIC(10, 2),
    unit_price NUMERIC(10, 2),
    total_amount NUMERIC(10, 2),
    discount_amount NUMERIC(10, 2),
    final_amount NUMERIC(10, 2),
    loyalty_points INTEGER
);
-- Changing the data type of quantity column, since the quantity should be integer
ALTER TABLE raw.grocery_sales
ADD COLUMN quantity_int INTEGER;

UPDATE raw.grocery_sales
SET quantity_int = CAST(quantity AS INTEGER);

ALTER TABLE raw.grocery_sales
DROP COLUMN quantity;

ALTER TABLE raw.grocery_sales
RENAME COLUMN quantity_int TO quantity;