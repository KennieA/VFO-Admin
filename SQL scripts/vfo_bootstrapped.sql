USE [master]
GO
/****** Object:  Database [VFO_new]    Script Date: 10-04-2014 13:05:07 ******/
CREATE DATABASE [VFO_new]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fysio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPR2012\MSSQL\DATA\VFO_new.mdf' , SIZE = 33024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Fysio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPR2012\MSSQL\DATA\VFO_new_1.ldf' , SIZE = 22464KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VFO_new] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VFO_new].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VFO_new] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VFO_new] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VFO_new] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VFO_new] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VFO_new] SET ARITHABORT OFF 
GO
ALTER DATABASE [VFO_new] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VFO_new] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [VFO_new] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VFO_new] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VFO_new] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VFO_new] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VFO_new] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VFO_new] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VFO_new] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VFO_new] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VFO_new] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VFO_new] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VFO_new] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VFO_new] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VFO_new] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VFO_new] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VFO_new] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VFO_new] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VFO_new] SET RECOVERY FULL 
GO
ALTER DATABASE [VFO_new] SET  MULTI_USER 
GO
ALTER DATABASE [VFO_new] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VFO_new] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VFO_new] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VFO_new] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [VFO_new]
GO
/****** Object:  User [Administrator]    Script Date: 10-04-2014 13:05:07 ******/
CREATE USER [Administrator] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin]    Script Date: 10-04-2014 13:05:07 ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Administrator]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10-04-2014 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DetailsId] [int] NOT NULL,
	[Score] [float] NOT NULL,
	[UserId] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ExerciseCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryDetails]    Script Date: 10-04-2014 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryDescription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 10-04-2014 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CultureCode] [nchar](5) NOT NULL,
	[Language] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exercise]    Script Date: 10-04-2014 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exercise](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DetailsId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Score] [float] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Attempted] [bit] NOT NULL,
 CONSTRAINT [PK_Exercise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExerciseDetails]    Script Date: 10-04-2014 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExerciseDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SceneFunction] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[OrderNr] [int] NULL,
 CONSTRAINT [PK_ExerciseDescription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupToExerciseRight]    Script Date: 10-04-2014 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupToExerciseRight](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[ExerciseId] [int] NOT NULL,
	[IsChosen] [bit] NOT NULL,
 CONSTRAINT [PK_ExercisePackage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 10-04-2014 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[UserId] [int] NULL,
	[Message] [nvarchar](500) NULL,
	[Type] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[OtherInfo] [nvarchar](500) NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResponsibleToUserGroup]    Script Date: 10-04-2014 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponsibleToUserGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupId] [int] NOT NULL,
	[ResponsibleUserId] [int] NOT NULL,
 CONSTRAINT [PK_ResponsibleToUserGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TemplateToPageRight]    Script Date: 10-04-2014 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemplateToPageRight](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserTemplateId] [int] NOT NULL,
	[PageId] [int] NOT NULL,
	[IsAllowed] [bit] NOT NULL,
 CONSTRAINT [PK_UserGroupSite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 10-04-2014 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Salt] [char](12) NULL,
	[Phone] [int] NULL,
	[UserGroupId] [int] NOT NULL,
	[SalaryNumber] [int] NULL,
	[CountryId] [int] NULL,
	[UserTemplateId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Username] [nvarchar](150) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 10-04-2014 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
	[UserGroupParentId] [int] NULL,
	[CustomerId] [int] NULL,
	[PackageId] [int] NULL,
	[Path] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserLevels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTemplate]    Script Date: 10-04-2014 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](150) NOT NULL,
	[Created] [date] NOT NULL,
	[TemplateLevel] [int] NOT NULL,
	[ParentTemplateId] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserGroupTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[CategoryDetails] ON 

INSERT [dbo].[CategoryDetails] ([Id], [Name]) VALUES (1, N'Category11')
INSERT [dbo].[CategoryDetails] ([Id], [Name]) VALUES (6, N'Category12')
INSERT [dbo].[CategoryDetails] ([Id], [Name]) VALUES (8, N'Category13')
INSERT [dbo].[CategoryDetails] ([Id], [Name]) VALUES (9, N'Category14')
INSERT [dbo].[CategoryDetails] ([Id], [Name]) VALUES (10, N'Category15')
INSERT [dbo].[CategoryDetails] ([Id], [Name]) VALUES (11, N'Category16')
SET IDENTITY_INSERT [dbo].[CategoryDetails] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name], [CultureCode], [Language]) VALUES (1, N'Denmark', N'da-dk', N'Danish')
INSERT [dbo].[Country] ([Id], [Name], [CultureCode], [Language]) VALUES (2, N'US', N'en-US', N'English')
INSERT [dbo].[Country] ([Id], [Name], [CultureCode], [Language]) VALUES (3, N'Sverige', N'sv-SE', N'Svenska')
INSERT [dbo].[Country] ([Id], [Name], [CultureCode], [Language]) VALUES (4, N'Norge', N'nb-NO', N'Norsk')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Exercise] ON 
SET IDENTITY_INSERT [dbo].[Exercise] OFF
SET IDENTITY_INSERT [dbo].[ExerciseDetails] ON 

INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (1, N'Exercise101', 1, 1, 1)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (2, N'Exercise102', 2, 1, 2)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (3, N'Exercise201', 10, 6, 1)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (4, N'Exercise202', 21, 6, 2)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (5, N'Exercise203', 30, 6, 3)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (6, N'Exercise204', 31, 6, 4)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (7, N'Exercise205', 6, 6, 5)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (9, N'Exercise206', 18, 6, 7)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (10, N'Exercise207', 24, 6, 8)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (11, N'Exercise208', 3, 6, 9)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (12, N'Exercise209', 27, 6, 10)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (13, N'Exercise210', 28, 6, 11)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (14, N'Exercise301', 11, 8, 1)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (15, N'Exercise302', 22, 8, 2)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (16, N'Exercise303', 23, 8, 3)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (17, N'Exercise304', 32, 8, 4)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (18, N'Exercise305', 7, 8, 5)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (19, N'Exercise306', 19, 8, 6)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (20, N'Exercise307', 20, 8, 7)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (22, N'Exercise308', 25, 8, 8)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (23, N'Exercise309', 4, 8, 9)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (27, N'Exercise310', 5, 8, 10)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (28, N'Exercise401', 12, 9, 2)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (29, N'Exercise402', 8, 9, 3)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (30, N'Exercise403', 26, 9, 4)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (31, N'Exercise404', 29, 9, 5)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (33, N'Exercise501', 9, 10, 2)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (34, N'Exercise502', 16, 10, 3)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (35, N'Exercise503', 13, 10, 5)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (36, N'Exercise504', 14, 10, 6)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (37, N'Exercise505', 17, 10, 8)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (38, N'Exercise506', 15, 10, 9)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (39, N'Exercise601', 100, 11, 1)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (40, N'Exercise602', 101, 11, 2)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (41, N'Exercise603', 102, 11, 3)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (42, N'Exercise604', 103, 11, 4)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (43, N'Exercise605', 104, 11, 5)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (44, N'Exercise606', 105, 11, 6)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (45, N'Exercise103', 106, 1, 3)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (46, N'Exercise104', 107, 1, 4)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (47, N'Exercise211', 108, 6, 6)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (48, N'Exercise507', 109, 10, 1)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (49, N'Exercise508', 110, 10, 4)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (50, N'Exercise509', 111, 10, 7)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (51, N'Exercise510', 112, 10, 10)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (52, N'Exercise511', 113, 10, 11)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (53, N'Exercise512', 114, 9, 6)
INSERT [dbo].[ExerciseDetails] ([Id], [Name], [SceneFunction], [CategoryId], [OrderNr]) VALUES (54, N'Exercise405', 115, 9, 1)
SET IDENTITY_INSERT [dbo].[ExerciseDetails] OFF
SET IDENTITY_INSERT [dbo].[GroupToExerciseRight] ON 
SET IDENTITY_INSERT [dbo].[GroupToExerciseRight] OFF
SET IDENTITY_INSERT [dbo].[Log] ON 
SET IDENTITY_INSERT [dbo].[Log] OFF
SET IDENTITY_INSERT [dbo].[ResponsibleToUserGroup] ON 
SET IDENTITY_INSERT [dbo].[ResponsibleToUserGroup] OFF
SET IDENTITY_INSERT [dbo].[TemplateToPageRight] ON 

INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (286, 1, 1, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (287, 1, 11, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (288, 1, 12, 0)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (289, 1, 13, 0)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (290, 1, 14, 0)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (291, 1, 15, 0)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (292, 1, 2, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (293, 1, 21, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (294, 1, 22, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (295, 1, 3, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (296, 1, 31, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (297, 1, 32, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (298, 1, 33, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (299, 1, 34, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (300, 1, 4, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (301, 1, 41, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (302, 1, 42, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (443, 1, 5, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (444, 1, 51, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (445, 1, 52, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (446, 1, 53, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (508, 1, 54, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (509, 1, 55, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (510, 1, 6, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (511, 1, 61, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (512, 1, 62, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (513, 1, 63, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (514, 1, 64, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (515, 1, 65, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (516, 1, 66, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (517, 1, 35, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (518, 1, 36, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (519, 1, 37, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (520, 1, 44, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (521, 1, 56, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (522, 1, 57, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (523, 1, 67, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (524, 1, 68, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (528, 35, 1, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (529, 35, 12, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (530, 35, 2, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (531, 35, 21, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (532, 35, 22, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (533, 35, 23, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (534, 35, 3, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (535, 35, 31, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (536, 35, 32, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (537, 35, 33, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (538, 35, 4, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (539, 35, 44, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (558, 1, 23, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (559, 1, 43, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (572, 1, 58, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (573, 1, 59, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (574, 35, 41, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (575, 35, 42, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (576, 36, 1, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (577, 36, 13, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (578, 1, 45, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (579, 35, 43, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (580, 35, 45, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (581, 36, 3, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (582, 36, 31, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (583, 36, 32, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (584, 36, 33, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (585, 36, 4, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (586, 36, 41, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (587, 36, 42, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (588, 37, 1, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (589, 37, 14, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (590, 36, 2, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (591, 36, 21, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (592, 36, 22, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (593, 36, 23, 1)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (594, 37, 6, 0)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (595, 37, 62, 0)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (596, 37, 61, 0)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (597, 36, 6, 0)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (598, 36, 61, 0)
INSERT [dbo].[TemplateToPageRight] ([Id], [UserTemplateId], [PageId], [IsAllowed]) VALUES (599, 36, 62, 0)
SET IDENTITY_INSERT [dbo].[TemplateToPageRight] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Firstname], [Lastname], [Email], [Password], [Salt], [Phone], [UserGroupId], [SalaryNumber], [CountryId], [UserTemplateId], [IsDeleted], [Username]) VALUES (1, N'VLAB', N'User', N'vlab@welfaredenmark.dk', N'5c03a2dabb92ca9ebb6f682b0390c6788d5aa502357f9883c573266892e0197856ed0b7545861c50cb9078552abb1a1f6005c16ff3ecb1a443c40a8188ba041a', N'965528f950fa', 12345678, 1, NULL, 2, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserGroup] ON 

INSERT [dbo].[UserGroup] ([Id], [GroupName], [CountryId], [UserGroupParentId], [CustomerId], [PackageId], [Path]) VALUES (1, N'VLab', 2, NULL, NULL, NULL, N'1')
SET IDENTITY_INSERT [dbo].[UserGroup] OFF
SET IDENTITY_INSERT [dbo].[UserTemplate] ON 

INSERT [dbo].[UserTemplate] ([Id], [TemplateName], [Created], [TemplateLevel], [ParentTemplateId], [IsActive]) VALUES (1, N'VLab', CAST(0x52350B00 AS Date), 0, NULL, 1)
INSERT [dbo].[UserTemplate] ([Id], [TemplateName], [Created], [TemplateLevel], [ParentTemplateId], [IsActive]) VALUES (35, N'Admin', CAST(0x7A350B00 AS Date), 1, 1, 1)
INSERT [dbo].[UserTemplate] ([Id], [TemplateName], [Created], [TemplateLevel], [ParentTemplateId], [IsActive]) VALUES (36, N'Vejleder', CAST(0x7A350B00 AS Date), 2, 35, 1)
INSERT [dbo].[UserTemplate] ([Id], [TemplateName], [Created], [TemplateLevel], [ParentTemplateId], [IsActive]) VALUES (37, N'Bruger', CAST(0x9B360B00 AS Date), 3, 36, 1)
SET IDENTITY_INSERT [dbo].[UserTemplate] OFF
ALTER TABLE [dbo].[Exercise] ADD  DEFAULT ((0)) FOR [Attempted]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_CategoryDetails] FOREIGN KEY([DetailsId])
REFERENCES [dbo].[CategoryDetails] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_CategoryDetails]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_User1]
GO
ALTER TABLE [dbo].[Exercise]  WITH CHECK ADD  CONSTRAINT [FK_Exercise_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Exercise] CHECK CONSTRAINT [FK_Exercise_Category]
GO
ALTER TABLE [dbo].[Exercise]  WITH CHECK ADD  CONSTRAINT [FK_Exercise_ExerciseDescription] FOREIGN KEY([DetailsId])
REFERENCES [dbo].[ExerciseDetails] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exercise] CHECK CONSTRAINT [FK_Exercise_ExerciseDescription]
GO
ALTER TABLE [dbo].[ExerciseDetails]  WITH CHECK ADD  CONSTRAINT [FK_ExerciseDetails_CategoryDetails] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CategoryDetails] ([Id])
GO
ALTER TABLE [dbo].[ExerciseDetails] CHECK CONSTRAINT [FK_ExerciseDetails_CategoryDetails]
GO
ALTER TABLE [dbo].[GroupToExerciseRight]  WITH CHECK ADD  CONSTRAINT [FK_ExercisePackage_ExerciseDetails] FOREIGN KEY([ExerciseId])
REFERENCES [dbo].[ExerciseDetails] ([Id])
GO
ALTER TABLE [dbo].[GroupToExerciseRight] CHECK CONSTRAINT [FK_ExercisePackage_ExerciseDetails]
GO
ALTER TABLE [dbo].[GroupToExerciseRight]  WITH CHECK ADD  CONSTRAINT [FK_GroupExercise_UserGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[GroupToExerciseRight] CHECK CONSTRAINT [FK_GroupExercise_UserGroup]
GO
ALTER TABLE [dbo].[ResponsibleToUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_ResponsibleToUserGroup_User] FOREIGN KEY([ResponsibleUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ResponsibleToUserGroup] CHECK CONSTRAINT [FK_ResponsibleToUserGroup_User]
GO
ALTER TABLE [dbo].[ResponsibleToUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_ResponsibleToUserGroup_UserGroup] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[ResponsibleToUserGroup] CHECK CONSTRAINT [FK_ResponsibleToUserGroup_UserGroup]
GO
ALTER TABLE [dbo].[TemplateToPageRight]  WITH CHECK ADD  CONSTRAINT [FK_GroupToPageRight_UserGroupTemplate] FOREIGN KEY([UserTemplateId])
REFERENCES [dbo].[UserTemplate] ([Id])
GO
ALTER TABLE [dbo].[TemplateToPageRight] CHECK CONSTRAINT [FK_GroupToPageRight_UserGroupTemplate]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserGroup] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserGroup]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserTemplate] FOREIGN KEY([UserTemplateId])
REFERENCES [dbo].[UserTemplate] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserTemplate]
GO
ALTER TABLE [dbo].[UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserGroup_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[UserGroup] CHECK CONSTRAINT [FK_UserGroup_Country]
GO
USE [master]
GO
ALTER DATABASE [VFO_new] SET  READ_WRITE 
GO
