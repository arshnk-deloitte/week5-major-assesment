select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select category
from major_assignment.major_assignment.milestone_1_query_1
where category is null



      
    ) dbt_internal_test