USE [master]
GO

CREATE DATABASE [AcademyPaymentsDB]
GO

USE [AcademyPaymentsDB]
GO

CREATE TABLE Payments (
    Id                 UNIQUEIDENTIFIER NOT NULL
                                     CONSTRAINT PK_Payments PRIMARY KEY,
    CourseId           UNIQUEIDENTIFIER NOT NULL,
    StudentId          UNIQUEIDENTIFIER NOT NULL,
    Value              DECIMAL(18,2)    NOT NULL,
    CardName           VARCHAR(250)     NOT NULL,
    CardNumber         VARCHAR(50)      NOT NULL,
    CardExpirationDate VARCHAR(10)      NOT NULL,
    CardCVV            VARCHAR(4)       NOT NULL,
    CreatedDate        DATETIME         NOT NULL,
    UpdatedDate        DATETIME         NOT NULL,
    Deleted            BIT              NOT NULL
);

CREATE TABLE Transactions (
    Id                UNIQUEIDENTIFIER NOT NULL
                                     CONSTRAINT PK_Transactions PRIMARY KEY,
    RegistrationId    UNIQUEIDENTIFIER NOT NULL,
    PaymentId         UNIQUEIDENTIFIER NOT NULL,
    Total             DECIMAL(18,2)    NOT NULL,
    StatusTransaction INT              NOT NULL,
    CreatedDate       DATETIME         NOT NULL,
    UpdatedDate       DATETIME         NOT NULL,
    Deleted           BIT              NOT NULL,
    CONSTRAINT FK_Transactions_Payments_PaymentId FOREIGN KEY (PaymentId)
        REFERENCES Payments (Id) ON DELETE CASCADE
);


USE [master]
GO
ALTER DATABASE [AcademyPaymentsDB] SET  READ_WRITE 
GO

USE [AcademyPaymentsDB]
GO

INSERT INTO Payments (
    Id,
    CourseId,
    StudentId,
    Value,
    CardName,
    CardNumber,
    CardExpirationDate,
    CardCVV,
    CreatedDate,
    UpdatedDate,
    Deleted
)
VALUES (
    '5DD346BF-381C-4F65-9184-45A328D56233',                -- Id
    '66666666-6666-6666-6666-666666666666',                -- CourseId
    '33333333-3333-3333-3333-333333333333',                -- StudentId
    350,                -- Value
    'Aluno Teste 2',        -- CardName
    '6543210987654321',     -- CardNumber (exemplo Visa)
    '11/27',              -- CardExpirationDate
    '321',                  -- CardCVV
    GETDATE(),              -- CreatedDate
    GETDATE(),              -- UpdatedDate
    0                       -- Deleted (false)
);

INSERT INTO Payments (
    Id,
    CourseId,
    StudentId,
    Value,
    CardName,
    CardNumber,
    CardExpirationDate,
    CardCVV,
    CreatedDate,
    UpdatedDate,
    Deleted
)
VALUES (
    '9130A1E1-EE2D-4A53-A8A1-04A4356793E8',                -- Id
    '55555555-5555-5555-5555-555555555555',                -- CourseId
    '22222222-2222-2222-2222-222222222222',                -- StudentId
    500,                -- Value
    'Aluno Teste',        -- CardName
    '1234567890123456',     -- CardNumber (exemplo Visa)
    '12/28',              -- CardExpirationDate
    '123',                  -- CardCVV
    GETDATE(),              -- CreatedDate
    GETDATE(),              -- UpdatedDate
    0                       -- Deleted (false)
);