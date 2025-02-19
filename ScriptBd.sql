USE [Home]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 13.10.2024 17:24:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 13.10.2024 17:24:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[RoleId] [int] NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Пользователь')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [RoleId], [Login], [Password]) VALUES (1, N'Иванов', N'Иван', N'Иванович', N'89868884572', 1, N'ivanovii', N'11')
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [RoleId], [Login], [Password]) VALUES (2, N'Петров', N'Петр', N'Петрович', N'89879884262', 2, N'petrovpp', N'12')
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [RoleId], [Login], [Password]) VALUES (3, N'Сидоров', N'Саша', NULL, N'777777777', 2, N'sasa', N'13')
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [RoleId], [Login], [Password]) VALUES (4, N'Ашуров', N'яша', NULL, N'888888888', 1, N'yasha', N'114')
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [RoleId], [Login], [Password]) VALUES (5, N'Яковлев', NULL, NULL, N'99999999', 1, N'23423423423', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
