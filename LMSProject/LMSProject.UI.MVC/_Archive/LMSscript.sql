/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 8/18/2021 9:06:05 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 8/18/2021 9:06:05 AM ******/
DROP TABLE IF EXISTS [dbo].[LessonViews]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 8/18/2021 9:06:05 AM ******/
DROP TABLE IF EXISTS [dbo].[Lessons]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 8/18/2021 9:06:05 AM ******/
DROP TABLE IF EXISTS [dbo].[Courses]
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 8/18/2021 9:06:05 AM ******/
DROP TABLE IF EXISTS [dbo].[CourseCompletions]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/18/2021 9:06:05 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/18/2021 9:06:05 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/18/2021 9:06:05 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/18/2021 9:06:05 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/18/2021 9:06:05 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 8/18/2021 9:06:05 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 8/18/2021 9:06:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/18/2021 9:06:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/18/2021 9:06:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/18/2021 9:06:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/18/2021 9:06:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/18/2021 9:06:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 8/18/2021 9:06:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CourseCompletions](
	[CourseCompletionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[CourseId] [int] NOT NULL,
	[DateCompleted] [date] NOT NULL,
 CONSTRAINT [PK_CourseCompletions] PRIMARY KEY CLUSTERED 
(
	[CourseCompletionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 8/18/2021 9:06:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](200) NOT NULL,
	[CourseDescription] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 8/18/2021 9:06:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lessons](
	[LessonId] [int] IDENTITY(1,1) NOT NULL,
	[LessonTitle] [varchar](200) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Introduction] [varchar](300) NULL,
	[VideoURL] [varchar](250) NULL,
	[PdfFilename] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[LessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 8/18/2021 9:06:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LessonViews](
	[LessonViewed] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[LessonId] [int] NOT NULL,
	[DateViewed] [date] NOT NULL,
 CONSTRAINT [PK_LessonViews] PRIMARY KEY CLUSTERED 
(
	[LessonViewed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 8/18/2021 9:06:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202108102038084_InitialCreate', N'LMSProject.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416A9954B77B10DEC16A993B44173C33A59F46D414BB4A3AE4469252A4D50F4CBFAD04FEA2F742851375E74B115DB29165844E4F0CC70382487C3A1FFFDFB9FF18F4FBE673CE228760332310F46FBA681891D382E594ECC842EBE7D67FEF8C3975F8CCF1CFFC9F890D31D313A6849E289F94069786C59B1FD807D148F7CD78E823858D0911DF8167202EB707FFF7BEBE0C0C200610296618CDF2784BA3E4E3FE0731A101B873441DE55E0602FE6E550334B518D6BE4E33844369E989757B3DB28F81DDB74747F31BAFA301D656D4CE3C47311C833C3DEC2341021014514A43DBE8FF18C460159CE422840DEDD7388816E81BC18F35E1C97E45D3BB47FC83A64950D73283B8969E0F7043C38E21AB2C4E62BE9D92C34083A3C035DD367D6EB548F13F3C2C169D1FBC00305880C8FA75EC48827E655C1E2240EAF311DE50D4719E47904707F04D1A7511571CFE8DC6EAFB0A8C3D13EFBB7674C138F26119E109CD008797BC66D32F75CFB57FC7C177CC2647274305F1CBD7BF31639476FBFC3476FAA3D85BE025DAD008AC05A421C816C7851F4DF34AC7A3B4B6C5834ABB4C9B402B60493C334AED0D325264BFA00D3E6F09D699CBB4FD8C94BB871DD1317E61234A251029FD789E7A1B9878B7AAB9127FBBF81EBE19BB78370BD468FEE321D7A813F4C9C08E6D57BECA5B5F1831B66D3AB36DE1F39D97914F8ECBB6E5F59EDC759904436EB4CA025B943D112D3BA7463AB34DE4E26CDA08637EB1C75F74D9B492A9BB792947568959990B3D8F46CC8E57D59BE9D2DEE240C61F052D3621A693238DD96351230F60C89B234A383AE6644A07BFFE755F1CC47AE37C0B2D8810BF8250B37F271D1CB9F023042447ACB7C8BE2185605E717143F34880E7F0E20FA0CDB4904C63AA3C80F5F9CDBED4340F075E2CFD91CD81CAFC186E6EE8FE01CD93488CE086BB536DE65607F0A127A469C5344F13DB57340F679E7FADD010611E7C4B6711C9F833163671A80DB9D035E107A74D81B8E2D53DB764BA61E727DB55F222CA81F73D2D237515348FE89864CE5A334897A192C5DD24DD49C542F6A46D12A2A27EB2B2A03EB2629A7D40B9A12B4CA99510DE6F5A52334BCDB97C2EEBEDFB7DEE6AD5B0B2A6A9CC10A897FC60447B08C39B788521C917204BAAC1BDB7016D2E1634C5F7C6F4A397D405E3234AB956643BA080C3F1B52D8DD9F0DA99850FCE83ACC2BE97018CA8901BE13BDFA9CD53EE704C9363D1D6ADDDC34F3CDAC01BAE97212C781EDA6B3401106E3418CBAFCE0C319ED118DAC376254043A0686EEB22D0F4AA06FA6685437E4147B9862E3C4CEC2845314DBC891D5081D727A0896EFA80AC1CAE8485DB86F249E60E938628D103B04C530535D42E569E112DB0D91D7AA25A165C72D8CF5BDE021D69CE21013C6B055135D98AB83214C80828F30286D1A1A5B158B6B36448DD7AA1BF33617B61C772946B1119B6CF19D3576C9FDB71731CC668D6DC0389B55D245006D606F1B06CACF2A5D0D403CB8EC9A810A27268D8172976A23065AD7D8160CB4AE925767A0D911B5EBF80BE7D55D33CFFA4179F3DB7AA3BAB6609B357DEC986966BE27B4A1D00247B2799ECE59257EA28AC319C8C9CF67317775451361E0334CEB219BD2DF55FAA156338868444D80A5A1B580F22B4109489A503D84CB63798DD2712FA2076C1E776B84E56BBF005BB10119BB7A355A21D45FA08AC6D9E9F451F4ACB006C9C83B1D162A380A831017AF7AC73B284517979515D3C517EEE30D573AC607A341412D9EAB4649796706D7526E9AED5A5239647D5CB2B5B424B84F1A2DE59D195C4BDC46DB95A4700A7AB8056BA9A8BE850F34D9F24847B1DB1475632BCB9BE205634B936035BE4261E8926525E18A9718B32CDB6AFAEDAC7F02929F615876ACC8432AA42D38D120424B2CD4026B90F4DC8D627A8A289A2316E7993ABE44A6DC5B35CB7FCEB2BA7DCA8398EF033935FB9B47EF7417F9B51D57764938D239F4D3677E4D1A4C575881BAB9C1D2E090872245FC7E1A78894FF46E96BE75768B576D9F95C808634B905F72A3249D49CE6E7D003A0D8F3C35061DAAC297597DB8F4103AA5E79E6855ED3AEF548F9207ABAA28BA00D6D6864FE7D4AC3064A2D7D87FC45A115E668EF154952A002FEA8951C97690C02A75DD51EB092955CC7A4D774421EBA40A2954F590B29A5B5213B25AB1129E46A36A8AEE1CE46C922ABA5CDB1D59915752855654AF80AD9059ACEB8EAA483DA9022BAABB63977928E252BAC3BB98F62CB3E636961D7AD7DBC734182FB32E0EB30D56EEF6AB4095E29E58FCF65E02E3E53B6953DA93DF9A3695453CD6B3290D867E15AADD8DD717A1C60B7D3D66EDC2BBB6D0375DF8EBF1FA59EE8BDA8774FC13490AEEC5315038EE8DF9D1ABFDD18D7416CB484C2357236CF2CF31C5FE88118C669FBDA9E762B6A4E7045788B80B1CD32CC9C33CDC3F38145EECECCEEB192B8E1D4F7174D53DA1A98FD906F2B5C8238AEC0714C9D9136BBC302941A5C0F40571F0D3C4FC336D759CC638D85F69F19E7111DF13F77302157751828DBFE46CD06132EE9B8F5D3BFA3EA2BB562F7EFB9835DD336E229831C7C6BEA0CB5546B8FE6AA2973459D335A459F92DC5EB9D50B5C7094A546142ACFE1661EED241DE21E4527EE5A3A7AFFB8AA67C6BB016A2E23DC1507883A850F75E60152CED5B01073E69FA56A05F67D56F0756114DFB6EC025FDC1C45703DD97A1BCE516B71AC5C968134B52AAE7D6ACEBB55230B7BD3749C9D96B4D743901BB07DC1A49D62B58C62BCB4F1E6C7754A41F0F86BD4DD37EF19CE35D49332E1340B69B5DBCC984E2868BA2FF551EF10E64BE293279B69F2DBC695BD34573773CE5B25F4EF08E191BCFEFDA7EE6EFA68D4D17E6DD7163EB95DFBB63B6B6ADFD73CB96D6790BDD7AB6AE9C78A4B99551C582DBB271B3C0399CF0E7011841E651668F28D5E95F4DA9AB2D0C4B123D537DDE99C8589A38125F89A2996DBFBEF20DBFB1B39CA699AD265BB389375FFF1B79739A66DE9A1CC86DE4112BB31055B9DD2DEB58535AD46BCA1BAEF5A4254DBDCD676DBC627F4D69C28328A5367B3477C4AF272B7810950C39757A6401CBD7BDB077567E8911F6EFD85D9610EC771909B66BBB664173411641BE790B12E5244284E60A53E4C0967A125177816C0AD52CC69CBE024FE376ECA6638E9D0B7293D030A1D065ECCFBD5AC08B39014DFCD354E7BACCE39B30FD419321BA0062BA2C367F437E4A5CCF29E43E57C4843410CCBBE0115D369694457697CF05D275403A0271F5154ED11DF6430FC0E21B32438F7815D9C0FC2EF112D9CF65045007D23E1075B58F4F5DB48C901F738CB23D7C820D3BFED30FFF011FDD3A3D90540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'5027825d-f590-4487-8957-3ae4067ffeb4', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'5ad8fb97-ef07-45db-8329-42f19d1c297f', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b0d5db04-f233-4476-aa7d-428cc4c33a05', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'65fbf3b9-dd2b-4e56-959a-9e2a92ea4584', N'5027825d-f590-4487-8957-3ae4067ffeb4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'29a92b35-5953-4978-ab01-3a94db43e7c0', N'5ad8fb97-ef07-45db-8329-42f19d1c297f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', N'5ad8fb97-ef07-45db-8329-42f19d1c297f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd423b2d6-51c9-4723-93d9-57ed1640ff22', N'5ad8fb97-ef07-45db-8329-42f19d1c297f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0edef12e-388b-4bb7-b88c-95a0352ccbf0', N'b0d5db04-f233-4476-aa7d-428cc4c33a05')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0edef12e-388b-4bb7-b88c-95a0352ccbf0', N'fake@email.com', 1, N'AAI09kfLitS2qcH/c+q/oo/Z2kY4HTI79QCCsSAcYydghgSDXxyKTtUH44AS2nJzjA==', N'b266e561-3589-40d2-aa01-93bb326e496d', NULL, 0, 0, NULL, 1, 0, N'fake@email.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'29a92b35-5953-4978-ab01-3a94db43e7c0', N'test@email.com', 0, N'ACKPURpgZqbtrLS0dGmKKlOMUhm20rFHzN5mjIy75IU39UFPwBh4mEtxPtU7qwDQiQ==', N'7a81b344-c1b7-4c0b-958b-bcdb3154e9df', NULL, 0, 0, NULL, 1, 0, N'test@email.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'65fbf3b9-dd2b-4e56-959a-9e2a92ea4584', N'dwschejbal@outlook.com', 1, N'ACIzv2+RwIXtTbB/s7M9ooymXkBYYh3fT+2+ju/AgO1X+bSC3fIbL/rkTlS6tEKcow==', N'0d0ca6e0-cc0e-4db9-8679-6c4dc7f78a02', NULL, 0, 0, NULL, 1, 0, N'dwschejbal@outlook.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', N'fake@test.com', 1, N'AE9VxnKcL9Fc0n4VUOPWCK6KDLWZczbErsZf6gW3zzR5k0boCcNs5VgzJvBc3kf2Ew==', N'6792196c-76bb-47c1-90d5-19a4b13e2bf8', NULL, 0, 0, NULL, 1, 0, N'fake@test.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd423b2d6-51c9-4723-93d9-57ed1640ff22', N'test@fake.com', 1, N'ANkFMmsBPLCv/7ICkq48ku5HH0H6inJ5sckB4Q4kSWStlCIwNNGXd7FgS7lbmFKLzw==', N'23480dea-5f5f-4e29-8ebd-2fe785fd8b3d', NULL, 0, 0, NULL, 1, 0, N'test@fake.com')
SET IDENTITY_INSERT [dbo].[CourseCompletions] ON 

INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (1, N'29a92b35-5953-4978-ab01-3a94db43e7c0', 1, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (2, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 1, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (3, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 1, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (4, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 2, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (5, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 3, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (6, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 6, CAST(N'2021-08-14' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (7, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 4, CAST(N'2021-08-17' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (8, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 2, CAST(N'2021-08-17' AS Date))
SET IDENTITY_INSERT [dbo].[CourseCompletions] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (1, N'Passing Techniques', N'Everything you could need to know about passing techniques', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (2, N'Shooting Techniques', N'Everything you could need to know about shooting techniques', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (3, N'Defensive Techniques', N'Everything you could need to know about defensive techniques', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (4, N'Support Techniques', N'Everything you could need to know about support techniques', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (5, N'Positions', N'Everything you could need to know about positions', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (6, N'Formations', N'Everything you could need to know about formations', 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (1, N'Venom', 1, N'The venom passing techniques', N'https://www.youtube.com/embed/k1pgP6ZbUbs', N'7a32ac9a-9645-4192-baef-eb976d2edd0c.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (2, N'Wither', 1, N'The wither passing techniques', N'https://www.youtube.com/embed/CaCJZvsggFk', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (3, N'Nap', 1, N'The nap passing techniques', N'https://www.youtube.com/embed/LAEkGZMlys8', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (4, N'Venom', 2, N'The venom shooting techniques', N'https://www.youtube.com/embed/8wA0EvVB0Sk', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (5, N'Wither', 2, N'The wither shooting techniques', N'https://www.youtube.com/embed/8wA0EvVB0Sk', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (6, N'Nap', 2, N'The nap shooting techniques', N'https://www.youtube.com/embed/j1DD0R8ARX0', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (7, N'Venom', 3, N'Defensive venom techniques', N'https://www.youtube.com/embed/71CrM-oXds8', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (8, N'Wither', 3, N'Defensive wither techniques', N'https://www.youtube.com/embed/Oeu9WPw9nt0', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (9, N'Nap', 3, N'Defensive nap techniques', N'https://www.youtube.com/embed/Fu2ZQmFGjjw', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (10, N'Anti-Venom', 4, N'Anti-Venom support techniques', N'https://www.youtube.com/embed/fNgvtegGDtU', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (11, N'Anti-Wither', 4, N'Anti-Wither support techniques', N'https://www.youtube.com/embed/BdySNolKvA8', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (12, N'Anti-Nap', 4, N'Anti-Nap support techniques', N'https://www.youtube.com/embed/HL-Gn8M5uZc', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (13, N'Tackle-slip', 4, N'Tackle-slip support techniques', N'https://www.youtube.com/embed/k1pgP6ZbUbs', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (14, N'Left-Forward', 5, N'Left-Forward roles and responsibilities', N'https://www.youtube.com/embed/1ih5HnbJOkE', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (15, N'Right-Forward', 5, N'Right-Forward roles and responsibilities', N'https://www.youtube.com/embed/fNgvtegGDtU', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (16, N'Mid-Fielder', 5, N'Mid-Fielder roles and responsibilities', N'https://www.youtube.com/embed/A6_0ICHrjP8', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (17, N'Left-Defense', 5, N'Left-Defense roles and responsibilities', N'https://www.youtube.com/embed/HL-Gn8M5uZc', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (18, N'Right-Defense', 5, N'Right-Defense roles and responsibilities', N'https://www.youtube.com/embed/71CrM-oXds8', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (19, N'Goalkeeper', 5, N'Goalkeeper roles and responsibilities', N'https://www.youtube.com/embed/k1pgP6ZbUbs', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (20, N'Normal', 6, N'Normal formation setup and focus', N'https://www.youtube.com/embed/R1TA8ID_Upg', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (21, N'Mark', 6, N'Mark formation setup and focus', N'https://www.youtube.com/embed/Av9pHzmtgBk', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (22, N'Left-Side', 6, N'Left-Side formation setup and focus', N'https://www.youtube.com/embed/fNgvtegGDtU', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (23, N'Right-Side', 6, N'Right-Side formation setup and focus', N'https://www.youtube.com/embed/71CrM-oXds8', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (24, N'Center Attack', 6, N'Center Attack formation setup and focus', N'https://www.youtube.com/embed/1ih5HnbJOkE', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (25, N'All-out Defense', 6, N'All-out Defense formation setup and focus', N'https://www.youtube.com/embed/4KvAefuHSKM', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (26, N'Flat Line', 6, N'Flat Line formation setup and focus', N'https://www.youtube.com/embed/HL-Gn8M5uZc', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (27, N'Counter', 6, N'Counter formation setup and focus', N'https://www.youtube.com/embed/A6_0ICHrjP8', N'noPDF.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (28, N'Double Sides', 6, N'Double Sides formation setup and focus', N'https://www.youtube.com/embed/k1pgP6ZbUbs', N'noPDF.pdf', 1)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
SET IDENTITY_INSERT [dbo].[LessonViews] ON 

INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (1, N'29a92b35-5953-4978-ab01-3a94db43e7c0', 1, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (2, N'29a92b35-5953-4978-ab01-3a94db43e7c0', 2, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (3, N'29a92b35-5953-4978-ab01-3a94db43e7c0', 3, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (4, N'29a92b35-5953-4978-ab01-3a94db43e7c0', 4, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (5, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 1, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (6, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 2, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (7, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 3, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (8, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 1, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (9, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 2, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (10, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 3, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (11, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 4, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (12, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 5, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (13, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 6, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (14, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 7, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (15, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 8, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (16, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 9, CAST(N'2021-08-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (17, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 20, CAST(N'2021-08-14' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (18, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 21, CAST(N'2021-08-14' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (19, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 22, CAST(N'2021-08-14' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (20, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 23, CAST(N'2021-08-14' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (21, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 24, CAST(N'2021-08-14' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (22, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 25, CAST(N'2021-08-14' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (23, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 26, CAST(N'2021-08-14' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (24, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 27, CAST(N'2021-08-14' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (25, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 28, CAST(N'2021-08-14' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (26, N'd423b2d6-51c9-4723-93d9-57ed1640ff22', 14, CAST(N'2021-08-16' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (27, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 10, CAST(N'2021-08-17' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (28, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 11, CAST(N'2021-08-17' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (29, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 12, CAST(N'2021-08-17' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (30, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 13, CAST(N'2021-08-17' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (31, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 4, CAST(N'2021-08-17' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (32, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 5, CAST(N'2021-08-17' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewed], [UserId], [LessonId], [DateViewed]) VALUES (33, N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', 6, CAST(N'2021-08-17' AS Date))
SET IDENTITY_INSERT [dbo].[LessonViews] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'0edef12e-388b-4bb7-b88c-95a0352ccbf0', N'Brianna', N'Webb')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'65fbf3b9-dd2b-4e56-959a-9e2a92ea4584', N'David', N'Schejbal')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'a3d874e6-7f79-4480-93bd-09ea1b93a17b', N'Lunafreya', N'Schejbal')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'd423b2d6-51c9-4723-93d9-57ed1640ff22', N'Nora', N'Schejbal')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
