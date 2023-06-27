create database QUANLYMYPHAM

use QUANLYMYPHAM

CREATE TABLE KHACHHANG
(
	MAKH	char(4) PRIMARY KEY,
	HOTEN	Nvarchar(80),
	DIACHI	Nvarchar(100),
	SDT		Nvarchar(10),
	NGSINH	date,
	DOANHSO	money,
	NGDK	date,
	MACN char(4)
	
)
CREATE TABLE NHANVIEN
(
	MANV	char(4) PRIMARY KEY,
	HOTEN	 Nvarchar(40),
	GIOITINH Nvarchar(4),
	NGVL	date,
	CHUCVU  Nvarchar(30),
	MACN   char(4) foreign key references CHINHANH(MACN) ,
	SDT		Nvarchar(10)
	
)
CREATE TABLE SANPHAM
(
	MASP	char(4)PRIMARY KEY,
	TENSP	Nvarchar(40),
	DVT		Nvarchar(20),
	GIA		money,
	SLTON   int
)
CREATE TABLE HOADON
(
	SOHD		int PRIMARY KEY,
	NGHD		date,
	MAKH		char(4)FOREIGN KEY REFERENCES KHACHHANG(MAKH),
	MANV		char(4) FOREIGN KEY REFERENCES NHANVIEN(MANV),
	TRIGIA		money
)
CREATE TABLE CTHD
(
	SOHD		int FOREIGN KEY REFERENCES HOADON(SOHD),
	MASP		char(4) FOREIGN KEY REFERENCES SANPHAM(MASP),
	SL			int,
	CONSTRAINT PK_CTHD PRIMARY KEY (SOHD,MASP)
)
CREATE TABLE CHINHANH(
	MACN char(4) PRIMARY KEY,
	TENCN Nvarchar(40),
	DIACHI Nvarchar(40),
	SDT		Nvarchar(10)
)

insert into KHACHHANG
values
('K001',N'Phạm Thị Minh Châu',N'98,Ấp 1, xã Phước Long, huyện Giồng Trôm, tỉnh Bến Tre','0361051729','2002-11-08','595000','2020-12-25','CN1'),
('K002',N'Ngô Phạm Hoàn Châu',N'410, Ấp 5, xã  Sơn Phú, huyện Giồng Trôm, tỉnh Bến Tre','0381075089','1999-07-23','370000','2021-01-28','CN2'),
('K003',N'Võ Quốc Huy',N'257, Ấp 6, xã Sơn Phú, huyện Giồng Trôm, tỉnh Bến Tre','0391082860','1995-05-04','737000','2021-02-03','CN1'),
('K004',N'Kim Duy Khang',N'749, Ấp 3, xã Thạnh Phú Đông, huyện Giồng Trôm, tỉnh Bến Tre','0981064169','2001-03-17','170000','2021-03-26','CN1'),
('K005',N'Lê Võ Huỳnh Nga',N'172, Ấp 6, xã Tân Lợi Thạnh, huyện Giồng Trôm, tỉnh Bến Tre','0781050003','2002-12-28','530000','2021-04-30','CN2'),
('K006',N'Nguyễn Ngọc Công Thành',N'987, Ấp 6, xã Phước Long, huyện Giồng Trôm, tỉnh Bến Tre','0332086293','2002-08-05','10000','2021-5-19','CN2'),
('K007',N'Tô Thị Bé Thơ',N'237, Ấp 4, xã Sơn Phú, huyện Giồng Trôm, tỉnh Bến Tre','0367655586','1998-07-20','420000','2021-06-01','CN2'),
('K008',N'Võ Huỳnh Anh Tuấn',N'659, Ấp 7, xã Phước Long, huyện Giồng Trôm, tỉnh Bến Tre','0984384486','2001-01-25','200000','2021-07-15','CN2'),
('K009',N'Võ Văn Lâm Trường',N'67, Ấp 2B, xã  Thạnh Phú Đông, huyện Giồng Trôm, tỉnh Bến Tre','0789453470','2000-06-18','240000','2021-07-27','CN1'),
('K010',N'Trần Thị Hải Yến',N'339, Ấp 1, xã Tân Hào, huyện Giồng Trôm, tỉnh Bến Tre','0368593489','2000-09-30','500000','2021-09-02','CN1');
insert into NHANVIEN
values
('NV01', N'Nguyễn Thị Diệu Ân',N'Nữ','2020-12-20',N'Quản lý','CN1','0865469104'),
('NV02', N'Trần Khánh Duy',N'Nam','2020-12-20',N'Nhân viên','CN2','0349821209'),
('NV03', N'Tạ Nguyễn Gia Hân',N'Nữ','2021-01-15',N'Quản lý','CN2','0357377543'),
('NV04', N'Huỳnh Thị Thanh Thủy',N'Nữ','2021-02-03',N'Nhân viên','CN2','0374249602'),
('NV05', N'Phan Huỳnh Trung',N'Nam','2021-02-05',N'Quản lý','CN1','0962350023');

insert into SANPHAM
values
('CF01', N'SON 3CE', N'Thỏi','10000','20'),
('CF02', N'KEM CHỐNG NẮNG ANESSA', N'Tuýt','15000','30'),
('CF03', N'KEM CHÔNG NẮNG VICHY', N'Tuýt','15000','20'),
('CF04', N'KEM DƯỠNG ÂM LAROCHE-POSAY', N'Lọ','25000','25'),
('TS01', N'KEM DƯỠNG ÂM KLAIRS', N'Lọ','15000','20'),
('TS02', N'KEM DƯỠNG ẨM SENKA', N'Lọ','20000','30'),
('TS03', N'KEM DƯỠNG ÂM PONDS', N'Lọ','20000','20'),
('TS04', N'SERUM-TINH CHẤT KLAIRS VITAMIN C', N'Lọ','20000','30'),
('TS05', N'TINH CHẤT GOODNDOC DƯỠNG ẨM HYDRA B5', N'Lọ','20000','30'),
('TS06', N'TẨY TRANG LOREAL', 'Chai','20000','20'),
('TS07', N'TẨY TRANG BIODERMA','Chai','25000','10'),
('TS08', N'TẨY TRANG GARNIER','Chai','30000','10'),
('ST01', N'KEM NỀN MAYBELLINE','Chai','30000','20'),
('ST02', N'KEM NỀN MAC KIỀM DẦU SPF15','Chai','30000','10'),
('ST03', N'BÚT KẺ MẮT MAYBELLINE',N'Cây','30000','10'),
('TP01', N'BÔNG TẨY TRANG SILCOT', N'Gói','5000','10'),
('TP02', N'CHÌ KẺ MẮT MAYBELLINE', N'Cây','5000','30'),
('TP03', N'PHẤN MẮT 3CE', N'Bảng','4000','40'),
('TP04', N'PHẤN MẮT MERZY', N'Bảng','4000','40'),
('TP05', N'SỮA RỬA MẶT CERAVE', N'Chai','3000','10'),
('TP06', N'SỮA RỬA MẶT CETAPHIL', N'Chai','3000','20');


insert into HOADON
values
('1001', '2020-12-25','K001','NV01','35000'),
('1002', '2020-12-27',NULL, 'NV02', '107000'),
('1003', '2021-01-10',NULL, 'NV01', '130000'),
('1004', '2021-01-28','K002', 'NV03', '305000'),
('1005', '2021-02-03','K003', 'NV02', '327000'),
('1006', '2021-02-15',NULL, 'NV03', '25000'),
('1007', '2021-02-28','K001', 'NV03', '40000'),
('1008', '2021-03-12','K003', 'NV01', '210000'),
('1009', '2021-03-26','K004', 'NV04', '170000'),
('1010', '2021-04-18','K002', 'NV05', '65000'),
('1011', '2021-04-30','K005', 'NV01', '230000'),
('1012', '2021-05-19','K006', 'NV02', '10000'),
('1013', '2021-06-01','K007', 'NV04', '420000'),
('1014', '2021-06-27','K005', 'NV03', '300000'),
('1015', '2021-07-15','K008', 'NV05', '200000'),
('1016', '2021-07-27','K009', 'NV01', '240000'),
('1017', '2021-08-08','K001', 'NV02', '520000'),
('1018', '2021-09-02','K010', 'NV03', '50000'),
('1019', '2021-09-18','K003', 'NV05', '200000'),
('1020', '2021-10-01',NULL, 'NV04', '312000');

insert into CTHD
values
('1001','CF01','1'),
('1001','CF02','1'),
('1001','TP02','2'),
('1002','TS08','1'),
('1002','ST02','2'),
('1002','TP01','1'),
('1002','TP03','3'),
('1003','CF04','2'),
('1003','TS04','4'),
('1004','CF03','3'),
('1004','TS07','2'),
('1004','TS08','3'),
('1004','ST01','3'),
('1004','TP01','2'),
('1004','TP04','5'),
('1005','TS01','5'),
('1005','TS08','3'),
('1005','ST03','4'),
('1005','TP05','10'),
('1005','TP06','4'),
('1006','CF04','1'),
('1007','TS02','1'),
('1007','TS03','1'),
('1008','CF02','2'),
('1008','TS04','3'),
('1008','ST02','4'),
('1009','CF01','1'),
('1009','CF02','2'),
('1009','CF03','2'),
('1009','CF04','4'),
('1010','TS01','1'),
('1010','TS03','2'),
('1010','TP01','2'),
('1011','CF04','2'),
('1011','TS02','3'),
('1011','TS05','2'),
('1011','ST01','2'),
('1011','TP03','5'),
('1012','CF01','1'),
('1013','CF04','2'),
('1013','TS01','2'),
('1013','TS06','3'),
('1013','TS08','3'),
('1013','ST01','4'),
('1013','TP01','10'),
('1013','TP04','5'),
('1014','TS08','10'),
('1015','CF01','5'),
('1015','ST01','5'),
('1016','ST02','8'),
('1017','CF03','4'),
('1017','TS05','5'),
('1017','ST03','12'),
('1018','TS01','10'),
('1018','TS07','10'),
('1018','TP02','20'),
('1019','CF03','5'),
('1019','CF04','5'),
('1020','CF03','3'),
('1020','TS02','5'),
('1020','TS07','5'),
('1020','TP04','3'),
('1020','TP06','10');

insert into CHINHANH
values
('CN1', N'THIÊN ĐƯỜNG SWEET',N'812/9 ADV PHƯỜNG 4 QUẬN 3','0943792617'),
('CN2', N'THIÊN ĐƯỜNG SWEET',N'75/4 LVS PHƯỜNG 2 QUẬN 1','0943792389');


