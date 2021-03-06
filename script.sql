USE [master]
GO
/****** Object:  Database [LoginDB]    Script Date: 25/07/2020 10:36:38 ******/
CREATE DATABASE [LoginDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LoginDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LoginDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LoginDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LoginDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LoginDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LoginDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LoginDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LoginDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LoginDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LoginDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LoginDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LoginDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LoginDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LoginDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LoginDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LoginDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LoginDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LoginDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LoginDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LoginDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LoginDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LoginDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LoginDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LoginDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LoginDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LoginDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LoginDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LoginDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LoginDB] SET RECOVERY FULL 
GO
ALTER DATABASE [LoginDB] SET  MULTI_USER 
GO
ALTER DATABASE [LoginDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LoginDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LoginDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LoginDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LoginDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LoginDB', N'ON'
GO
USE [LoginDB]
GO
/****** Object:  Table [dbo].[MasterUser]    Script Date: 25/07/2020 10:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterUser](
	[MobileNumber] [nvarchar](50) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DateofBirth] [datetime] NULL,
	[Gender] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_MasterUser] PRIMARY KEY CLUSTERED 
(
	[MobileNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_User]    Script Date: 25/07/2020 10:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_Insert_User] 
	-- Add the parameters for the stored procedure here
	@MobileNumber nvarchar(50),
	@FirstName varchar(50),
	@LastName varchar(50),
	@DateofBirth varchar(50),
	@Gender varchar(50),
	@Email varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into MasterUser(
	MobileNumber,
	FirstName,
	LastName,
	DateofBirth,
	Gender,
	Email)
	Values(
	@MobileNumber,
	@FirstName,
	@LastName,
	@DateofBirth,
	@Gender,
	@Email)

	select 'success'
END

GO
USE [master]
GO
ALTER DATABASE [LoginDB] SET  READ_WRITE 
GO
