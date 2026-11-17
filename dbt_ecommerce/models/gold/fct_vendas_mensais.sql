{{config(schema='gold', materialized='table')}}

SELECT
    DATE_TRUNC('month', o.purchase_date) AS mes,

    COUNT(DISTINCT o.order_id) AS quantidade_pedidos,

    SUM(p.payment_value) AS faturamento

FROM {{ ref('stg_orders') }} o

INNER JOIN {{ ref('stg_payments') }} p
    ON o.order_id = p.order_id

WHERE o.order_status = 'delivered'

GROUP BY 1