/****** Object:  Database [BookStore]    Script Date: 14/04/2020 9:02:22 PM ******/
CREATE DATABASE [BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore', FILENAME = N'D:\Data\Database\2012\BookStore.mdf' , SIZE = 3456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookStore_log', FILENAME = N'D:\Data\Database\2012\BookStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookStore] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookStore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
/****** Object:  StoredProcedure [dbo].[sp_User_CountByUserID]    Script Date: 14/04/2020 9:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_CountByUserID] 
	@UserID nvarchar(50)
AS

SELECT Count(*)
FROM
	[tUser]
WHERE
	[UserID] = @UserID

GO
/****** Object:  StoredProcedure [dbo].[sp_User_CountByUserIDPass]    Script Date: 14/04/2020 9:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_CountByUserIDPass] 
	@UserID nvarchar(50),
	@Password nvarchar(50),
	@Active bit
AS

SELECT Count(*)
FROM
	[tUser]
WHERE
	[UserID] = @UserID And [Password]=@Password And Active=@Active
GO
/****** Object:  StoredProcedure [dbo].[sp_User_CountByUserIDPassActive]    Script Date: 14/04/2020 9:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_CountByUserIDPassActive] 
	@UserID nvarchar(50),
	@Password nvarchar(50),
	@Active bit
AS

SELECT Count(*)
FROM
	[tUser]
WHERE
	[UserID] = @UserID And [Password]=@Password And Active=@Active
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Delete]    Script Date: 14/04/2020 9:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_Delete] 
	
	@UserID nvarchar(50)
	
AS

DELETE FROM [tUser]
WHERE 
	[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Insert]    Script Date: 14/04/2020 9:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_User_Insert] 
	
	@UserID nvarchar(50),
	@Password nvarchar(50),
	@Email nvarchar(50),
	@Mobile varchar(20),
	@FullName nvarchar(100),
	@Active bit,
	@CreatedDate smalldatetime
AS

INSERT INTO [tUser] (
	[UserID],
	[Password],
	[Email],
	[Mobile],
	[FullName],
	[Active],
	[CreatedDate]
) VALUES (
	@UserID,
	@Password,
	@Email,
	@Mobile,
	@FullName,
	@Active,
	@CreatedDate
)

GO
/****** Object:  StoredProcedure [dbo].[sp_User_Select]    Script Date: 14/04/2020 9:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_Select] 
	@UserID nvarchar(50)
AS

SELECT
	[UserID],
	[Password],
	[Email],
	[Mobile],
	[FullName],
	[Active],
	[CreatedDate]
FROM
	[dbo].[tUser]
WHERE
	[UserID] = @UserID

GO
/****** Object:  StoredProcedure [dbo].[sp_User_SelectAll]    Script Date: 14/04/2020 9:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_User_SelectAll] 
	
AS

SELECT 
	[UserID],
	[Password],
	[Email],
	[Mobile],
	[FullName],
	[Active],
	[CreatedDate]
FROM
	[dbo].[tUser]


GO
/****** Object:  StoredProcedure [dbo].[sp_User_Update]    Script Date: 14/04/2020 9:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_User_Update]
	@UserID nvarchar(50),
	@Password nvarchar(50),
	@Email nvarchar(50),
	@Mobile varchar(20),
	@FullName nvarchar(100),
	@Active bit,
	@CreatedDate smalldatetime
	
AS

UPDATE [dbo].[tUser] SET
	[Password] = @Password,
	[Email] = @Email,
	[Mobile] = @Mobile,
	[FullName] = @FullName,
	[Active] = @Active,
	[CreatedDate] = @CreatedDate
	
WHERE
	[UserID] = @UserID

GO
/****** Object:  Table [dbo].[tChuDe]    Script Date: 14/04/2020 9:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenCD] [nvarchar](50) NULL,
 CONSTRAINT [PK_tChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tNhaXuatBan]    Script Date: 14/04/2020 9:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhaXuatBan](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[DienThoai] [nvarchar](10) NULL,
 CONSTRAINT [PK_tNhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tSach]    Script Date: 14/04/2020 9:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tSach](
	[MaSach] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](255) NULL,
	[DonVi] [nvarchar](50) NULL,
	[DonGia] [money] NULL,
	[MoTa] [ntext] NULL,
	[Hinh] [nvarchar](250) NULL,
	[MaCD] [int] NULL,
	[MaNXB] [int] NULL,
	[NgayCapNhat] [smalldatetime] NULL,
	[SoLuongBan] [int] NULL,
	[SoLanXem] [int] NULL,
 CONSTRAINT [PK_tSach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tUser]    Script Date: 14/04/2020 9:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tUser](
	[UserID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Mobile] [varchar](20) NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tChuDe] ON 

INSERT [dbo].[tChuDe] ([MaCD], [TenCD]) VALUES (1, N'Công nghệ thông tin')
INSERT [dbo].[tChuDe] ([MaCD], [TenCD]) VALUES (2, N'Ngoại ngữ')
INSERT [dbo].[tChuDe] ([MaCD], [TenCD]) VALUES (3, N'Luật')
INSERT [dbo].[tChuDe] ([MaCD], [TenCD]) VALUES (4, N'Văn học')
SET IDENTITY_INSERT [dbo].[tChuDe] OFF
SET IDENTITY_INSERT [dbo].[tNhaXuatBan] ON 

INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (1, N'NXB Trẻ', N'123 Nguyễn Du', N'19001560')
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (2, N'NXB Thống kê', N'456 Cống Quỳnh', N'19001010')
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (3, N'NXB Kim Đồng', N'789 Nguyễn Trãi', N'19001234')
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (4, N'NXB Đại học Quốc gia TPHCM', N'234 Trần Phú', N'19004321')
SET IDENTITY_INSERT [dbo].[tNhaXuatBan] OFF
SET IDENTITY_INSERT [dbo].[tSach] ON 

INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (1, N'Hack Internet OS Và Bảo Mật - Từng Bước Khám Phá An Ninh Mạng (Tập 1)', N'Cuốn', 60000.0000, N'Hack Internet OS Và Bảo Mật - Từng Bước Khám Phá An Ninh Mạng (Tập 1):
Với tiêu chí "Học Hack để chống lại Hack", bộ sách "Từng Bước Khám Phá An Ninh Mạng" sẽ cung cấp cho bạn đọc những kiến thức từ căn bản đến nâng cao về bảo mật và mạng máy tính. Với mục đích hướng độc giả thành một nhân viên quản trị mạng, kỹ sư bảo mật.... nội dung sách sẽ gửi đến bạn đọc những kiến thức mà Hacker, Attacker thường sử dụng để tấn công vào hệ thống.', N'b1.jpg', 1, 1, CAST(0x9AAC0000 AS SmallDateTime), 5, 3)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (2, N'Bác Sĩ Máy Vi Tính: Hướng Dẫn Lắp Ráp, Sửa Chữa Và Xử Lý Sự Cố Chuyên Nghiệp (Toàn Tập)', N'Cuốn', 50000.0000, N'Bác Sĩ Máy Vi Tính: Hướng Dẫn Lắp Ráp, Sửa Chữa Và Xử Lý Sự Cố Chuyên Nghiệp (Toàn Tập):
"Bác Sĩ Máy Vi Tính: Hướng Dẫn Lắp Ráp, Sửa Chữa Và Xử Lý Sự Cố Chuyên Nghiệp" là quyển sách dành cho những người sẽ tháo mở và làm việc trên máy tính của mình, những người muốn hiểu rõ có những linh kiện nào bên trong máy tính, chúng hoạt động ra sao và chúng được nối kết lại với nhau như thế nào, và cả những người muốn lắp ráp một máy tính phù hợp với sở thích.

Sách được bố cục thành 7 phần chính, hướng dẫn cách chọn lựa phần cứng phù hợp, đánh giá khả năng nâng cấp, chọn cấu hình máy đáp ứng nhu cầu đặt ra, lắp ráp một máy mới từ những linh kiện đã chọn, tích hợp các máy tính cá nhân và các mạng cục bộ và Internet, và sửa chữa hệ thống máy tính hiện có để đạt được hiệu suất cao nhất.

Không có xảo thuật nào bên trong máy tính. Nhưng khi làm việc, bạn có thể gặp phải những sự cố lạ mà bạn phải chẩn đoán và sửa chữa. Vì vậy, phần phụ lục được đưa vào cuối sách để giúp bạn biết cách xử lý những sự cố có thể xảy ra trong quá trình bạn làm việc, từ đó đẩy nhanh tiến độ thực hiện công việc với hiệu quả cao nhất.

Mọi người làm một công việc nào đó khác nhau với máy tính của mình, hoặc làm những công việc tương tự theo những cách khác nhau. Những điểm khác biệt này dẫn đến những lời giải đáp khác nhau cho câu hỏi về máy tính tốt nhất cho bạn là máy tính gì.', N'b2.jpg', 1, 2, CAST(0x9AAC0000 AS SmallDateTime), 12, 4)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (4, N'Kỹ Thuật Lập Trình Web Với Ajax', N'Cuốn', 56000.0000, N'Kỹ Thuật Lập Trình Web Với Ajax

Nội Dung
Chương 1: Tổng quan về AJAX
Chương 2: AJAX cơ bản
Chương 3: : AJAX nâng cao
Chương 4: Lập trình AJAX với viện AJAX.NET
1. Tìm hiểu Ajax.Net
2. Tạo dự án
3. Thiết lập thư viện Ajax.Net
4. Xây dựng hàm ở Server
5. Sử dụng hàm ở Client
6. Sử dụng Session
7. Gửi dữ liệu đến Server và sử dụng mã Unicode
Chương 5: Các thư viện khác cho AJAX.', N'b3.jpg', 1, 1, CAST(0x9AAC0000 AS SmallDateTime), 21, 5)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (5, N'Xây Dựng Forum Với WebwizForum', N'Cuốn', 10000.0000, N'Xây Dựng Forum Với WebwizForum đề này sẽ giúp bạn làm quen với mã nguồn WWF 7.97 (open source) của Web Wiz Guide cùng một số chức năng  như sử dụng việc cài đặt, việt hóa  WWF, thêm bộ gõ Mviet cho WWF. Cuối cùng là khai thác những chức năng đặc biệt của WWF:

+ Sửa lỗi upload file cho WWF

+ Hiển thị các avatar như một gallery

+ Thay đổi Skin cho WWF

+  Thêm lịch biểu (calendar) WWF

+  Mod tin ngắn RSS.', N'b4.jpg', 1, 4, CAST(0x9AAC0000 AS SmallDateTime), 2, 1)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (6, N'Học Viết Tiếng Anh', N'Cuốn', 25000.0000, N'Học Viết Tiếng Anh
Trình độ thích hợp với cuốn sách này là từ trình độ B, C trở lên, thích hợp hơn cho những sinh viên đại học, cao đẳng chuyên ngành tiếng Anh, những ai có nhu cầu luyện thi TOEFL, IELTS hay các kỳ thi “A” Level do các trường ở nước ngoài tổ chức.

Cuốn sách "Học Viết Tiếng Anh" tập hợp những kỹ năng viết tiếng Anh và các đề tài thường gặp trong những kỳ thi ở các trường đại học, cao đẳng chuyên ngành tiếng Anh từ các lĩnh vực giáo dục, khoa học và kỹ thuật công nghệ đến những vấn đề toàn cầu, từ ngôn ngữ và văn chương đến lịch sử và giao tiếp văn hóa, từ những khái niệm thông dụng đến những ý niệm về kinh tế, chính trị.', N'b5.jpg', 2, 2, CAST(0x9AAC0000 AS SmallDateTime), 2, 3)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (7, N'1000 Câu Trắc Nghiệm Đọc Hiểu Luyện Thi TOEFL', N'Cuốn', 30000.0000, N'1000 Câu Trắc Nghiệm Đọc Hiểu Luyện Thi TOEFL được biên soạn theo chương trình cải cách học và thi trắc nghiệm hiện nay của chương trình thi TOEFL.

Bộ sách là tư liệu tham khảo rất quý cho các em học sinh cũng như những ai đang và đã học tiếng Anh muốn tìm tài liệu để tham khảo thêm về thể loại trắc nghiệm môn tiếng Anh.

Bộ sách gồm có 3 cuốn sau:
1000 câu trắc nghiệm đọc hiểu luyện thi TOEFL.
1200 câu trắc nghiệm cấu trúc và văn phạm luyện thi TOEFL.
600 câu trắc nghiệm từ vựng luyện thi TOEFL.', N'b6.jpg', 2, 1, CAST(0x9AAC0000 AS SmallDateTime), 2, 2)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (8, N'Văn Phạm Anh Văn Giản Yếu', N'Cuốn', 24000.0000, N'Cuốn sách Văn Phạm Anh Văn Giản Yếu được tác giả biên soạn nhằm giúp các bạn đọc và học viên tự học môn tiếng Anh nắm bắt được một số kiến thức quan trọng để hỗ trợ cho phần thực hành nói và viết".

Mục Lục:
Chapter I: A short guide to the English study
Section 1: Pronunciation - Question forms - Mistakes
Section 2: Stressing
Section 3: The eight parts of speech
Chapter II: Nouns
Section 1: Kinds of nouns
Section 2: Genders of nouns
Section 3: Formation of the feminine
Section 4: Numbers of nouns
Section 5: Formation of the plural
Section 6: Functions of nouns 
Section 7: Case of nouns
Section 8: Possessive case', N'b7.jpg', 2, 3, CAST(0x9AAC0000 AS SmallDateTime), 1, 3)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (9, N' Lao Động - Tiền Lương Và Bảo Hiểm Xã Hội Mới', N'Cuốn', 50000.0000, N'Lao Động - Tiền Lương Và Bảo Hiểm Xã Hội Mới:
- Nghị định số 166/2007/NĐ-CP ngày 16-11-2007 của Chính Phủ quy định mức lương tối thiểu chung
- Nghị định số 167/2007/NĐ-CP ngày 16-11-2007 của Chính Phủ quy định mức lương tối thiểu vùng đối với người lao động làm việc ở công ty, doanh nghiệp, hợp tác xã, tổ chức hợp tác, trang trại, hộ gia đình, cá nhân và các tổ chức khác của Việt Nam có thuê mướn nguời lao động
- Nghị định số168/2007/NĐ-CP ngày 16-11-2007 của Chính Phủ quy định mức lương tối thiểu vùng đối với lao động Việt Nam làm việc cho doanh nghiệp có vốn đầu tư nước ngoài, cơ quan, tổ chức nước ngoài, tổ chức quốc tế và cá nhân người nước ngoài tại Việt Nam
- Thông tư số 29/2007/TT-BLĐTBXH ngày 05-12-2007 của Bộ Lao động - Thương binh và Xã hội hướng dẫn thực hiện mức lương tối thiểu chung, mức lương tối thiểu vùng đối với công ty nhà nước và công ty trách nhiệm hữu hạn một thành viên do nhà nước sở hữu 100% vốn điều lệ.
- Thông tư số 30/2007/TT-BLĐTBXH ngày 05-12-2007 của Bộ Lao động - Thương binh và Xã hội hướng dẫn thực hiện mức lương tối thiểu vùng đối với doanh nghiệp, hợp tác, trang trại, hộ gia đình, cá nhân và các tổ chức khác của Việt Nam có thuê mướn lao động.', N'b8.jpg', 3, 4, CAST(0x9AAC0000 AS SmallDateTime), 0, 0)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (10, N'Luật Giao Dịch Điện Tử Và Các Văn Bản Hướng Dẫn Thực Hiện', N'Cuốn', 45000.0000, N'Luật Giao Dịch Điện Tử Và Các Văn Bản Hướng Dẫn Thực Hiện:
Ngày 29 tháng 11 năm 2005, Quốc hội nước cộng hoà xã hội chủ nghĩa Việt Nam khoá XI, kỳ họp thứ 8 đã thông qua Luật giao dịch điện tử, có hiệu lực thi hành từ ngày 01 tháng 3 năm 2006. Luật này quy định về giao dịch điện tử trong hoạt động của các cơ quan nhà nước, trong lĩnh vực dân sự, kinh doanh, thương mại và các lĩnh vực khác.
Để hướng dẫn cụ thể việc thực hiện Luật Giao dịch điện tử nói trên, Chính phủ và Bộ Thương mại đã ban hành các văn bản như Nghị định số 57/2006/NĐ-CP ngày 09 tháng 6 năm 2006 của Chính Phủ về thương mại điện tử, Nghị định số 26/2007/NĐ-CP ngày 15 tháng 02 năm 2007 của Chính Phủ quy định chi tiết thi hành Luật Giao dịch điện tử về chữ ký số và dịch vụ chứng thực chữ ký số, Nghị định số 27/2007/NĐ-CP ngày 23 tháng 02 năm 2007 của Chính Phủ về giao dịch điện tử trong hoạt động tài chính và Quyết định số 25/2006/QĐ-BTM ngày 25 tháng 07 năm 2006 của Bộ trưởng Bộ Thương Mại về việc ban hành quy chế sử dụng chữ ký số của Bộ Thương Mại.
Cuốn sách này nhằm giúp cho các doanh nghiệp, các cơ quan quản lý, các ban, ngành và đông đảo người học tập, nghiên cứu thuận tiện trong việc tìm hiểu và thực hiện Luật Giao dịch điện tử.', N'b9.jpg', 3, 2, CAST(0x9AAC0000 AS SmallDateTime), 0, 0)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (11, N'Tìm Hiểu Nội Dung Của Luật Hôn Nhân Và Gia Đình', N'Cuốn', 67000.0000, N'Tìm Hiểu Nội Dung Của Luật Hôn Nhân Và Gia Đình:
Cuốn sách " Tìm Hiểu Nội Dung Của Luật Hôn Nhân Và Gia Đình " được biên soạn theo những tài liệu mới nhất như Luật hôn nhân và gia đình 2000, Bộ luật Dân sự 2005,..... sẽ giúp bạn đọc nắm vững một cách có hệ thống những quy định về lĩnh vực hôn nhân và gia đình. Ngoài ra phần phụ lục có in toàn văn Luật Hôn nhân và gia đình năm 2000 và hệ thống các văn bản pháp luật về hôn nhân gia đình mới nhất để bạn đọc thuận tiện tham khảo và tra cứu khi cần thiết. 

Khái niệm luật hôn nhân gia đình:
- Theo nghĩa rộng: Luật hôn nhân và gia đình là một ngành luật độc lập trong hệ thống pháp luật của nước cộng hoà xã hội chủ nghĩa Việt Nam, gổm tổng hợp các quy phạm pháp luật điều chỉnh các quan hệ hôn nhân và gia đình và những vấn đề khác liên quan đến hôn nhân và gia đình.
- Theo nghĩa hẹp: Luật hôn nhân và gia đình là văn bản quy phạm pháp luật được Quốc hội nước Cộng hoà xã hội chủ nghĩa Việt Nam ban hành, quy định chế độ hôn nhân và gia đình, trách nhiệm của công dân, Nhà nước và xã hội trong việc xây dựng, củng cố chế độ hôn nhân và gia đình Việt Nam.', N'b10.jpg', 3, 2, CAST(0x9AAC0000 AS SmallDateTime), 2, 3)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (12, N'Thám Tử Siêu Hạng - Phá Án Bằng Trí Thông Minh (Bộ 2 Tập)', N'Cuốn', 50000.0000, N'Thám Tử Siêu Hạng - Phá Án Bằng Trí Thông Minh  (Bộ 2 Tập):
Cuốn sách này tập hợp những vụ phá án bằng tài trí, bằng những con đường suy luận thật đơn giản mà hết sức bất ngờ, kèm theo nhiều tranh minh hoạ ấn tượng.

Những vụ án bí hiểm được các nhà điều tra siêu đẳng tìm ra thủ phạm một cách nhanh chóng bằng trí tu, không phải bằng gươm súng.

Điều quan trọng hơn, câu chuyện về những vụ án này lại nhằm đưa ra những thực tế để khơi gợi và kích thích trí thông minh trẻ em và bạn đọc của mọi tầng lớp. Mỗi vụ án là những bài học về suy luận lôigíc giản dị, ngắn gọn, sinh động mà lôi cuốn đến mức không thể bỏ qua. Điều sáng tạo của người biên soạn là đã đưa ra những đáp án bất ngờ ở phần cuối sách.', N'b11.jpg', 4, 2, CAST(0x9AAC0000 AS SmallDateTime), 2, 4)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (13, N'Chuyện Của Thiên Tài', N'Cuốn', 45000.0000, N'Trên tay bạn là tập truyện ngắn Lan man trong lúc kẹt xe của tác giả Bảo Ninh nằm trong bộ Văn mới, một cố gắng tập hợp những tác phẩm được viết và được xuất bản từ năm 1986, năm bắt đầu thời kỳ đổi mới trong văn học nghệ thuật trên đất nước ta. Hai mươi năm qua, đổi mới trên nhiều lĩnh vực đã đem đến cho văn học Việt Nam một làn gió mới với những tác phẩm được viết bằng cảm hứng mới, văn phong mới, nội dung mới. Những tìm tòi về cả hình thức và nội dung đã được ghi nhận, đã gây hiệu ứng nhiều chiều giữa nhà văn, tác phẩm và độc giả. Bộ sách Văn mới này sẽ tuyển chọn những tác phẩm đặc sắc nhất của những tác giả mà tên tuổi gắn liền với thời kỳ đổi mới và vẫn đang đi tiếp trên con đường sáng tạo văn học. Bộ sách sẽ được thực hiện trong nhiều năm với việc bổ sung những tác phẩm mới, chất lượng cao', N'b12.jpg', 4, 3, CAST(0x9AAC0000 AS SmallDateTime), 0, 0)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (14, N'101 Truyện Cổ Tích Thần Thoại - Tập 4', N'Cuốn', 30000.0000, N'101 Truyện Cổ Tích Thần Thoại tập hợp 101 truyện cổ tích thần thoại, giúp bạn thưởng thức và tìm hiểu về những câu chuyện mang tính thần thoại có từ thưở xa xưa nhưng vẫn lưu truyền cho đến hôm nay: Na Tra, Nữ Oa, Ngưu Lang - Chức Nữ...', N'b13.jpg', 4, 2, CAST(0x9AAC0000 AS SmallDateTime), 0, 0)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (15, N'Thiết Kế Mẫu Vật Với Photoshop', N'Cuốn', 25000.0000, N'Thiết Kế Mẫu Vật Với Photoshop hướng dẫn cách tạo hình đĩa nghe nhạc CD, cách áp dụng một số hiệu ứng cũng như bố cục cho mẫu vật, hướng dẫn cách tạo các vòng tròn nối nhau cũng như cách tạo một bông hồng. và một số thủ thuật để có thể tạo ra các mẫu vật giống với thực tế hơn.', N'b14.jpg', 1, 4, CAST(0x9AAC0000 AS SmallDateTime), 0, 0)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB], [NgayCapNhat], [SoLuongBan], [SoLanXem]) VALUES (16, N' Lập Trình Trò Chơi Với Flash - Tập 2', N'Cuốn', 34000.0000, N'Lập Trình Trò Chơi Với Flash - Tập 2
Cuốn sách sẽ hướng dẫn bạn tìm hiểu cách xây dựng nhiều loại trò chơi khác nhau như: trò chơi toán học, trò chơi cơ bản với trái bóng, tạo quái vật,...

Nội Dung:
Xây dựng và kiểm soát các đoạn phim cơ bản
Làm cho văn bản xuất hiện và biến đổi
Tạo các số ngẫu nhiên
Bổ sung hiệu ứng âm thanh
Tạo ra chiếc xe, phi thuyền chuyển động một cách hiện thực
Làm nổ tung mọi thứ trên màn hình.', N'b15.jpg', 1, 2, CAST(0x9AAC0000 AS SmallDateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[tSach] OFF
INSERT [dbo].[tUser] ([UserID], [Password], [Email], [Mobile], [Fullname], [Active], [CreatedDate]) VALUES (N'abcd', N'abcd', N'abcd', N'abcd', N'abcd', 0, CAST(0x00009E3D01118F40 AS DateTime))
INSERT [dbo].[tUser] ([UserID], [Password], [Email], [Mobile], [Fullname], [Active], [CreatedDate]) VALUES (N'admin', N'123', N'hungleit@yahoo.com.vn', N'188888888', N'Administrator', 1, CAST(0x00009DCF00000000 AS DateTime))
INSERT [dbo].[tUser] ([UserID], [Password], [Email], [Mobile], [Fullname], [Active], [CreatedDate]) VALUES (N'test', N'test', N'test', N'1', N'test', 0, CAST(0x00009E2E00000000 AS DateTime))
ALTER TABLE [dbo].[tSach]  WITH CHECK ADD  CONSTRAINT [FK_tSach_tChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[tChuDe] ([MaCD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tSach] CHECK CONSTRAINT [FK_tSach_tChuDe]
GO
ALTER TABLE [dbo].[tSach]  WITH CHECK ADD  CONSTRAINT [FK_tSach_tNhaXuatBan] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[tNhaXuatBan] ([MaNXB])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tSach] CHECK CONSTRAINT [FK_tSach_tNhaXuatBan]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
