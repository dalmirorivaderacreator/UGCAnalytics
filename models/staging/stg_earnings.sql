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
    md5(cast("Client" as varchar) || '-' || cast("Job name" as varchar)) as earning_id,
    null as contract_id,
    cast(coalesce("Your earnings", 0) as decimal(10,2)) as amount,
    current_date as earning_date
from dedup
where rn = 1
