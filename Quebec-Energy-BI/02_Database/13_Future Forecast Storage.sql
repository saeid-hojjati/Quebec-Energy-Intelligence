
USE QuebecEnergyBI;
GO

-- STEP 16: Future Forecast Storage

IF OBJECT_ID('ml.OperationalForecast', 'U') IS NULL
BEGIN
    CREATE TABLE ml.OperationalForecast
    (
        ForecastOriginUTC DATETIME2(0) NOT NULL,
        HourUTC DATETIME2(0) NOT NULL,
        HorizonHours SMALLINT NOT NULL,
        PredictedDemandMW DECIMAL(18,6) NOT NULL,
        Model NVARCHAR(100) NOT NULL,

        CreatedAtUTC DATETIME2(0) NOT NULL
            DEFAULT SYSUTCDATETIME(),

        CONSTRAINT PK_OperationalForecast
            PRIMARY KEY (
                ForecastOriginUTC,
                HourUTC,
                Model
            ),

        CONSTRAINT CK_ForecastHorizon
            CHECK (HorizonHours BETWEEN 1 AND 168),

        CONSTRAINT CK_ForecastValue
            CHECK (PredictedDemandMW >= 0)
    );
END;
GO

-- Validate table creation

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'ml'
ORDER BY TABLE_NAME;
