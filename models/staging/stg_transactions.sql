with raw_transactions as (
    select *
    from read_csv_auto('../data/raw/transactions.csv')
    where "Transaction ID" is not null
),

dedup as (
    select
        *,
        row_number() over (
            partition by "Transaction ID"
            order by "Date" desc
        ) as rn
    from raw_transactions
)

select
    cast("Transaction ID" as varchar) as transaction_id,
    cast("Ref ID" as varchar) as contract_id,
    cast(coalesce("Amount $", 0) as decimal(10,2)) as amount,
    cast(try_strptime("Date", '%m/%d/%Y') as date) as transaction_date,
    lower(trim(cast("Transaction type" as varchar))) as transaction_type
from dedup
where rn = 1
