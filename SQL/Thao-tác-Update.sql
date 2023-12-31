USE [QUANLYMYPHAM]
GO
/****** Object:  StoredProcedure [dbo].[NHANVIEN_UPDATE]    Script Date: 14-Dec-22 9:38:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[NHANVIEN_UPDATE]
(
@MANV char(4),
@HOTEN nvarchar(40),
@GIOITINH nvarchar(4),
@NGVL date,
@CHUCVU nvarchar(30),
@MACN char(4),
@SDT nvarchar(10)
)
AS
BEGIN

UPDATE [dbo].[NHANVIEN]
   SET [HOTEN] = @HOTEN
      ,[GIOITINH] = @GIOITINH
      ,[NGVL] = @NGVL
      ,[CHUCVU] = @CHUCVU
      ,[MACN] = @MACN
      ,[SDT] = @SDT
 WHERE MANV=@MANV
 SELECT ErrMsg=N'Sửa thành công'

END
