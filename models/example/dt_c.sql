{{
    config(
        materialized="view",
        target_database='{{ env_var("DBT_SF_DB_COMMON") }}',
                target_database='{{ env_var("DBT_SF_DB_CURATED") }}',
        schema="eqp_stg",
        post_hook=["delete from {{ env_var('DBT_SF_DB_COMMON') }}.utility.dt_c where  where btch_typ_desc in ('DIM_WRK_RQST'
,'DIM_MNTC_CMPGN'
,'SF_RAW_SBL_CURATED_ORD') and btch_exe_ind = 1 and btch_curr_ind = 1;",
],
       
    )
}}

with source_data as (


select * from {{ source('common_utility','dt_c') }}  zank_junk
where (btch_typ_desc in ('DIM_WRK_RQST'
,'DIM_MNTC_CMPGN'
,'SF_RAW_SBL_CURATED_ORD') and btch_curr_ind = 1) or btch_exe_ind = 1
order by btch_cre_dttm desc


)

select *
from source_data   
   
