/* TODO: Check PK_yaf_ */
/* Version 0.7.0 */

if not exists (select * from sysobjects where id = object_id(N'yaf_Active') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_Active] (
	[SessionID] [varchar] (24) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[IP] [varchar] (15) NOT NULL ,
	[Login] [datetime] NOT NULL ,
	[LastActive] [datetime] NOT NULL ,
	[Location] [varchar] (50) NOT NULL ,
	[ForumID] [int] NULL ,
	[TopicID] [int] NULL ,
	[Browser] [varchar] (50) NULL ,
	[Platform] [varchar] (50) NULL 
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_BannedIP') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_BannedIP] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Mask] [varchar] (15) NOT NULL ,
	[Since] [datetime] NOT NULL 
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_Buddy') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_Buddy] (
	[BuddyID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[BuddyUserID] [int] NOT NULL ,
	[Description] [varchar] (50) NULL ,
	[Block] [bit] NOT NULL 
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_Category') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_Category] (
	[CategoryID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [varchar] (50) NOT NULL ,
	[SortOrder] [smallint] NOT NULL 
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_CheckEmail') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_CheckEmail] (
	[CheckEmailID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[Email] [varchar] (50) NOT NULL ,
	[Created] [datetime] NOT NULL ,
	[Hash] [varchar] (32) NOT NULL 
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_Choice') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_Choice] (
	[ChoiceID] [int] IDENTITY (1, 1) NOT NULL ,
	[PollID] [int] NOT NULL ,
	[Choice] [varchar] (50) NOT NULL ,
	[Votes] [int] NOT NULL 
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_Forum') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_Forum] (
	[ForumID] [int] IDENTITY (1, 1) NOT NULL ,
	[CategoryID] [int] NOT NULL ,
	[Name] [varchar] (50) NOT NULL ,
	[Description] [varchar] (255) NOT NULL ,
	[SortOrder] [smallint] NOT NULL ,
	[Locked] [bit] NOT NULL ,
	[Hidden] [bit] NOT NULL ,
	[IsTest] [bit] NOT NULL ,
	[LastPosted] [datetime] NULL ,
	[LastTopicID] [int] NULL ,
	[LastMessageID] [int] NULL ,
	[LastUserID] [int] NULL ,
	[LastUserName] [varchar] (50) NULL ,
	[Moderated] [bit] NOT NULL
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_ForumAccess') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_ForumAccess] (
	[GroupID] [int] NOT NULL ,
	[ForumID] [int] NOT NULL ,
	[ReadAccess] [bit] NOT NULL ,
	[PostAccess] [bit] NOT NULL ,
	[ReplyAccess] [bit] NOT NULL ,
	[PriorityAccess] [bit] NOT NULL ,
	[PollAccess] [bit] NOT NULL ,
	[VoteAccess] [bit] NOT NULL ,
	[ModeratorAccess] [bit] NOT NULL ,
	[EditAccess] [bit] NOT NULL ,
	[DeleteAccess] [bit] NOT NULL ,
	[UploadAccess] [bit] NOT NULL
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_Group') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_Group] (
	[GroupID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [varchar] (50) NOT NULL ,
	[IsAdmin] [bit] NOT NULL ,
	[IsGuest] [bit] NOT NULL ,
	[IsStart] [bit] NOT NULL
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_Mail') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_Mail] (
	[MailID] [int] IDENTITY (1, 1) NOT NULL ,
	[FromUser] [varchar] (50) NOT NULL ,
	[ToUser] [varchar] (50) NOT NULL ,
	[Created] [datetime] NOT NULL ,
	[Subject] [varchar] (100) NOT NULL ,
	[Body] [text] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_Message') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_Message] (
	[MessageID] [int] IDENTITY (1, 1) NOT NULL ,
	[TopicID] [int] NOT NULL ,
	[UserID] [int] NOT NULL ,
	[UserName] [varchar] (50) NULL ,
	[Posted] [datetime] NOT NULL ,
	[Message] [text] NOT NULL ,
	[IP] [varchar] (15) NOT NULL ,
	[Edited] [datetime] NULL ,
	[Approved] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_PMessage') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_PMessage] (
	[PMessageID] [int] IDENTITY (1, 1) NOT NULL ,
	[FromUserID] [int] NOT NULL ,
	[ToUserID] [int] NOT NULL ,
	[Created] [datetime] NOT NULL ,
	[Subject] [varchar] (100) NOT NULL ,
	[Body] [text] NOT NULL ,
	[IsRead] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_Poll') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_Poll] (
	[PollID] [int] IDENTITY (1, 1) NOT NULL ,
	[Question] [varchar] (50) NOT NULL 
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_Smiley') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_Smiley] (
	[SmileyID] [int] IDENTITY (1, 1) NOT NULL ,
	[Code] [varchar] (10) NOT NULL ,
	[Icon] [varchar] (50) NOT NULL ,
	[Emoticon] [varchar] (50) NULL 
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_System') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_System] (
	[SystemID] [int] NOT NULL ,
	[Version] [int] NOT NULL ,
	[VersionName] [varchar] (50) NOT NULL ,
	[Name] [varchar] (50) NOT NULL ,
	[TimeZone] [int] NOT NULL ,
	[SmtpServer] [varchar] (50) NOT NULL ,
	[SmtpUserName] [varchar](50) NULL,
	[SmtpUserPass] [varchar](50) NULL,
	[ForumEmail] [varchar] (50) NOT NULL ,
	[EmailVerification] [bit] NOT NULL,
	[ShowMoved] [bit] NOT NULL,
	[BlankLinks] [bit] NOT NULL,
	[AvatarWidth] [int] NOT NULL,
	[AvatarHeight] [int] NOT NULL
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_Topic') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_Topic] (
	[TopicID] [int] IDENTITY (1, 1) NOT NULL ,
	[ForumID] [int] NOT NULL ,
	[UserID] [int] NOT NULL ,
	[UserName] [varchar] (50) NULL ,
	[Posted] [datetime] NOT NULL ,
	[Topic] [varchar] (100) NOT NULL ,
	[Views] [int] NOT NULL ,
	[IsLocked] [bit] NOT NULL ,
	[Priority] [smallint] NOT NULL ,
	[PollID] [int] NULL ,
	[TopicMovedID] [int] NULL ,
	[LastPosted] [datetime] NULL ,
	[LastMessageID] [int] NULL ,
	[LastUserID] [int] NULL ,
	[LastUserName] [varchar] (50) NULL 
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_User') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_User] (
	[UserID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [varchar] (50) NOT NULL ,
	[Password] [varchar] (32) NOT NULL ,
	[Email] [varchar] (50) NULL ,
	[Joined] [datetime] NOT NULL ,
	[LastVisit] [datetime] NOT NULL ,
	[IP] [varchar] (15) NULL ,
	[NumPosts] [int] NOT NULL ,
	[Approved] [bit] NOT NULL ,
	[Location] [varchar] (50) NULL ,
	[HomePage] [varchar] (50) NULL ,
	[TimeZone] [int] NOT NULL ,
	[Avatar] [varchar] (100) NULL ,
	[Signature] [varchar] (255) NULL ,
	[AvatarImage] [image] NULL,
	[RankID] [int] not null
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_WatchForum') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_WatchForum] (
	[WatchForumID] [int] IDENTITY (1, 1) NOT NULL ,
	[ForumID] [int] NOT NULL ,
	[UserID] [int] NOT NULL ,
	[Created] [datetime] NOT NULL 
) ON [PRIMARY]
GO

if not exists (select * from sysobjects where id = object_id(N'yaf_WatchTopic') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [yaf_WatchTopic] (
	[WatchTopicID] [int] IDENTITY (1, 1) NOT NULL ,
	[TopicID] [int] NOT NULL ,
	[UserID] [int] NOT NULL ,
	[Created] [datetime] NOT NULL 
) ON [PRIMARY]
GO

if not exists(select * from sysindexes where id=object_id('yaf_Active') and name='PK_Active')
ALTER TABLE [yaf_Active] WITH NOCHECK ADD 
	CONSTRAINT [PK_Active] PRIMARY KEY  CLUSTERED 
	(
		[SessionID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_BannedIP') and name='PK_BannedIP')
ALTER TABLE [yaf_BannedIP] WITH NOCHECK ADD 
	CONSTRAINT [PK_BannedIP] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Buddy') and name='PK_Buddy')
ALTER TABLE [yaf_Buddy] WITH NOCHECK ADD 
	CONSTRAINT [PK_Buddy] PRIMARY KEY  CLUSTERED 
	(
		[BuddyID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Category') and name='PK_Category')
ALTER TABLE [yaf_Category] WITH NOCHECK ADD 
	CONSTRAINT [PK_Category] PRIMARY KEY  CLUSTERED 
	(
		[CategoryID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_CheckEmail') and name='PK_CheckEmail')
ALTER TABLE [yaf_CheckEmail] WITH NOCHECK ADD 
	CONSTRAINT [PK_CheckEmail] PRIMARY KEY  CLUSTERED 
	(
		[CheckEmailID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Choice') and name='PK_Choice')
ALTER TABLE [yaf_Choice] WITH NOCHECK ADD 
	CONSTRAINT [PK_Choice] PRIMARY KEY  CLUSTERED 
	(
		[ChoiceID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Forum') and name='PK_Forum')
ALTER TABLE [yaf_Forum] WITH NOCHECK ADD 
	CONSTRAINT [PK_Forum] PRIMARY KEY  CLUSTERED 
	(
		[ForumID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_ForumAccess') and name='PK_ForumAccess')
ALTER TABLE [yaf_ForumAccess] WITH NOCHECK ADD 
	CONSTRAINT [PK_ForumAccess] PRIMARY KEY  CLUSTERED 
	(
		[GroupID],
		[ForumID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Group') and name='PK_Group')
ALTER TABLE [yaf_Group] WITH NOCHECK ADD 
	CONSTRAINT [PK_Group] PRIMARY KEY  CLUSTERED 
	(
		[GroupID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Mail') and name='PK_Mail')
ALTER TABLE [yaf_Mail] WITH NOCHECK ADD 
	CONSTRAINT [PK_Mail] PRIMARY KEY  CLUSTERED 
	(
		[MailID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Message') and name='PK_Message')
ALTER TABLE [yaf_Message] WITH NOCHECK ADD 
	CONSTRAINT [PK_Message] PRIMARY KEY  CLUSTERED 
	(
		[MessageID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_PMessage') and name='PK_PMessage')
ALTER TABLE [yaf_PMessage] WITH NOCHECK ADD 
	CONSTRAINT [PK_PMessage] PRIMARY KEY  CLUSTERED 
	(
		[PMessageID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Poll') and name='PK_Poll')
ALTER TABLE [yaf_Poll] WITH NOCHECK ADD 
	CONSTRAINT [PK_Poll] PRIMARY KEY  CLUSTERED 
	(
		[PollID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Smiley') and name='PK_Smiley')
ALTER TABLE [yaf_Smiley] WITH NOCHECK ADD 
	CONSTRAINT [PK_Smiley] PRIMARY KEY  CLUSTERED 
	(
		[SmileyID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_System') and name='PK_System')
ALTER TABLE [yaf_System] WITH NOCHECK ADD 
	CONSTRAINT [PK_System] PRIMARY KEY  CLUSTERED 
	(
		[SystemID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Topic') and name='PK_Topic')
ALTER TABLE [yaf_Topic] WITH NOCHECK ADD 
	CONSTRAINT [PK_Topic] PRIMARY KEY  CLUSTERED 
	(
		[TopicID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_User') and name='PK_User')
ALTER TABLE [yaf_User] WITH NOCHECK ADD 
	CONSTRAINT [PK_User] PRIMARY KEY  CLUSTERED 
	(
		[UserID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_WatchForum') and name='PK_WatchForum')
ALTER TABLE [yaf_WatchForum] WITH NOCHECK ADD 
	CONSTRAINT [PK_WatchForum] PRIMARY KEY  CLUSTERED 
	(
		[WatchForumID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_WatchTopic') and name='PK_WatchTopic')
ALTER TABLE [yaf_WatchTopic] WITH NOCHECK ADD 
	CONSTRAINT [PK_WatchTopic] PRIMARY KEY  CLUSTERED 
	(
		[WatchTopicID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysobjects where name='DF_yaf_BannedIP_Since' and parent_obj=object_id('yaf_BannedIP') and OBJECTPROPERTY(id,N'IsDefaultCnst')=1)
ALTER TABLE [yaf_BannedIP] ADD 
	CONSTRAINT [DF_yaf_BannedIP_Since] DEFAULT (getdate()) FOR [Since]
GO

if not exists(select * from sysindexes where id=object_id('yaf_BannedIP') and name='IX_BannedIP')
ALTER TABLE [yaf_BannedIP] ADD 
	CONSTRAINT [IX_BannedIP] UNIQUE  NONCLUSTERED 
	(
		[Mask]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Buddy') and name='IX_Buddy')
ALTER TABLE [yaf_Buddy] ADD 
	CONSTRAINT [IX_Buddy] UNIQUE  NONCLUSTERED 
	(
		[UserID],
		[BuddyUserID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Category') and name='IX_Category')
ALTER TABLE [yaf_Category] ADD 
	CONSTRAINT [IX_Category] UNIQUE  NONCLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_CheckEmail') and name='IX_CheckEmail')
ALTER TABLE [yaf_CheckEmail] ADD 
	CONSTRAINT [IX_CheckEmail] UNIQUE  NONCLUSTERED 
	(
		[Hash]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Forum') and name='IX_Forum')
ALTER TABLE [yaf_Forum] ADD 
	CONSTRAINT [IX_Forum] UNIQUE  NONCLUSTERED 
	(
		[CategoryID],
		[Name]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_Group') and name='IX_Group')
ALTER TABLE [yaf_Group] ADD 
	CONSTRAINT [IX_Group] UNIQUE  NONCLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_User') and name='IX_User')
ALTER TABLE [yaf_User] ADD 
	CONSTRAINT [IX_User] UNIQUE  NONCLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_WatchForum') and name='IX_WatchForum')
ALTER TABLE [yaf_WatchForum] ADD 
	CONSTRAINT [IX_WatchForum] UNIQUE  NONCLUSTERED 
	(
		[ForumID],
		[UserID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysindexes where id=object_id('yaf_WatchTopic') and name='IX_WatchTopic')
ALTER TABLE [yaf_WatchTopic] ADD 
	CONSTRAINT [IX_WatchTopic] UNIQUE  NONCLUSTERED 
	(
		[TopicID],
		[UserID]
	)  ON [PRIMARY] 
GO

if not exists(select * from sysobjects where name='FK_Active_Forum' and parent_obj=object_id('yaf_Active') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Active] ADD 
	CONSTRAINT [FK_Active_Forum] FOREIGN KEY 
	(
		[ForumID]
	) REFERENCES [yaf_Forum] (
		[ForumID]
	)
GO

if not exists(select * from sysobjects where name='FK_Active_Topic' and parent_obj=object_id('yaf_Active') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Active] ADD 
	CONSTRAINT [FK_Active_Topic] FOREIGN KEY 
	(
		[TopicID]
	) REFERENCES [yaf_Topic] (
		[TopicID]
	)
GO

if not exists(select * from sysobjects where name='FK_Active_User' and parent_obj=object_id('yaf_Active') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Active] ADD 
	CONSTRAINT [FK_Active_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [yaf_User] (
		[UserID]
	)
GO

if not exists(select * from sysobjects where name='FK_Buddy_User1' and parent_obj=object_id('yaf_Buddy') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Buddy] ADD 
	CONSTRAINT [FK_Buddy_User1] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [yaf_User] (
		[UserID]
	)
GO

if not exists(select * from sysobjects where name='FK_Buddy_User2' and parent_obj=object_id('yaf_Buddy') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Buddy] ADD 
	CONSTRAINT [FK_Buddy_User2] FOREIGN KEY 
	(
		[BuddyUserID]
	) REFERENCES [yaf_User] (
		[UserID]
	)
GO

if not exists(select * from sysobjects where name='FK_CheckEmail_User' and parent_obj=object_id('yaf_CheckEmail') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_CheckEmail] ADD 
	CONSTRAINT [FK_CheckEmail_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [yaf_User] (
		[UserID]
	)
GO

if not exists(select * from sysobjects where name='FK_Choice_Poll' and parent_obj=object_id('yaf_Choice') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Choice] ADD 
	CONSTRAINT [FK_Choice_Poll] FOREIGN KEY 
	(
		[PollID]
	) REFERENCES [yaf_Poll] (
		[PollID]
	)
GO

if not exists(select * from sysobjects where name='FK_Forum_Category' and parent_obj=object_id('yaf_Forum') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Forum] ADD 
	CONSTRAINT [FK_Forum_Category] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [yaf_Category] (
		[CategoryID]
	)
GO

if not exists(select * from sysobjects where name='FK_Forum_Message' and parent_obj=object_id('yaf_Forum') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Forum] ADD 
	CONSTRAINT [FK_Forum_Message] FOREIGN KEY 
	(
		[LastMessageID]
	) REFERENCES [yaf_Message] (
		[MessageID]
	)
GO

if not exists(select * from sysobjects where name='FK_Forum_Topic' and parent_obj=object_id('yaf_Forum') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Forum] ADD 
	CONSTRAINT [FK_Forum_Topic] FOREIGN KEY 
	(
		[LastTopicID]
	) REFERENCES [yaf_Topic] (
		[TopicID]
	)
GO

if not exists(select * from sysobjects where name='FK_Forum_User' and parent_obj=object_id('yaf_Forum') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Forum] ADD 
	CONSTRAINT [FK_Forum_User] FOREIGN KEY 
	(
		[LastUserID]
	) REFERENCES [yaf_User] (
		[UserID]
	)
GO

if not exists(select * from sysobjects where name='FK_ForumAccess_Forum' and parent_obj=object_id('yaf_ForumAccess') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_ForumAccess] ADD 
	CONSTRAINT [FK_ForumAccess_Forum] FOREIGN KEY 
	(
		[ForumID]
	) REFERENCES [yaf_Forum] (
		[ForumID]
	)
GO

if not exists(select * from sysobjects where name='FK_ForumAccess_Group' and parent_obj=object_id('yaf_ForumAccess') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_ForumAccess] ADD 
	CONSTRAINT [FK_ForumAccess_Group] FOREIGN KEY 
	(
		[GroupID]
	) REFERENCES [yaf_Group] (
		[GroupID]
	)
GO

if not exists(select * from sysobjects where name='FK_Message_Topic' and parent_obj=object_id('yaf_Message') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Message] ADD 
	CONSTRAINT [FK_Message_Topic] FOREIGN KEY 
	(
		[TopicID]
	) REFERENCES [yaf_Topic] (
		[TopicID]
	)
GO

if not exists(select * from sysobjects where name='FK_Message_User' and parent_obj=object_id('yaf_Message') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Message] ADD 
	CONSTRAINT [FK_Message_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [yaf_User] (
		[UserID]
	)
GO

if not exists(select * from sysobjects where name='FK_PMessage_User1' and parent_obj=object_id('yaf_PMessage') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_PMessage] ADD 
	CONSTRAINT [FK_PMessage_User1] FOREIGN KEY 
	(
		[FromUserID]
	) REFERENCES [yaf_User] (
		[UserID]
	)
GO

if not exists(select * from sysobjects where name='FK_PMessage_User2' and parent_obj=object_id('yaf_PMessage') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_PMessage] ADD 
	CONSTRAINT [FK_PMessage_User2] FOREIGN KEY 
	(
		[ToUserID]
	) REFERENCES [yaf_User] (
		[UserID]
	)
GO

if not exists(select * from sysobjects where name='FK_Topic_Forum' and parent_obj=object_id('yaf_Topic') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Topic] ADD 
	CONSTRAINT [FK_Topic_Forum] FOREIGN KEY 
	(
		[ForumID]
	) REFERENCES [yaf_Forum] (
		[ForumID]
	)
GO

if not exists(select * from sysobjects where name='FK_Topic_Message' and parent_obj=object_id('yaf_Topic') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Topic] ADD 
	CONSTRAINT [FK_Topic_Message] FOREIGN KEY 
	(
		[LastMessageID]
	) REFERENCES [yaf_Message] (
		[MessageID]
	)
GO

if not exists(select * from sysobjects where name='FK_Topic_Poll' and parent_obj=object_id('yaf_Topic') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Topic] ADD 
	CONSTRAINT [FK_Topic_Poll] FOREIGN KEY 
	(
		[PollID]
	) REFERENCES [yaf_Poll] (
		[PollID]
	)
GO

if not exists(select * from sysobjects where name='FK_Topic_Topic' and parent_obj=object_id('yaf_Topic') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Topic] ADD 
	CONSTRAINT [FK_Topic_Topic] FOREIGN KEY 
	(
		[TopicMovedID]
	) REFERENCES [yaf_Topic] (
		[TopicID]
	)
GO

if not exists(select * from sysobjects where name='FK_Topic_User' and parent_obj=object_id('yaf_Topic') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Topic] ADD 
	CONSTRAINT [FK_Topic_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [yaf_User] (
		[UserID]
	)
GO

if not exists(select * from sysobjects where name='FK_Topic_User2' and parent_obj=object_id('yaf_Topic') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_Topic] ADD 
	CONSTRAINT [FK_Topic_User2] FOREIGN KEY 
	(
		[LastUserID]
	) REFERENCES [yaf_User] (
		[UserID]
	)
GO

if not exists(select * from sysobjects where name='FK_WatchForum_Forum' and parent_obj=object_id('yaf_WatchForum') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_WatchForum] ADD 
	CONSTRAINT [FK_WatchForum_Forum] FOREIGN KEY 
	(
		[ForumID]
	) REFERENCES [yaf_Forum] (
		[ForumID]
	)
GO

if not exists(select * from sysobjects where name='FK_WatchForum_User' and parent_obj=object_id('yaf_WatchForum') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_WatchForum] ADD 
	CONSTRAINT [FK_WatchForum_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [yaf_User] (
		[UserID]
	)
GO

if exists(select * from sysobjects where name='FK_TrackTopic_Topic' and parent_obj=object_id('yaf_WatchTopic') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
alter table yaf_WatchTopic drop FK_TrackTopic_Topic
GO

if not exists(select * from sysobjects where name='FK_WatchTopic_Topic' and parent_obj=object_id('yaf_WatchTopic') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_WatchTopic] ADD 
	CONSTRAINT [FK_WatchTopic_Topic] FOREIGN KEY 
	(
		[TopicID]
	) REFERENCES [yaf_Topic] (
		[TopicID]
	)
GO

if exists(select * from sysobjects where name='FK_TrackTopic_User' and parent_obj=object_id('yaf_WatchTopic') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
alter table yaf_WatchTopic drop FK_TrackTopic_User
GO

if not exists(select * from sysobjects where name='FK_WatchTopic_User' and parent_obj=object_id('yaf_WatchTopic') and OBJECTPROPERTY(id,N'IsForeignKey')=1)
ALTER TABLE [yaf_WatchTopic] ADD 
	CONSTRAINT [FK_WatchTopic_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [yaf_User] (
		[UserID]
	)
GO

if exists (select * from sysobjects where id = object_id(N'yaf_bannedip_delete') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_bannedip_delete
GO

create procedure yaf_bannedip_delete(@ID int) as
begin
	delete from yaf_BannedIP where ID = @ID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_bannedip_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_bannedip_list
GO

create procedure yaf_bannedip_list(@ID int=null) as
begin
	if @ID is null
		select * from yaf_BannedIP
	else
		select * from yaf_BannedIP where ID = @ID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_bannedip_save') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_bannedip_save
GO

create procedure yaf_bannedip_save(@ID int=null,@Mask varchar(15)) as
begin
	if @ID is null or @ID = 0 begin
		insert into yaf_BannedIP(Mask) values(@Mask)
	end
	else begin
		update yaf_BannedIP set Mask = @Mask where ID = @ID
	end
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_category_delete') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_category_delete
GO

create procedure yaf_category_delete(@CategoryID int) as
begin
	--delete from yaf_Forum where CategoryID = @CategoryID
	delete from yaf_Category where CategoryID = @CategoryID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_category_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_category_list
GO

create procedure yaf_category_list(@CategoryID int=null) as
begin
	if @CategoryID is null
		select * from yaf_Category order by SortOrder
	else
		select * from yaf_Category where CategoryID = @CategoryID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_category_save') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_category_save
GO

create procedure yaf_category_save(@CategoryID int,@Name varchar(50),@SortOrder smallint) as
begin
	if @CategoryID>0 begin
		update yaf_Category set Name=@Name,SortOrder=@SortOrder where CategoryID=@CategoryID
		select CategoryID = @CategoryID
	end
	else begin
		insert into yaf_Category(Name,SortOrder) values(@Name,@SortOrder)
		select CategoryID = @@IDENTITY
	end
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_checkemail_save') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_checkemail_save
GO

create procedure yaf_checkemail_save(@UserID int,@Hash varchar(32),@Email varchar(50)) as
begin
	insert into yaf_CheckEmail(UserID,Email,Created,Hash)
	values(@UserID,@Email,getdate(),@Hash)	
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_checkemail_update') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_checkemail_update
GO

create procedure yaf_checkemail_update(@Hash varchar(32)) as
begin
	declare @UserID int
	declare @CheckEmailID int
	declare @Email varchar(50)
	set @UserID = null
	select 
		@CheckEmailID = CheckEmailID,
		@UserID = UserID,
		@Email = Email
	from
		yaf_CheckEmail
	where
		Hash = @Hash
	if @UserID is null begin
		select convert(bit,0)
		return
	end
	-- Update new user email
	update yaf_User set Email = @Email, Approved = 1 where UserID = @UserID
	delete yaf_CheckEmail where CheckEmailID = @CheckEmailID
	select convert(bit,1)
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_choice_vote') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_choice_vote
GO

create procedure yaf_choice_vote(@ChoiceID int) as
begin
	update yaf_Choice set Votes = Votes + 1 where ChoiceID = @ChoiceID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_forum_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_forum_list
GO

CREATE  procedure yaf_forum_list(@ForumID int=null) as
begin
	if @ForumID = 0 set @ForumID = null
	if @ForumID is null
		select * from yaf_Forum order by SortOrder
	else
		select * from yaf_Forum where ForumID = @ForumID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_forum_moderators') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_forum_moderators
GO

create procedure yaf_forum_moderators as
begin
	select
		a.ForumID, 
		a.GroupID, 
		GroupName = b.Name
	from
		yaf_ForumAccess a,
		yaf_Group b
	where
		a.ModeratorAccess = 1 and
		b.GroupID = a.GroupID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_forumaccess_group') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_forumaccess_group
GO

create procedure yaf_forumaccess_group(@GroupID int) as
begin
	select 
		a.*,
		ForumName = b.Name,
		CategoryName = c.Name 
	from 
		yaf_ForumAccess a, 
		yaf_Forum b, 
		yaf_Category c 
	where 
		a.GroupID = @GroupID and 
		b.ForumID=a.ForumID and 
		c.CategoryID=b.CategoryID 
	order by 
		c.SortOrder,
		b.SortOrder
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_forumaccess_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_forumaccess_list
GO

create procedure yaf_forumaccess_list(@ForumID int) as
begin
	select 
		a.*,
		GroupName=b.Name 
	from 
		yaf_ForumAccess a, 
		yaf_Group b 
	where 
		a.ForumID = @ForumID and 
		b.GroupID = a.GroupID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_group_delete') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_group_delete
GO

create procedure yaf_group_delete(@GroupID int) as
begin
	delete from yaf_ForumAccess where GroupID = @GroupID
	delete from yaf_Group where GroupID = @GroupID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_group_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_group_list
GO

create procedure yaf_group_list(@GroupID int=null) as
begin
	if @GroupID is null
		select * from yaf_Group
	else
		select * from yaf_Group where GroupID = @GroupID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_mail_delete') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_mail_delete
GO

create procedure yaf_mail_delete(@MailID int) as
begin
	delete from yaf_Mail where MailID = @MailID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_mail_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_mail_list
GO

create procedure yaf_mail_list as
begin
	select top 10 * from yaf_Mail order by Created
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_message_delete') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_message_delete
GO

CREATE  procedure yaf_message_delete(@MessageID int) as
begin
	declare @TopicID	int
	declare @MessageCount	int
	declare @LastMessageID	int
	-- Find TopicID
	select @TopicID = TopicID from yaf_Message where MessageID = @MessageID
	-- Update LastMessageID in Topic and Forum
	update yaf_Topic set 
		LastPosted = null,
		LastMessageID = null,
		LastUserID = null,
		LastUserName = null
	where LastMessageID = @MessageID
	update yaf_Forum set 
		LastPosted = null,
		LastTopicID = null,
		LastMessageID = null,
		LastUserID = null,
		LastUserName = null
	where LastMessageID = @MessageID
	-- Delete message
	delete from yaf_Message where MessageID = @MessageID
	-- Delete topic if there are no more messages
	select @MessageCount = count(1) from yaf_Message where TopicID = @TopicID
	if @MessageCount=0 exec yaf_topic_delete @TopicID
	-- update lastpost
	exec yaf_topic_updatelastpost
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_message_searchphrase') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_message_searchphrase
GO

create procedure yaf_message_searchphrase(@CategoryID int=null,@ForumID int=null,@UserID int,@Search varchar(255)) as
begin
	return
	/*
	declare @Filter varchar(255)
	-- Exact phrase
	set @Filter = '%' + @Search + '%'
	select
		CategoryID	= a.CategoryID,
		ForumID		= a.ForumID,
		TopicID		= e.TopicID,
		MessageID	= f.MessageID,
		Topic		= e.Topic,
		Posted		= f.Posted,
		Message		= convert(varchar(100),f.Message)
	from
		yaf_Forum a,
		yaf_ForumAccess b,
		yaf_Group c,
		yaf_User d,
		yaf_Topic e,
		yaf_Message f
	where
		d.UserID = @UserID and
		b.ReadAccess = 1 and
		(e.Topic like @Filter or f.Message like @Filter) and
		(@CategoryID is null or a.CategoryID = @CategoryID) and
		(@ForumID is null or a.ForumID = @ForumID) and
		b.ForumID = a.ForumID and
		b.GroupID = c.GroupID and
		c.GroupID = d.GroupID and
		e.ForumID = a.ForumID and
		f.TopicID = e.TopicID
	*/
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_pmessage_delete') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_pmessage_delete
GO

create procedure yaf_pmessage_delete(@PMessageID int) as
begin
	delete from yaf_PMessage where PMessageID = @PMessageID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_pmessage_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_pmessage_list
GO

create procedure yaf_pmessage_list(@UserID int=null,@Sent bit=null,@PMessageID int=null) as
begin
	if @PMessageID is null begin
		select
			a.*,
			FromUser = b.Name,
			ToUser = c.Name
		from
			yaf_PMessage a,
			yaf_User b,
			yaf_User c
		where
			b.UserID = a.FromUserID and
			c.UserID = a.ToUserID and
			((@Sent=0 and a.ToUserID = @UserID) or (@Sent=1 and a.FromUserID = @UserID))
		order by
			Created desc
	end
	else begin
		select
			a.*,
			FromUser = b.Name,
			ToUser = c.Name
		from
			yaf_PMessage a,
			yaf_User b,
			yaf_User c
		where
			b.UserID = a.FromUserID and
			c.UserID = a.ToUserID and
			a.PMessageID = @PMessageID
		order by
			Created desc
	end
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_pmessage_save') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_pmessage_save
GO

create procedure yaf_pmessage_save(
	@From		varchar(50),
	@To		varchar(50),
	@Subject	varchar(100),
	@Body		text
) as
begin
	declare @ToUserID int
	declare @FromUserID int
	select @ToUserID = UserID from yaf_User where Name = @To
	select @FromUserID = UserID from yaf_User where Name = @From
	insert into yaf_PMessage(FromUserID,ToUserID,Created,Subject,Body,IsRead)
	values(@FromUserID,@ToUserID,getdate(),@Subject,@Body,0)
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_smiley_listunique') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_smiley_listunique
GO

create procedure yaf_smiley_listunique as
begin
	select 
		Icon, 
		Emoticon,
		Code = (select top 1 Code from yaf_Smiley x where x.Icon=yaf_Smiley.Icon)
	from 
		yaf_Smiley
	group by
		Icon,
		Emoticon
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_system_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_system_list
GO

create procedure yaf_system_list as
begin
	select top 1 
		a.*,
		SQLVersion = @@VERSION
	from 
		yaf_System a
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_topic_delete') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_topic_delete
GO

CREATE   procedure yaf_topic_delete(@TopicID int) as
begin
	--begin transaction
	update yaf_Topic set LastMessageID = null where TopicID = @TopicID
	update yaf_Forum set 
		LastTopicID = null,
		LastMessageID = null,
		LastUserID = null,
		LastUserName = null,
		LastPosted = null
	where LastMessageID in (select MessageID from yaf_Message where TopicID = @TopicID)
	update yaf_Active set TopicID = null where TopicID = @TopicID
	--commit
	--begin transaction
	delete from yaf_WatchTopic where TopicID = @TopicID
	delete from yaf_Message where TopicID = @TopicID
	delete from yaf_Topic where TopicMovedID = @TopicID
	delete from yaf_Topic where TopicID = @TopicID
	--commit
	exec yaf_topic_updatelastpost
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_topic_findnext') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_topic_findnext
GO

create procedure yaf_topic_findnext(@TopicID int) as
begin
	declare @LastPosted datetime
	declare @ForumID int
	select @LastPosted = LastPosted, @ForumID = ForumID from yaf_Topic where TopicID = @TopicID
	select top 1 TopicID from yaf_Topic where LastPosted>@LastPosted and ForumID = @ForumID order by LastPosted asc
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_topic_findprev') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_topic_findprev
GO

create procedure yaf_topic_findprev(@TopicID int) as 
begin
	declare @LastPosted datetime
	declare @ForumID int
	select @LastPosted = LastPosted, @ForumID = ForumID from yaf_Topic where TopicID = @TopicID
	select top 1 TopicID from yaf_Topic where LastPosted<@LastPosted and ForumID = @ForumID order by LastPosted desc
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_topic_info') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_topic_info
GO

create procedure yaf_topic_info(@TopicID int=null) as
begin
	if @TopicID = 0 set @TopicID = null
	if @TopicID is null
		select * from yaf_Topic
	else
		select * from yaf_Topic where TopicID = @TopicID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_topic_lock') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_topic_lock
GO

create procedure yaf_topic_lock(@TopicID int,@Locked bit) as
begin
	update yaf_Topic set IsLocked = @Locked where TopicID = @TopicID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_user_changepassword') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_user_changepassword
GO

create procedure yaf_user_changepassword(@UserID int,@OldPassword varchar(32),@NewPassword varchar(32)) as
begin
	declare @CurrentOld varchar(32)
	select @CurrentOld = Password from yaf_User where UserID = @UserID
	if @CurrentOld<>@OldPassword begin
		select Success = convert(bit,0)
		return
	end
	update yaf_User set Password = @NewPassword where UserID = @UserID
	select Success = convert(bit,1)
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_user_getsignature') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_user_getsignature
GO

create procedure yaf_user_getsignature(@UserID int) as
begin
	select Signature from yaf_User where UserID = @UserID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_user_login') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_user_login
GO

create procedure yaf_user_login(@Name varchar(50),@Password varchar(32)) as
begin
	declare @IsValid int
	select 
		@IsValid = count(1) 
	from 
		yaf_User 
	where 
		Approved=1 and 
		Name = @Name and 
		Password = @Password
	if @IsValid=1
		select Success = convert(bit,1)
	else
		select Success = convert(bit,0)
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_user_recoverpassword') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_user_recoverpassword
GO

create procedure yaf_user_recoverpassword(@UserName varchar(50),@Email varchar(50),@Password varchar(32)) as
begin
	declare @UserID int
	select @UserID = UserID from yaf_User where Name = @UserName and Email = @Email
	if @UserID is null begin
		select Success = convert(bit,0)
		return
	end
	update yaf_User set Password = @Password where UserID = @UserID
	select Success = convert(bit,1)
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_user_savesignature') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_user_savesignature
GO

create procedure yaf_user_savesignature(@UserID int,@Signature text) as
begin
	update yaf_User set Signature = @Signature where UserID = @UserID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_watchforum_add') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_watchforum_add
GO

CREATE  procedure yaf_watchforum_add(@UserID int,@ForumID int) as
begin
	insert into yaf_WatchForum(ForumID,UserID,Created)
	select @ForumID, @UserID, getdate()
	where not exists(select 1 from yaf_WatchForum where ForumID=@ForumID and UserID=@UserID)
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_watchforum_delete') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_watchforum_delete
GO

create procedure yaf_watchforum_delete(@WatchForumID int) as
begin
	delete from yaf_WatchForum where WatchForumID = @WatchForumID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_watchforum_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_watchforum_list
GO

create procedure yaf_watchforum_list(@UserID int) as
begin
	select
		a.*,
		ForumName = b.Name,
		Replies = (select count(1) from yaf_Topic x, yaf_Message y where x.ForumID=a.ForumID and y.TopicID=x.TopicID) - 1,
		Topics = (select count(1) from yaf_Topic x where x.ForumID=a.ForumID),
		b.LastPosted,
		b.LastMessageID,
		LastTopicID = (select TopicID from yaf_Message x where x.MessageID=b.LastMessageID),
		b.LastUserID,
		LastUserName = IsNull(b.LastUserName,(select Name from yaf_User x where x.UserID=b.LastUserID))
	from
		yaf_WatchForum a,
		yaf_Forum b
	where
		a.UserID = @UserID and
		b.ForumID = a.ForumID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_watchtopic_delete') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_watchtopic_delete
GO

create procedure yaf_watchtopic_delete(@WatchTopicID int) as
begin
	delete from yaf_WatchTopic where WatchTopicID = @WatchTopicID
end
GO

if exists (select * from sysobjects where id = object_id(N'yaf_watchtopic_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure yaf_watchtopic_list
GO

create procedure yaf_watchtopic_list(@UserID int) as
begin
	select
		a.*,
		TopicName = b.Topic,
		Replies = (select count(1) from yaf_Message x where x.TopicID=b.TopicID),
		b.Views,
		b.LastPosted,
		b.LastMessageID,
		b.LastUserID,
		LastUserName = IsNull(b.LastUserName,(select Name from yaf_User x where x.UserID=b.LastUserID))
	from
		yaf_WatchTopic a,
		yaf_Topic b
	where
		a.UserID = @UserID and
		b.TopicID = a.TopicID
end
GO
