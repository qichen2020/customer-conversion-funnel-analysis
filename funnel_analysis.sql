-- Overall customer funnel analysis
-- behavior_type:
-- 1 = click
-- 2 = collect
-- 3 = add_to_cart
-- 4 = purchase

WITH user_stage_flags AS (
    SELECT
        user_id,
        MAX(CASE WHEN behavior_type = 1 THEN 1 ELSE 0 END) AS viewed,
        MAX(CASE WHEN behavior_type = 3 THEN 1 ELSE 0 END) AS added_to_cart,
        MAX(CASE WHEN behavior_type = 4 THEN 1 ELSE 0 END) AS purchased
    FROM user_behavior
    GROUP BY user_id
),

funnel_counts AS (
    SELECT
        COUNT(CASE WHEN viewed = 1 THEN 1 END) AS view_users,
        COUNT(CASE WHEN added_to_cart = 1 THEN 1 END) AS cart_users,
        COUNT(CASE WHEN purchased = 1 THEN 1 END) AS purchase_users
    FROM user_stage_flags
)

SELECT
    view_users,
    cart_users,
    purchase_users,
    ROUND(cart_users * 100.0 / NULLIF(view_users, 0), 2) AS view_to_cart_rate,
    ROUND(purchase_users * 100.0 / NULLIF(cart_users, 0), 2) AS cart_to_purchase_rate,
    ROUND(purchase_users * 100.0 / NULLIF(view_users, 0), 2) AS overall_conversion_rate
FROM funnel_counts;