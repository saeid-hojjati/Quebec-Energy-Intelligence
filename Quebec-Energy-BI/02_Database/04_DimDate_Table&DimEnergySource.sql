
USE QuebecEnergyBI;
GO

-- =====================================
-- DIMENSION 1: DATE
-- =====================================

CREATE TABLE dw.DimDate (
    DateKey INT NOT NULL PRIMARY KEY,
    FullDate DATE NOT NULL UNIQUE,
    CalendarYear SMALLINT NOT NULL,
    CalendarQuarter TINYINT NOT NULL,
    CalendarMonth TINYINT NOT NULL,
    DayOfMonth TINYINT NOT NULL,
    IsoDayOfWeek TINYINT NOT NULL,
    IsWeekend BIT NOT NULL
);
GO

-- =====================================
-- DIMENSION 2: ENERGY SOURCE
-- =====================================

CREATE TABLE dw.DimEnergySource (
    EnergySourceKey TINYINT NOT NULL PRIMARY KEY,
    SourceCode VARCHAR(30) NOT NULL UNIQUE,
    SourceName NVARCHAR(80) NOT NULL,
    IsRenewable BIT NOT NULL
);
GO
