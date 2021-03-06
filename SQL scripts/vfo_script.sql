USE [master]
GO
/****** Object:  Database [VFO]    Script Date: 02/12/2013 14:27:14 ******/
CREATE DATABASE [VFO] ON  PRIMARY 
( NAME = N'Fysio', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\VFO.mdf' , SIZE = 5376KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Fysio_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\VFO_1.ldf' , SIZE = 9408KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VFO] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VFO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VFO] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [VFO] SET ANSI_NULLS OFF
GO
ALTER DATABASE [VFO] SET ANSI_PADDING OFF
GO
ALTER DATABASE [VFO] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [VFO] SET ARITHABORT OFF
GO
ALTER DATABASE [VFO] SET AUTO_CLOSE ON
GO
ALTER DATABASE [VFO] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [VFO] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [VFO] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [VFO] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [VFO] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [VFO] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [VFO] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [VFO] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [VFO] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [VFO] SET  DISABLE_BROKER
GO
ALTER DATABASE [VFO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [VFO] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [VFO] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [VFO] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [VFO] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [VFO] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [VFO] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [VFO] SET  READ_WRITE
GO
ALTER DATABASE [VFO] SET RECOVERY SIMPLE
GO
ALTER DATABASE [VFO] SET  MULTI_USER
GO
ALTER DATABASE [VFO] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [VFO] SET DB_CHAINING OFF
GO
USE [VFO]
GO
/****** Object:  User [Administrator]    Script Date: 02/12/2013 14:27:15 ******/
CREATE USER [Administrator] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin]    Script Date: 02/12/2013 14:27:15 ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 02/12/2013 14:27:16 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTemplate]    Script Date: 02/12/2013 14:27:16 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 02/12/2013 14:27:16 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryDetails]    Script Date: 02/12/2013 14:27:16 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExerciseDetails]    Script Date: 02/12/2013 14:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExerciseDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SceneFunction] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ExerciseDescription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 02/12/2013 14:27:16 ******/
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
 CONSTRAINT [PK_UserLevels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TemplateToPageRight]    Script Date: 02/12/2013 14:27:16 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupToExerciseRight]    Script Date: 02/12/2013 14:27:16 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02/12/2013 14:27:16 ******/
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
	[Email] [nvarchar](150) NULL,
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02/12/2013 14:27:16 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exercise]    Script Date: 02/12/2013 14:27:16 ******/
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
 CONSTRAINT [PK_Exercise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_ExerciseDetails_CategoryDetails]    Script Date: 02/12/2013 14:27:16 ******/
ALTER TABLE [dbo].[ExerciseDetails]  WITH CHECK ADD  CONSTRAINT [FK_ExerciseDetails_CategoryDetails] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CategoryDetails] ([Id])
GO
ALTER TABLE [dbo].[ExerciseDetails] CHECK CONSTRAINT [FK_ExerciseDetails_CategoryDetails]
GO
/****** Object:  ForeignKey [FK_UserGroup_Country]    Script Date: 02/12/2013 14:27:16 ******/
ALTER TABLE [dbo].[UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserGroup_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[UserGroup] CHECK CONSTRAINT [FK_UserGroup_Country]
GO
/****** Object:  ForeignKey [FK_GroupToPageRight_UserGroupTemplate]    Script Date: 02/12/2013 14:27:16 ******/
ALTER TABLE [dbo].[TemplateToPageRight]  WITH CHECK ADD  CONSTRAINT [FK_GroupToPageRight_UserGroupTemplate] FOREIGN KEY([UserTemplateId])
REFERENCES [dbo].[UserTemplate] ([Id])
GO
ALTER TABLE [dbo].[TemplateToPageRight] CHECK CONSTRAINT [FK_GroupToPageRight_UserGroupTemplate]
GO
/****** Object:  ForeignKey [FK_ExercisePackage_ExerciseDetails]    Script Date: 02/12/2013 14:27:16 ******/
ALTER TABLE [dbo].[GroupToExerciseRight]  WITH CHECK ADD  CONSTRAINT [FK_ExercisePackage_ExerciseDetails] FOREIGN KEY([ExerciseId])
REFERENCES [dbo].[ExerciseDetails] ([Id])
GO
ALTER TABLE [dbo].[GroupToExerciseRight] CHECK CONSTRAINT [FK_ExercisePackage_ExerciseDetails]
GO
/****** Object:  ForeignKey [FK_GroupExercise_UserGroup]    Script Date: 02/12/2013 14:27:16 ******/
ALTER TABLE [dbo].[GroupToExerciseRight]  WITH CHECK ADD  CONSTRAINT [FK_GroupExercise_UserGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[GroupToExerciseRight] CHECK CONSTRAINT [FK_GroupExercise_UserGroup]
GO
/****** Object:  ForeignKey [FK_User_UserGroup]    Script Date: 02/12/2013 14:27:16 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserGroup] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserGroup]
GO
/****** Object:  ForeignKey [FK_User_UserTemplate]    Script Date: 02/12/2013 14:27:16 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserTemplate] FOREIGN KEY([UserTemplateId])
REFERENCES [dbo].[UserTemplate] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserTemplate]
GO
/****** Object:  ForeignKey [FK_Category_CategoryDetails]    Script Date: 02/12/2013 14:27:16 ******/
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_CategoryDetails] FOREIGN KEY([DetailsId])
REFERENCES [dbo].[CategoryDetails] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_CategoryDetails]
GO
/****** Object:  ForeignKey [FK_Category_User1]    Script Date: 02/12/2013 14:27:16 ******/
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_User1]
GO
/****** Object:  ForeignKey [FK_Exercise_Category]    Script Date: 02/12/2013 14:27:16 ******/
ALTER TABLE [dbo].[Exercise]  WITH CHECK ADD  CONSTRAINT [FK_Exercise_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Exercise] CHECK CONSTRAINT [FK_Exercise_Category]
GO
/****** Object:  ForeignKey [FK_Exercise_ExerciseDescription]    Script Date: 02/12/2013 14:27:16 ******/
ALTER TABLE [dbo].[Exercise]  WITH CHECK ADD  CONSTRAINT [FK_Exercise_ExerciseDescription] FOREIGN KEY([DetailsId])
REFERENCES [dbo].[ExerciseDetails] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exercise] CHECK CONSTRAINT [FK_Exercise_ExerciseDescription]
GO
