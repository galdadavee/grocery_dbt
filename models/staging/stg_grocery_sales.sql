with source as (
    select *
    from {{ source('raw', 'grocery_sales') }}
),

renamed as (
    select
        customer_id,
        store_name,
        transaction_date,
        aisle,
        product_name,
        quantity,
        unit_price,
        total_amount,
        discount_amount,
        final_amount,
        loyalty_points
    from source
)

select * from renamed