
{{ config(materialized='table') }}


SELECT
    C.customer_state AS estado,

    COUNT(DISTINCT O.order_id) AS quantidade_pedidos,

    SUM(P.payment_value) AS faturamento_estado

FROM {{ ref('stg_orders') }} AS O

INNER JOIN {{ ref('stg_customers') }} AS C
    ON O.customer_id = C.customer_id

INNER JOIN {{ ref('stg_payments') }} AS P
    ON O.order_id = P.order_id

WHERE O.order_status = 'delivered'

GROUP BY
    C.customer_state

ORDER BY
    faturamento_estado DESC
