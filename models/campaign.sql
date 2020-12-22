with source as (
  select *
  from {{ source('salesforce', 'campaign') }}

), mapping as (

  select {{ mappings(source('log_data', 'sfdc_log_map'), 'campaign') }}
  from source
)
select *
from mapping
