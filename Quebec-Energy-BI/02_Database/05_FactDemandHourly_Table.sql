
USE QuebecEnergyBI;
GO

CREATE TABLE dw.FactDemandHourly (
    DemandFactID BIGINT IDENTITY(1,1) PRIMARY KEY,

    DateKey INT NOT NULL,

    HourUTC DATETIME2(0) NOT NULL,

    LocalHour DATETIME2(0) NOT NULL,

    DemandMW DECIMAL(20,4) NOT NULL,

    SourceStageRowID BIGINT NOT NULL,

    CONSTRAINT FK_FactDemand_DimDate
        FOREIGN KEY (DateKey)
        REFERENCES dw.DimDate(DateKey),

    CONSTRAINT UQ_FactDemand_HourUTC
        UNIQUE (HourUTC),

    CONSTRAINT CK_FactDemand_Positive
        CHECK (DemandMW > 0)
);
GO

CREATE INDEX IX_FactDemand_DateKey
ON dw.FactDemandHourly(DateKey);
GO
