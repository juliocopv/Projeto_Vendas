
{{ config(materialized='table') }}

SELECT
    P.product_id,

    COALESCE(P.product_category_name, 'sem_categoria') AS categoria,

    COUNT(*) AS quantidade_vendida,

    ROUND(SUM(OI.price), 2) AS faturamento,

    RANK()OVER (ORDER BY COUNT(*) DESC) AS ranking

FROM {{ ref('stg_order_items') }} AS OI

INNER JOIN {{ ref('stg_products') }} AS P
    ON OI.product_id = P.product_id

INNER JOIN {{ ref('stg_orders') }} AS O
    ON OI.order_id = O.order_id

WHERE O.order_status = 'delivered'

GROUP BY
    P.product_id,
    P.product_category_name

ORDER BY
    quantidade_vendida DESC
