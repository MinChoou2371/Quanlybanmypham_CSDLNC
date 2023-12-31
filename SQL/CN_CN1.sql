USE [QUANLYMYPHAM]
GO

/****** Object:  Table [dbo].[CHINHANH]    Script Date: 03-Nov-22 10:47:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CHINHANH](
	[MACN] [char](4) NOT NULL,
	[TENCN] [nvarchar](40) NULL,
	[DIACHI] [nvarchar](40) NULL,
	[SDT] [nvarchar](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__CHINHANH__603F183C3F5721A4] PRIMARY KEY CLUSTERED 
(
	[MACN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CHINHANH] ADD  CONSTRAINT [MSmerge_df_rowguid_F9F8E4B753134B9F99F18CED18ABE169]  DEFAULT (newsequentialid()) FOR [rowguid]
GO

