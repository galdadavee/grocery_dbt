# Grocery Store Sales – dbt Star Schema Project

This project builds a **star schema** data model for a grocery store sales dataset using **dbt** with PostgreSQL.  
It includes **data cleaning**, **staging**, **dimension & fact tables**, a **date dimension**, and automated **data tests**.

---

## 📊 Dataset

- **Source**: [Grocery Store Sales Dataset (Kaggle)](https://www.kaggle.com/datasets/pratyushpuri/grocery-store-sales-dataset-in-2025-1900-record)
- **Size**: 1900 records
- **Raw table**: `raw.grocery_sales`
- **Columns**:
  - `transaction_date`, `store_name`, `product_name`, `aisle`
  - `quantity`, `unit_price`, `final_amount`, `loyalty_points`
  - `customer_id`

---

## 🏗 Data Model

The project follows the **Medallion Architecture** pattern:

### **1. Staging Layer (`stg_`)**
- Cleans raw data (e.g., trims spaces, fixes NULL/empty values)
- Standardizes formats (dates, numeric types)
- Acts as the single source for all downstream models

### **2. Dimension Tables**
- `dim_product` – Unique `(product_name, aisle)` combinations
- `dim_store` – Store names (empty values replaced with `"Unknown Store"`)
- `dim_date` – Generated using [`dbt_date`](https://hub.getdbt.com/godatadriven/dbt_date/latest/) package for the full calendar range

### **3. Fact Table**
- `fct_sales` – Contains sales transactions with foreign keys to:
  - `dim_product`
  - `dim_store`
  - `dim_date`

---

## 🔍 Data Tests

The project includes **generic dbt tests** for:
- **`not_null`** – Key fields in all tables
- **`unique`** – Dimension primary keys
- **`relationships`** – Referential integrity between fact and dimensions

**All tests currently PASS ✅**

---

## ⚙️ Tech Stack

- **dbt-core**: 1.10.6
- **dbt-postgres**: 1.9.0
- **PostgreSQL**: 15
- **pgAdmin 4** for database management
- **Python**: 3.11
- **VS Code** for development
- **dbt-date** package for `dim_date`

---

## 🚀 How to Run

### 1. Clone the repository
```bash
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
