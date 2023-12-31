USE [QUANLYMYPHAM]
GO
/****** Object:  StoredProcedure [dbo].[NHANVIEN_INSERT]    Script Date: 14-Dec-22 9:38:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[NHANVIEN_INSERT]
(
@MANV char(4),
@HOTEN nvarchar(40),
@GIOITINH nvarchar(4),
@NGVL date,
@CHUCVU nvarchar(30),
@MACN char(4),
@SDT nvarchar(10),
@rowguid uniqueidentifier
)
AS
BEGIN
	INSERT INTO [dbo].[NHANVIEN]
           ([MANV]
           ,[HOTEN]
           ,[GIOITINH]
           ,[NGVL]
           ,[CHUCVU]
           ,[MACN]
           ,[SDT]
           ,[rowguid])
     VALUES
           (@MANV,@HOTEN,@GIOITINH,@NGVL,@CHUCVU,@MACN,@SDT,@rowguid)
		   SELECT ErrMsg=N'Thêm thành công'

END
