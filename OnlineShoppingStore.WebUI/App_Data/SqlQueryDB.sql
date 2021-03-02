USE [BookDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 01-03-2021 23:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 01-03-2021 23:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
	[Description] [varchar](200) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01-03-2021 23:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

GO
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (1, N'Electronics', N'Electronics Items')
GO
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (2, N'Clothes', N'Dresses')
GO
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (3, N'Grocery', N'Grocery Items')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [CategoryId]) VALUES (1, N'Grains aserwaeafa', N'Grains I stumbled across your tip and it is such a smartI stumbled across your tip and it is such a smart and quick way to create a table and quick way to create a table', CAST(79.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [CategoryId]) VALUES (2, N'Sugar sfa asda a', N'Sugar I stumbled across your tip and it is such a smart and quick way to creaI stumbled across your tip and it is such a smart and quick way to create a tablete a table', CAST(40.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [CategoryId]) VALUES (3, N'ABC Grocery', N' Application features a fully functional free trial so you can download and try it to see if it works for you', CAST(15.01 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [CategoryId]) VALUES (5, N'CDE asda asd', N'W Application features a fully functional free trial so you can download and try it to see if it works for you', CAST(23.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [CategoryId]) VALUES (6, N'ASD asdasd', N'RI stumbled across your tip and it is such a smart and quick way to create a table Application features a fully functional free trial so you can download and try it to see if it works for you', CAST(34.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [CategoryId]) VALUES (9, N'T-Shirt', N'The Brand new Yellow T-Shirt, size : S,M,L,XL', CAST(399.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [CategoryId]) VALUES (10, N'Sugar', N'Sugar', CAST(40.00 AS Decimal(18, 2)), 3)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([id], [Username], [Password]) VALUES (1, N'admin', N'123456')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
