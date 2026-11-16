# Quebec-Energy-Intelligence
End-to-end Energy Business Intelligence and Machine Learning project using SQL Server, SSIS, Python, and Power BI.

### End-to-End Business Intelligence & Machine Learning Project

An energy analytics project focused on electricity demand, generation, weather impact, and demand forecasting in Québec, Canada.

The solution integrates data engineering, data warehousing, machine learning, and interactive business intelligence reporting.

## Technologies

- **Database:** Microsoft SQL Server 2022
- **ETL:** SQL Server Integration Services (SSIS)
- **Data Analysis & ML:** Python, Pandas, Scikit-learn, Google Colab
- **Data Visualization:** Microsoft Power BI
- **Development:** Visual Studio, SQL Server Management Studio (SSMS)

## Project Architecture

**Data Sources → ETL & Validation → SQL Data Warehouse → Machine Learning → Power BI**

- **Data sources:** Historical electricity demand and generation data from Hydro-Québec, plus historical weather data obtained using Open-Meteo.
- **ETL:** Six SSIS packages supporting staging, transformation, validation, warehouse loading, and ML results integration.
- **Data Warehouse:** SQL Server tables, dimensions, fact tables, analytical views, and data-quality checks.
- **Machine Learning:** Historical demand prediction, 7-day and 14-day forecasting simulations, and backtesting.
- **Reporting:** Five interactive Power BI report pages.

Machine learning results are imported into SQL Server through the project's ETL workflow and incorporated into the Power BI data model.

## Power BI Report

The report includes five interactive pages:

1. **Overview** — Electricity demand trends, peak demand, average generation, and data coverage.
2. **Generation & Energy Mix** — Electricity generation by source, hydroelectric and wind shares, and generation-versus-demand analysis.
3. **Weather & Demand Insights** — Relationships between electricity consumption, temperature, humidity, and precipitation.
4. **AI Demand Forecasting** — Historical actual-versus-predicted demand, model comparisons, and prediction errors.
5. **Future Demand** — Interactive 7-day and 14-day demand forecast simulations with backtesting performance metrics.

## Machine Learning Results

| Model / Horizon | MAE (MW) | RMSE (MW) | R² |
|---|---:|---:|---:|
| Historical one-hour-ahead forecast | 188.51 | 284.01 | 0.9977 |
| 7-day rolling backtest | 1,572.39 | 2,363.64 | 0.8396 |
| 14-day rolling backtest | 1,597.93 | 2,356.18 | 0.8406 |

The 7-day and 14-day models improved MAE against their respective seasonal naïve baselines by approximately **14.77%** and **21.71%**.

**Important:** The future forecast dashboard represents a historical simulation beginning in January 2026, based on data available through the end of 2025. It is not a live operational forecast.

## Data Quality and Limitations

- Historical electricity demand contains some missing hourly observations.
- Electricity generation data has incomplete coverage, notably for 2021.
- Forecasting accuracy depends on the evaluation horizon and historical data availability.
- The current solution uses historical datasets and a manually executed ETL/ML workflow rather than a continuously automated production pipeline.

## Project Status

- SQL Data Warehouse — Completed
- SSIS ETL Packages — Completed
- Machine Learning & Backtesting — Completed
- Five-page Power BI Report — Completed
- Power BI Service Publication — Completed
- Public Portfolio Documentation — In progress

## Portfolio

Screenshots, technical documentation, SQL scripts, SSIS packages, and Python source code will be organized within this repository.

*This is an educational and portfolio project, not an official Hydro-Québec forecasting service.*
