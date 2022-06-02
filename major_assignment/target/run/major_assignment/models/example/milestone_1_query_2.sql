
  create or replace  view major_assignment.major_assignment.milestone_1_query_2
  
   as (
    

WITH cat AS
(
SELECT nav_date,f.category as category,nav,
	  ROW_NUMBER() OVER(partition by f.category ORDER BY nav ASC) mini_rows,
	  ROW_NUMBER() OVER(partition by f.category ORDER BY nav DESC) maxi_rows
	  FROM 
  "MAJOR_ASSIGNMENT"."MAJOR_ASSIGNMENT"."NAVHISTORY" n join "MAJOR_ASSIGNMENT"."MAJOR_ASSIGNMENT"."MUTUALFUND" m
on n.code=m.code join "MAJOR_ASSIGNMENT"."MAJOR_ASSIGNMENT"."FUNDCATEGORY" f
on m.category_id=f.id
)
SELECT category,
	   MAX(CASE WHEN maxi_rows=1 THEN nav END) max_nav,
	   MAX(CASE WHEN maxi_rows=1 THEN nav_date END) max_nav_date,
	   MAX(CASE WHEN mini_rows=1 THEN nav END) min_nav,
	   MAX(CASE WHEN mini_rows=1 THEN nav_date END) min_nav_date
 FROM Cat WHERE mini_rows=1 OR maxi_rows=1
GROUP BY category
  );
