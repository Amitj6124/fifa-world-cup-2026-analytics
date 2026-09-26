# FIFA World Cup 2026 Analytics

## Project Overview

This project analyzes FIFA World Cup 2026 data using an end-to-end data analytics workflow.

The project combines API-pulled CSV datasets, SQL analysis, Python analysis, Power BI visualization, and Excel-based data preparation.

The objective is to collect structured football data, prepare it, analyze it, and present useful insights through different analytics tools.

---

## Project Workflow

```text
API Data
   ↓
CSV Data
   ↓
Data Cleaning / Preparation
   ↓
SQL Analysis
   ↓
Python Analysis
   ↓
Power BI Visualization
   ↓
Insights
```

---

## Tools & Technologies Used

- Python
- SQL / MySQL
- Power BI
- Excel
- CSV
- GitHub
- API-based data collection

---

## Project Structure

```text
fifa-world-cup-2026-analytics/
│
└── data/
    │
    ├── games_live.csv
    ├── groups_live.csv
    ├── stadiums_live.csv
    ├── teams_live.csv
    │
    └── sql/
        │
        ├── worldcup2026.sql
        │
        └── python/
            │
            ├── live_wc_pull_no_pandas.py
            │
            └── powerbi/
                │
                ├── Fifa worldcup project.pbix
                │
                └── documentation/
                    │
                    ├── README.md
                    │
                    └── screenshots/
                        │
                        └── Dashboard1.png
```

---

# 1. Data Collection

The project uses structured FIFA World Cup 2026 datasets collected through an API-based workflow.

The collected data is stored in CSV format for further analysis.

### Dataset Files

| File | Description |
|---|---|
| [`games_live.csv`](../../../../games_live.csv) | Match/game-related data |
| [`groups_live.csv`](../../../../groups_live.csv) | Group-stage information |
| [`stadiums_live.csv`](../../../../stadiums_live.csv) | Stadium-related information |
| [`teams_live.csv`](../../../../teams_live.csv) | Team-related information |

These datasets provide the base data used for SQL, Python, and Power BI analysis.

---

# 2. SQL Analysis

The SQL analysis is stored in:

[`worldcup2026.sql`](../../../worldcup2026.sql)

SQL is used to work with the structured FIFA World Cup data and perform analytical queries.

The SQL component helps extract meaningful information from the underlying data before visualization and further analysis.

---

# 3. Python Analysis

The Python component is located at:

[`live_wc_pull_no_pandas.py`](../../live_wc_pull_no_pandas.py)

This script is used as part of the data collection workflow.

The project uses Python to work with the FIFA World Cup data and prepare structured CSV datasets for downstream analysis.

The collected datasets are stored in the `data` directory.

---

# 4. Power BI Dashboard

The Power BI project file is located at:

[`Fifa worldcup project.pbix`](../Fifa%20worldcup%20project.pbix)

Power BI is used to transform the prepared data into interactive visualizations and dashboards.

The dashboard provides a visual representation of the FIFA World Cup 2026 data and allows users to explore the available information more easily.

---

## Dashboard Screenshot

The dashboard screenshot is available here:

[`Dashboard1.png`](screenshots/Dashboard1.png)

![FIFA World Cup 2026 Dashboard](screenshots/Dashboard1.png)

---

# 5. Documentation

This README is the main documentation for the Power BI project.

The documentation folder contains:

- [`README.md`](README.md)
- [`Dashboard1.png`](screenshots/Dashboard1.png)

---

# 6. End-to-End Analytics Pipeline

The complete project follows this workflow:

### Step 1: Data Collection

FIFA World Cup 2026 data is collected using an API-based Python workflow.

### Step 2: Data Storage

The collected information is stored in CSV files:

- [`games_live.csv`](../../../../games_live.csv)
- [`groups_live.csv`](../../../../groups_live.csv)
- [`stadiums_live.csv`](../../../../stadiums_live.csv)
- [`teams_live.csv`](../../../../teams_live.csv)

### Step 3: Data Preparation

The collected data is prepared and organized for analytical use.

### Step 4: SQL Analysis

SQL queries are used to analyze the structured data and extract useful information.

See the complete SQL file:

[`worldcup2026.sql`](../../../worldcup2026.sql)

### Step 5: Python Analysis

Python is used as part of the data collection and analytical workflow.

Python script:

[`live_wc_pull_no_pandas.py`](../../live_wc_pull_no_pandas.py)

### Step 6: Power BI Visualization

The prepared data is used in Power BI to create visual dashboards.

Power BI file:

[`Fifa worldcup project.pbix`](../Fifa%20worldcup%20project.pbix)

### Step 7: Insights

The final dashboard helps convert the underlying FIFA World Cup 2026 data into understandable visual insights.

---

# 7. Key Components

| Component | Technology | File |
|---|---|---|
| Data Collection | Python | [`live_wc_pull_no_pandas.py`](../../live_wc_pull_no_pandas.py) |
| Match Data | CSV | [`games_live.csv`](../../../../games_live.csv) |
| Group Data | CSV | [`groups_live.csv`](../../../../groups_live.csv) |
| Stadium Data | CSV | [`stadiums_live.csv`](../../../../stadiums_live.csv) |
| Team Data | CSV | [`teams_live.csv`](../../../../teams_live.csv) |
| SQL Analysis | SQL | [`worldcup2026.sql`](../../../worldcup2026.sql) |
| Dashboard | Power BI | [`Fifa worldcup project.pbix`](../Fifa%20worldcup%20project.pbix) |
| Dashboard Screenshot | PNG | [`Dashboard1.png`](screenshots/Dashboard1.png) |
| Documentation | Markdown | `README.md` |

---

# 8. Project Objective

The main objective of this project is to demonstrate an end-to-end data analytics workflow using FIFA World Cup 2026 data.

The project brings together:

- Data collection
- Data preparation
- SQL analysis
- Python
- Business intelligence
- Data visualization
- Insight generation

This provides a complete workflow from structured data collection to analytical visualization.

---

# 9. Repository Files

### Data

- [`games_live.csv`](../../../../games_live.csv)
- [`groups_live.csv`](../../../../groups_live.csv)
- [`stadiums_live.csv`](../../../../stadiums_live.csv)
- [`teams_live.csv`](../../../../teams_live.csv)

### SQL

- [`worldcup2026.sql`](../../../worldcup2026.sql)

### Python

- [`live_wc_pull_no_pandas.py`](../../live_wc_pull_no_pandas.py)

### Power BI

- [`Fifa worldcup project.pbix`](../Fifa%20worldcup%20project.pbix)

### Documentation

- [`Dashboard1.png`](screenshots/Dashboard1.png)
- `README.md`

---

## Dashboard Preview

![FIFA World Cup 2026 Dashboard](screenshots/Dashboard1.png)
