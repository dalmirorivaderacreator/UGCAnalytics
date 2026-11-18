with raw_earnings as (
    select *
    from read_csv_auto('../data/raw/earnings.csv')
    where "Client" is not null
),

dedup as (
    select
        *,
        row_number() over (
            partition by "Client", "Job name"
            order by "Your earnings" desc
        ) as rn
    from raw_earnings
)

select
    md5(
        lower(trim(cast("Client" as varchar))) || '-' || 
        lower(trim(cast("Job name" as varchar)))
    ) as earning_id,
    {{ hash_pii('"Client"') }} as client_hash_id,
    null as contract_id,
    cast(coalesce("Your earnings", 0) as decimal(10,2)) as amount,
    cast('{{ run_started_at.strftime("%Y-%m-%d") }}' as date) as earning_date
from dedup
where rn = 1
