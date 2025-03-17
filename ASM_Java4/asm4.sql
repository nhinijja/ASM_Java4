-- Tạo cơ sở dữ liệu PolyOE
CREATE DATABASE PolyOE;
GO
USE PolyOE;
GO

-- Tạo bảng Video
CREATE TABLE Video (
    id VARCHAR(255) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    poster NVARCHAR(MAX) NOT NULL,
    views INT DEFAULT 0 CHECK (views >= 0),
    [description] NVARCHAR(MAX) NOT NULL,
    active BIT DEFAULT 1
);
GO

-- Tạo bảng User
CREATE TABLE [Users] (
    id VARCHAR(255) PRIMARY KEY,
    [password] VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    fullname NVARCHAR(255) NOT NULL,
    [admin] BIT DEFAULT 0
);
GO

-- Tạo bảng Share
CREATE TABLE Share (
    id INT IDENTITY(1,1) PRIMARY KEY,
    [user_id] VARCHAR(255) FOREIGN KEY REFERENCES [Users](id),
    video_id VARCHAR(255) FOREIGN KEY REFERENCES Video(id),
    emails VARCHAR(50) NOT NULL,
    share_date DATE DEFAULT GETDATE()
);
GO

-- Tạo bảng Favorite
CREATE TABLE Favorite (
    id INT IDENTITY(1,1) PRIMARY KEY,
    [user_id] VARCHAR(255) FOREIGN KEY REFERENCES [Users](id),
    video_id VARCHAR(255) FOREIGN KEY REFERENCES Video(id),
    share_date DATE DEFAULT GETDATE()
);
GO

-- Chèn dữ liệu vào bảng Video
INSERT INTO Video (id, title, poster, views, [description], active) VALUES
('V001', N'Anh Trai Say', 'https://www.youtube.com/watch?v=example1', 150, N'Một bài hát đầy cảm xúc về cuộc sống', 1),
('V002', N'Cơn Mưa Ngang Qua', 'https://www.youtube.com/watch?v=example2', 300, N'Bài hát nổi tiếng về tình yêu và nỗi nhớ', 1),
('V003', N'Em Gái Mưa', 'https://www.youtube.com/watch?v=example3', 200, N'Câu chuyện về tình yêu đơn phương', 1),
('V004', N'Chạy Ngay Đi', 'https://www.youtube.com/watch?v=example4', 100, N'Bài hát với giai điệu sôi động và cuốn hút', 1),
('V005', N'Có Chàng Trai Viết Lên Cây', 'https://www.youtube.com/watch?v=example5', 250, N'Một bản tình ca lãng mạn', 0);
GO
SELECT * FROM [Users];

-- Chèn dữ liệu vào bảng User
INSERT INTO [Users] (id, [password], email, fullname, [admin]) 
VALUES 
('u001', '123456', 'nhitty1py00004@gmail.com', 'Tran Thi Yen Nhi', 1),
('u002', 'pass123', 'nguyenvana@fpt.edu.vn', 'Nguyen Van An', 0),
('u003', 'pass456', 'tranthib@fpt.edu.vn', 'Tran Thi Binh', 1),
('u004', 'pass789', 'levanc@fpt.edu.vn', 'Le Van Cam', 0),
('u005', 'pass234', 'phamthid@gmail.com', 'Pham Thi Dau', 0),
('u006', 'pass567', 'dovane@gmail.com', 'Do Van Linh', 1),
('u007', 'pass890', 'vuthif@fpt.edu.vn', 'Vu Thi Thanh', 0),
('u008', 'pass345', 'nguyenvang@fpt.edu.vn', 'Nguyen Van Giang', 0),
('u009', 'pass678', 'hoangthih@gmail.com', 'Hoang Thi Hanh', 1),
('u010', 'pass901', 'phamvani@fpt.edu.vn', 'Pham Van Tien', 0),
('u011', 'pass2345', 'lethithuyan@gmail.com', 'Le Thi Thuy An', 1),
('u012', 'pass2345', 'lethilinhlan@gmail.com', 'Le Thi Linh Lan', 0),
('u013', 'pass2345', 'lethianh@gmail.com', 'Le Thi Anh', 0),
('u014', 'pass2345', 'lethibinh@gmail.com', 'Le Thi Binh', 0),
('u015', 'pass2345', 'lethinga@gmail.com', 'Le Thi Nga', 0),
('u016', 'pass2345', 'lethingoc@gmail.com', 'Le Thi Ngoc', 0);
GO

-- Chèn dữ liệu vào bảng Share
INSERT INTO Share ([user_id], video_id, emails, share_date) 
VALUES
('U001', 'V001', 'friend2@example.com', '2024-01-15'),
('U002', 'V001', 'friend3@example.com', '2024-01-20'),
('U003', 'V001', 'friend4@example.com', '2024-01-25'),
('U004', 'V001', 'friend5@example.com', '2024-02-05'),
('U005', 'V002', 'friend6@example.com', '2024-02-10'),
('U001', 'V002', 'friend7@example.com', '2024-02-15'),
('U002', 'V002', 'friend8@example.com', '2024-02-20'),
('U003', 'V002', 'friend9@example.com', '2024-02-25'),
('U004', 'V003', 'friend10@example.com', '2024-03-05'),
('U005', 'V003', 'friend11@example.com', '2024-03-10'),
('U001', 'V003', 'friend12@example.com', '2024-03-15'),
('U002', 'V003', 'friend13@example.com', '2024-03-20'),
('U003', 'V003', 'friend14@example.com', '2024-03-25'),
('U004', 'V004', 'friend15@example.com', '2024-04-05'),
('U005', 'V004', 'friend16@example.com', '2024-04-10'),
('U001', 'V004', 'friend17@example.com', '2024-04-15'),
('U002', 'V004', 'friend18@example.com', '2024-04-20'),
('U003', 'V005', 'friend19@example.com', '2024-05-01'),
('U004', 'V005', 'friend20@example.com', '2024-05-10'),
('U005', 'V005', 'friend21@example.com', '2024-05-15');
GO

-- Chèn dữ liệu vào bảng Favorite
INSERT INTO Favorite ([user_id], video_id, share_date) 
VALUES
('U001', 'V001', '2024-01-20'),
('U002', 'V001', '2024-01-25'),
('U003', 'V001', '2024-02-01'),
('U004', 'V001', '2024-02-10'),
('U005', 'V001', '2024-02-15'),
('U001', 'V002', '2024-02-20'),
('U002', 'V002', '2024-02-25'),
('U003', 'V002', '2024-03-01'),
('U004', 'V002', '2024-03-05'),
('U005', 'V002', '2024-03-10'),
('U001', 'V003', '2024-03-15'),
('U002', 'V003', '2024-03-20'),
('U003', 'V003', '2024-03-25'),
('U004', 'V003', '2024-04-01'),
('U005', 'V003', '2024-04-05'),
('U001', 'V004', '2024-04-10'),
('U002', 'V004', '2024-04-15'),
('U003', 'V004', '2024-04-20'),
('U004', 'V004', '2024-04-25'),
('U005', 'V004', '2024-05-01'),
('U001', 'V005', '2024-05-05'),
('U002', 'V005', '2024-05-10'),
('U003', 'V005', '2024-05-15'),
('U004', 'V005', '2024-05-20'),
('U005', 'V005', '2024-05-25');
GO

drop table [User]
drop table Share
drop table Favorite
drop table Video
DROP TABLE [User];
