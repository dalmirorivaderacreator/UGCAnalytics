{#-
    Pseudonymizes PII columns with a salted MD5 hash.
    DBT_PII_SALT is required and has no default on purpose: a public default
    salt would let anyone recompute the hash of a known client name.
-#}
{% macro hash_pii(column_name) %}
    MD5(
        LOWER(TRIM(COALESCE(CAST({{ column_name }} AS VARCHAR), 'UNKNOWN_CLIENT')))
        || '{{ env_var("DBT_PII_SALT") }}'
    )
{% endmacro %}
