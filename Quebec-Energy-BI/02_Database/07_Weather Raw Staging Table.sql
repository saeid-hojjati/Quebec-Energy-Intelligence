
USE QuebecEnergyBI;
GO

-- Create Weather Raw Staging Table
IF OBJECT_ID('stg.WeatherRaw', 'U') IS NULL
BEGIN
    CREATE TABLE stg.WeatherRaw (
        StageRowID BIGINT IDENTITY(1,1)
            PRIMARY KEY,

        HourUTCText NVARCHAR(64) NULL,

        TemperatureCText NVARCHAR(80) NULL,

        HumidityPercentText NVARCHAR(80) NULL,

        PrecipitationMMText NVARCHAR(80) NULL,

        LoadedAtUTC DATETIME2(0)
            NOT NULL
            DEFAULT SYSUTCDATETIME()
    );
END;
GO
