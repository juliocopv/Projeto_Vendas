{{ config(materialized='view') }}

SELECT
    TRIM(customer_id) AS customer_id,
    TRIM(customer_unique_id) AS customer_unique_id,
    LPAD(CAST(customer_zip_code_prefix AS VARCHAR), 5, '0')
        AS customer_zip_code_prefix,
    LOWER(TRIM(customer_city)) AS customer_city,
    UPPER(TRIM(customer_state)) AS customer_state
FROM {{ source('olist', 'customers') }}
WHERE customer_id IS NOT NULL