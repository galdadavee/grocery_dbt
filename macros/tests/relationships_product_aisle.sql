{% macro test_relationships_product_aisle(model, dim_model) %}

with fact_rows as (
    select
        product_name,
        aisle
    from {{ model }}
),

dim_rows as (
    select
        product_name,
        aisle
    from {{ dim_model }}
)

select f.*
from fact_rows f
left join dim_rows d
    on f.product_name = d.product_name
   and f.aisle = d.aisle
where d.product_name is null

{% endmacro %}
