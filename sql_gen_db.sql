USE [master]
GO
/****** Object:  Database [DEMO_IOT]    Script Date: 2024-05-13 10:06:19 AM ******/
CREATE DATABASE [DEMO_IOT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DEMO_IOT', FILENAME = N'D:\SQL2022\DEMO_IOT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DEMO_IOT_log', FILENAME = N'D:\SQL2022\DEMO_IOT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DEMO_IOT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DEMO_IOT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DEMO_IOT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DEMO_IOT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DEMO_IOT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DEMO_IOT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DEMO_IOT] SET ARITHABORT OFF 
GO
ALTER DATABASE [DEMO_IOT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DEMO_IOT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DEMO_IOT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DEMO_IOT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DEMO_IOT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DEMO_IOT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DEMO_IOT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DEMO_IOT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DEMO_IOT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DEMO_IOT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DEMO_IOT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DEMO_IOT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DEMO_IOT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DEMO_IOT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DEMO_IOT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DEMO_IOT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DEMO_IOT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DEMO_IOT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DEMO_IOT] SET  MULTI_USER 
GO
ALTER DATABASE [DEMO_IOT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DEMO_IOT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DEMO_IOT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DEMO_IOT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DEMO_IOT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DEMO_IOT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DEMO_IOT] SET QUERY_STORE = ON
GO
ALTER DATABASE [DEMO_IOT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DEMO_IOT]
GO
/****** Object:  Table [dbo].[Sensor]    Script Date: 2024-05-13 10:06:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensor](
	[SID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[Value] [decimal](18, 2) NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_Sensor] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SensorHistory]    Script Date: 2024-05-13 10:06:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SensorHistory](
	[ID] [int] NOT NULL,
	[SID] [int] NULL,
	[Value] [decimal](18, 2) NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_SensorHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Sensor] ([SID], [Name], [Unit], [Value], [Time]) VALUES (1, N'Nhiệt độ lò ấp trứng chim cút', N'°C', NULL, NULL)
GO
INSERT [dbo].[Sensor] ([SID], [Name], [Unit], [Value], [Time]) VALUES (2, N'Độ ẩm phòng khách', N'%', NULL, NULL)
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (5, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (6, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (7, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (8, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (9, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (10, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (11, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (12, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (13, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (14, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (15, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (16, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (17, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (18, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (19, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (20, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:00:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (21, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (22, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (23, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (24, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (25, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (26, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (27, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (28, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (29, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (30, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (31, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (32, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (33, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (34, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (35, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (36, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (37, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (38, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (39, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (40, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:01:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (41, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (42, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (43, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (44, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (45, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (46, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (47, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (48, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (49, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (50, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (51, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (52, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (53, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (54, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (55, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (56, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (57, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (58, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (59, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (60, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:02:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (61, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (62, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (63, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (64, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (65, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (66, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (67, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (68, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (69, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (70, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (71, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (72, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (73, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (74, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (75, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (76, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (77, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (78, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (79, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (80, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:03:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (81, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (82, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (83, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (84, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (85, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (86, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (87, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (88, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (89, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (90, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (91, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (92, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (93, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (94, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (95, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (96, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (97, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (98, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (99, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (100, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:04:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (101, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (102, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (103, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (104, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (105, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (106, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (107, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (108, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (109, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (110, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (111, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (112, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (113, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (114, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (115, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (116, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (117, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (118, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (119, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (120, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:05:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (121, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (122, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (123, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (124, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (125, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (126, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (127, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (128, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (129, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (130, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (131, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (132, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (133, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (134, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (135, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (136, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (137, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (138, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (139, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (140, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:06:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (141, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (142, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (143, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (144, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (145, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (146, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (147, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (148, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (149, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (150, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (151, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (152, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (153, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (154, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (155, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (156, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (157, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (158, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (159, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (160, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:07:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (161, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (162, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (163, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (164, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (165, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (166, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (167, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (168, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (169, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (170, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (171, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (172, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (173, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (174, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (175, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (176, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (177, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (178, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (179, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (180, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:08:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (181, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (182, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (183, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (184, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (185, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (186, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (187, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (188, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (189, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (190, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (191, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (192, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (193, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (194, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (195, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (196, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (197, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (198, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (199, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (200, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:09:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (201, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (202, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (203, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (204, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (205, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (206, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (207, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (208, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (209, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (210, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (211, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (212, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (213, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (214, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (215, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (216, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (217, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (218, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (219, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (220, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:10:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (221, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (222, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (223, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (224, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (225, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (226, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (227, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (228, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (229, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (230, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (231, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (232, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (233, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (234, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (235, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (236, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (237, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (238, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (239, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (240, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:11:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (241, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (242, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (243, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (244, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (245, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (246, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (247, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (248, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (249, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (250, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (251, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (252, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (253, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (254, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (255, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (256, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (257, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (258, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (259, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (260, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:12:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (261, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (262, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (263, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (264, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (265, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (266, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (267, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (268, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (269, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (270, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (271, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (272, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (273, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (274, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (275, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (276, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (277, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (278, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (279, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (280, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:13:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (281, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (282, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (283, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (284, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (285, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (286, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (287, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (288, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (289, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (290, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (291, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (292, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (293, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (294, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (295, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (296, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (297, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (298, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (299, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (300, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:14:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (301, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (302, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (303, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (304, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (305, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (306, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (307, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (308, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (309, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (310, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (311, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (312, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (313, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (314, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (315, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (316, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (317, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (318, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (319, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (320, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:15:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (321, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (322, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (323, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (324, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (325, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (326, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (327, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (328, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (329, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (330, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (331, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (332, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (333, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (334, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (335, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (336, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (337, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (338, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (339, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (340, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:16:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (341, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (342, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (343, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (344, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (345, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (346, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (347, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (348, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (349, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (350, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (351, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (352, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (353, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (354, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (355, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (356, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (357, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (358, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (359, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (360, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:17:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (361, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (362, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (363, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (364, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (365, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (366, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (367, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (368, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (369, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (370, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (371, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (372, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (373, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (374, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (375, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (376, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (377, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (378, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (379, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (380, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:18:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (381, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (382, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (383, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (384, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (385, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (386, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (387, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (388, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (389, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (390, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (391, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (392, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (393, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (394, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (395, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (396, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (397, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (398, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (399, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (400, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:19:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (401, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (402, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (403, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (404, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (405, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (406, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (407, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (408, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (409, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (410, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (411, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (412, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (413, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (414, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (415, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (416, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (417, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (418, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (419, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (420, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:20:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (421, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (422, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (423, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (424, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (425, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (426, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (427, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (428, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (429, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (430, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (431, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (432, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (433, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (434, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (435, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (436, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (437, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (438, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (439, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (440, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:21:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (441, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (442, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (443, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (444, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (445, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (446, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (447, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (448, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (449, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (450, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (451, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (452, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (453, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (454, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (455, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (456, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (457, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (458, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (459, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (460, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:22:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (461, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (462, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (463, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (464, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (465, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (466, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (467, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (468, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (469, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (470, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (471, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (472, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (473, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (474, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (475, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (476, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (477, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (478, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (479, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (480, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:23:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (481, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (482, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (483, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (484, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (485, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (486, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (487, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (488, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (489, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (490, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (491, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (492, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (493, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (494, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (495, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (496, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (497, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (498, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (499, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (500, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:24:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (501, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (502, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (503, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (504, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (505, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (506, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (507, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (508, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (509, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (510, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (511, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (512, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (513, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (514, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (515, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (516, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (517, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (518, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (519, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (520, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:25:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (521, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (522, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (523, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (524, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (525, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (526, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (527, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (528, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (529, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (530, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (531, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (532, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (533, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (534, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (535, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (536, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (537, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (538, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (539, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (540, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:26:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (541, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (542, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (543, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (544, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (545, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (546, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (547, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (548, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (549, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (550, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (551, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (552, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (553, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (554, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (555, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (556, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (557, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (558, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (559, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (560, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:27:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (561, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (562, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (563, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (564, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (565, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (566, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (567, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (568, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (569, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (570, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (571, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (572, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (573, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (574, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (575, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (576, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (577, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (578, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (579, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (580, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:28:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (581, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (582, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (583, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (584, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (585, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (586, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (587, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (588, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (589, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (590, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (591, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (592, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (593, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (594, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (595, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (596, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (597, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (598, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (599, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (600, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:29:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (601, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (602, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (603, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (604, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (605, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (606, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (607, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (608, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (609, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (610, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (611, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (612, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (613, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (614, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (615, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (616, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (617, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (618, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (619, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (620, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:30:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (621, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (622, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (623, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (624, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (625, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (626, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (627, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (628, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (629, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (630, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (631, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (632, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (633, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (634, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (635, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (636, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (637, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (638, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (639, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (640, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:31:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (641, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (642, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (643, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (644, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (645, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (646, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (647, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (648, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (649, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (650, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (651, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (652, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (653, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (654, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (655, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (656, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (657, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (658, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (659, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (660, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:32:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (661, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (662, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (663, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (664, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (665, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (666, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (667, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (668, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (669, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (670, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (671, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (672, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (673, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (674, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (675, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (676, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (677, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (678, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (679, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (680, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:33:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (681, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (682, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (683, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (684, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (685, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (686, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (687, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (688, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (689, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (690, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (691, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (692, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (693, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (694, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (695, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (696, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (697, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (698, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (699, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (700, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:34:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (701, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (702, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (703, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (704, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (705, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (706, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (707, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (708, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (709, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (710, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (711, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (712, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (713, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (714, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (715, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (716, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (717, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (718, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (719, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (720, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:35:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (721, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (722, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (723, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (724, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (725, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (726, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (727, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (728, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (729, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (730, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (731, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (732, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (733, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (734, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (735, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (736, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (737, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (738, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (739, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (740, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:36:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (741, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (742, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (743, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (744, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (745, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (746, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (747, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (748, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (749, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (750, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (751, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (752, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (753, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (754, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (755, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (756, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (757, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (758, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (759, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (760, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:37:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (761, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (762, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (763, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (764, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (765, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (766, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (767, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (768, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (769, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (770, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (771, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (772, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (773, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (774, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (775, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (776, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (777, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (778, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (779, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (780, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:38:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (781, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (782, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (783, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (784, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (785, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (786, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (787, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (788, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (789, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (790, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (791, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (792, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (793, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (794, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (795, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (796, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (797, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (798, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (799, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (800, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:39:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (801, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (802, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (803, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (804, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (805, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (806, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (807, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (808, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (809, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (810, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (811, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (812, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (813, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (814, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (815, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (816, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (817, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (818, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (819, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (820, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:40:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (821, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (822, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (823, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (824, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (825, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (826, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (827, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (828, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (829, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (830, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (831, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (832, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (833, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (834, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (835, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (836, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (837, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (838, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (839, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (840, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:41:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (841, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (842, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (843, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (844, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (845, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (846, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (847, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (848, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (849, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (850, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (851, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (852, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (853, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (854, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (855, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (856, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (857, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (858, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (859, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (860, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:42:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (861, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (862, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (863, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (864, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (865, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (866, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (867, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (868, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (869, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (870, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (871, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (872, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (873, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (874, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (875, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (876, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (877, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (878, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (879, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (880, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:43:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (881, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (882, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (883, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (884, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (885, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (886, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (887, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (888, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (889, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (890, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (891, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (892, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (893, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (894, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (895, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (896, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (897, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (898, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (899, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (900, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:44:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (901, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (902, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (903, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (904, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (905, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (906, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (907, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (908, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (909, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (910, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (911, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (912, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (913, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (914, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (915, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (916, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (917, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (918, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (919, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (920, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:45:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (921, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (922, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (923, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (924, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (925, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (926, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (927, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (928, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (929, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (930, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (931, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (932, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (933, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (934, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (935, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (936, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (937, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (938, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (939, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (940, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:46:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (941, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (942, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (943, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (944, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (945, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (946, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (947, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (948, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (949, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (950, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (951, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (952, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (953, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (954, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (955, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (956, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (957, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (958, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (959, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (960, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:47:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (961, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (962, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (963, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (964, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (965, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (966, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (967, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (968, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (969, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (970, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (971, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (972, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (973, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (974, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (975, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (976, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (977, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (978, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (979, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (980, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:48:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (981, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (982, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (983, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (984, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (985, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (986, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (987, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (988, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (989, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (990, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (991, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (992, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (993, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (994, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (995, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (996, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (997, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (998, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (999, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1000, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:49:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1001, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1002, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1003, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1004, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1005, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1006, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1007, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1008, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1009, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1010, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1011, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1012, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1013, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1014, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1015, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1016, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1017, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1018, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1019, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1020, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:50:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1021, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1022, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1023, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1024, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1025, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1026, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1027, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1028, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1029, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1030, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1031, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1032, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1033, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1034, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1035, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1036, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1037, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1038, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1039, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1040, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:51:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1041, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1042, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1043, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1044, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1045, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1046, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1047, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1048, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1049, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1050, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1051, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1052, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1053, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1054, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1055, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1056, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1057, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1058, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1059, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1060, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:52:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1061, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1062, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1063, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1064, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1065, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1066, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1067, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1068, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1069, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1070, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1071, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1072, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1073, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1074, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1075, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1076, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1077, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1078, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1079, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1080, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:53:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1081, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1082, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1083, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1084, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1085, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1086, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1087, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1088, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1089, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1090, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1091, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1092, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1093, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1094, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1095, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1096, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1097, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1098, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1099, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1100, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:54:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1101, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1102, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1103, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1104, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1105, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1106, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1107, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1108, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1109, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1110, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1111, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1112, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1113, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1114, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1115, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1116, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1117, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1118, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1119, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1120, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:55:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1121, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1122, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1123, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1124, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1125, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1126, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1127, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1128, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1129, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1130, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1131, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1132, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1133, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1134, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1135, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1136, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1137, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1138, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1139, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1140, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:56:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1141, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1142, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1143, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1144, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1145, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1146, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1147, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1148, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1149, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1150, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1151, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1152, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1153, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1154, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1155, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1156, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1157, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1158, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1159, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1160, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:57:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1161, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1162, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1163, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1164, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1165, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1166, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1167, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1168, 1, CAST(28.00 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1169, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1170, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1171, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1172, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1173, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1174, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1175, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1176, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1177, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1178, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1179, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1180, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:58:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1181, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1182, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1183, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1184, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1185, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1186, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1187, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1188, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1189, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1190, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1191, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1192, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1193, 1, CAST(28.10 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1194, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1195, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1196, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1197, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1198, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1199, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1200, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T21:59:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1201, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1202, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1203, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1204, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1205, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1206, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1207, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1208, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1209, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1210, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1211, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1212, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1213, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1214, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1215, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1216, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1217, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1218, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1219, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1220, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:00:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1221, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1222, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1223, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1224, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1225, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1226, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1227, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1228, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1229, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1230, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1231, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1232, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1233, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1234, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1235, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1236, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1237, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1238, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1239, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1240, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:01:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1241, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1242, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1243, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1244, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1245, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1246, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1247, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1248, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1249, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1250, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1251, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1252, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1253, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1254, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1255, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1256, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1257, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1258, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1259, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1260, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:02:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1261, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1262, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1263, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1264, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1265, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1266, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1267, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1268, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1269, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1270, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1271, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1272, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1273, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1274, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1275, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1276, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1277, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1278, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1279, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1280, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:03:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1281, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1282, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1283, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1284, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1285, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1286, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1287, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1288, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1289, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1290, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1291, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1292, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1293, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1294, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1295, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1296, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1297, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1298, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1299, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1300, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:04:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1301, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1302, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1303, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1304, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1305, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1306, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1307, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1308, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1309, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1310, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1311, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1312, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1313, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1314, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1315, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1316, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1317, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1318, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1319, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1320, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:05:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1321, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1322, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1323, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1324, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1325, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1326, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1327, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1328, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1329, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1330, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1331, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1332, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1333, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1334, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1335, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1336, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1337, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1338, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1339, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1340, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:06:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1341, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1342, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1343, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1344, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1345, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1346, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1347, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1348, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1349, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1350, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1351, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1352, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1353, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1354, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1355, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1356, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1357, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1358, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1359, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1360, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:07:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1361, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1362, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1363, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1364, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1365, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1366, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1367, 1, CAST(28.20 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1368, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1369, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1370, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1371, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1372, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1373, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1374, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1375, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1376, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1377, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1378, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1379, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1380, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:08:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1381, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1382, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1383, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1384, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1385, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1386, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1387, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1388, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1389, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1390, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1391, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1392, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1393, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1394, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1395, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1396, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1397, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1398, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1399, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1400, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:09:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1401, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1402, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1403, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1404, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1405, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1406, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1407, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1408, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1409, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1410, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1411, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1412, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1413, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1414, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1415, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1416, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1417, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1418, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1419, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1420, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:10:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1421, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1422, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1423, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1424, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1425, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1426, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1427, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1428, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1429, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1430, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1431, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1432, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1433, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1434, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1435, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1436, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1437, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1438, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1439, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1440, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:11:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1441, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1442, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1443, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1444, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1445, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1446, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1447, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1448, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1449, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1450, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1451, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1452, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1453, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1454, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1455, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1456, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1457, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1458, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1459, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1460, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:12:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1461, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1462, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1463, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1464, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1465, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1466, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1467, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1468, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1469, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1470, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1471, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1472, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1473, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1474, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1475, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1476, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1477, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1478, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1479, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1480, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:13:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1481, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1482, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1483, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1484, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1485, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1486, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1487, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1488, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1489, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1490, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1491, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1492, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1493, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1494, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1495, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1496, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1497, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1498, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1499, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1500, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:14:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1501, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1502, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1503, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1504, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1505, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1506, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1507, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1508, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1509, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1510, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1511, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1512, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1513, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1514, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1515, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1516, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1517, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1518, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1519, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1520, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:15:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1521, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1522, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1523, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1524, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1525, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1526, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1527, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1528, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1529, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1530, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1531, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1532, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1533, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1534, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1535, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1536, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1537, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1538, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1539, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1540, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:16:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1541, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1542, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1543, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1544, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1545, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1546, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1547, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1548, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1549, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1550, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1551, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1552, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1553, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1554, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1555, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1556, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1557, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1558, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1559, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1560, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:17:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1561, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1562, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1563, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1564, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1565, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1566, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1567, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1568, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1569, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1570, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1571, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1572, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1573, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1574, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1575, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1576, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1577, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1578, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1579, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1580, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:18:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1581, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1582, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1583, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1584, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1585, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1586, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1587, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1588, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1589, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1590, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1591, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1592, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1593, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1594, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1595, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1596, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1597, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1598, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1599, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1600, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:19:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1601, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1602, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1603, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1604, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1605, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1606, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1607, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1608, 1, CAST(28.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1609, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1610, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1611, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1612, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1613, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1614, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1615, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1616, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1617, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1618, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1619, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1620, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:20:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1621, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1622, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1623, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1624, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1625, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1626, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1627, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1628, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1629, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1630, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1631, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1632, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1633, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1634, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1635, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1636, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1637, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1638, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1639, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1640, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:21:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1641, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1642, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1643, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1644, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1645, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1646, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1647, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1648, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1649, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1650, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1651, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1652, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1653, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1654, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1655, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1656, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1657, 1, CAST(28.70 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1658, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1659, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1660, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:22:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1661, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1662, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1663, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1664, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1665, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1666, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1667, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1668, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1669, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1670, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1671, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1672, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1673, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1674, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1675, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1676, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1677, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1678, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1679, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1680, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:23:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1681, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1682, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1683, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1684, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1685, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1686, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1687, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1688, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1689, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1690, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1691, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1692, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1693, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1694, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1695, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1696, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1697, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1698, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1699, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1700, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:24:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1701, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1702, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1703, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1704, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1705, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1706, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1707, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1708, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1709, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1710, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1711, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1712, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1713, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1714, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1715, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1716, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1717, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1718, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1719, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1720, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:25:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1721, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1722, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1723, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1724, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1725, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1726, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1727, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1728, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1729, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1730, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1731, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1732, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1733, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1734, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1735, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1736, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1737, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1738, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1739, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1740, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:26:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1741, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1742, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1743, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1744, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1745, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1746, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1747, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1748, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1749, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1750, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1751, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1752, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1753, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1754, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1755, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1756, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1757, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1758, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1759, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1760, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:27:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1761, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1762, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1763, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1764, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1765, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1766, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1767, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1768, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1769, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1770, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1771, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1772, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1773, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1774, 1, CAST(28.50 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1775, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1776, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1777, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1778, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1779, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1780, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:28:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1781, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1782, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1783, 1, CAST(28.60 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1784, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1785, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1786, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1787, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1788, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1789, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1790, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1791, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1792, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1793, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1794, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1795, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1796, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1797, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1798, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1799, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1800, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:29:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1801, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2024-05-12T22:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1802, 1, CAST(32.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:45:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1803, 1, CAST(32.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:45:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1804, 1, CAST(32.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:45:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1805, 1, CAST(32.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1806, 1, CAST(32.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1807, 1, CAST(32.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1808, 1, CAST(32.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1809, 1, CAST(32.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1810, 1, CAST(32.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1811, 1, CAST(32.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1812, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1813, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1814, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1815, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1816, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1817, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1818, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1819, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1820, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1821, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1822, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1823, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1824, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:46:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1825, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1826, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1827, 1, CAST(32.10 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1828, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1829, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1830, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1831, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1832, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1833, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1834, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1835, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1836, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1837, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1838, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1839, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1840, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1841, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1842, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1843, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1844, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:47:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1845, 1, CAST(32.30 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1846, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1847, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1848, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1849, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1850, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1851, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1852, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1853, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1854, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1855, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1856, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1857, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1858, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1859, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1860, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1861, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1862, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1863, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1864, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:48:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1865, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1866, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1867, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1868, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1869, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1870, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1871, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1872, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1873, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1874, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1875, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1876, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1877, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1878, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1879, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1880, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1881, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1882, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1883, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1884, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:49:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1885, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1886, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1887, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1888, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1889, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1890, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1891, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1892, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1893, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1894, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1895, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1896, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1897, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1898, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1899, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1900, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1901, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1902, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1903, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1904, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:50:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1905, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1906, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1907, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1908, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1909, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1910, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1911, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1912, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1913, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1914, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1915, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1916, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1917, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1918, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1919, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1920, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1921, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1922, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1923, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1924, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:51:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1925, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1926, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1927, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1928, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1929, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1930, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1931, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1932, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1933, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1934, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1935, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1936, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1937, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1938, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1939, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1940, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1941, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1942, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1943, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1944, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:52:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1945, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1946, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1947, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1948, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1949, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1950, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1951, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1952, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1953, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1954, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1955, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1956, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1957, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1958, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1959, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1960, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1961, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1962, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1963, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1964, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:53:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1965, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1966, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1967, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1968, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1969, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1970, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1971, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1972, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1973, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1974, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1975, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1976, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1977, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1978, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1979, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1980, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1981, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1982, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1983, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1984, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:54:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1985, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1986, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1987, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1988, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1989, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1990, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1991, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1992, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1993, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1994, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1995, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1996, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1997, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1998, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (1999, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2000, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2001, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2002, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2003, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2004, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:55:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2005, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2006, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2007, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2008, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2009, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2010, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2011, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2012, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2013, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2014, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2015, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2016, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2017, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2018, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2019, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:42.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2020, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:45.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2021, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:48.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2022, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:51.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2023, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:54.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2024, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:56:57.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2025, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2026, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:03.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2027, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:06.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2028, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:09.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2029, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:12.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2030, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:15.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2031, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:18.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2032, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:21.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2033, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:24.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2034, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:27.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2035, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2036, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:33.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2037, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:36.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2038, 1, CAST(33.00 AS Decimal(18, 2)), CAST(N'2024-05-12T22:57:39.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2039, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2040, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:13:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2041, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2042, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:13:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2043, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2044, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:13:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2045, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2046, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:14:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2047, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2048, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:14:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2049, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2050, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:14:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2051, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2052, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:15:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2053, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2054, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:15:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2055, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2056, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:15:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2057, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2058, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:16:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2059, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2060, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:16:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2061, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2062, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:16:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2063, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2064, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:17:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2065, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2066, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:17:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2067, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2068, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:17:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2069, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2070, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:18:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2071, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2072, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:18:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2073, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2074, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:18:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2075, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2076, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:19:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2077, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2078, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:19:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2079, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2080, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:19:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2081, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2082, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:20:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2083, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2084, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:20:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2085, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2086, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:20:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2087, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2088, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:21:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2089, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2090, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:21:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2091, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2092, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:21:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2093, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2094, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:22:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2095, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2096, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:22:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2097, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2098, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:22:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2099, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2100, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:23:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2101, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2102, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:23:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2103, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2104, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:23:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2105, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2106, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:24:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2107, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2108, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:24:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2109, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2110, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:24:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2111, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2112, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:25:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2113, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2114, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:25:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2115, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2116, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:25:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2117, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2118, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:26:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2119, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2120, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:26:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2121, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2122, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:26:50.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2123, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2124, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:27:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2125, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2126, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:27:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2127, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:27:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2128, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2129, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2130, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:28:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2131, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2132, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:28:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2133, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:28:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2134, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2135, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2136, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:29:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2137, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2138, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:29:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2139, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:29:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2140, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2141, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2142, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:30:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2143, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2144, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:30:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2145, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:30:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2146, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2147, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2148, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:31:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2149, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2150, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:31:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2151, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:31:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2152, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2153, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2154, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:32:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2155, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2156, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:32:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2157, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:32:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2158, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2159, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2160, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:33:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2161, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2162, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:33:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2163, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:33:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2164, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2165, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2166, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:34:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2167, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2168, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:34:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2169, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:34:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2170, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2171, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2172, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:35:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2173, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2174, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:35:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2175, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:35:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2176, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2177, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2178, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:36:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2179, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2180, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:36:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2181, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:36:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2182, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2183, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2184, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:37:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2185, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2186, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:37:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2187, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:37:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2188, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2189, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2190, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:38:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2191, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2192, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:38:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2193, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:38:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2194, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2195, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2196, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:39:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2197, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2198, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:39:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2199, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:39:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2200, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2201, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2202, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:40:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2203, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2204, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:40:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2205, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:40:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2206, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2207, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2208, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:41:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2209, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2210, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:41:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2211, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:41:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2212, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2213, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2214, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:42:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2215, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2216, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:42:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2217, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:42:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2218, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2219, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2220, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:43:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2221, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2222, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:43:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2223, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:43:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2224, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2225, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2226, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:44:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2227, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2228, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:44:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2229, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:44:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2230, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2231, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2232, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:45:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2233, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2234, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:45:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2235, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:45:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2236, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2237, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2238, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:46:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2239, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2240, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:46:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2241, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:46:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2242, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2243, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2244, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:47:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2245, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2246, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:47:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2247, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:47:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2248, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2249, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2250, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:48:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2251, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2252, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:48:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2253, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:48:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2254, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2255, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2256, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:49:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2257, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2258, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:49:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2259, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:49:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2260, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2261, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2262, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:50:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2263, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2264, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:50:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2265, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:50:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2266, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2267, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2268, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:51:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2269, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2270, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:51:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2271, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:51:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2272, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2273, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2274, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:52:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2275, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2276, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:52:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2277, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:52:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2278, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2279, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2280, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:53:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2281, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2282, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:53:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2283, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:53:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2284, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2285, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2286, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:54:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2287, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2288, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:54:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2289, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:54:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2290, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2291, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2292, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:55:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2293, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2294, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:55:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2295, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:55:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2296, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2297, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2298, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:56:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2299, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2300, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:56:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2301, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:56:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2302, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2303, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2304, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:57:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2305, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2306, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:57:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2307, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:57:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2308, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2309, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2310, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:58:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2311, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2312, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:58:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2313, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:58:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2314, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2315, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2316, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:59:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2317, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2318, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:59:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2319, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:59:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2320, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T02:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2321, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2322, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:00:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2323, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2324, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:00:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2325, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:00:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2326, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2327, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2328, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:01:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2329, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2330, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:01:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2331, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:01:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2332, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2333, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2334, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:02:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2335, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2336, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:02:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2337, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:02:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2338, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2339, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2340, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:03:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2341, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2342, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:03:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2343, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:03:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2344, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2345, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2346, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:04:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2347, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2348, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:04:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2349, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:04:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2350, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2351, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2352, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:05:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2353, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2354, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:05:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2355, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:05:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2356, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2357, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2358, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:06:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2359, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2360, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:06:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2361, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:06:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2362, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2363, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2364, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:07:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2365, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2366, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:07:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2367, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:07:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2368, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2369, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2370, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:08:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2371, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2372, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:08:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2373, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:08:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2374, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2375, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2376, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:09:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2377, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2378, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:09:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2379, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:09:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2380, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2381, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2382, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:10:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2383, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2384, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:10:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2385, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:10:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2386, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2387, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2388, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:11:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2389, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2390, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:11:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2391, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:11:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2392, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2393, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2394, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:12:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2395, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2396, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:12:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2397, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:12:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2398, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2399, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2400, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:13:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2401, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2402, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:13:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2403, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:13:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2404, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2405, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2406, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:14:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2407, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2408, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:14:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2409, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:14:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2410, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2411, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2412, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:15:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2413, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2414, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:15:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2415, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:15:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2416, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2417, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2418, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:16:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2419, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2420, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:16:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2421, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:16:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2422, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2423, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2424, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:17:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2425, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2426, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:17:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2427, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:17:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2428, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2429, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2430, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:18:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2431, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2432, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:18:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2433, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:18:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2434, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2435, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2436, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:19:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2437, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2438, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:19:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2439, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:19:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2440, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2441, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2442, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:20:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2443, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2444, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:20:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2445, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:20:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2446, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2447, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2448, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:21:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2449, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2450, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:21:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2451, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:21:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2452, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2453, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2454, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:22:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2455, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2456, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:22:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2457, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:22:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2458, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2459, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2460, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:23:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2461, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2462, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:23:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2463, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:23:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2464, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2465, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2466, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:24:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2467, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2468, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:24:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2469, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:24:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2470, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2471, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2472, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:25:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2473, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2474, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:25:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2475, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:25:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2476, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2477, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2478, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:26:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2479, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2480, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:26:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2481, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:26:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2482, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2483, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2484, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:27:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2485, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2486, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:27:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2487, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:27:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2488, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2489, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2490, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:28:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2491, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2492, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:28:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2493, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:28:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2494, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2495, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2496, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:29:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2497, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2498, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:29:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2499, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:29:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2500, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2501, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2502, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:30:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2503, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2504, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:30:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2505, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:30:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2506, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2507, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2508, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:31:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2509, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2510, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:31:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2511, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:31:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2512, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2513, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2514, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:32:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2515, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2516, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:32:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2517, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:32:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2518, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2519, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2520, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:33:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2521, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2522, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:33:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2523, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:33:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2524, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2525, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2526, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:34:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2527, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2528, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:34:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2529, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:34:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2530, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2531, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2532, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:35:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2533, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2534, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:35:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2535, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:35:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2536, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2537, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2538, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:36:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2539, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2540, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:36:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2541, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:36:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2542, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2543, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2544, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:37:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2545, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2546, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:37:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2547, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:37:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2548, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2549, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2550, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:38:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2551, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2552, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:38:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2553, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:38:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2554, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2555, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2556, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:39:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2557, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2558, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:39:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2559, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:39:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2560, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2561, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2562, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:40:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2563, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2564, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:40:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2565, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:40:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2566, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2567, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2568, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:41:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2569, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2570, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:41:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2571, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:41:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2572, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2573, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2574, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:42:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2575, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2576, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:42:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2577, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:42:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2578, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2579, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2580, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:43:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2581, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2582, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:43:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2583, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:43:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2584, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2585, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2586, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:44:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2587, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2588, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:44:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2589, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:44:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2590, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2591, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2592, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:45:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2593, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2594, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:45:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2595, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:45:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2596, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2597, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2598, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:46:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2599, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2600, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:46:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2601, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:46:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2602, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2603, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2604, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:47:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2605, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2606, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:47:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2607, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:47:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2608, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2609, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2610, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:48:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2611, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2612, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:48:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2613, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:48:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2614, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2615, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2616, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:49:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2617, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2618, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:49:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2619, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:49:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2620, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2621, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2622, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:50:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2623, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2624, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:50:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2625, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:50:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2626, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2627, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2628, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:51:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2629, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2630, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:51:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2631, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:51:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2632, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2633, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2634, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:52:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2635, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2636, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:52:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2637, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:52:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2638, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2639, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2640, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:53:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2641, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2642, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:53:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2643, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:53:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2644, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2645, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2646, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:54:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2647, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2648, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:54:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2649, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:54:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2650, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2651, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2652, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:55:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2653, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2654, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:55:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2655, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:55:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2656, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2657, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2658, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:56:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2659, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2660, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:56:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2661, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:56:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2662, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2663, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2664, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:57:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2665, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2666, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:57:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2667, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:57:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2668, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2669, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2670, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:58:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2671, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2672, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:58:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2673, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:58:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2674, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2675, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2676, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:59:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2677, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2678, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:59:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2679, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:59:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2680, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T03:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2681, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2682, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:00:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2683, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2684, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:00:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2685, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:00:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2686, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2687, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2688, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:01:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2689, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2690, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:01:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2691, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:01:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2692, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2693, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2694, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:02:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2695, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2696, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:02:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2697, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:02:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2698, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2699, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2700, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:03:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2701, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2702, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:03:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2703, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:03:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2704, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2705, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2706, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:04:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2707, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2708, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:04:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2709, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:04:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2710, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2711, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2712, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:05:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2713, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2714, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:05:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2715, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:05:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2716, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2717, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2718, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:06:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2719, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2720, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:06:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2721, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:06:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2722, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2723, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2724, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:07:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2725, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2726, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:07:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2727, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:07:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2728, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2729, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2730, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:08:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2731, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2732, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:08:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2733, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:08:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2734, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2735, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2736, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:09:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2737, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2738, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:09:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2739, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:09:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2740, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2741, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2742, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:10:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2743, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2744, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:10:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2745, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:10:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2746, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2747, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2748, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:11:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2749, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2750, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:11:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2751, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:11:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2752, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2753, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2754, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:12:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2755, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2756, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:12:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2757, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:12:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2758, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2759, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2760, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:13:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2761, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2762, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:13:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2763, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:13:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2764, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2765, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2766, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:14:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2767, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2768, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:14:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2769, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:14:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2770, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2771, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2772, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:15:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2773, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2774, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:15:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2775, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:15:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2776, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2777, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2778, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:16:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2779, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2780, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:16:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2781, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:16:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2782, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2783, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2784, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:17:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2785, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2786, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:17:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2787, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:17:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2788, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2789, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2790, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:18:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2791, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2792, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:18:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2793, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:18:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2794, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2795, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2796, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:19:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2797, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2798, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:19:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2799, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:19:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2800, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2801, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2802, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:20:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2803, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2804, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:20:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2805, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:20:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2806, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2807, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2808, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:21:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2809, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2810, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:21:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2811, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:21:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2812, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2813, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2814, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:22:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2815, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2816, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:22:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2817, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:22:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2818, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2819, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2820, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:23:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2821, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2822, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:23:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2823, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:23:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2824, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2825, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2826, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:24:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2827, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2828, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:24:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2829, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:24:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2830, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2831, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2832, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:25:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2833, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2834, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:25:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2835, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:25:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2836, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2837, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2838, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:26:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2839, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2840, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:26:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2841, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:26:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2842, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2843, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2844, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:27:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2845, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2846, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:27:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2847, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:27:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2848, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2849, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2850, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:28:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2851, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2852, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:28:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2853, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:28:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2854, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2855, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2856, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:29:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2857, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2858, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:29:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2859, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:29:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2860, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2861, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2862, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:30:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2863, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2864, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:30:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2865, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:30:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2866, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2867, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2868, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:31:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2869, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2870, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:31:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2871, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:31:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2872, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2873, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2874, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:32:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2875, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2876, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:32:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2877, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:32:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2878, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2879, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2880, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:33:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2881, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2882, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:33:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2883, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:33:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2884, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2885, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2886, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:34:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2887, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2888, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:34:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2889, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:34:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2890, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2891, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2892, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:35:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2893, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2894, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:35:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2895, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:35:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2896, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2897, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2898, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:36:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2899, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2900, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:36:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2901, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:36:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2902, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2903, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2904, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:37:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2905, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2906, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:37:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2907, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:37:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2908, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2909, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2910, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:38:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2911, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2912, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:38:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2913, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:38:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2914, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2915, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2916, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:39:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2917, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2918, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:39:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2919, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:39:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2920, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2921, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2922, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:40:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2923, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2924, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:40:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2925, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:40:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2926, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2927, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2928, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:41:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2929, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2930, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:41:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2931, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:41:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2932, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2933, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2934, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:42:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2935, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2936, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:42:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2937, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:42:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2938, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2939, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2940, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:43:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2941, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2942, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:43:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2943, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:43:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2944, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2945, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2946, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:44:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2947, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2948, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:44:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2949, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:44:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2950, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2951, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2952, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:45:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2953, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2954, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:45:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2955, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:45:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2956, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2957, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2958, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:46:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2959, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2960, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:46:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2961, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:46:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2962, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2963, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2964, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:47:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2965, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2966, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:47:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2967, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:47:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2968, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2969, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2970, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:48:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2971, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2972, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:48:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2973, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:48:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2974, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2975, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2976, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:49:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2977, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2978, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:49:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2979, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:49:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2980, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2981, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2982, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:50:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2983, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2984, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:50:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2985, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:50:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2986, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2987, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2988, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:51:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2989, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2990, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:51:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2991, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:51:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2992, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2993, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2994, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:52:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2995, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2996, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:52:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2997, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:52:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2998, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (2999, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3000, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:53:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3001, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3002, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:53:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3003, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:53:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3004, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3005, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3006, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:54:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3007, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3008, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:54:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3009, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:54:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3010, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3011, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3012, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:55:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3013, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3014, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:55:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3015, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:55:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3016, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3017, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3018, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:56:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3019, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3020, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:56:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3021, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:56:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3022, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3023, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3024, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:57:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3025, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3026, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:57:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3027, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:57:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3028, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3029, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3030, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:58:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3031, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3032, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:58:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3033, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:58:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3034, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3035, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3036, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:59:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3037, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3038, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:59:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3039, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:59:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3040, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T04:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3041, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3042, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:00:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3043, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3044, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:00:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3045, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:00:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3046, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3047, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3048, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:01:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3049, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3050, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:01:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3051, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:01:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3052, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3053, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3054, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:02:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3055, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3056, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:02:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3057, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:02:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3058, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3059, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3060, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:03:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3061, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3062, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:03:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3063, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:03:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3064, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3065, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3066, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:04:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3067, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3068, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:04:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3069, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:04:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3070, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3071, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3072, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:05:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3073, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3074, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:05:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3075, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:05:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3076, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3077, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3078, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:06:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3079, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3080, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:06:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3081, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:06:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3082, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3083, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3084, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:07:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3085, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3086, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:07:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3087, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:07:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3088, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3089, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3090, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:08:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3091, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3092, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:08:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3093, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:08:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3094, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3095, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3096, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:09:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3097, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3098, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:09:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3099, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:09:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3100, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3101, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3102, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:10:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3103, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3104, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:10:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3105, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:10:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3106, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3107, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3108, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:11:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3109, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3110, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:11:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3111, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:11:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3112, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3113, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3114, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:12:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3115, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3116, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:12:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3117, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:12:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3118, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3119, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3120, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:13:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3121, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3122, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:13:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3123, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:13:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3124, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3125, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3126, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:14:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3127, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3128, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:14:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3129, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:14:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3130, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3131, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3132, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:15:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3133, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3134, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:15:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3135, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:15:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3136, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3137, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3138, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:16:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3139, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3140, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:16:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3141, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:16:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3142, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3143, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3144, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:17:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3145, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3146, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:17:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3147, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:17:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3148, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3149, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3150, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:18:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3151, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3152, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:18:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3153, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:18:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3154, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3155, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3156, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:19:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3157, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3158, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:19:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3159, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:19:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3160, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3161, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3162, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:20:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3163, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3164, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:20:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3165, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:20:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3166, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3167, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3168, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:21:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3169, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3170, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:21:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3171, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:21:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3172, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3173, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3174, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:22:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3175, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3176, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:22:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3177, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:22:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3178, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3179, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3180, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:23:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3181, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3182, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:23:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3183, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:23:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3184, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3185, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3186, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:24:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3187, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3188, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:24:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3189, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:24:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3190, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3191, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3192, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:25:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3193, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3194, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:25:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3195, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:25:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3196, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3197, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3198, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:26:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3199, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3200, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:26:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3201, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:26:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3202, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3203, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3204, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:27:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3205, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3206, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:27:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3207, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:27:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3208, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3209, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3210, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:28:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3211, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3212, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:28:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3213, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:28:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3214, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3215, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3216, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:29:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3217, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3218, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:29:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3219, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:29:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3220, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3221, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3222, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:30:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3223, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3224, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:30:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3225, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:30:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3226, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3227, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3228, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:31:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3229, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3230, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:31:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3231, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:31:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3232, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3233, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3234, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:32:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3235, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3236, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:32:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3237, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:32:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3238, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3239, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3240, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:33:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3241, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3242, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:33:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3243, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:33:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3244, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3245, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3246, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:34:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3247, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3248, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:34:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3249, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:34:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3250, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3251, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3252, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:35:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3253, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3254, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:35:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3255, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:35:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3256, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3257, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3258, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:36:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3259, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3260, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:36:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3261, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:36:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3262, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3263, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3264, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:37:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3265, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3266, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:37:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3267, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:37:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3268, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3269, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3270, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:38:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3271, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3272, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:38:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3273, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:38:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3274, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3275, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3276, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:39:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3277, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3278, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:39:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3279, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:39:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3280, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3281, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3282, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:40:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3283, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3284, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:40:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3285, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:40:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3286, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3287, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3288, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:41:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3289, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3290, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:41:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3291, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:41:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3292, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3293, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3294, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:42:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3295, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3296, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:42:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3297, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:42:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3298, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3299, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3300, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:43:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3301, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3302, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:43:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3303, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:43:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3304, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3305, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3306, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:44:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3307, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3308, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:44:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3309, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:44:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3310, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3311, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3312, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:45:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3313, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3314, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:45:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3315, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:45:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3316, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3317, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3318, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:46:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3319, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3320, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:46:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3321, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:46:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3322, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3323, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3324, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:47:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3325, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3326, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:47:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3327, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:47:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3328, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3329, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3330, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:48:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3331, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3332, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:48:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3333, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:48:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3334, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3335, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3336, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:49:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3337, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3338, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:49:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3339, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:49:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3340, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3341, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3342, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:50:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3343, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3344, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:50:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3345, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:50:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3346, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3347, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3348, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:51:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3349, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3350, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:51:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3351, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:51:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3352, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3353, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3354, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:52:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3355, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3356, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:52:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3357, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:52:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3358, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3359, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3360, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:53:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3361, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3362, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:53:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3363, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:53:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3364, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3365, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3366, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:54:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3367, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3368, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:54:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3369, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:54:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3370, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3371, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3372, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:55:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3373, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3374, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:55:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3375, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:55:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3376, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3377, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3378, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:56:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3379, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3380, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:56:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3381, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:56:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3382, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3383, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3384, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:57:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3385, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3386, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:57:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3387, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:57:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3388, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3389, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3390, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:58:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3391, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3392, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:58:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3393, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:58:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3394, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3395, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3396, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:59:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3397, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3398, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:59:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3399, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:59:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3400, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T05:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3401, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3402, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:00:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3403, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3404, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:00:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3405, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:00:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3406, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3407, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3408, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:01:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3409, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3410, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:01:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3411, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:01:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3412, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3413, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3414, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:02:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3415, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3416, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:02:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3417, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:02:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3418, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3419, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3420, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:03:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3421, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3422, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:03:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3423, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:03:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3424, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3425, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3426, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:04:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3427, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3428, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:04:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3429, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:04:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3430, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3431, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3432, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:05:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3433, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3434, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:05:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3435, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:05:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3436, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3437, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3438, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:06:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3439, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3440, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:06:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3441, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:06:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3442, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3443, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3444, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:07:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3445, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3446, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:07:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3447, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:07:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3448, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3449, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3450, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:08:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3451, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3452, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:08:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3453, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:08:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3454, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3455, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3456, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:09:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3457, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3458, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:09:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3459, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:09:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3460, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3461, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3462, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:10:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3463, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3464, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:10:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3465, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:10:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3466, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3467, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3468, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:11:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3469, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3470, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:11:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3471, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:11:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3472, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3473, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3474, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:12:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3475, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3476, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:12:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3477, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:12:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3478, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3479, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3480, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:13:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3481, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3482, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:13:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3483, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:13:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3484, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3485, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3486, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:14:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3487, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3488, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:14:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3489, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:14:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3490, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3491, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3492, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:15:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3493, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3494, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:15:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3495, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:15:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3496, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3497, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3498, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:16:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3499, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3500, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:16:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3501, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:16:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3502, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3503, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3504, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:17:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3505, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3506, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:17:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3507, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:17:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3508, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3509, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3510, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:18:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3511, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3512, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:18:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3513, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:18:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3514, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3515, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3516, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:19:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3517, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3518, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:19:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3519, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:19:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3520, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3521, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3522, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:20:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3523, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3524, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:20:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3525, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:20:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3526, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3527, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3528, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:21:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3529, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3530, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:21:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3531, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:21:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3532, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3533, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3534, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:22:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3535, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3536, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:22:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3537, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:22:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3538, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3539, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3540, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:23:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3541, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3542, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:23:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3543, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:23:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3544, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3545, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3546, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:24:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3547, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3548, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:24:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3549, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:24:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3550, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3551, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3552, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:25:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3553, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3554, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:25:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3555, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:25:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3556, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3557, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3558, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:26:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3559, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3560, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:26:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3561, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:26:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3562, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3563, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3564, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:27:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3565, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3566, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:27:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3567, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:27:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3568, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3569, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3570, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:28:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3571, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3572, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:28:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3573, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:28:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3574, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3575, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3576, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:29:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3577, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3578, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:29:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3579, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:29:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3580, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3581, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3582, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:30:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3583, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3584, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:30:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3585, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:30:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3586, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3587, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3588, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:31:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3589, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3590, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:31:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3591, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:31:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3592, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3593, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3594, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:32:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3595, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3596, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:32:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3597, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:32:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3598, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3599, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3600, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:33:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3601, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3602, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:33:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3603, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:33:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3604, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3605, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3606, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:34:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3607, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3608, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:34:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3609, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:34:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3610, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3611, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3612, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:35:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3613, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3614, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:35:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3615, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:35:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3616, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3617, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3618, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:36:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3619, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3620, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:36:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3621, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:36:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3622, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3623, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3624, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:37:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3625, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3626, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:37:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3627, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:37:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3628, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3629, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3630, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:38:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3631, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3632, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:38:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3633, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:38:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3634, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3635, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3636, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:39:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3637, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3638, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:39:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3639, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:39:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3640, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3641, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3642, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:40:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3643, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3644, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:40:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3645, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:40:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3646, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3647, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3648, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:41:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3649, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3650, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:41:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3651, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:41:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3652, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3653, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3654, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:42:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3655, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3656, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:42:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3657, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:42:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3658, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3659, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3660, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:43:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3661, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3662, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:43:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3663, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:43:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3664, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3665, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3666, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:44:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3667, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3668, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:44:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3669, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:44:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3670, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3671, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3672, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:45:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3673, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3674, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:45:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3675, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:45:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3676, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3677, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3678, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:46:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3679, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3680, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:46:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3681, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:46:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3682, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3683, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3684, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:47:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3685, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3686, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:47:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3687, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:47:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3688, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3689, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3690, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:48:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3691, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3692, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:48:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3693, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:48:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3694, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3695, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3696, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:49:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3697, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3698, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:49:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3699, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:49:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3700, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3701, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3702, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:50:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3703, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3704, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:50:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3705, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:50:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3706, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3707, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3708, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:51:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3709, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3710, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:51:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3711, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:51:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3712, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3713, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3714, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:52:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3715, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3716, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:52:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3717, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:52:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3718, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3719, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3720, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:53:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3721, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3722, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:53:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3723, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:53:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3724, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3725, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3726, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:54:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3727, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3728, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:54:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3729, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:54:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3730, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3731, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3732, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:55:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3733, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3734, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:55:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3735, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:55:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3736, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3737, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3738, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:56:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3739, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3740, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:56:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3741, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:56:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3742, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:56:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3743, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3744, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:57:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3745, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3746, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:57:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3747, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:57:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3748, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:57:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3749, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3750, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:58:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3751, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3752, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:58:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3753, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:58:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3754, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:58:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3755, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3756, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:59:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3757, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3758, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:59:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3759, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:59:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3760, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T06:59:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3761, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3762, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:00:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3763, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3764, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:00:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3765, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:00:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3766, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:00:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3767, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3768, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:01:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3769, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3770, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:01:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3771, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:01:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3772, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:01:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3773, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3774, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:02:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3775, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3776, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:02:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3777, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:02:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3778, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:02:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3779, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3780, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:03:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3781, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3782, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:03:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3783, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:03:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3784, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:03:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3785, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3786, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:04:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3787, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3788, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:04:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3789, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:04:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3790, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:04:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3791, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3792, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:05:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3793, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3794, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:05:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3795, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:05:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3796, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:05:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3797, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3798, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:06:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3799, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3800, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:06:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3801, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:06:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3802, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:06:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3803, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3804, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:07:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3805, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3806, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:07:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3807, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:07:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3808, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:07:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3809, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3810, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:08:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3811, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3812, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:08:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3813, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:08:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3814, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:08:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3815, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3816, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:09:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3817, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3818, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:09:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3819, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:09:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3820, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:09:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3821, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3822, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:10:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3823, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3824, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:10:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3825, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:10:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3826, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:10:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3827, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3828, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:11:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3829, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3830, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:11:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3831, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:11:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3832, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:11:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3833, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3834, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:12:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3835, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3836, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:12:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3837, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:12:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3838, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:12:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3839, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3840, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:13:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3841, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3842, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:13:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3843, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:13:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3844, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:13:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3845, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3846, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:14:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3847, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3848, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:14:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3849, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:14:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3850, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:14:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3851, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3852, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:15:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3853, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3854, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:15:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3855, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:15:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3856, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:15:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3857, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3858, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:16:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3859, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3860, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:16:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3861, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:16:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3862, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:16:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3863, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3864, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:17:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3865, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3866, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:17:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3867, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:17:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3868, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:17:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3869, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3870, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:18:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3871, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3872, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:18:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3873, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:18:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3874, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:18:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3875, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3876, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:19:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3877, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3878, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:19:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3879, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:19:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3880, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:19:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3881, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3882, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:20:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3883, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3884, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:20:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3885, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:20:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3886, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:20:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3887, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3888, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:21:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3889, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3890, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:21:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3891, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:21:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3892, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:21:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3893, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3894, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:22:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3895, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3896, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:22:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3897, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:22:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3898, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:22:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3899, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3900, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:23:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3901, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3902, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:23:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3903, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:23:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3904, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:23:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3905, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3906, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:24:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3907, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3908, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:24:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3909, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:24:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3910, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:24:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3911, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3912, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:25:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3913, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3914, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:25:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3915, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:25:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3916, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:25:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3917, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3918, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:26:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3919, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3920, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:26:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3921, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:26:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3922, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:26:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3923, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3924, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:27:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3925, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3926, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:27:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3927, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:27:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3928, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:27:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3929, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3930, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:28:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3931, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3932, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:28:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3933, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:28:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3934, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:28:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3935, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3936, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:29:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3937, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3938, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:29:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3939, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:29:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3940, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:29:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3941, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3942, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:30:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3943, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3944, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:30:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3945, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:30:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3946, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:30:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3947, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3948, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:31:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3949, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3950, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:31:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3951, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:31:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3952, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:31:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3953, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3954, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:32:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3955, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3956, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:32:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3957, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:32:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3958, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:32:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3959, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3960, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:33:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3961, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3962, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:33:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3963, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:33:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3964, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:33:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3965, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3966, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:34:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3967, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3968, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:34:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3969, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:34:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3970, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:34:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3971, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3972, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:35:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3973, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3974, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:35:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3975, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:35:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3976, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:35:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3977, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3978, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:36:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3979, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3980, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:36:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3981, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:36:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3982, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:36:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3983, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3984, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:37:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3985, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3986, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:37:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3987, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:37:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3988, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:37:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3989, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3990, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:38:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3991, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3992, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:38:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3993, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:38:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3994, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:38:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3995, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3996, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:39:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3997, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3998, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:39:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (3999, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:39:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4000, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:39:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4001, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4002, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:40:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4003, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4004, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:40:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4005, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:40:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4006, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:40:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4007, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4008, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:41:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4009, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4010, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:41:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4011, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:41:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4012, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:41:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4013, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4014, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:42:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4015, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4016, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:42:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4017, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:42:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4018, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:42:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4019, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4020, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:43:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4021, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4022, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:43:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4023, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:43:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4024, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:43:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4025, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4026, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:44:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4027, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4028, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:44:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4029, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:44:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4030, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:44:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4031, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4032, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:45:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4033, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4034, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:45:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4035, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:45:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4036, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:45:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4037, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4038, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:46:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4039, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4040, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:46:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4041, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:46:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4042, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:46:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4043, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4044, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:47:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4045, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4046, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:47:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4047, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:47:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4048, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:47:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4049, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4050, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:48:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4051, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4052, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:48:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4053, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:48:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4054, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:48:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4055, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4056, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:49:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4057, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4058, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:49:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4059, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:49:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4060, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:49:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4061, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4062, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:50:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4063, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4064, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:50:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4065, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:50:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4066, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:50:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4067, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4068, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:51:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4069, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4070, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:51:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4071, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:51:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4072, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:51:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4073, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4074, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:52:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4075, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4076, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:52:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4077, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:52:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4078, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:52:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4079, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4080, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:53:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4081, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4082, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:53:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4083, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:53:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4084, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:53:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4085, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4086, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:54:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4087, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4088, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:54:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4089, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:54:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4090, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:54:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4091, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4092, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:55:10.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4093, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:55:00.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4094, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:55:30.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4095, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:55:40.000' AS DateTime))
GO
INSERT [dbo].[SensorHistory] ([ID], [SID], [Value], [Time]) VALUES (4096, 1, CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-05-13T07:55:00.000' AS DateTime))
GO
ALTER TABLE [dbo].[SensorHistory]  WITH CHECK ADD  CONSTRAINT [FK_SensorHistory_Sensor] FOREIGN KEY([SID])
REFERENCES [dbo].[Sensor] ([SID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SensorHistory] CHECK CONSTRAINT [FK_SensorHistory_Sensor]
GO
/****** Object:  StoredProcedure [dbo].[SP_Chart]    Script Date: 2024-05-13 10:06:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Do DUy Cop
-- Create date: 13.5.2024
-- Description:	Get data json for google chart
-- =============================================
CREATE PROCEDURE [dbo].[SP_Chart]
	@sid int,
	@timeFrom datetime=null,
	@timeEnd  datetime=null
AS
BEGIN
	if(@timeEnd is null or @timeEnd>GetDate())set @timeEnd=getdate();
	if(@timeFrom is null or @timeFrom>@timeEnd)set @timeFrom=dateAdd(HOUR,-48,@timeEnd);
	declare @name nvarchar(50);
	select @name = name from Sensor where sid=@sid;
	declare c cursor for 
		select value,time 
		from SensorHistory
		where (sid = @sid) and (time between @timeFrom and @timeEnd)
		order by time;
	open c;
	declare @value decimal(18,2), @time datetime, @value_old decimal(18,2)=0, @time_old datetime=null;
	declare @kq table(id int identity,value decimal(18,2), time datetime);
	fetch next from c into @value,@time;
	while (@@FETCH_STATUS = 0)
	begin
		declare @ss int = DateDiff(SECOND,@time_old,@time);
		if(@value != @value_old OR @time_old IS NULL OR @ss>60)
		begin
			if(@time_old is not null)
				insert into @kq(value,time)values(@value_old,@time_old);
			if(@ss>60)
			begin
				insert into @kq(value,time)values(0,@time_old),(0,@time);
			end
			insert into @kq(value,time)values(@value,@time);
		end
		select @value_old = @value, @time_old=@time; --copy 2 biến
		fetch next from c into @value,@time;
	end; --ket thuc while
	insert into @kq(value,time)values(@value,@time);
	close c;
	deallocate c;
	select @name as name,(select value as v,time as t from @kq for json path) as data
	for json path, WITHOUT_ARRAY_WRAPPER;
END
GO
USE [master]
GO
ALTER DATABASE [DEMO_IOT] SET  READ_WRITE 
GO
