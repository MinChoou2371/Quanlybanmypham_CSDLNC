USE [QUANLYMYPHAM]
GO
/****** Object:  StoredProcedure [dbo].[NHANVIEN_DELETE]    Script Date: 14-Dec-22 9:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[NHANVIEN_DELETE]
(
@MANV char(4)
)
AS
BEGIN
DELETE FROM [dbo].[NHANVIEN]
      WHERE MANV=@MANV

SELECT ErrMsg=N'Xóa thành công'
END