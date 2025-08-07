-- Creating a dimension table with the distinct product names & which aisles do they belongs, but since we don't have any product_id in the fct_sales table, need to create a surrogate key for it.

with src as (
  select distinct
    product_name,
    aisle
  from {{ ref('stg_grocery_sales') }}
)
select
  {{ dbt_utils.generate_surrogate_key(['product_name','aisle']) }} as product_key,
  product_name,
  aisle
from src

