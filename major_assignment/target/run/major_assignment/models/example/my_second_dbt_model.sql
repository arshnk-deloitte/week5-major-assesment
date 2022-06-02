
  create or replace  view major_assignment.major_assignment.my_second_dbt_model
  
   as (
    -- Use the `ref` function to select from other models

select *
from major_assignment.major_assignment.my_first_dbt_model
where id = 1
  );
