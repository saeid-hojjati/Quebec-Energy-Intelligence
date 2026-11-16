/* Québec Energy BI | Phase 1: Staging tables
   SQL Server / SSMS
   Source files:
     historique-demande-electricite-quebec.csv
     historique-production-electricite-quebec.csv
   Raw numeric values and timestamps are deliberately stored as text.
   This script does not remove or overwrite existing tables or records.
*/
USE QuebecEnergyBI;
GO

IF SCHEMA_ID(N'stg') IS NULL
    THROW 50001, 'Schema stg was not found. Create the four project schemas first.', 1;
GO

IF OBJECT_ID(N'stg.DemandRaw', N'U') IS NULL
BEGIN
    CREATE TABLE stg.DemandRaw
    (
        StageRowID   BIGINT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_stg_DemandRaw PRIMARY KEY,
        DateText     NVARCHAR(64) NULL,
        DemandMWText NVARCHAR(80) NULL,
        LoadedAtUTC  DATETIME2(0) NOT NULL
            CONSTRAINT DF_stg_DemandRaw_LoadedAtUTC DEFAULT SYSUTCDATETIME()
    );
END;
GO

IF OBJECT_ID(N'stg.GenerationRaw', N'U') IS NULL
BEGIN
    CREATE TABLE stg.GenerationRaw
    (
        StageRowID          BIGINT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_stg_GenerationRaw PRIMARY KEY,
        DateText            NVARCHAR(64) NULL,
        HydroelectricMWText NVARCHAR(80) NULL,
        WindMWText          NVARCHAR(80) NULL,
        OtherRenewablesMWText NVARCHAR(80) NULL,
        SolarMWText         NVARCHAR(80) NULL,
        ThermalMWText       NVARCHAR(80) NULL,
        TotalMWText         NVARCHAR(80) NULL,
        LoadedAtUTC        DATETIME2(0) NOT NULL
            CONSTRAINT DF_stg_GenerationRaw_LoadedAtUTC DEFAULT SYSUTCDATETIME()
    );
END;
GO

SELECT SCHEMA_NAME(t.schema_id) AS SchemaName,
       t.name AS TableName
FROM sys.tables AS t
WHERE t.schema_id = SCHEMA_ID(N'stg')
ORDER BY t.name;

SELECT N'DemandRaw' AS TableName, COUNT_BIG(*) AS RecordCount
FROM stg.DemandRaw
UNION ALL
SELECT N'GenerationRaw', COUNT_BIG(*)
FROM stg.GenerationRaw;
GO
