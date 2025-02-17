CREATE DEFINER=`root`@`localhost` TRIGGER `fact_sales_monthly_AFTER_INSERT` AFTER INSERT ON `fact_sales_monthly` FOR EACH ROW BEGIN
insert into fact_act_est 
                        (date, product_code, customer_code, sold_quantity)
    		values (
				NEW.date, 
        		NEW.product_code, 
        		NEW.customer_code, 
        		NEW.sold_quantity
    		 )
    		on duplicate key update
                         sold_quantity = values(sold_quantity);
	END