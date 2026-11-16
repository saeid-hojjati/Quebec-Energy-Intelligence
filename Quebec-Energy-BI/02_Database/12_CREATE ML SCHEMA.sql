
USE QuebecEnergyBI;
GO

-- =====================================
-- STEP 10: CREATE ML SCHEMA
-- =====================================

IF SCHEMA_ID('ml') IS NULL
    EXEC('CREATE SCHEMA ml');
GO

-- =====================================
-- TABLE 1: HOURLY FORECAST RESULTS
-- =====================================

IF OBJECT_ID('ml.ForecastHourly', 'U') IS NULL
BEGIN
    CREATE TABLE ml.ForecastHourly
    (
        HourUTC DATETIME2(0) NOT NULL,
        FullDate DATE NOT NULL,
        CalendarYear SMALLINT NOT NULL,
        CalendarMonth TINYINT NOT NULL,
        MonthShort VARCHAR(3) NOT NULL,
        LocalHour TINYINT NOT NULL,

        Model NVARCHAR(100) NOT NULL,

        ActualDemandMW DECIMAL(20,10) NOT NULL,
        PredictedDemandMW DECIMAL(20,10) NOT NULL,
        ErrorMW DECIMAL(20,10) NOT NULL,
        AbsoluteErrorMW DECIMAL(20,10) NOT NULL,

        CONSTRAINT PK_ForecastHourly
            PRIMARY KEY (HourUTC, Model)
    );
END;
GO

-- =====================================
-- TABLE 2: MODEL PERFORMANCE
-- =====================================

IF OBJECT_ID('ml.ModelPerformance', 'U') IS NULL
BEGIN
    CREATE TABLE ml.ModelPerformance
    (
        TestYear SMALLINT NOT NULL,
        Model NVARCHAR(100) NOT NULL,

        MAE DECIMAL(18,6) NOT NULL,
        RMSE DECIMAL(18,6) NOT NULL,
        R2 DECIMAL(12,8) NOT NULL,

        CONSTRAINT PK_ModelPerformance
            PRIMARY KEY (TestYear, Model)
    );
END;
GO

-- =====================================
-- VALIDATION
-- =====================================

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'ml'
ORDER BY TABLE_NAME;
