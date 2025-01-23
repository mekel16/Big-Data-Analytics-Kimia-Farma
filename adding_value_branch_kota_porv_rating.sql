UPDATE `data-analyst-test-448614.intern.analisa_tabel` a
SET 
  branch_name = b.branch_name,
  kota = b.kota,
  provinsi = b.provinsi,
  rating_cabang = b.rating
FROM 
  `data-analyst-test-448614.intern.kf_kantor_cabang` b
WHERE 
  CAST(a.branch_id AS STRING) = CAST(b.branch_id AS STRING);
