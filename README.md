# Big-Data-Analytics-Kimia-Farma

## Database Setup and SQL Scripts
---
This sql is made separately because when I run the code in the big query it is very long so I decided not to use CTE or subquery which might be simpler and easier.
---
Below are the detailed explanations and links to each SQL file.

---

## 1. [Create Table.sql](./Create%20Table.sql)

This SQL script creates the `analisa_tabel` table in the database, which will store transaction-related data. The table consists of multiple columns including transaction ID, date, branch information (ID, name, city, province, and rating), product details (ID, name, price, discount, gross profit percentage, nett sales, and profit), as well as transaction ratings.

The structure of the table includes:
- **transaction_id**: Unique identifier for each transaction.
- **date**: The date of the transaction.
- **branch_id**: ID of the branch where the transaction occurred.
- **branch_name**: Name of the branch.
- **kota**: City where the branch is located.
- **provinsi**: Province where the branch is located.
- **rating_cabang**: Rating of the branch.
- **customer_name**: Name of the customer.
- **product_id**: Unique identifier for the product sold.
- **product_name**: Name of the product sold.
- **price**: Price of the product.
- **discount_percentage**: Percentage discount applied to the product.
- **persentase_gross_laba**: Gross profit percentage.
- **nett_sales**: Nett sales value after discounts.
- **nett_profit**: Nett profit after all costs.
- **rating_transaksi**: Rating of the transaction.

---

## 2. [adding_value_branch_kota_porv_rating.sql](./adding_value_branch_kota_porv_rating.sql)

This SQL script updates the `analisa_tabel` table by adding branch-related information such as the branch name, city, province, and branch rating. It uses data from the `kf_kantor_cabang` table and joins it with the `analisa_tabel` based on the `branch_id`. The data from `kf_kantor_cabang` is matched to the corresponding records in `analisa_tabel` to update the fields.

The operation is performed as follows:
- **branch_name**: Updated with the corresponding value from the `kf_kantor_cabang` table.
- **kota**: Updated with the corresponding city from `kf_kantor_cabang`.
- **provinsi**: Updated with the corresponding province.
- **rating_cabang**: Updated with the branch rating from the `kf_kantor_cabang` table.

This ensures that the `analisa_tabel` table is enriched with the correct branch information.

---

## 3. [insert_data_from_existing_table.sql](./insert_data_from_other_table.sql)

This SQL script inserts data into the `analisa_tabel` table from the `kf_final_transaction` and `kf_inventory` tables. It selects specific columns such as transaction ID, date, branch ID, customer name, product ID, discount percentage, and transaction rating, and then inserts these values into the respective columns of the `analisa_tabel`.

The operation is performed as follows:
- The data from `kf_final_transaction` is joined with `kf_inventory` based on the `product_id`.
- **transaction_id**, **date**, **branch_id**, **customer_name**, **product_id**, **discount_percentage**, and **rating_transaksi** are selected from the joined tables.
- The selected data is then inserted into `analisa_tabel`.

This process ensures that the `analisa_tabel` table is populated with relevant transaction data and linked product information.

---

## 4. [update_table_with_aggregation_task.sql](./update_table_with_aggregation_task.sql)

This SQL script updates the `analisa_tabel` table by adding and calculating several fields related to product details and sales performance. The script uses data from the `kf_product` table and performs several updates based on the product price.

The following fields are updated:
- **product_name**: The name of the product is updated from the `kf_product` table.
- **price**: The price of the product is updated.
- **persentase_gross_laba**: Gross profit percentage is calculated based on the product price:
  - Prices ≤ 50,000: 10%
  - 50,001 ≤ Prices ≤ 100,000: 15%
  - 100,001 ≤ Prices ≤ 300,000: 20%
  - 300,001 ≤ Prices ≤ 500,000: 25%
  - Prices > 500,000: 30%
- **nett_sales**: Nett sales are calculated as the product price minus the discount applied.
- **nett_profit**: Nett profit is calculated based on the price and the discount percentage, further adjusted by the gross profit percentage.

This ensures that the `analisa_tabel` is updated with accurate financial data for each transaction, taking into account product details and pricing logic.

---

## 5. [saya_coba_cek_data.sql](./saya_coba_cek_data.sql)

This SQL script is used to check the data in the `analisa_tabel` table by querying for specific records. It retrieves all columns (`*`) from the table where the `customer_name` matches 'Derrick Wright III'. This allows you to verify if the data for this specific customer is correctly stored and updated after all previous operations.

The query helps ensure that the database contains the expected information and allows for easy validation of data integrity.

---

![image](https://github.com/user-attachments/assets/9087fb3f-c494-4436-92b5-ba492b4d560e)

## Visualisation

The final results of the SQL operations can be visualized using Looker. Below are the links to the visualizations, which are created based on the data accessed from BigQuery. These visualizations provide insights derived from the data processed and updated through the SQL scripts.

- [Dashboard: Kimia Farma Business Year 2020-2023](https://lookerstudio.google.com/reporting/33108970-4f9e-443b-a2c8-93b5650b610b)
![image](https://github.com/user-attachments/assets/e9697ff3-70e7-49bb-a126-af098dd7ae72)

---

**Created by [Michael Luwi Pallea']**
