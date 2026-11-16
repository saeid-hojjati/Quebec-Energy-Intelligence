
USE QuebecEnergyBI;
GO

CREATE TABLE dw.FactGenerationBySource (
    GenerationFactID BIGINT IDENTITY(1,1)
        PRIMARY KEY,

    DateKey INT NOT NULL,

    HourUTC DATETIME2(0) NOT NULL,

    LocalHour DATETIME2(0) NOT NULL,

    EnergySourceKey TINYINT NOT NULL,

    GenerationMW DECIMAL(20,4) NOT NULL,

    SourceStageRowID BIGINT NOT NULL,

    CONSTRAINT FK_Generation_DimDate
        FOREIGN KEY (DateKey)
        REFERENCES dw.DimDate(DateKey),

    CONSTRAINT FK_Generation_DimEnergySource
        FOREIGN KEY (EnergySourceKey)
        REFERENCES dw.DimEnergySource(EnergySourceKey),

    CONSTRAINT UQ_Generation_Time_Source
        UNIQUE (HourUTC, EnergySourceKey)
);
GO

CREATE INDEX IX_Generation_Date_Source
ON dw.FactGenerationBySource (
    DateKey,
    EnergySourceKey
);
GO
