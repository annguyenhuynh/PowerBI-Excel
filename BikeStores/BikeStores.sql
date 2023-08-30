select
	ord.order_id,
	CONCAT(cu.first_name, ' ', cu.last_name) as 'customers',
	cu.city,
	cu.state,
	ord.order_date,
	sum(oi.quantity) as 'total_units',
	sum(oi.quantity *oi.list_price*oi.discount) as 'revenue',
	p.product_name,
	b.brand_name,
	ca.category_name,
	so.store_name,
	CONCAT(sa.first_name, ' ', sa.last_name) as 'sales_rep'

from BikeStores.sales.order_items oi
join BikeStores.sales.orders ord on oi.order_id = ord.order_id
join BikeStores.sales.customers cu on ord.customer_id = cu.customer_id
join BikeStores.sales.stores so on ord.store_id = so.store_id
join BikeStores.sales.staffs sa on ord.staff_id = sa.staff_id
join BikeStores.production.products p on oi.product_id = p.product_id
join BikeStores.production.brands b on p.brand_id = b.brand_id
join BikeStores.production.categories ca on p.category_id = ca.category_id
group by 
	ord.order_id,
	CONCAT(cu.first_name, ' ', cu.last_name),
	cu.city,
	cu.state,
	ord.order_date,
	p.product_name,
	b.brand_name,
	ca.category_name,
	so.store_name,
	CONCAT(sa.first_name, ' ', sa.last_name)
order by ord.order_id;




