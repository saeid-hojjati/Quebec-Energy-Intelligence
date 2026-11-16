
USE QuebecEnergyBI;
GO

IF OBJECT_ID('stg.OperationalForecastLoad', 'U') IS NULL
BEGIN
    CREATE TABLE stg.OperationalForecastLoad
    (
        HourUTC DATETIME2(0) NOT NULL,
        ForecastOriginUTC DATETIME2(0) NOT NULL,
        HorizonHours SMALLINT NOT NULL,
        PredictedDemandMW DECIMAL(18,6) NOT NULL,
        Model NVARCHAR(100) NOT NULL
    );
END;
GO

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'stg'
  AND TABLE_NAME = 'OperationalForecastLoad';
