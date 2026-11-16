
USE QuebecEnergyBI;
GO

SELECT
    DATEPART(MINUTE, HourUTC) AS MeasurementMinute,
    COUNT(DISTINCT HourUTC) AS TotalTimestamps
FROM dw.FactGenerationBySource
GROUP BY DATEPART(MINUTE, HourUTC)
ORDER BY MeasurementMinute;
