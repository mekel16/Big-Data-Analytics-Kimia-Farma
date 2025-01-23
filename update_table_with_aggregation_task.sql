UPDATE `data-analyst-test-448614.intern.analisa_tabel` a
SET 
  product_name = p.product_name,
  price = p.price,
  persentase_gross_laba = CASE
    WHEN p.price <= 50000 THEN 10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 25
    WHEN p.price > 500000 THEN 30
  END,
  nett_sales = p.price * (1 - a.discount_percentage / 100),
  nett_profit = p.price * (1 - a.discount_percentage / 100) * (CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
    WHEN p.price > 500000 THEN 0.30
  END)
FROM 
  `data-analyst-test-448614.intern.kf_product` p
WHERE 
  a.product_id = p.product_id;
