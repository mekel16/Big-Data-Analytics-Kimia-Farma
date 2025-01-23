INSERT INTO `data-analyst-test-448614.intern.analisa_tabel`
(transaction_id, date, branch_id, customer_name, product_id, discount_percentage, rating_transaksi)
SELECT 
  t.transaction_id,
  t.date,
  t.branch_id,
  t.customer_name,
  t.product_id,
  t.discount_percentage,
  t.rating
FROM 
  `data-analyst-test-448614.intern.kf_final_transaction` t
JOIN 
  `data-analyst-test-448614.intern.kf_inventory` i
ON 
  t.product_id = i.product_id;
