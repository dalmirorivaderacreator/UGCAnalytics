{{ config(materialized='table') }}

select
    client_hash_id,
    left(client_hash_id, 8) as client_short_id,
    min(start_date) as first_contract_date,
    max(start_date) as last_contract_date,
    count(distinct contract_id) as total_contracts
from {{ ref('stg_contracts') }}
where client_hash_id is not null
group by 1, 2
