USE [master]
GO
/****** Object:  Database [db_greedy]    Script Date: 02/06/2023 22:33:41 ******/
CREATE DATABASE [db_greedy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_greedy', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\db_greedy.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_greedy_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\db_greedy_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_greedy] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_greedy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_greedy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_greedy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_greedy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_greedy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_greedy] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_greedy] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_greedy] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [db_greedy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_greedy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_greedy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_greedy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_greedy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_greedy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_greedy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_greedy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_greedy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_greedy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_greedy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_greedy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_greedy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_greedy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_greedy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_greedy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_greedy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_greedy] SET  MULTI_USER 
GO
ALTER DATABASE [db_greedy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_greedy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_greedy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_greedy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [db_greedy]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 02/06/2023 22:33:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] NOT NULL,
	[Category] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetailGreedy]    Script Date: 02/06/2023 22:33:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailGreedy](
	[ID] [int] NOT NULL,
	[Nama_Item] [varchar](30) NULL,
	[Price] [money] NULL,
	[Category] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HasilGreedy]    Script Date: 02/06/2023 22:33:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HasilGreedy](
	[ID_Category] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items]    Script Date: 02/06/2023 22:33:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ID] [int] NOT NULL,
	[Category] [int] NULL,
	[Item] [nvarchar](255) NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Categories] ([ID], [Category]) VALUES (1, N'Beras')
INSERT [dbo].[Categories] ([ID], [Category]) VALUES (2, N'Daging Ayam')
INSERT [dbo].[Categories] ([ID], [Category]) VALUES (3, N'Daging Sapi')
INSERT [dbo].[Categories] ([ID], [Category]) VALUES (4, N'Telur')
INSERT [dbo].[Categories] ([ID], [Category]) VALUES (5, N'Bawang Merah')
INSERT [dbo].[Categories] ([ID], [Category]) VALUES (6, N'Bawang Putih')
INSERT [dbo].[Categories] ([ID], [Category]) VALUES (7, N'Cabai Merah')
INSERT [dbo].[Categories] ([ID], [Category]) VALUES (8, N'Cabai Rawit')
INSERT [dbo].[Categories] ([ID], [Category]) VALUES (9, N'Minyak Goreng')
INSERT [dbo].[Categories] ([ID], [Category]) VALUES (10, N'Gula Pasir')
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (1, 1, N'Beras Kualitas Bawah I (kg)', 10000)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (2, 1, N'Beras Kualitas Bawah II (kg)', 9750)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (3, 1, N'Beras Kualitas Medium I (kg)', 11000)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (4, 1, N'Beras Kualitas Medium II (kg)', 11250)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (5, 1, N'Beras Kualitas Super I (kg)', 12250)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (6, 1, N'Beras Kualitas Super II (kg)', 11750)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (7, 2, N'Daging Ayam Ras Segar (kg)', 29300)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (8, 3, N'Daging Sapi Kualitas 1 (kg)', 127500)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (9, 3, N'Daging Sapi Kualitas 2 (kg)', 110000)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (10, 4, N'Telur Ayam Ras Segar
 (kg)', 23500)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (11, 5, N'Bawang Merah Ukuran Sedang (kg)', 24200)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (12, 6, N'Bawang Putih Ukuran Sedang (kg)', 22350)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (13, 7, N'Cabai Merah Besar (kg)', 20150)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (14, 7, N'Cabai Merah Keriting  (kg)', 20000)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (15, 8, N'Cabai Rawit Hijau (kg)', 15350)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (16, 8, N'Cabai Rawit Merah (kg)', 18650)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (17, 9, N'Minyak Goreng Curah (kg)', 12050)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (18, 9, N'Minyak Goreng Kemasan Bermerk 1 (kg)', 13500)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (19, 9, N'Minyak Goreng Kemasan Bermerk 2 (kg)', 12750)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (20, 10, N'Gula Pasir Kualitas Premium (kg)', 14500)
INSERT [dbo].[Items] ([ID], [Category], [Item], [Price]) VALUES (21, 10, N'Gula Pasir Lokal (kg)', 12750)
USE [master]
GO
ALTER DATABASE [db_greedy] SET  READ_WRITE 
GO
