{{ config(materialized='view') }}

SELECT
    TRIM(order_id) AS order_id,
    TRIM(customer_id) AS customer_id,
    CAST(order_purchase_timestamp AS TIMESTAMP) AS purchase_date,
    TRIM(order_status) AS order_status
FROM bronze.orders
WHERE order_id IS NOT NULL