USE [web_news]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Title] [nvarchar](1) NULL,
	[Url] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Language]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Lang] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LanguageCategory]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LanguageCategory](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Image] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Media]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Media](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Type] [int] NOT NULL,
	[Source] [nvarchar](255) NULL,
	[ContentDetail] [nvarchar](500) NULL,
	[Content] [nvarchar](max) NULL,
	[Description] [nvarchar](500) NULL,
	[Order] [int] NULL,
	[Slug] [nvarchar](255) NULL,
	[Action] [varchar](255) NULL,
	[Tags] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
	[ParentId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedById] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedById] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuFE]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuFE](
	[Id] [int] NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[Slug] [nvarchar](255) NULL,
	[Show] [bit] NULL,
	[MenuLevel] [int] NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_MenuFE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Type] [int] NULL,
	[Title] [nvarchar](500) NULL,
	[Author] [nvarchar](255) NULL,
	[Source] [nvarchar](255) NULL,
	[ContentDetail] [nvarchar](500) NULL,
	[Content] [nvarchar](max) NULL,
	[Description] [nvarchar](500) NULL,
	[Order] [int] NULL,
	[Slug] [nvarchar](255) NULL,
	[Action] [varchar](255) NULL,
	[Tags] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
	[ParentId] [int] NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedById] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedById] [int] NULL,
 CONSTRAINT [PK__News__3214EC079894B469] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewsCategory]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Order] [int] NULL,
	[Slug] [nvarchar](255) NULL,
	[Action] [varchar](255) NULL,
	[Tags] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[ParentId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedById] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedById] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Page]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Page](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](255) NULL,
	[Title] [nvarchar](500) NULL,
	[Slug] [nvarchar](255) NULL,
	[Action] [varchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[ParentId] [int] NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedById] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedById] [int] NULL,
 CONSTRAINT [PK__Page__3214EC0707766EC8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[Info] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[Order] [int] NULL,
	[Tags] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedById] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedById] [int] NULL,
 CONSTRAINT [PK__Project__3214EC073AED4BCB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectCategory]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Order] [int] NULL,
	[Image] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[ParentId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedById] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedById] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Route]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Route](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ObjectType] [int] NOT NULL,
	[ObjectId] [int] NULL,
	[Slug] [nvarchar](500) NULL,
	[Action] [varchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedById] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedById] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Security_Function]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Security_Function](
	[Id] [int] NOT NULL,
	[FunctionCode] [varchar](255) NULL,
	[FunctionName] [nvarchar](255) NULL,
	[IDINSYSTEM] [nvarchar](500) NULL,
 CONSTRAINT [PK_Security_Function] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Security_Permission]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[TargetId] [int] NULL,
 CONSTRAINT [PK_Security_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Security_Role]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security_Role](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[ParentRoleId] [int] NULL,
	[Builtin] [bit] NULL,
 CONSTRAINT [PK_Security_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Security_RoleFunctionPermision]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security_RoleFunctionPermision](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[FunctionId] [int] NULL,
	[PermissionId] [int] NULL,
 CONSTRAINT [PK_Security_RoleFunctionPermision] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Security_UserPermission]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security_UserPermission](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PermissionId] [int] NULL,
	[ObjectId] [int] NULL,
 CONSTRAINT [PK_Security_UserPermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Security_UserRole]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security_UserRole](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_Security_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Slug] [nvarchar](500) NULL,
	[Action] [varchar](255) NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedById] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedById] [int] NULL,
 CONSTRAINT [PK__Service__3214EC07C3C6E223] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[System_Menu]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[System_Menu](
	[MenuId] [int] NOT NULL,
	[ParentId] [int] NULL,
	[Controller] [varchar](100) NULL,
	[AliasUrl] [varchar](200) NULL,
	[Permission] [int] NULL,
	[Text] [nvarchar](200) NULL,
	[MenuLevel] [int] NULL,
	[Action] [varchar](50) NULL,
	[MenuOrder] [int] NULL,
	[Description] [nvarchar](200) NULL,
	[ShowMenu] [bit] NULL,
	[Area] [varchar](50) NULL,
 CONSTRAINT [PK_System_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[System_User]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[System_User](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[CraetedById] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedById] [int] NULL,
	[Salt] [varchar](50) NULL,
	[LoginFailedCount] [int] NULL,
 CONSTRAINT [PK_System_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Temp_Code]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Code](
	[Id] [int] NOT NULL,
	[BackendUser] [int] NOT NULL,
	[Agent] [int] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Temp_Code] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Security_VwRoleService]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  VIEW [dbo].[Security_VwRoleService]
AS
    SELECT  c.Id as RoleID ,
            c.Description AS RoleName ,
            cr2.FunctionName ,
            cr2.[Id] AS FunctionID ,
            cr1.PermissionName ,
            cr2.IDInSystem ,
            cr1.Id as PermissionID
    FROM    Security_Role c
            LEFT JOIN [Security_RoleFunctionPermision] cr ON cr.RoleID = c.Id
            LEFT JOIN Security_Function cr2 ON cr2.[ID] = cr.[FunctionId]
            LEFT JOIN Security_Permission cr1 ON cr.Id = cr1.Id



GO
/****** Object:  View [dbo].[Vw_Core_User]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_Core_User]
as 
select * from [web_news].[dbo].[System_User]
GO
/****** Object:  View [dbo].[Vw_UserInfo]    Script Date: 8/14/2018 5:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_UserInfo]
as 
select * from [web_news].[dbo].[System_User]
GO
SET IDENTITY_INSERT [dbo].[System_User] ON 

GO
INSERT [dbo].[System_User] ([UserId], [UserName], [Password], [Email], [Description], [Status], [CreatedDate], [CreatedBy], [CraetedById], [UpdatedDate], [UpdatedBy], [UpdatedById], [Salt], [LoginFailedCount]) VALUES (1, N'admin', N'f3f6a4b0308844a86fe7331e69dc2e2e6d242c36633318d1445c5e8e8cf1f428', N'admin@gmail.com', N'Admin system', 1, CAST(0x0000A72100A03E09 AS DateTime), N'SYSTEM', 1, CAST(0x0000A72100A03E09 AS DateTime), N'SYSTEM', 1, N'4LEEosBHHmycGO/pmE+lv8wbJA6l10lerLHvnkHTei8=', NULL)
GO
SET IDENTITY_INSERT [dbo].[System_User] OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'"1: Banner, 2: Logo top, 3: Logo giới thiệu, 4: Logo footer, 5: Đối tác"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banner', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'"Đường dẫn ảnh"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banner', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: tin tức, 2: sự kiện' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Recruit, 2: Contact' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Page', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'"1:News, 2:Page, 3:Project, .."' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Route', @level2type=N'COLUMN',@level2name=N'ObjectType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'"Tên dịch vụ công ty"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'"Đường dẫn"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service', @level2type=N'COLUMN',@level2name=N'Slug'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dịch vụ, lĩnh vực hoạt động' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hoạt động, 0: Locked' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'System_User', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quá 3 lần lock lại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'System_User', @level2type=N'COLUMN',@level2name=N'LoginFailedCount'
GO
