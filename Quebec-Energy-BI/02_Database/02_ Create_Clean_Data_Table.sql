
USE QuebecEnergyBI;
GO

CREATE TABLE wrk.DemandClean (
    StageRowID BIGINT PRIMARY KEY,
    LocalHour DATETIME2(0) NOT NULL,
    HourUTC DATETIME2(0) NOT NULL,
    DemandMW DECIMAL(20,4) NOT NULL
);
GO

CREATE TABLE wrk.GenerationClean (
    StageRowID BIGINT PRIMARY KEY,
    LocalHour DATETIME2(0) NOT NULL,
    HourUTC DATETIME2(0) NOT NULL,
    HydroelectricMW DECIMAL(20,4) NULL,
    WindMW DECIMAL(20,4) NULL,
    OtherRenewablesMW DECIMAL(20,4) NULL,
    SolarMW DECIMAL(20,4) NULL,
    ThermalMW DECIMAL(20,4) NULL,
    TotalMW DECIMAL(20,4) NOT NULL
);
GO
