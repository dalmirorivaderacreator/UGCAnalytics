{% macro hash_pii(column_name) %}
    MD5(
        LOWER(TRIM(COALESCE(CAST({{ column_name }} AS VARCHAR), 'UNKNOWN_CLIENT'))) 
        || '{{ env_var("DBT_PII_SALT", "default_portfolio_salt_2026") }}'
    )
{% endmacro %}
