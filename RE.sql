/****** Object:  Table [dbo].[Repair]    Script Date: 21.03.2025 14:23:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repair](
	[ID] [int] NOT NULL,
	[ID_machine] [int] NOT NULL,
	[ID_repair] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[notes] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types of machines]    Script Date: 21.03.2025 14:23:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types of machines](
	[ID_machine] [int] NOT NULL,
	[country] [nvarchar](20) NOT NULL,
	[year_of_release] [date] NOT NULL,
	[stamp] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Types of machines] PRIMARY KEY CLUSTERED 
(
	[ID_machine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types of repairs]    Script Date: 21.03.2025 14:23:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types of repairs](
	[ID_repair] [int] NOT NULL,
	[title] [nvarchar](30) NOT NULL,
	[duration] [time](3) NOT NULL,
	[cost] [money] NOT NULL,
	[notes] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Types of repairs] PRIMARY KEY CLUSTERED 
(
	[ID_repair] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21.03.2025 14:23:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] NOT NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[FIO] [nvarchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Repair] ([ID], [ID_machine], [ID_repair], [start_date], [notes]) VALUES (1, 4, 2, CAST(N'2024-07-20' AS Date), N'нет')
INSERT [dbo].[Repair] ([ID], [ID_machine], [ID_repair], [start_date], [notes]) VALUES (2, 3, 1, CAST(N'2024-02-03' AS Date), N'нет')
INSERT [dbo].[Repair] ([ID], [ID_machine], [ID_repair], [start_date], [notes]) VALUES (3, 5, 3, CAST(N'2024-04-01' AS Date), N'нет')
INSERT [dbo].[Repair] ([ID], [ID_machine], [ID_repair], [start_date], [notes]) VALUES (4, 2, 5, CAST(N'2024-09-10' AS Date), N'нет')
INSERT [dbo].[Repair] ([ID], [ID_machine], [ID_repair], [start_date], [notes]) VALUES (5, 1, 4, CAST(N'2024-08-12' AS Date), N'нет')
GO
INSERT [dbo].[Types of machines] ([ID_machine], [country], [year_of_release], [stamp]) VALUES (1, N'Russia', CAST(N'2001-03-01' AS Date), N'West')
INSERT [dbo].[Types of machines] ([ID_machine], [country], [year_of_release], [stamp]) VALUES (2, N'UAE', CAST(N'2012-09-02' AS Date), N'Sand')
INSERT [dbo].[Types of machines] ([ID_machine], [country], [year_of_release], [stamp]) VALUES (3, N'USA', CAST(N'2002-11-07' AS Date), N'AYE')
INSERT [dbo].[Types of machines] ([ID_machine], [country], [year_of_release], [stamp]) VALUES (4, N'France', CAST(N'2003-08-12' AS Date), N'dog')
INSERT [dbo].[Types of machines] ([ID_machine], [country], [year_of_release], [stamp]) VALUES (5, N'Russia', CAST(N'2034-12-21' AS Date), N'AG')
GO
INSERT [dbo].[Types of repairs] ([ID_repair], [title], [duration], [cost], [notes]) VALUES (1, N'Ремонт 2', CAST(N'03:00:00' AS Time), 3000.0000, N'нет')
INSERT [dbo].[Types of repairs] ([ID_repair], [title], [duration], [cost], [notes]) VALUES (2, N'Ремонт', CAST(N'05:00:00' AS Time), 2000.0000, N'нет')
INSERT [dbo].[Types of repairs] ([ID_repair], [title], [duration], [cost], [notes]) VALUES (3, N'Ремонт 3', CAST(N'01:00:00' AS Time), 4000.0000, N'нет')
INSERT [dbo].[Types of repairs] ([ID_repair], [title], [duration], [cost], [notes]) VALUES (4, N'Ремонт 5', CAST(N'00:15:00' AS Time), 6000.0000, N'нет')
INSERT [dbo].[Types of repairs] ([ID_repair], [title], [duration], [cost], [notes]) VALUES (5, N'Ремонт 4', CAST(N'00:30:00' AS Time), 5000.0000, N'хорошо')
GO
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Types of machines] FOREIGN KEY([ID_machine])
REFERENCES [dbo].[Types of machines] ([ID_machine])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Types of machines]
GO
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Types of repairs] FOREIGN KEY([ID_repair])
REFERENCES [dbo].[Types of repairs] ([ID_repair])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Types of repairs]
GO
