USE [master]
GO

CREATE DATABASE [AcademyStudentsDB]
GO

USE [AcademyStudentsDB]
GO

-- Tabela StudentUsers
CREATE TABLE StudentUsers (
    Id          UNIQUEIDENTIFIER NOT NULL
                                CONSTRAINT PK_StudentUsers PRIMARY KEY,
    UserName    VARCHAR(100)     NULL,
    IsAdmin     BIT              NOT NULL,
    FirstName   VARCHAR(100)     NULL,
    LastName    VARCHAR(100)     NULL,
    DateOfBirth DATE             NOT NULL,
    Email       VARCHAR(250)     NULL,
    CreatedDate DATETIME         NOT NULL,
    UpdatedDate DATETIME         NOT NULL,
    Deleted     BIT              NOT NULL
);

-- Tabela Certifications
CREATE TABLE Certifications (
    Id          UNIQUEIDENTIFIER NOT NULL
                                CONSTRAINT PK_Certifications PRIMARY KEY,
    CourseId    UNIQUEIDENTIFIER NOT NULL,
    StudentId   UNIQUEIDENTIFIER NOT NULL,
    CreatedDate DATETIME         NOT NULL,
    UpdatedDate DATETIME         NOT NULL,
    Deleted     BIT              NOT NULL,
    CONSTRAINT FK_Certifications_StudentUsers_StudentId 
        FOREIGN KEY (StudentId) REFERENCES StudentUsers (Id) ON DELETE CASCADE
);

-- Tabela Registrations
CREATE TABLE Registrations (
    Id               UNIQUEIDENTIFIER NOT NULL
                                     CONSTRAINT PK_Registrations PRIMARY KEY,
    StudentId        UNIQUEIDENTIFIER NOT NULL,
    CourseId         UNIQUEIDENTIFIER NOT NULL,
    RegistrationTime DATETIME         NOT NULL,
    Status           INT              NOT NULL,
    StudentUserId    UNIQUEIDENTIFIER NULL,
    CreatedDate      DATETIME         NOT NULL,
    UpdatedDate      DATETIME         NOT NULL,
    Deleted          BIT              NOT NULL,
    CONSTRAINT FK_Registrations_StudentUsers_StudentId 
        FOREIGN KEY (StudentId) REFERENCES StudentUsers (Id) ON DELETE CASCADE,
    CONSTRAINT FK_Registrations_StudentUsers_StudentUserId 
        FOREIGN KEY (StudentUserId) REFERENCES StudentUsers (Id)
);

USE [master]
GO
ALTER DATABASE [AcademyStudentsDB] SET  READ_WRITE 
GO

USE [AcademyStudentsDB]
GO

-- Inserindo usuários
INSERT INTO StudentUsers (
    Id, UserName, IsAdmin, FirstName, LastName, DateOfBirth, Email, CreatedDate, UpdatedDate, Deleted
)
VALUES
('11111111-1111-1111-1111-111111111111', 'admin@academyio.com', 1, 'Admin', 'AcademyIO', '1990-05-12', 'admin@academyio.com', GETDATE(), GETDATE(), 0),
('22222222-2222-2222-2222-222222222222', 'aluno1@academyio.com', 0, 'Student1', 'AcademyIO', '1995-08-20', 'aluno1@academyio.com', GETDATE(), GETDATE(), 0),
('33333333-3333-3333-3333-333333333333', 'aluno2@academyio.com', 0, 'Student2', 'AcademyIO', '1998-02-14', 'aluno2@academyio.com', GETDATE(), GETDATE(), 0);