create database SINHVIEN
use SINHVIEN

create table SinhVien (
	MSSV nvarchar(10) primary key,
	HoTen nvarchar(50) not null,
	MaLop nvarchar(10) not null,
	foreign key (MaLop) references Lop(MaLop)
)

create table Lop (
	MaLop nvarchar(10) primary key,
	TenLop nvarchar(50) not null
)

create table MonHoc(
	MaMon nvarchar(10) primary key,
	TenMon nvarchar(50) not null
)

create table CanBo(
	MaCB nvarchar(10) primary key,
	TenCB nvarchar(50) not null,
	MatKhau varchar(50) not null
)

create table GiangDay(
	MaCB nvarchar(10),
	MaMon nvarchar(10),
	MaLop nvarchar(10),
	FOREIGN KEY (MaCB) REFERENCES CanBo(MaCB),
    FOREIGN KEY (MaMon) REFERENCES MonHoc(MaMon),
    FOREIGN KEY (MaLop) REFERENCES Lop(MaLop)
)

CREATE TABLE Diem (
	MSSV nvarchar(10),
    MaMon nvarchar(10),
	Diem float not null,
    PRIMARY KEY (MSSV, MaMon),
    FOREIGN KEY (MSSV) REFERENCES SinhVien(MSSV),
    FOREIGN KEY (MaMon) REFERENCES MonHoc(MaMon)
)

SELECT * FROM Lop
SELECT * FROM MonHoc
SELECT * FROM CanBo
SELECT * FROM SinhVien
SELECT * FROM Diem

alter table SinhVien add GioiTinh nvarchar(10);


INSERT INTO SinhVien (MSSV, HoTen, MaLop)
VALUES 
	('B18001', 'Phạm Thị Bảo Nhiên', 'K44-01'),
	('B18002', 'Nguyễn Văn An', 'K44-01'),
	('B18003', 'Lê Hoài Anh', 'K44-01'),
	('B18004', 'Nguyễn Lâm Hoàng Anh', 'K44-01'),
	('B18005', 'Lê Minh Bằng', 'K44-01'),
	('B18006', 'Vương Thừa Chấn', 'K44-02'),
	('B18007', 'Cao Công Danh', 'K44-02'),
	('B18008', 'Trịnh Lê Long Đức', 'K44-02'),
	('B18009', 'Dương Lê Minh Hậu', 'K44-02'),
	('B18010', 'Nguyễn Vũ Hoàng', 'K44-02'),
	('B18011', 'Nguyễn Hoàng Thái Học', 'K44-03'),
	('B18012', 'Nguyễn Quốc Huy', 'K44-03'),
	('B18013', 'Võ Đoàn Gia Huy', 'K44-03'),
	('B18014', 'Vũ Thị Bích Huyền', 'K44-03'),
	('B18015', 'Hồ Việt Hưng', 'K44-03');

INSERT INTO Lop (MaLop, TenLop)
VALUES
	('K44-01', 'CNPM 01'),
	('K44-02', 'CNPM 02'),
	('K44-03', 'CNPM 03')

INSERT INTO MonHoc (MaMon, TenMon)
VALUES
	('CT101', 'Lập trình căn bản'),
	('CT103', 'Cấu trúc dữ liệu'),
	('CT251', 'Phát triển ứng dựng trên Windows')

INSERT INTO CanBo (MaCB, TenCB, MatKhau)
VALUES
	('001', 'Nguyễn Văn Cường', '123'),
	('002', 'Huỳnh Minh Phương', '123'),
	('003', 'Thái Cẩm Nhung', '123')

insert into GiangDay(MaCB, MaLop, MaMon) values ('001','K44-01','CT101')
insert into GiangDay(MaCB, MaLop, MaMon) values ('001','K44-02','CT101')
insert into GiangDay(MaCB, MaLop, MaMon) values ('001','K44-01','CT103')
insert into GiangDay(MaCB, MaLop, MaMon) values ('001','K44-03','CT103')

insert into GiangDay(MaCB, MaLop, MaMon) values ('002','K44-03','CT101')
insert into GiangDay(MaCB, MaLop, MaMon) values ('002','K44-02','CT103')

insert into GiangDay(MaCB, MaLop, MaMon) values ('003','K44-01','CT251')
insert into GiangDay(MaCB, MaLop, MaMon) values ('003','K44-02','CT251')
insert into GiangDay(MaCB, MaLop, MaMon) values ('003','K44-03','CT251')


insert into Diem(MSSV,MaMon,Diem) values ('B18001', 'CT101', 10)
insert into Diem(MSSV,MaMon,Diem) values ('B18001', 'CT103', 10)

insert into Diem(MSSV,MaMon,Diem) values ('B18002', 'CT101', 10)
insert into Diem(MSSV,MaMon,Diem) values ('B18002', 'CT103', 10)

insert into Diem(MSSV,MaMon,Diem) values ('B18003', 'CT251', 10)
insert into Diem(MSSV,MaMon,Diem) values ('B18003', 'CT101', 10)




select m.MaMon, m.TenMon
from MonHoc m join GiangDay g on m.MaMon = g.MaMon
where MaCB = '001';

SELECT s.MSSV, s.HoTen, d.MaMon, d.Diem FROM SinhVien s
	join Diem d on s.MSSV = d.MSSV
WHERE d.MaMon = 'CT251'

UPDATE Diem
SET Diem = '1'
where MSSV = 'B18001' and MaMon = 'CT101'
select *from Diem

