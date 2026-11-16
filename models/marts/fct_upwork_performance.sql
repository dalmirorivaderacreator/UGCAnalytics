with contracts as (
    select * from {{ ref('stg_contracts') }}
),

transactions as (
    select * from {{ ref('stg_transactions') }}
),

earnings as (
    select * from {{ ref('stg_earnings') }}
),

aggregated_transactions as (
    select
        contract_id,
        sum(amount) as total_transaction_amount,
        count(transaction_id) as total_transactions
    from transactions
    group by 1
),

aggregated_earnings as (
    select
        contract_id,
        sum(amount) as total_earned
    from earnings
    group by 1
)

select
    c.contract_id,
    c.client_hash_id,
    c.start_date,
    c.contract_status,
    c.total_amount as agreed_amount,
    coalesce(t.total_transaction_amount, 0) as transaction_amount,
    coalesce(t.total_transactions, 0) as transaction_count,
    coalesce(e.total_earned, 0) as earned_amount
from contracts c
left join aggregated_transactions t on c.contract_id = t.contract_id
left join aggregated_earnings e on c.contract_id = e.contract_id
