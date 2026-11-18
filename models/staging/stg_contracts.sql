with raw_contracts as (
    select *
    from read_csv_auto('../data/raw/contracts.csv')
    where "Contract ID" is not null
),

dedup as (
    select
        *,
        row_number() over (
            partition by "Contract ID"
            order by "Start Date" desc
        ) as rn
    from raw_contracts
)

select
    cast("Contract ID" as varchar) as contract_id,
    {{ hash_pii('"Contact person"') }} as client_hash_id,
    cast("Start Date" as date) as start_date,
    cast(coalesce("Fixed Price Amount Agreed", 0) as decimal(10,2)) as total_amount,
    case
        when lower(trim(cast("Status" as varchar))) in ('ended', 'completed') then 'Completed'
        when lower(trim(cast("Status" as varchar))) = 'active' then 'Active'
        when lower(trim(cast("Status" as varchar))) = 'paused' then 'Paused'
        else 'Closed'
    end as contract_status
from dedup
where rn = 1
