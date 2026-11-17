{{ config(materialized='table') }}

WITH date_bounds AS (
    SELECT
        COALESCE(MIN(start_date), CURRENT_DATE) AS min_date,
        COALESCE(MAX(start_date), CURRENT_DATE) AS max_date
    FROM {{ ref('stg_contracts') }}
),

date_spine AS (
    SELECT UNNEST(generate_series(min_date, max_date, INTERVAL 1 DAY))::DATE AS date_day
    FROM date_bounds
)

SELECT
    date_day,
    EXTRACT(YEAR FROM date_day) AS year,
    EXTRACT(MONTH FROM date_day) AS month,
    EXTRACT(QUARTER FROM date_day) AS quarter,
    DAYNAME(date_day) AS day_name
FROM date_spine
