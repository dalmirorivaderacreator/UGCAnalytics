{{ config(materialized='table') }}

SELECT
    client_hash_id,
    MIN(start_date) AS first_contract_date,
    MAX(start_date) AS last_contract_date,
    COUNT(DISTINCT contract_id) AS total_contracts
FROM {{ ref('stg_contracts') }}
WHERE client_hash_id IS NOT NULL
GROUP BY 1
