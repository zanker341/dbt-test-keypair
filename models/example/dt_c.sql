{{
    config(
        materialized="view",
        target_database='{{ env_var("DBT_SF_DB_COMMON") }}',
       
    )
}}

with source_data as (


select * from {{ source('common_utility','dt_c') }}  dt_c
where btch_exec_ind = 1


)

select *
from source_data   
   
