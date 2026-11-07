
SELECT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state

FROM bronze.customers
WHERE customer_id IS NOT NULL