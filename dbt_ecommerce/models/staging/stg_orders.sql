SELECT
    order_id,
    customer_id,
    CAST(order_purchase_timestamp AS TIMESTAMP) AS purchase_date,
    order_status

FROM bronze.orders
WHERE order_id IS NOT NULL