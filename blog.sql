CREATE DATABASE Blog;
GO

USE Blog;

CREATE TABLE Users (
                       UserId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
                       UserName NVARCHAR(50),
                       Email NVARCHAR(60) NOT NULL UNIQUE,
                       PasswordHash VARBINARY(64),
                       Salt VARBINARY(16),
                       Algorithm NVARCHAR(32),
                       IsActive BIT DEFAULT 1,
                       CreatedAt DATETIME DEFAULT GETDATE(),
                       UpdatedAt DATETIME DEFAULT GETDATE(),
                       DeletedAt DATETIME DEFAULT NULL 
);
GO

CREATE TABLE UserLogins (
                            LoginId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
                            UserId UNIQUEIDENTIFIER NOT NULL,
                            Provider NVARCHAR(50) NOT NULL,
                            ProviderUserId NVARCHAR(255) NOT NULL,
                            AccessToken NVARCHAR(MAX) NULL,
                            RefreshToken NVARCHAR(MAX) NULL,
                            TokenExpiresAt DATETIME NULL,
                            FOREIGN KEY (UserId) REFERENCES Users(UserId),
                            UNIQUE (Provider, ProviderUserId)
);
GO

CREATE TABLE Roles (
                       RoleId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
                       RoleName NVARCHAR(50) NOT NULL UNIQUE
);
GO

CREATE TABLE UserRoles (
                           UserId UNIQUEIDENTIFIER NOT NULL,
                           RoleId UNIQUEIDENTIFIER NOT NULL,
                           PRIMARY KEY (UserId, RoleId),
                           FOREIGN KEY (UserId) REFERENCES Users(UserId),
                           FOREIGN KEY (RoleId) REFERENCES Roles(RoleId)
);
GO

CREATE TABLE Post (
                      PostId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
                      UserId UNIQUEIDENTIFIER NOT NULL,
                      Title NVARCHAR(256) NOT NULL,
                      Content NVARCHAR(4096) NOT NULL,
                      IsActive BIT DEFAULT 1,
                      CreatedAt DATETIME DEFAULT GETDATE(),
                      UpdatedAt DATETIME DEFAULT GETDATE(),
                      DeletedAt DATETIME DEFAULT NULL,
                      FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
GO
CREATE TABLE Tag(
    TagId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    PostId UNIQUEIDENTIFIER NOT NULL,
    FOREIGN KEY (PostId) REFERENCES Post(PostId)
)
GO
CREATE TABLE Comment (
                         CommentId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
                         PostId UNIQUEIDENTIFIER NOT NULL,
                         UserId UNIQUEIDENTIFIER NOT NULL,
                         Content NVARCHAR(512),
                         IsActive BIT DEFAULT 1,
                         CreatedAt DATETIME DEFAULT GETDATE(),
                         UpdatedAt DATETIME DEFAULT GETDATE(),
                         DeletedAt DATETIME DEFAULT NULL,
                         FOREIGN KEY (PostId) REFERENCES Post(PostId),
                         FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
GO
