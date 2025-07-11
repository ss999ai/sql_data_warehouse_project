/*
===============================================================================
DDL and Data Load Script: 'bronze' Schema
===============================================================================

Purpose:
    This script performs the following operations for tables within the 'bronze' schema:
      - Drops existing tables if they already exist
      - Recreates the table structures (DDL)
      - Truncates the tables (if not dropped)
      - Loads data into the tables from external CSV files using client-side import

Usage:
    Use this script to fully reset and populate the tables in the 'bronze' schema.

Warning:
    ⚠️ All existing tables and their data in the 'bronze' schema will be permanently removed.
    Ensure that necessary backups are in place before executing this script.

===============================================================================
*/


==================================================

DROP TABLE IF EXISTS bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(50),
    cst_create_date DATE
);

==================================================

DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INT,
    prd_line VARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE
);

==================================================

DROP TABLE IF EXISTS bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);

==================================================

DROP TABLE IF EXISTS bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 (
    cid VARCHAR(50),
    cntry VARCHAR(50)
);

==================================================

DROP TABLE IF EXISTS bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 (
    cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(50)
);

==================================================

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2 (
    id VARCHAR(50),
    cat VARCHAR(50),
    subcat VARCHAR(50),
    maintenance VARCHAR(50)
);


==================================================
==================================================
==================================================


### Truncate and Import

==================================================

TRUNCATE TABLE bronze.crm_cust_info;
\copy bronze.crm_cust_info 
FROM 'C:/path/to/your/csv/cust_info.csv' 
DELIMITER ',' CSV HEADER;

==================================================

-- Truncate and Import: crm_prd_info

TRUNCATE TABLE bronze.crm_prd_info;
\copy bronze.crm_prd_info 
FROM 'C:/path/to/your/csv/prd_info.csv' 
DELIMITER ',' CSV HEADER;

==================================================

-- Truncate and Import: crm_sales_details

TRUNCATE TABLE bronze.crm_sales_details;
\copy bronze.crm_sales_details 
FROM 'C:/path/to/your/csv/sales_details.csv' 
DELIMITER ',' CSV HEADER;

==================================================

-- Truncate and Import: erp_loc_a101

TRUNCATE TABLE bronze.erp_loc_a101;
\copy bronze.erp_loc_a101 
FROM 'C:/path/to/your/csv/loc_a101.csv' 
DELIMITER ',' CSV HEADER;

==================================================

-- Truncate and Import: erp_cust_az12

TRUNCATE TABLE bronze.erp_cust_az12;
\copy bronze.erp_cust_az12 
FROM 'C:/path/to/your/csv/cust_az12.csv' 
DELIMITER ',' CSV HEADER;

==================================================

-- Truncate and Import: erp_px_cat_g1v2

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
\copy bronze.erp_px_cat_g1v2 
FROM 'C:/path/to/your/csv/PX_CAT_G1V2.csv' 
DELIMITER ',' CSV HEADER;


