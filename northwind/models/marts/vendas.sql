{{ config(
  materialized='incremental',
  unique_key='id'
  ) }}

select * from {{ref("stg_crm_nova_tabela")}}

{% if is_incremental() %}

  -- Assuming Postgres database
  where updated_at > (select max(updated_at) from {{ this }})

{% endif %}