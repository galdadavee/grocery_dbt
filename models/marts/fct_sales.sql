-- Creating a fact table where we can aggregate the purchases per transactions

{{ config(materialized='table') }}

with s as (
    select
        customer_id,
        coalesce(nullif(store_name, ''), 'Unknown Store') as store_name,
        product_name,
        aisle,
        transaction_date,
        quantity,
        unit_price,
        final_amount,
        loyalty_points
    from {{ ref('stg_grocery_sales') }}
),

p as (
    select
        product_key,
        product_name,
        aisle
    from {{ ref('dim_product') }}
),

st as (
    select
        store_name
    from {{ ref('dim_store') }}
)

select
    -- keys
    p.product_key,               -- FK → dim_product
    st.store_name,               -- natural FK → dim_store

    -- measures & descriptors
    s.customer_id,
    s.transaction_date,
    s.quantity,
    s.unit_price,
    s.final_amount,
    s.loyalty_points

from s
join p
  on s.product_name = p.product_name
 and s.aisle        = p.aisle
join st
  on s.store_name   = st.store_name
