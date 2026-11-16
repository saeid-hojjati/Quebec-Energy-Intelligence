
USE QuebecEnergyBI;
GO

CREATE TABLE etl.DataQualityIssue (
    IssueID BIGINT IDENTITY(1,1) PRIMARY KEY,
    DatasetName NVARCHAR(30) NOT NULL,
    StageRowID BIGINT NOT NULL,
    RawDateText NVARCHAR(64) NULL,
    RawValueText NVARCHAR(80) NULL,
    IssueCode NVARCHAR(80) NOT NULL,
    LoggedAtUTC DATETIME2(0)
        NOT NULL DEFAULT SYSUTCDATETIME()
);
