USE [master]
GO
/****** Object:  Database [FITHAUI.SimulationATMSystem]    Script Date: 11/20/2018 11:06:39 AM ******/
CREATE DATABASE [FITHAUI.SimulationATMSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FITHAUI.SimulationATMSystem', FILENAME = N'E:\BTL_WIN\FITHAUI.SimulationATMSystem\FITHAUI.SimulationATMSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
LOG ON 
( NAME = N'FITHAUI.SimulationATMSystem_log', FILENAME = N'E:\BTL_WIN\FITHAUI.SimulationATMSystem\FITHAUI.SimulationATMSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FITHAUI.SimulationATMSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET  MULTI_USER 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FITHAUI.SimulationATMSystem', N'ON'
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET QUERY_STORE = OFF
GO
USE [FITHAUI.SimulationATMSystem]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/20/2018 11:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [uniqueidentifier] NOT NULL,
	[Balance] [money] NULL,
	[CustID] [uniqueidentifier] NULL,
	[ODID] [uniqueidentifier] NULL,
	[WDID] [uniqueidentifier] NULL,
	[AccountNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ATM]    Script Date: 11/20/2018 11:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATM](
	[ATMID] [uniqueidentifier] NOT NULL,
	[Branch] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
 CONSTRAINT [PK_ATM] PRIMARY KEY CLUSTERED 
(
	[ATMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 11/20/2018 11:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[CardNo] [nvarchar](50) NOT NULL,
	[PIN] [decimal](18, 0) NULL,
	[Status] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[ExpiredDate] [datetime] NULL,
	[AccountID] [uniqueidentifier] NULL,
	[Attempt] [int] NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 11/20/2018 11:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[ConfigID] [uniqueidentifier] NOT NULL,
	[MinWithdraw] [money] NULL,
	[MaxWithdraw] [money] NULL,
	[DateModified] [datetime] NULL,
	[NumberPage] [int] NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/20/2018 11:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](13) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 11/20/2018 11:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[LogID] [uniqueidentifier] NULL,
	[LogDate] [datetime] NULL,
	[Amount] [money] NULL,
	[Details] [nvarchar](255) NULL,
	[LogTypeID] [uniqueidentifier] NULL,
	[ATMID] [uniqueidentifier] NULL,
	[CardNo] [nvarchar](50) NULL,
	[CardNoTo] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogType]    Script Date: 11/20/2018 11:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogType](
	[LogTypeID] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_LogType] PRIMARY KEY CLUSTERED 
(
	[LogTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Money]    Script Date: 11/20/2018 11:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Money](
	[MoneyID] [uniqueidentifier] NOT NULL,
	[MoneyValue] [money] NULL,
 CONSTRAINT [PK_Money] PRIMARY KEY CLUSTERED 
(
	[MoneyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OverDraft]    Script Date: 11/20/2018 11:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OverDraft](
	[ODID] [uniqueidentifier] NOT NULL,
	[Value] [money] NULL,
 CONSTRAINT [PK_OverDraft] PRIMARY KEY CLUSTERED 
(
	[ODID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 11/20/2018 11:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockID] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NULL,
	[MoneyID] [uniqueidentifier] NULL,
	[ATMID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WithdrawLimit]    Script Date: 11/20/2018 11:06:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WithdrawLimit](
	[WDID] [uniqueidentifier] NOT NULL,
	[Value] [money] NULL,
 CONSTRAINT [PK_WithdrawLimit] PRIMARY KEY CLUSTERED 
(
	[WDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([AccountID], [Balance], [CustID], [ODID], [WDID], [AccountNo]) VALUES (N'32854028-fe60-4552-89aa-4914468de1ff', 20000000.0000, N'891c2bd9-92f5-4753-aae3-d9d668538676', N'305a43ee-7bc2-4ff7-bd2a-59f826f5a024', N'cfae2384-85ff-42fe-aae0-6766cce52a00', N'875')
INSERT [dbo].[Account] ([AccountID], [Balance], [CustID], [ODID], [WDID], [AccountNo]) VALUES (N'4905e63c-b262-4e9b-ab2d-6315a704bdf9', 10000000.0000, N'42a9a4e4-ec78-453f-8a39-6ed8ba4cb578', N'305a43ee-7bc2-4ff7-bd2a-59f826f5a024', N'cfae2384-85ff-42fe-aae0-6766cce52a00', N'123')
INSERT [dbo].[Account] ([AccountID], [Balance], [CustID], [ODID], [WDID], [AccountNo]) VALUES (N'9387eed4-fcea-421d-af26-6b772ea343dc', 40000000.0000, N'27ecc4d7-6976-4ac4-8098-88a0105e1cef', N'305a43ee-7bc2-4ff7-bd2a-59f826f5a024', N'cfae2384-85ff-42fe-aae0-6766cce52a00', N'456')
INSERT [dbo].[Account] ([AccountID], [Balance], [CustID], [ODID], [WDID], [AccountNo]) VALUES (N'af576ce4-83a3-40e1-9c28-eb3883f8cacd', 50000000.0000, N'e91c7ea7-387d-4d6a-82fc-c81b962f1355', N'305a43ee-7bc2-4ff7-bd2a-59f826f5a024', N'cfae2384-85ff-42fe-aae0-6766cce52a00', N'789')
INSERT [dbo].[ATM] ([ATMID], [Branch], [Address]) VALUES (N'b936bf52-94d0-488f-bcda-1e4f1ecc422f', N'Cầu Giấy', N'Đường Hồ Tùng Mậu')
INSERT [dbo].[ATM] ([ATMID], [Branch], [Address]) VALUES (N'5e337e53-b644-4623-afa8-742a8f47661c', N'Bắc Từ Liêm', N'Đường Hồ Tùng Mậu')
INSERT [dbo].[ATM] ([ATMID], [Branch], [Address]) VALUES (N'fc57dd25-0a60-427a-aaa5-f9d2059c8abb', N'Cầu Giấy', N'Công ty điện cơ Hà Nội')
INSERT [dbo].[Card] ([CardNo], [PIN], [Status], [StartDate], [ExpiredDate], [AccountID], [Attempt]) VALUES (N'123456789', CAST(12345 AS Decimal(18, 0)), N'normal', CAST(N'2019-01-05T00:00:00.000' AS DateTime), CAST(N'2029-03-05T00:00:00.000' AS DateTime), N'32854028-fe60-4552-89aa-4914468de1ff', 0)
INSERT [dbo].[Card] ([CardNo], [PIN], [Status], [StartDate], [ExpiredDate], [AccountID], [Attempt]) VALUES (N'234567891', CAST(23456 AS Decimal(18, 0)), N'normal', CAST(N'2013-05-05T00:00:00.000' AS DateTime), CAST(N'2018-05-05T00:00:00.000' AS DateTime), N'4905e63c-b262-4e9b-ab2d-6315a704bdf9', 0)
INSERT [dbo].[Card] ([CardNo], [PIN], [Status], [StartDate], [ExpiredDate], [AccountID], [Attempt]) VALUES (N'345678912', CAST(78910 AS Decimal(18, 0)), N'block', CAST(N'2017-05-07T00:00:00.000' AS DateTime), CAST(N'2024-05-07T00:00:00.000' AS DateTime), N'9387eed4-fcea-421d-af26-6b772ea343dc', 0)
INSERT [dbo].[Card] ([CardNo], [PIN], [Status], [StartDate], [ExpiredDate], [AccountID], [Attempt]) VALUES (N'456789123', CAST(24563 AS Decimal(18, 0)), N'normal', CAST(N'2018-05-06T00:00:00.000' AS DateTime), CAST(N'2025-05-06T00:00:00.000' AS DateTime), N'af576ce4-83a3-40e1-9c28-eb3883f8cacd', 1)
INSERT [dbo].[Config] ([ConfigID], [MinWithdraw], [MaxWithdraw], [DateModified], [NumberPage]) VALUES (N'83d7a9d9-82ce-4024-a821-501a9791803e', 500000.0000, 2000000.0000, CAST(N'2018-11-20T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Customer] ([CustomerID], [Name], [Email], [Phone], [Address]) VALUES (N'42a9a4e4-ec78-453f-8a39-6ed8ba4cb578', N'Nguyễn Thị Hạnh', N'nguyenthihanh@gmail.com', N'0345267895', N'Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [Name], [Email], [Phone], [Address]) VALUES (N'27ecc4d7-6976-4ac4-8098-88a0105e1cef', N'Nguyễn Thế Quyền', N'nguyenthequyen13@gmail.com', N'0334808565', N'Hà Tĩnh')
INSERT [dbo].[Customer] ([CustomerID], [Name], [Email], [Phone], [Address]) VALUES (N'e91c7ea7-387d-4d6a-82fc-c81b962f1355', N'Vũ Thị Hải Yến', N'vuthihaiyen@gmail.com', N'0234567819', N'Hưng Yên')
INSERT [dbo].[Customer] ([CustomerID], [Name], [Email], [Phone], [Address]) VALUES (N'891c2bd9-92f5-4753-aae3-d9d668538676', N'Vũ Văn Đông', N'vuvandong@gmail.com', N'0123456789', N'Hải Dương')
INSERT [dbo].[Log] ([LogID], [LogDate], [Amount], [Details], [LogTypeID], [ATMID], [CardNo], [CardNoTo]) VALUES (N'a4fa9659-be9a-4711-9c06-ccc5d2f864ee', CAST(N'2018-05-07T00:00:00.000' AS DateTime), 1000000.0000, N'Success', N'ed52b1ad-47ed-48c3-a89e-79958250f402', N'b936bf52-94d0-488f-bcda-1e4f1ecc422f', N'123456789', N'234567891')
INSERT [dbo].[Log] ([LogID], [LogDate], [Amount], [Details], [LogTypeID], [ATMID], [CardNo], [CardNoTo]) VALUES (N'455b9812-fb5b-43dc-a36b-e7df9b0fbe8b', CAST(N'2018-11-20T00:00:00.000' AS DateTime), 5000000.0000, N'ERROR', N'542ed769-f0d8-48b4-ba5c-ddf600a85be1', N'b936bf52-94d0-488f-bcda-1e4f1ecc422f', N'234567891', NULL)
INSERT [dbo].[LogType] ([LogTypeID], [Description]) VALUES (N'ed52b1ad-47ed-48c3-a89e-79958250f402', N'Transfer')
INSERT [dbo].[LogType] ([LogTypeID], [Description]) VALUES (N'09da2d0c-dd3e-4530-bb8d-98445d6457ae', N'changePIN')
INSERT [dbo].[LogType] ([LogTypeID], [Description]) VALUES (N'abcf9247-c548-45eb-9660-b6c8bc8c7f27', N'checkBalance')
INSERT [dbo].[LogType] ([LogTypeID], [Description]) VALUES (N'542ed769-f0d8-48b4-ba5c-ddf600a85be1', N'Withdraw')
INSERT [dbo].[Money] ([MoneyID], [MoneyValue]) VALUES (N'24a21df7-143d-40ae-9b3d-245a022efb75', 100000.0000)
INSERT [dbo].[Money] ([MoneyID], [MoneyValue]) VALUES (N'2e585453-33d3-4ecf-9c5f-740bad7fd74a', 500000.0000)
INSERT [dbo].[Money] ([MoneyID], [MoneyValue]) VALUES (N'7e34377c-3774-46bd-9030-9a1e9356c5b0', 20000.0000)
INSERT [dbo].[Money] ([MoneyID], [MoneyValue]) VALUES (N'79658465-775c-449d-b1ac-c51812886d7c', 50000.0000)
INSERT [dbo].[Money] ([MoneyID], [MoneyValue]) VALUES (N'8d0df24b-a494-4d34-af1b-e67195080410', 10000.0000)
INSERT [dbo].[Money] ([MoneyID], [MoneyValue]) VALUES (N'b75f52b6-0467-432a-a274-ea209efed713', 200000.0000)
INSERT [dbo].[OverDraft] ([ODID], [Value]) VALUES (N'305a43ee-7bc2-4ff7-bd2a-59f826f5a024', 0.0000)
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'8ef97d0b-6fdd-420f-a6d5-0035fc347e33', 500000000, N'24a21df7-143d-40ae-9b3d-245a022efb75', N'b936bf52-94d0-488f-bcda-1e4f1ecc422f')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'288c3f31-5164-4dfb-83df-06ef1aaad423', 500000000, N'2e585453-33d3-4ecf-9c5f-740bad7fd74a', N'b936bf52-94d0-488f-bcda-1e4f1ecc422f')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'9fe9183a-8f53-4122-96de-0a67de3b0619', 500000000, N'24a21df7-143d-40ae-9b3d-245a022efb75', N'5e337e53-b644-4623-afa8-742a8f47661c')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'abe8d033-daba-4861-b33d-1d81a33d877c', 500000000, N'24a21df7-143d-40ae-9b3d-245a022efb75', N'fc57dd25-0a60-427a-aaa5-f9d2059c8abb')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'b5a831bb-89d6-4eee-9995-285e0cbbed6f', 500000000, N'2e585453-33d3-4ecf-9c5f-740bad7fd74a', N'5e337e53-b644-4623-afa8-742a8f47661c')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'82eebe89-ed44-44ed-b94e-34384dfd08c1', 500000000, N'7e34377c-3774-46bd-9030-9a1e9356c5b0', N'b936bf52-94d0-488f-bcda-1e4f1ecc422f')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'6f98c77b-6392-4781-b1a5-3b5c7a2c8ae5', 500000000, N'79658465-775c-449d-b1ac-c51812886d7c', N'b936bf52-94d0-488f-bcda-1e4f1ecc422f')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'66b61ef8-5a7d-4580-b7b5-4425a55985d3', 500000000, N'2e585453-33d3-4ecf-9c5f-740bad7fd74a', N'fc57dd25-0a60-427a-aaa5-f9d2059c8abb')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'b97be7df-24e4-4f0d-97fd-5fcd97084258', 500000000, N'8d0df24b-a494-4d34-af1b-e67195080410', N'b936bf52-94d0-488f-bcda-1e4f1ecc422f')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'aa9a9070-7bcd-45cf-a6d7-68cf95d16a32', 500000000, N'7e34377c-3774-46bd-9030-9a1e9356c5b0', N'5e337e53-b644-4623-afa8-742a8f47661c')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'53d4eb0c-51b9-4a62-abe1-828eda9305d4', 500000000, N'b75f52b6-0467-432a-a274-ea209efed713', N'b936bf52-94d0-488f-bcda-1e4f1ecc422f')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'fe21a2b1-e59c-4cdd-a5e5-aa21d2683761', 500000000, N'79658465-775c-449d-b1ac-c51812886d7c', N'5e337e53-b644-4623-afa8-742a8f47661c')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'73a92c52-0c32-4ac3-9e95-b898452475e4', 500000000, N'7e34377c-3774-46bd-9030-9a1e9356c5b0', N'fc57dd25-0a60-427a-aaa5-f9d2059c8abb')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'dd736fb1-ac3b-4b8e-81cb-bbb1d358d31d', 500000000, N'79658465-775c-449d-b1ac-c51812886d7c', N'fc57dd25-0a60-427a-aaa5-f9d2059c8abb')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'02f401a4-7832-42df-ae63-bdd5581329f2', 500000000, N'8d0df24b-a494-4d34-af1b-e67195080410', N'fc57dd25-0a60-427a-aaa5-f9d2059c8abb')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'a384e322-321f-4990-87c7-d22dcb24ff4d', 500000000, N'8d0df24b-a494-4d34-af1b-e67195080410', N'5e337e53-b644-4623-afa8-742a8f47661c')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'550a7ed5-86b7-46fd-a80a-d4f5b42b7aff', 500000000, N'b75f52b6-0467-432a-a274-ea209efed713', N'fc57dd25-0a60-427a-aaa5-f9d2059c8abb')
INSERT [dbo].[Stock] ([StockID], [Quantity], [MoneyID], [ATMID]) VALUES (N'a738e053-515c-4d16-b149-e3b6c63f9f86', 500000000, N'b75f52b6-0467-432a-a274-ea209efed713', N'fc57dd25-0a60-427a-aaa5-f9d2059c8abb')
INSERT [dbo].[WithdrawLimit] ([WDID], [Value]) VALUES (N'cfae2384-85ff-42fe-aae0-6766cce52a00', 25000000.0000)
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_AccountID]  DEFAULT (newid()) FOR [AccountID]
GO
ALTER TABLE [dbo].[ATM] ADD  CONSTRAINT [DF_ATM_ATMID]  DEFAULT (newid()) FOR [ATMID]
GO
ALTER TABLE [dbo].[Card] ADD  CONSTRAINT [DF_Card_CardNo]  DEFAULT (newid()) FOR [CardNo]
GO
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_ConfigID]  DEFAULT (newid()) FOR [ConfigID]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustID]  DEFAULT (newid()) FOR [CustomerID]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_LogID]  DEFAULT (newid()) FOR [LogID]
GO
ALTER TABLE [dbo].[LogType] ADD  CONSTRAINT [DF_LogType_LogTypeID]  DEFAULT (newid()) FOR [LogTypeID]
GO
ALTER TABLE [dbo].[Money] ADD  CONSTRAINT [DF_Money_MoneyID]  DEFAULT (newid()) FOR [MoneyID]
GO
ALTER TABLE [dbo].[OverDraft] ADD  CONSTRAINT [DF_OverDraft_ODID]  DEFAULT (newid()) FOR [ODID]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_StockID]  DEFAULT (newid()) FOR [StockID]
GO
ALTER TABLE [dbo].[WithdrawLimit] ADD  CONSTRAINT [DF_WithdrawLimit_WDID]  DEFAULT (newid()) FOR [WDID]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([CustID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_OverDraft] FOREIGN KEY([ODID])
REFERENCES [dbo].[OverDraft] ([ODID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_OverDraft]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_WithdrawLimit] FOREIGN KEY([WDID])
REFERENCES [dbo].[WithdrawLimit] ([WDID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_WithdrawLimit]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Account]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_ATM] FOREIGN KEY([ATMID])
REFERENCES [dbo].[ATM] ([ATMID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_ATM]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_Card] FOREIGN KEY([CardNo])
REFERENCES [dbo].[Card] ([CardNo])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_Card]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_LogType] FOREIGN KEY([LogTypeID])
REFERENCES [dbo].[LogType] ([LogTypeID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_LogType]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_ATM] FOREIGN KEY([ATMID])
REFERENCES [dbo].[ATM] ([ATMID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_ATM]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Money] FOREIGN KEY([MoneyID])
REFERENCES [dbo].[Money] ([MoneyID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Money]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã tài khoản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'AccountID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền còn lại trong tài khoản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Balance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'CustID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền có thể thấu chi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ODID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền rút tối đa trong ngày' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'WDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã ATM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ATM', @level2type=N'COLUMN',@level2name=N'ATMID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên chi nhánh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ATM', @level2type=N'COLUMN',@level2name=N'Branch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vị trí chi nhánh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ATM', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số thẻ ATM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'CardNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã PIN của thẻ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'PIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Trạng thái của thẻ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày cấp thẻ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày hết hạn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'ExpiredDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tài khoản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'AccountID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lần nhập không hợp lệ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Card', @level2type=N'COLUMN',@level2name=N'Attempt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền tối thiểu một lần rút]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'MinWithdraw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền tối đa rút trong ngày' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'MaxWithdraw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày cập nhật' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'DateModified'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số bản ghỉ được hiển thị ở màn hình hiển thị' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'NumberPage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số điện thoại khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã của bản ghi log' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'LogID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày giao dịch xảy ra' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'LogDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Khoản tiền giao dịch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả về giao dịch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại Log' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'LogTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số thẻ ATM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'ATMID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số thẻ ATM nhận tiền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'CardNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã log type sử dụng trong hệ thống' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogType', @level2type=N'COLUMN',@level2name=N'LogTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hoặc các chi tiết loại log type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogType', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại tiền sử dụng trong hệ thống' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Money', @level2type=N'COLUMN',@level2name=N'MoneyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá trị của loại tiền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Money', @level2type=N'COLUMN',@level2name=N'MoneyValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã mức thấu chi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OverDraft', @level2type=N'COLUMN',@level2name=N'ODID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền mà một tài khoản có thể thấu chi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OverDraft', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã của bản ghi stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'StockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mỗi loại tiền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại tiền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'MoneyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã máy ATM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'ATMID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã giới hạn rút' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithdrawLimit', @level2type=N'COLUMN',@level2name=N'WDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền tối đa một tài khoản có thể rút trong ngày' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithdrawLimit', @level2type=N'COLUMN',@level2name=N'Value'
GO
USE [master]
GO
ALTER DATABASE [FITHAUI.SimulationATMSystem] SET  READ_WRITE 
GO
