USE [StudentDb]
GO
/****** Object:  Table [dbo].[Homeworks]    Script Date: 27.02.2022 20:03:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Homeworks](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[TopicId] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Homework] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentHomeWorks]    Script Date: 27.02.2022 20:03:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentHomeWorks](
	[Id] [int] NOT NULL,
	[StudentId] [int] NULL,
	[HomeWorkId] [int] NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_StudentHomeWorks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 27.02.2022 20:03:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votes]    Script Date: 27.02.2022 20:03:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[Id] [int] NOT NULL,
	[Vote] [smallint] NULL,
	[UserId] [int] NULL,
	[StudentHomeWorkId] [int] NULL,
 CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Homeworks]  WITH CHECK ADD  CONSTRAINT [FK_Homeworks_Topics] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[Homeworks] CHECK CONSTRAINT [FK_Homeworks_Topics]
GO
ALTER TABLE [dbo].[StudentHomeWorks]  WITH CHECK ADD  CONSTRAINT [FK_StudentHomeWorks_Homeworks] FOREIGN KEY([HomeWorkId])
REFERENCES [dbo].[Homeworks] ([Id])
GO
ALTER TABLE [dbo].[StudentHomeWorks] CHECK CONSTRAINT [FK_StudentHomeWorks_Homeworks]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_StudentHomeWorks] FOREIGN KEY([StudentHomeWorkId])
REFERENCES [dbo].[StudentHomeWorks] ([Id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_StudentHomeWorks]
GO
