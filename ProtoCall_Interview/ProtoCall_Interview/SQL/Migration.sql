CREATE TABLE [dbo].[People](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EntityId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](400) NULL,
	[LastName] [nvarchar](400) NULL,
	[PreferredName] [nvarchar](256) NULL,
	[BirthDate] [datetime] NULL,
	[PrimaryPhoneNumber] [nvarchar](25) NULL,
	[SecondaryPhoneNumber] [nvarchar](25) NULL,

 CONSTRAINT [PK_dbo.People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO People(EntityId, FirstName, LastName, PreferredName, BirthDate, PrimaryPhoneNumber)VALUES(NEWID(), 'Jacob', 'Wisniewski', NULL, '18-Mar-1992', '(616)795-8076') 
INSERT INTO People(EntityId, FirstName, LastName, PreferredName, BirthDate, PrimaryPhoneNumber)VALUES(NEWID(), 'Kendra', 'Ensley', NULL, '11-Jan-1993', '(616)123-1234') 
INSERT INTO People(EntityId, FirstName, LastName, PreferredName, BirthDate, PrimaryPhoneNumber)VALUES(NEWID(), 'Jeff', 'Lebowski', 'The Dude', '11-05-1952', '(808)547-9997') 


GO
