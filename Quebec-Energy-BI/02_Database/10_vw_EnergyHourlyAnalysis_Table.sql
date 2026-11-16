
USE QuebecEnergyBI;
GO

CREATE OR ALTER VIEW dw.vw_EnergyHourlyAnalysis
AS

WITH GenerationHourly AS
(
    SELECT
        DATEADD(
            HOUR,
            DATEDIFF(HOUR, 0, g.HourUTC),
            0
        ) AS HourBucketUTC,

        MAX(CASE
            WHEN e.SourceCode = 'HYDRO'
            THEN g.GenerationMW
        END) AS HydroMW,

        MAX(CASE
            WHEN e.SourceCode = 'WIND'
            THEN g.GenerationMW
        END) AS WindMW,

        MAX(CASE
            WHEN e.SourceCode = 'OTHER'
            THEN g.GenerationMW
        END) AS OtherMW,

        MAX(CASE
            WHEN e.SourceCode = 'SOLAR'
            THEN g.GenerationMW
        END) AS SolarMW,

        MAX(CASE
            WHEN e.SourceCode = 'THERMAL'
            THEN g.GenerationMW
        END) AS ThermalMW,

        SUM(g.GenerationMW) AS TotalGenerationMW

    FROM dw.FactGenerationBySource AS g

    INNER JOIN dw.DimEnergySource AS e
        ON g.EnergySourceKey = e.EnergySourceKey

    GROUP BY
        DATEADD(
            HOUR,
            DATEDIFF(HOUR, 0, g.HourUTC),
            0
        )
)

SELECT
    d.HourUTC,
    d.LocalHour,
    d.DateKey,

    dt.FullDate,
    dt.CalendarYear,
    dt.CalendarQuarter,
    dt.CalendarMonth,
    dt.DayOfMonth,
    dt.IsoDayOfWeek,
    dt.IsWeekend,

    DATEPART(HOUR, d.LocalHour) AS HourOfDay,

    d.DemandMW,

    g.HydroMW,
    g.WindMW,
    g.OtherMW,
    g.SolarMW,
    g.ThermalMW,
    g.TotalGenerationMW,

    w.TemperatureC,
    w.HumidityPercent,
    w.PrecipitationMM,

    CASE
        WHEN g.HourBucketUTC IS NOT NULL
        THEN 1 ELSE 0
    END AS HasGeneration,

    CASE
        WHEN w.HourUTC IS NOT NULL
        THEN 1 ELSE 0
    END AS HasWeather

FROM dw.FactDemandHourly AS d

INNER JOIN dw.DimDate AS dt
    ON d.DateKey = dt.DateKey

LEFT JOIN GenerationHourly AS g
    ON d.HourUTC = g.HourBucketUTC

LEFT JOIN dw.FactWeatherHourly AS w
    ON d.HourUTC = w.HourUTC;
GO
