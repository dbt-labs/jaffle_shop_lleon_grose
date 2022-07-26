{{
    config(
        materialized = 'table',
        tags=['finance']
    )
}}

-- Use the `ref` function to select from other models

select 
    id,
    sale_amount,
    round(my_ratio * 100, 2) as my_percent,
    current_timestamp as _loaded_at
from 
    {{ ref('my_first_model') }} 
