{{ config(materialized='view') }}

SELECT 
	TRIM(order_id) AS order_id,
	CAST(payment_sequential AS INT) AS payment_sequential,
	LOWER(TRIM(payment_type)) AS payment_type,
	CAST(payment_installments AS INT) AS payment_installments,
	CAST(payment_value AS NUMERIC(12,2)) AS payment_value
FROM {{ source('order_payments') }}
WHERE order_id IS NOT NULL