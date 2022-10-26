{% macro get_plan_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "active", "datatype": "boolean"},
    {"name": "aggregate_usage", "datatype": dbt.type_string()},
    {"name": "amount", "datatype": dbt.type_int()},
    {"name": "billing_scheme", "datatype": dbt.type_string()},
    {"name": "created", "datatype": dbt.type_timestamp()},
    {"name": "currency", "datatype": dbt.type_string()},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "interval_count", "datatype": dbt.type_int()},
    {"name": "is_deleted", "datatype": "boolean"},
    {"name": "livemode", "datatype": "boolean"},
    {"name": "metadata", "datatype": dbt.type_string()},
    {"name": "nickname", "datatype": dbt.type_string()},
    {"name": "product_id", "datatype": dbt.type_string()},
    {"name": "tiers_mode", "datatype": dbt.type_string()},
    {"name": "transform_usage_divide_by", "datatype": dbt.type_int()},
    {"name": "transform_usage_round", "datatype": dbt.type_string()},
    {"name": "trial_period_days", "datatype": dbt.type_int()},
    {"name": "usage_type", "datatype": dbt.type_string()}
] %}

{% if target.type in ('bigquery', 'spark', 'databricks') %}
    {{ columns.append( {"name": 'interval', "datatype": dbt.type_string(), "quote": True } ) }}

{% else %}
    {{ columns.append( {"name": "interval", "datatype": dbt.type_string()} ) }}

{% endif %}

{{ return(columns) }}

{% endmacro %}
