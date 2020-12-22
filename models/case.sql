with source_table as (
  select *
  from {{ source('salesforce', 'case') }}

), mapping as (

  select {{ mappings(source('log_data', 'sfdc_log_map'), 'case') }}
  from source_table
)
select *
from mapping