--Stored Procedure
--Lấy ra danh sách hóa đơn có sản phẩm số lượng là 1
CREATE PROCEDURE Soluong (@soluong int = 1)
AS
BEGIN
	SELECT *
	FROM CTHD 
	WHERE SL = @soluong
END;

exec Soluong ;
--lấy ra danh sách nhân viên kèm mã số nhân viên của họ
CREATE PROCEDURE [dbo].[view_DanhSachNhanVien] 
AS
	SELECT MANV, HOTEN
	FROM NHANVIEN 
drop view [dbo].[view_DanhSachNhanVien] ;
exec [dbo].[view_DanhSachNhanVien] ;

--Kiểm tra mã nhân viên được truyền vào tồn tại hay chưa
create procedure sp_TraCuu_KiemTraMaNhanVien
	@MANHANVIEN CHAR(4)
as
begin
	if exists( select * from NHANVIEN as NV where NV.MANV = @MANHANVIEN)
		return 1; -- ma nhan vien ton tai
	return 0; -- ma nhan vien khong ton tai
end

DROP PROC sp_TraCuu_KiemTraMaNhanVien ;

declare @returnedResult CHAR(4)
exec @returnedResult = sp_TraCuu_KiemTraMaNhanVien 'NV07'
select @returnedResult

--Cập nhật số lượng sản phẩm biến động
CREATE PROCEDURE sp_CapNhatSoLuongSanPham
	@CHEDO NVARCHAR(6),
	@MASP CHAR(4),
	@SOLUONG INT
AS
BEGIN
	-- NEU XUAT SAN PHAM RA
	IF( @CHEDO = 'EXPORT')
	BEGIN
		IF( EXISTS(SELECT * FROM DBO.SANPHAM AS SP WHERE SP.MASP = @MASP))
			BEGIN
				UPDATE DBO.SANPHAM
				SET SLTON = SLTON - @SOLUONG
				WHERE MASP = @MASP
			END
	END

	-- NEU NHAP SAN PHAM VAO
	IF( @CHEDO = 'IMPORT')
	BEGIN
		IF( EXISTS(SELECT * FROM DBO.SANPHAM AS SP WHERE SP.MASP = @MASP) )
			BEGIN
				UPDATE DBO.SANPHAM
				SET SLTON = SLTON + @SOLUONG
				WHERE MASP = @MASP
			END
	END
END
drop proc sp_CapNhatSoLuongVatTu;

EXEC sp_CapNhatSoLuongSanPham 'IMPORT','CF01', 10

--Trigger
--Thêm một hóa đơn mới thì trị giá phải lớn hơn 0
CREATE TRIGGER trigger_TRIGIA ON dbo.HOADON
FOR INSERT, UPDATE
AS
DECLARE @new FLOAT
SELECT @new=ne.TRIGIA FROM Inserted ne
IF (@new<=0)
BEGIN
	PRINT(N'Giá trị phải lớn hơn 0')
	ROLLBACK;
END
GO

--DROP TRIGGER trigger_TRIGIA

SELECT * FROM HOADON
Insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA, rowguid)
Values (1023, CAST(N'2021-09-18' AS Date), N'K003', N'NV05', 100000,  N'7294315e-255b-ed11-b539-ac162d516697')

--Doanh số của khách hàng phải lớn hơn 0
CREATE TRIGGER trigger_DOANHSO ON dbo.KHACHHANG
FOR INSERT, UPDATE
AS
DECLARE @new FLOAT
SELECT @new=ne.DOANHSO FROM Inserted ne
IF (@new<=0)
BEGIN
	PRINT(N'Doanh số phải lớn hơn 0')
	ROLLBACK;
END
GO
--drop trigger trigger_DOANHSO
SELECT * FROM KHACHHANG
Insert into KHACHHANG (MAKH, HOTEN, DIACHI, SDT, NGSINH, DOANHSO, NGDK, MACN, rowguid)
Values (N'K014', N'Nguyên Thảo', N'67, Ấp 2B, xã  Thạnh Phú Đông, huyện Giồng Trôm, tỉnh Bến Tre', N'0789453470',
CAST(N'2000-06-18' AS Date), 420000.0000, CAST(N'2021-07-27' AS Date), N'CN1 ', N'4494315e-255b-ed11-b539-ac162d516697')



