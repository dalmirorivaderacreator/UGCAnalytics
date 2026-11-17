# 📊 End-to-End Upwork & UGC Financial Analytics Pipeline

An automated Analytics Engineering pipeline built with **dbt Core**, **DuckDB**, and **Power BI** to transform raw exports into a governed Star Schema for executive reporting.

## 🎯 Business Context & Solution
Resolves manual reporting bottlenecks, metric ambiguity, and PII privacy gaps by establishing a Single Source of Truth (SSOT) via dimensional modeling, MD5 hashing, and automated quality gates.

* **Stack:** DuckDB, dbt Core (`dbt-duckdb`), 19 dbt tests + SCD Type 2 Snapshots, Power BI Desktop, WSL2 Debian & Git.
* **Architecture:** Raw CSVs ──▶ Staging Views (`stg_contracts`, `stg_earnings`, `stg_transactions`) ──▶ Star Schema Marts (`fct_upwork_performance`, `dim_clients`, `dim_dates`) ──▶ Power BI.
* **Governance:** SCD Type 2 snapshot (`snap_contracts`), primary/foreign key tests, and domain validation.

## 🚀 Quickstart
1. Clone repository and set up virtual environment:
   ```bash
   git clone https://github.com
   cd ugc_analitica_analytics
   python3 -m venv venv && source venv/bin/activate
   pip install dbt-duckdb
   ```
2. Build models, snapshots, and run all 19 tests:
   ```bash
   dbt build
   ```

## 🖼️ Executive Dashboard Preview
![Power BI Dashboard Preview](assets/dashboard_preview.png)
