-- Test if we have unique product-aisle(category) combinations.

{% macro test_unique_product_aisle(model) %}

with duplicates as (
    select
        product_name,
        aisle,
        count(*) as cnt
    from {{ model }}
    group by product_name, aisle
    having count(*) > 1
)

select * from duplicates

{% endmacro %}
