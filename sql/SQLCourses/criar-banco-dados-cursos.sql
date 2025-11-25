USE [master]
GO

CREATE DATABASE [AcademyCoursesDB]
GO

USE [AcademyCoursesDB]
GO

CREATE TABLE Courses (
    Id           UNIQUEIDENTIFIER NOT NULL 
                 CONSTRAINT PK_Courses PRIMARY KEY DEFAULT NEWID(),
    Name         NVARCHAR(200) NULL,
    Description  NVARCHAR(MAX) NULL,
    Price        DECIMAL(18,2) NOT NULL,
    CreatedDate  DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    UpdatedDate  DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    Deleted      BIT NOT NULL DEFAULT 0
);

CREATE TABLE Lessons (
    Id           UNIQUEIDENTIFIER NOT NULL 
                 CONSTRAINT PK_Lessons PRIMARY KEY DEFAULT NEWID(),
    Name         NVARCHAR(200) NULL,
    Subject      NVARCHAR(200) NULL,
    TotalHours   DECIMAL(10,2) NOT NULL,
    CourseId     UNIQUEIDENTIFIER NOT NULL,
    CreatedDate  DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    UpdatedDate  DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    Deleted      BIT NOT NULL DEFAULT 0,
    CONSTRAINT FK_Lessons_Courses_CourseId 
        FOREIGN KEY (CourseId) REFERENCES Courses(Id) ON DELETE CASCADE
);

CREATE TABLE ProgressLessons (
    Id                 UNIQUEIDENTIFIER NOT NULL 
                       CONSTRAINT PK_ProgressLessons PRIMARY KEY DEFAULT NEWID(),
    StudentId          UNIQUEIDENTIFIER NOT NULL,
    LessonId           UNIQUEIDENTIFIER NOT NULL,
    ProgressionStatus  INT NOT NULL,
    CreatedDate        DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    UpdatedDate        DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    Deleted            BIT NOT NULL DEFAULT 0,
    CONSTRAINT FK_ProgressLessons_Lessons_LessonId 
        FOREIGN KEY (LessonId) REFERENCES Lessons(Id) ON DELETE CASCADE
);


USE [master]
GO
ALTER DATABASE [AcademyCoursesDB] SET  READ_WRITE 
GO

USE [AcademyCoursesDB]
GO

-- Courses
INSERT INTO Courses (Id, Name, Description, Price, CreatedDate, UpdatedDate, Deleted)
VALUES ('55555555-5555-5555-5555-555555555555', 'Curso de SQL Server', 'Aprenda fundamentos e práticas avançadas de SQL Server', 499.90, SYSUTCDATETIME(), SYSUTCDATETIME(), 0);

INSERT INTO Courses (Id, Name, Description, Price, CreatedDate, UpdatedDate, Deleted)
VALUES ('66666666-6666-6666-6666-666666666666', 'Curso de Python', 'Programação em Python para iniciantes', 299.00, SYSUTCDATETIME(), SYSUTCDATETIME(), 0);
    
-- Lessons
INSERT INTO Lessons (Id, Name, Subject, TotalHours, CourseId, CreatedDate, UpdatedDate, Deleted)
VALUES ('AAB9D859-365F-4ED1-BED8-5DC1E6D6A9A7', 'Introdução ao SQL Server', 'Banco de Dados', 10, '55555555-5555-5555-5555-555555555555', SYSUTCDATETIME(), SYSUTCDATETIME(), 0);

INSERT INTO Lessons (Id, Name, Subject, TotalHours, CourseId, CreatedDate, UpdatedDate, Deleted)
VALUES ('BEE1DB84-FECC-4EE0-84C1-505789674C62', 'Consultas Avançadas', 'Banco de Dados', 15, '55555555-5555-5555-5555-555555555555', SYSUTCDATETIME(), SYSUTCDATETIME(), 0);

INSERT INTO Lessons (Id, Name, Subject, TotalHours, CourseId, CreatedDate, UpdatedDate, Deleted)
VALUES ('99AC83C4-60CC-4BE8-B78F-3B6CC08C068C', 'Introdução ao Python', 'Programação Python', 30, '66666666-6666-6666-6666-666666666666', SYSUTCDATETIME(), SYSUTCDATETIME(), 0);

INSERT INTO Lessons (Id, Name, Subject, TotalHours, CourseId, CreatedDate, UpdatedDate, Deleted)
VALUES ('B9ACB1B4-E4FB-4DA5-9F8F-3124E083C759', 'Python Avançadas', 'Programação Python', 40, '66666666-6666-6666-6666-666666666666', SYSUTCDATETIME(), SYSUTCDATETIME(), 0);