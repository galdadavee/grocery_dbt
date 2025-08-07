{{ config(materialized='table') }}

-- Build a standard calendar date dimension from vars (godatadriven/dbt_date pack)
{{ dbt_date.get_date_dimension(var('dbt_date:start_date'), var('dbt_date:end_date')) }}
