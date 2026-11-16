
USE QuebecEnergyBI;
GO

IF OBJECT_ID('wrk.WeatherClean', 'U') IS NULL
BEGIN
    CREATE TABLE wrk.WeatherClean (
        StageRowID BIGINT NOT NULL PRIMARY KEY,

        HourUTC DATETIME2(0) NOT NULL,

        LocalHour DATETIME2(0) NOT NULL,

        TemperatureC DECIMAL(9,3) NOT NULL,

        HumidityPercent DECIMAL(5,2) NOT NULL,

        PrecipitationMM DECIMAL(12,3) NOT NULL
    );
END;
GO
