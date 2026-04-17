-- =====================================================
-- Category-level Funnel Analysis
-- =====================================================

-- Step 1: Deduplicate item table (avoid join duplication)
WITH item_dedup AS (
    SELECT DISTINCT
        item_id,
        item_category
    FROM item_info
),

-- Step 2: Join user behavior with item metadata
joined_data AS (
    SELECT
        u.user_id,
        u.item_id,
        u.behavior_type,
        d.item_category
    FROM user_behavior u
    JOIN item_dedup d
        ON u.item_id = d.item_id
),

-- Step 3: Build user-category level flags
user_category_stage_flags AS (
    SELECT
        user_id,
        item_category,

        -- Whether user viewed items in this category
        MAX(CASE WHEN behavior_type = 1 THEN 1 ELSE 0 END) AS viewed,

        -- Whether user added to cart
        MAX(CASE WHEN behavior_type = 3 THEN 1 ELSE 0 END) AS added_to_cart,

        -- Whether user purchased
        MAX(CASE WHEN behavior_type = 4 THEN 1 ELSE 0 END) AS purchased

    FROM joined_data
    GROUP BY user_id, item_category
)

-- Step 4: Aggregate funnel metrics
SELECT
    item_category,

    COUNT(CASE WHEN viewed = 1 THEN 1 END) AS view_users,
    COUNT(CASE WHEN added_to_cart = 1 THEN 1 END) AS cart_users,
    COUNT(CASE WHEN purchased = 1 THEN 1 END) AS purchase_users,

    -- Conversion Rates
    ROUND(
        COUNT(CASE WHEN added_to_cart = 1 THEN 1 END) * 100.0 /
        NULLIF(COUNT(CASE WHEN viewed = 1 THEN 1 END), 0), 2
    ) AS view_to_cart_rate,

    ROUND(
        COUNT(CASE WHEN purchased = 1 THEN 1 END) * 100.0 /
        NULLIF(COUNT(CASE WHEN added_to_cart = 1 THEN 1 END), 0), 2
    ) AS cart_to_purchase_rate,

    ROUND(
        COUNT(CASE WHEN purchased = 1 THEN 1 END) * 100.0 /
        NULLIF(COUNT(CASE WHEN viewed = 1 THEN 1 END), 0), 2
    ) AS overall_conversion_rate

FROM user_category_stage_flags
GROUP BY item_category

-- Sort by worst-performing categories (for business insight)
ORDER BY overall_conversion_rate ASC;