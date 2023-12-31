USE [master]
GO
/****** Object:  Database [Football]    Script Date: 12/25/2023 7:51:03 PM ******/
CREATE DATABASE [Football]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Football', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Football.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Football_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Football_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Football] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Football].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Football] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Football] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Football] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Football] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Football] SET ARITHABORT OFF 
GO
ALTER DATABASE [Football] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Football] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Football] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Football] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Football] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Football] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Football] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Football] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Football] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Football] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Football] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Football] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Football] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Football] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Football] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Football] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Football] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Football] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Football] SET  MULTI_USER 
GO
ALTER DATABASE [Football] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Football] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Football] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Football] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Football] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Football] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Football] SET QUERY_STORE = ON
GO
ALTER DATABASE [Football] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Football]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_User_Name] [varchar](50) NOT NULL,
	[Password] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_User_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Announcements]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcements](
	[A_Id] [int] NOT NULL,
	[Club_Id] [int] NOT NULL,
	[A_Date] [datetime] NOT NULL,
	[A_Text] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Announcements] PRIMARY KEY CLUSTERED 
(
	[A_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clubs]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clubs](
	[Club_Id] [int] NOT NULL,
	[Club_Name] [varchar](50) NOT NULL,
	[Password] [int] NOT NULL,
 CONSTRAINT [PK_Clubs] PRIMARY KEY CLUSTERED 
(
	[Club_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comp_Clubs]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comp_Clubs](
	[Comp_Id] [int] NOT NULL,
	[Club_Id] [int] NOT NULL,
	[Points] [int] NOT NULL,
 CONSTRAINT [PK_Comp_Clubs] PRIMARY KEY CLUSTERED 
(
	[Comp_Id] ASC,
	[Club_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comp_Stats]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comp_Stats](
	[Comp_Id] [int] NOT NULL,
	[Player_Id] [int] NOT NULL,
	[Goals] [int] NOT NULL,
	[Assists] [int] NOT NULL,
	[Clean_sheets] [int] NULL,
 CONSTRAINT [PK_Comp_Stats] PRIMARY KEY CLUSTERED 
(
	[Comp_Id] ASC,
	[Player_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Competitions]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Competitions](
	[C_Id] [int] NOT NULL,
	[C_Type] [varchar](50) NOT NULL,
	[C_Name] [varchar](50) NOT NULL,
	[Year] [int] NOT NULL,
	[Top_Scorer_Id] [int] NOT NULL,
	[Most_Assists_Id] [int] NOT NULL,
	[Most_Clean_Sheets_Id] [int] NOT NULL,
	[Trophy_Id] [int] NOT NULL,
 CONSTRAINT [PK_Competitions] PRIMARY KEY CLUSTERED 
(
	[C_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Line_up]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Line_up](
	[Match_Id] [int] NOT NULL,
	[Club_1_Id] [int] NOT NULL,
	[Club_2_Id] [int] NOT NULL,
	[Formation_Club_1] [varchar](50) NOT NULL,
	[Formation_Club_2] [varchar](50) NOT NULL,
	[Line_Up_Club_1] [int] NOT NULL,
	[Line_Up_Club_2] [int] NOT NULL,
 CONSTRAINT [PK_Line_up] PRIMARY KEY CLUSTERED 
(
	[Match_Id] ASC,
	[Club_1_Id] ASC,
	[Club_2_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[Manager_Id] [int] NOT NULL,
	[Manager_name] [varchar](50) NOT NULL,
	[Salary] [int] NOT NULL,
	[Club_Id] [int] NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[Manager_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matches]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matches](
	[Match_Id] [int] NOT NULL,
	[Match_date] [date] NOT NULL,
	[Match_Time] [time](7) NOT NULL,
	[Comp_Id] [int] NOT NULL,
	[Referee_Id] [int] NOT NULL,
	[Club_1_Id] [int] NOT NULL,
	[Club_2_Id] [int] NOT NULL,
	[Goals_C1] [int] NULL,
	[Goals_C2] [int] NULL,
	[Team_1_Votes] [int] NOT NULL,
	[Team_2_Votes] [int] NOT NULL,
	[Draw_Votes] [int] NOT NULL,
 CONSTRAINT [PK_Matches] PRIMARY KEY CLUSTERED 
(
	[Match_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[Player_Id] [int] NOT NULL,
	[Player_Name] [varchar](50) NOT NULL,
	[Club_Id] [int] NOT NULL,
	[Position] [varchar](50) NOT NULL,
	[Salary] [int] NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[Player_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referee]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referee](
	[Referee_Id] [int] NOT NULL,
	[Referee_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Referee] PRIMARY KEY CLUSTERED 
(
	[Referee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transfer]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfer](
	[Pre_Club_Id] [int] NOT NULL,
	[New_Club_Id] [int] NOT NULL,
	[Player_Id] [int] NOT NULL,
	[Transfer_Date] [date] NOT NULL,
 CONSTRAINT [PK_Transfer] PRIMARY KEY CLUSTERED 
(
	[Pre_Club_Id] ASC,
	[New_Club_Id] ASC,
	[Player_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trophies]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trophies](
	[Trophy_Id] [int] NOT NULL,
	[Trophy_Name] [varchar](50) NOT NULL,
	[Club_Id] [int] NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Trophies] PRIMARY KEY CLUSTERED 
(
	[Trophy_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_Name] [varchar](50) NOT NULL,
	[Password] [int] NOT NULL,
	[Fav_Club_Id] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votes]    Script Date: 12/25/2023 7:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[User_Name] [varchar](50) NOT NULL,
	[Match_Id] [int] NOT NULL,
 CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED 
(
	[User_Name] ASC,
	[Match_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Announcements]  WITH CHECK ADD  CONSTRAINT [FK_Announcements_Clubs] FOREIGN KEY([Club_Id])
REFERENCES [dbo].[Clubs] ([Club_Id])
GO
ALTER TABLE [dbo].[Announcements] CHECK CONSTRAINT [FK_Announcements_Clubs]
GO
ALTER TABLE [dbo].[Comp_Clubs]  WITH CHECK ADD  CONSTRAINT [FK_Comp_Clubs_Clubs] FOREIGN KEY([Club_Id])
REFERENCES [dbo].[Clubs] ([Club_Id])
GO
ALTER TABLE [dbo].[Comp_Clubs] CHECK CONSTRAINT [FK_Comp_Clubs_Clubs]
GO
ALTER TABLE [dbo].[Comp_Clubs]  WITH CHECK ADD  CONSTRAINT [FK_Comp_Clubs_Competitions] FOREIGN KEY([Comp_Id])
REFERENCES [dbo].[Competitions] ([C_Id])
GO
ALTER TABLE [dbo].[Comp_Clubs] CHECK CONSTRAINT [FK_Comp_Clubs_Competitions]
GO
ALTER TABLE [dbo].[Comp_Stats]  WITH CHECK ADD  CONSTRAINT [FK_Comp_Stats_Competitions] FOREIGN KEY([Comp_Id])
REFERENCES [dbo].[Competitions] ([C_Id])
GO
ALTER TABLE [dbo].[Comp_Stats] CHECK CONSTRAINT [FK_Comp_Stats_Competitions]
GO
ALTER TABLE [dbo].[Comp_Stats]  WITH CHECK ADD  CONSTRAINT [FK_Comp_Stats_Players] FOREIGN KEY([Player_Id])
REFERENCES [dbo].[Players] ([Player_Id])
GO
ALTER TABLE [dbo].[Comp_Stats] CHECK CONSTRAINT [FK_Comp_Stats_Players]
GO
ALTER TABLE [dbo].[Competitions]  WITH CHECK ADD  CONSTRAINT [FK_Competitions_Players] FOREIGN KEY([Top_Scorer_Id])
REFERENCES [dbo].[Players] ([Player_Id])
GO
ALTER TABLE [dbo].[Competitions] CHECK CONSTRAINT [FK_Competitions_Players]
GO
ALTER TABLE [dbo].[Competitions]  WITH CHECK ADD  CONSTRAINT [FK_Competitions_Players1] FOREIGN KEY([Most_Assists_Id])
REFERENCES [dbo].[Players] ([Player_Id])
GO
ALTER TABLE [dbo].[Competitions] CHECK CONSTRAINT [FK_Competitions_Players1]
GO
ALTER TABLE [dbo].[Competitions]  WITH CHECK ADD  CONSTRAINT [FK_Competitions_Players2] FOREIGN KEY([Most_Clean_Sheets_Id])
REFERENCES [dbo].[Players] ([Player_Id])
GO
ALTER TABLE [dbo].[Competitions] CHECK CONSTRAINT [FK_Competitions_Players2]
GO
ALTER TABLE [dbo].[Competitions]  WITH CHECK ADD  CONSTRAINT [FK_Competitions_Trophies] FOREIGN KEY([Trophy_Id])
REFERENCES [dbo].[Trophies] ([Trophy_Id])
GO
ALTER TABLE [dbo].[Competitions] CHECK CONSTRAINT [FK_Competitions_Trophies]
GO
ALTER TABLE [dbo].[Line_up]  WITH CHECK ADD  CONSTRAINT [FK_Line_up_Clubs] FOREIGN KEY([Club_1_Id])
REFERENCES [dbo].[Clubs] ([Club_Id])
GO
ALTER TABLE [dbo].[Line_up] CHECK CONSTRAINT [FK_Line_up_Clubs]
GO
ALTER TABLE [dbo].[Line_up]  WITH CHECK ADD  CONSTRAINT [FK_Line_up_Clubs1] FOREIGN KEY([Club_2_Id])
REFERENCES [dbo].[Clubs] ([Club_Id])
GO
ALTER TABLE [dbo].[Line_up] CHECK CONSTRAINT [FK_Line_up_Clubs1]
GO
ALTER TABLE [dbo].[Line_up]  WITH CHECK ADD  CONSTRAINT [FK_Line_up_Matches] FOREIGN KEY([Match_Id])
REFERENCES [dbo].[Matches] ([Match_Id])
GO
ALTER TABLE [dbo].[Line_up] CHECK CONSTRAINT [FK_Line_up_Matches]
GO
ALTER TABLE [dbo].[Line_up]  WITH CHECK ADD  CONSTRAINT [FK_Line_up_Players] FOREIGN KEY([Line_Up_Club_1])
REFERENCES [dbo].[Players] ([Player_Id])
GO
ALTER TABLE [dbo].[Line_up] CHECK CONSTRAINT [FK_Line_up_Players]
GO
ALTER TABLE [dbo].[Line_up]  WITH CHECK ADD  CONSTRAINT [FK_Line_up_Players1] FOREIGN KEY([Line_Up_Club_2])
REFERENCES [dbo].[Players] ([Player_Id])
GO
ALTER TABLE [dbo].[Line_up] CHECK CONSTRAINT [FK_Line_up_Players1]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Clubs] FOREIGN KEY([Club_Id])
REFERENCES [dbo].[Clubs] ([Club_Id])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Clubs]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Clubs] FOREIGN KEY([Club_1_Id])
REFERENCES [dbo].[Clubs] ([Club_Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Clubs]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Clubs1] FOREIGN KEY([Club_2_Id])
REFERENCES [dbo].[Clubs] ([Club_Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Clubs1]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Competitions] FOREIGN KEY([Comp_Id])
REFERENCES [dbo].[Competitions] ([C_Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Competitions]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Referee] FOREIGN KEY([Referee_Id])
REFERENCES [dbo].[Referee] ([Referee_Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Referee]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Clubs] FOREIGN KEY([Club_Id])
REFERENCES [dbo].[Clubs] ([Club_Id])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Clubs]
GO
ALTER TABLE [dbo].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_Clubs] FOREIGN KEY([Pre_Club_Id])
REFERENCES [dbo].[Clubs] ([Club_Id])
GO
ALTER TABLE [dbo].[Transfer] CHECK CONSTRAINT [FK_Transfer_Clubs]
GO
ALTER TABLE [dbo].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_Clubs1] FOREIGN KEY([New_Club_Id])
REFERENCES [dbo].[Clubs] ([Club_Id])
GO
ALTER TABLE [dbo].[Transfer] CHECK CONSTRAINT [FK_Transfer_Clubs1]
GO
ALTER TABLE [dbo].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_Players] FOREIGN KEY([Player_Id])
REFERENCES [dbo].[Players] ([Player_Id])
GO
ALTER TABLE [dbo].[Transfer] CHECK CONSTRAINT [FK_Transfer_Players]
GO
ALTER TABLE [dbo].[Trophies]  WITH CHECK ADD  CONSTRAINT [FK_Trophies_Clubs] FOREIGN KEY([Club_Id])
REFERENCES [dbo].[Clubs] ([Club_Id])
GO
ALTER TABLE [dbo].[Trophies] CHECK CONSTRAINT [FK_Trophies_Clubs]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_User_Clubs] FOREIGN KEY([Fav_Club_Id])
REFERENCES [dbo].[Clubs] ([Club_Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_User_Clubs]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Matches] FOREIGN KEY([Match_Id])
REFERENCES [dbo].[Matches] ([Match_Id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Matches]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_User] FOREIGN KEY([User_Name])
REFERENCES [dbo].[Users] ([User_Name])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_User]
GO
ALTER TABLE [dbo].[Competitions]  WITH CHECK ADD  CONSTRAINT [CK_Competitions] CHECK  (([C_Type]='League' OR [C_Type]='Friendly'))
GO
ALTER TABLE [dbo].[Competitions] CHECK CONSTRAINT [CK_Competitions]
GO
ALTER TABLE [dbo].[Line_up]  WITH CHECK ADD  CONSTRAINT [CK_Line_up] CHECK  (([Club_1_Id]<>[Club_2_Id]))
GO
ALTER TABLE [dbo].[Line_up] CHECK CONSTRAINT [CK_Line_up]
GO
ALTER TABLE [dbo].[Line_up]  WITH CHECK ADD  CONSTRAINT [CK_Line_up_Formation1] CHECK  (([Formation_Club_1]='4-4-2' OR [Formation_Club_1]='4-3-3' OR [Formation_Club_1]='5-3-2' OR [Formation_Club_1]='4-2-3-1'))
GO
ALTER TABLE [dbo].[Line_up] CHECK CONSTRAINT [CK_Line_up_Formation1]
GO
ALTER TABLE [dbo].[Line_up]  WITH CHECK ADD  CONSTRAINT [CK_Line_up_Formation2] CHECK  (([Formation_Club_2]='4-4-2' OR [Formation_Club_2]='4-3-3' OR [Formation_Club_2]='5-3-2' OR [Formation_Club_2]='4-2-3-1'))
GO
ALTER TABLE [dbo].[Line_up] CHECK CONSTRAINT [CK_Line_up_Formation2]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [CK_Matches] CHECK  (([Club_1_Id]<>[Club_2_Id]))
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [CK_Matches]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [CK_Players] CHECK  (([Position]='Goal-Keeper' OR [Position]='Defender' OR [Position]='Attacker' OR [Position]='Mid-Fielder'))
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [CK_Players]
GO
USE [master]
GO
ALTER DATABASE [Football] SET  READ_WRITE 
GO
