{% snapshot snap_contracts %}

{{
    config(
      target_schema='snapshots',
      unique_key='contract_id',
      strategy='check',
      check_cols=['contract_status', 'total_amount'],
    )
}}

SELECT
    contract_id,
    client_hash_id,
    start_date,
    contract_status,
    total_amount
FROM {{ ref('stg_contracts') }}

{% endsnapshot %}
