

select f.category,year(nav_date) as year,month(nav_date) as month,avg(nav) as avg_nav,avg(repurchase_price) as avg_repur_price,avg(sale_price) as avg_sale_price
FROM "MAJOR_ASSIGNMENT"."MAJOR_ASSIGNMENT"."NAVHISTORY" n join "MAJOR_ASSIGNMENT"."MAJOR_ASSIGNMENT"."MUTUALFUND" m
on n.code=m.code join "MAJOR_ASSIGNMENT"."MAJOR_ASSIGNMENT"."FUNDCATEGORY" f
on m.category_id=f.id group by f.category,year,month order by f.category,year,month