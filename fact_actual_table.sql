-- Create fact_act_est table
	drop table if exists fact_act_est;

	create table fact_act_est    -- an alternate way of creating tables rather than manually..the table will then appear in the database.
	(
        	select 
                    s.date as date,
                    s.fiscal_year as fiscal_year,
                    s.product_code as product_code,
                    s.customer_code as customer_code,
                    s.sold_quantity as sold_quantity,
                    f.forecast_quantity as forecast_quantity
        	from 
                    fact_sales_monthly s
        	left join fact_forecast_monthly f 
        	using (date, customer_code, product_code)
	)
	Union #using union to full join, recall that the actual and forecast records are different as forecast has more records/rows which makes inner join (join) not appropriate.
	(
        	select 
                    f.date as date,
                    f.fiscal_year as fiscal_year,
                    f.product_code as product_code,
                    f.customer_code as customer_code,
                    s.sold_quantity as sold_quantity,
                    f.forecast_quantity as forecast_quantity
        	from 
		    fact_forecast_monthly  f
        	left join fact_sales_monthly s 
        	using (date, customer_code, product_code) #since the column names are identical and we are joining with more than one keys, the usage of USING makes things faster.
	);
    
    SET SQL_SAFE_UPDATES = 0;

	update fact_act_est
	set sold_quantity = 0
	where sold_quantity is null; #done to replace null values created due to full join.

	update fact_act_est
	set forecast_quantity = 0
	where forecast_quantity is null;
    
    SET SQL_SAFE_UPDATES = 1;  #Re enable after update

 