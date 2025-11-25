USE [master]
GO

CREATE DATABASE [AcademyAuthDB]
GO

USE [AcademyAuthDB]
GO

-- AspNetRoles
CREATE TABLE [dbo].[AspNetRoles](
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(256) NULL,
    [NormalizedName] NVARCHAR(256) NULL,
    [ConcurrencyStamp] NVARCHAR(MAX) NULL
);

-- AspNetUsers
CREATE TABLE [dbo].[AspNetUsers](
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    [UserName] NVARCHAR(256) NULL,
    [NormalizedUserName] NVARCHAR(256) NULL,
    [Email] NVARCHAR(256) NULL,
    [NormalizedEmail] NVARCHAR(256) NULL,
    [EmailConfirmed] BIT NOT NULL,
    [PasswordHash] NVARCHAR(MAX) NULL,
    [SecurityStamp] NVARCHAR(MAX) NULL,
    [ConcurrencyStamp] NVARCHAR(MAX) NULL,
    [PhoneNumber] NVARCHAR(MAX) NULL,
    [PhoneNumberConfirmed] BIT NOT NULL,
    [TwoFactorEnabled] BIT NOT NULL,
    [LockoutEnd] DATETIMEOFFSET NULL,
    [LockoutEnabled] BIT NOT NULL,
    [AccessFailedCount] INT NOT NULL
);

-- AspNetRoleClaims
CREATE TABLE [dbo].[AspNetRoleClaims](
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [RoleId] UNIQUEIDENTIFIER NOT NULL,
    [ClaimType] NVARCHAR(MAX) NULL,
    [ClaimValue] NVARCHAR(MAX) NULL,
    CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] 
        FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles]([Id]) ON DELETE CASCADE
);

-- AspNetUserClaims
CREATE TABLE [dbo].[AspNetUserClaims](
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [ClaimType] NVARCHAR(MAX) NULL,
    [ClaimValue] NVARCHAR(MAX) NULL,
    CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] 
        FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers]([Id]) ON DELETE CASCADE
);

-- AspNetUserLogins
CREATE TABLE [dbo].[AspNetUserLogins](
    [LoginProvider] NVARCHAR(128) NOT NULL,
    [ProviderKey] NVARCHAR(128) NOT NULL,
    [ProviderDisplayName] NVARCHAR(MAX) NULL,
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY ([LoginProvider], [ProviderKey]),
    CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] 
        FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers]([Id]) ON DELETE CASCADE
);

-- AspNetUserRoles
CREATE TABLE [dbo].[AspNetUserRoles](
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [RoleId] UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] 
        FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers]([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] 
        FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles]([Id]) ON DELETE CASCADE
);

-- AspNetUserTokens
CREATE TABLE [dbo].[AspNetUserTokens](
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [LoginProvider] NVARCHAR(128) NOT NULL,
    [Name] NVARCHAR(128) NOT NULL,
    [Value] NVARCHAR(MAX) NULL,
    PRIMARY KEY ([UserId], [LoginProvider], [Name]),
    CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] 
        FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers]([Id]) ON DELETE CASCADE
);

USE [master]
GO
ALTER DATABASE [AcademyAuthDB] SET  READ_WRITE 
GO

USE [AcademyAuthDB]
GO

INSERT INTO AspNetUsers (Id,UserName,NormalizedUserName,Email,NormalizedEmail,EmailConfirmed,PasswordHash,SecurityStamp,ConcurrencyStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEnd,LockoutEnabled,AccessFailedCount) VALUES ('11111111-1111-1111-1111-111111111111','admin@academyio.com','ADMIN@ACADEMYIO.COM','admin@academyio.com','ADMIN@ACADEMYIO.COM','1','AQAAAAIAAYagAAAAEAaTqJEs5mErlWeL6MFOmt22uavvUScqZGkMJ9Cj+ipoZbs+RzHOLQFCsSrWzXbrVQ==','1224ff9b-63b8-4d73-a7c6-cdceca31a538','10ae793a-536b-453f-9ea6-48ebce5698e6', NULL,'0','0', NULL,'1','0');
INSERT INTO AspNetUsers (Id,UserName,NormalizedUserName,Email,NormalizedEmail,EmailConfirmed,PasswordHash,SecurityStamp,ConcurrencyStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEnd,LockoutEnabled,AccessFailedCount) VALUES ('22222222-2222-2222-2222-222222222222','aluno1@academyio.com','ALUNO1@ACADEMYIO.COM','aluno1@academyio.com','ALUNO1@ACADEMYIO.COM','1','AQAAAAIAAYagAAAAELIywwEWX3cZVS938f2Xw51JlyUwP1RbUHxRUv9/cZtirL4cWNjw0j66uPNZJSaNkQ==','22222222-2222-2222-2222-222222222222','7c6a8ac1-e45f-422d-9d63-a9c29779c620', NULL,'0','0', NULL,'1','0');
INSERT INTO AspNetUsers (Id,UserName,NormalizedUserName,Email,NormalizedEmail,EmailConfirmed,PasswordHash,SecurityStamp,ConcurrencyStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEnd,LockoutEnabled,AccessFailedCount) VALUES ('33333333-3333-3333-3333-333333333333','aluno2@academyio.com','ALUNO2@ACADEMYIO.COM','aluno2@academyio.com','ALUNO2@ACADEMYIO.COM','1','AQAAAAIAAYagAAAAEPJRYPOhJccqedX6XmNiBflxxlUkskrmBk8ZUquR6rKx11YzWX2oR7bf2563/CsPRg==','aluno2@academyio.com','455ccc45-4d71-4fe2-98f3-a0bc7ab0240c', NULL,'0','0', NULL,'1','0');

INSERT INTO AspNetRoles (Id, Name, NormalizedName, ConcurrencyStamp) VALUES ('1224FF9B-63B8-4D73-A7C6-CDCECA31A538', 'ADMIN', 'ADMIN', '1224ff9b-63b8-4d73-a7c6-cdceca31a538');
INSERT INTO AspNetRoles (Id, Name, NormalizedName, ConcurrencyStamp) VALUES ('F1F54529-5A6A-46AE-8D3E-60E7BFD39EDD', 'STUDENT', 'STUDENT', 'f1f54529-5a6a-46ae-8d3e-60e7bfd39edd');
INSERT INTO AspNetUserRoles (UserId, RoleId) VALUES ('11111111-1111-1111-1111-111111111111','1224FF9B-63B8-4D73-A7C6-CDCECA31A538');
INSERT INTO AspNetUserRoles (UserId, RoleId) VALUES ('22222222-2222-2222-2222-222222222222','F1F54529-5A6A-46AE-8D3E-60E7BFD39EDD');
INSERT INTO AspNetUserRoles (UserId, RoleId) VALUES ('33333333-3333-3333-3333-333333333333','F1F54529-5A6A-46AE-8D3E-60E7BFD39EDD');
                            
