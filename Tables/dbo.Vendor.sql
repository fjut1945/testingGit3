SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendor] (
		[BusinessEntityID]            [int] NOT NULL,
		[AccountNumber]               [int] NOT NULL,
		[Name]                        [int] NOT NULL,
		[CreditRating]                [tinyint] NOT NULL,
		[PreferredVendorStatus]       [int] NOT NULL,
		[ActiveFlag]                  [int] NOT NULL,
		[PurchasingWebServiceURL]     [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ModifiedDate]                [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vendor]
	ADD
	CONSTRAINT [PK_Vendor_BusinessEntityID]
	PRIMARY KEY
	CLUSTERED
	([BusinessEntityID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vendor]
	ADD
	CONSTRAINT [CK_Vendor_CreditRating]
	CHECK
	([CreditRating]>=(1) AND [CreditRating]<=(5))
GO
ALTER TABLE [dbo].[Vendor]
CHECK CONSTRAINT [CK_Vendor_CreditRating]
GO
ALTER TABLE [dbo].[Vendor]
	ADD
	CONSTRAINT [DF_Vendor_ActiveFlag]
	DEFAULT ((1)) FOR [ActiveFlag]
GO
ALTER TABLE [dbo].[Vendor]
	ADD
	CONSTRAINT [DF_Vendor_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Vendor]
	ADD
	CONSTRAINT [DF_Vendor_PreferredVendorStatus]
	DEFAULT ((1)) FOR [PreferredVendorStatus]
GO
ALTER TABLE [dbo].[Vendor] SET (LOCK_ESCALATION = TABLE)
GO
