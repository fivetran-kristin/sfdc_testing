{% macro mappings(mapping_table, table_name) %}
    
    {% set mappings = dbt_utils.get_query_results_as_dict("select schema_name, source_schema_name from " ~ mapping_table ~ " where table_name = '" ~ table_name ~ "'") %}
    
    {% for map in mappings['schema_name'] %}
    
    {{ map }} as {{ mappings['source_schema_name'][loop.index0] }}
    
    {% if not loop.last %} , {% endif %}
    
    {% endfor %}
{% endmacro %}