-- Creating a dimension table with store names - we had null values, so we renamed them to Unknown Stores

{{ config(materialized='table') }}

with src as (
    select distinct
        coalesce(nullif(store_name, ''), 'Unknown Store') as store_name
    from {{ ref('stg_grocery_sales') }}
)

select
    store_name
from src
