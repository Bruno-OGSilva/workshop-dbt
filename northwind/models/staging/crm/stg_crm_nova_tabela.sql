with renamed as (
    select
         category_id as id,
         category_name as name,
         description,
         updated_at
    from
         {{ref("raw_crm_nova_tabela")}}
)

select * from renamed