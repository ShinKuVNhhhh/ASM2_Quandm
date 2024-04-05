USE [master]
GO
/****** Object:  Database [Attendance_System]    Script Date: 4/5/2024 5:09:28 PM ******/
CREATE DATABASE [Attendance_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Attendance_System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Attendance_System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Attendance_System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Attendance_System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Attendance_System] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Attendance_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Attendance_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Attendance_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Attendance_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Attendance_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Attendance_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Attendance_System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Attendance_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Attendance_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Attendance_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Attendance_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Attendance_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Attendance_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Attendance_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Attendance_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Attendance_System] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Attendance_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Attendance_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Attendance_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Attendance_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Attendance_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Attendance_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Attendance_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Attendance_System] SET RECOVERY FULL 
GO
ALTER DATABASE [Attendance_System] SET  MULTI_USER 
GO
ALTER DATABASE [Attendance_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Attendance_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Attendance_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Attendance_System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Attendance_System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Attendance_System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Attendance_System', N'ON'
GO
ALTER DATABASE [Attendance_System] SET QUERY_STORE = ON
GO
ALTER DATABASE [Attendance_System] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Attendance_System]
GO
/****** Object:  Table [dbo].[Attendance_Records]    Script Date: 4/5/2024 5:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance_Records](
	[RecordID] [int] NULL,
	[SessionID] [int] NULL,
	[StudentID] [int] NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class_sessions]    Script Date: 4/5/2024 5:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_sessions](
	[SessionID] [int] NOT NULL,
	[CourseID] [int] NULL,
	[Date] [date] NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[RoomNumber] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 4/5/2024 5:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] NOT NULL,
	[CourseName] [varchar](100) NOT NULL,
	[Credits] [int] NULL,
	[DepartmentID] [int] NULL,
	[InstructorID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 4/5/2024 5:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 4/5/2024 5:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[InstructorID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 4/5/2024 5:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 4/5/2024 5:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddStudent]
    @recordid INT,
    @studentid INT,
    @sessionid INT,
    @status NVARCHAR(50),
    @LastName VARCHAR(50),
    @FirstName VARCHAR(50) -- Corrected column name
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra xem sinh viên đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM Attendance_Records WHERE StudentID = @studentid)
    BEGIN
        PRINT 'Sinh viên đã tồn tại.'
    END
    ELSE
    BEGIN
        -- Chèn thông tin sinh viên vào bảng Students
        INSERT INTO Attendance_Records (RecordID, StudentID, SessionID, LastName, FirstName, Status) -- Corrected column name
        VALUES (@recordid, @studentid, @sessionid, @LastName, @FirstName, @status) -- Corrected column name
        
        PRINT 'Sinh viên đã được thêm thành công.'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Attendence]    Script Date: 4/5/2024 5:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Attendence]
as
begin
    -- Lấy dữ liệu
    SELECT 
        Attendance_Records.RecordID,
        Attendance_Records.SessionID,
        Attendance_Records.StudentID,
        Students.LastName,
        Students.FirstName,
        Attendance_Records.Status
    FROM 
        Attendance_Records
    LEFT JOIN 
        Students 
    ON 
        Attendance_Records.StudentID = Students.StudentID;

    -- Xóa dữ liệu
    DELETE FROM Attendance_Records
    -- WHERE clause để xác định điều kiện cho việc xóa, ví dụ:
    -- WHERE [Điều kiện]

end
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 4/5/2024 5:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStudent]
    @studentid INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra xem sinh viên có tồn tại không
    IF EXISTS (SELECT 1 FROM Attendance_Records WHERE StudentID = @studentid)
    BEGIN
        BEGIN TRY
            BEGIN TRANSACTION; -- Bắt đầu giao dịch

            -- Xóa sinh viên từ bảng Attendance_Records
            DELETE FROM Attendance_Records WHERE StudentID = @studentid;

            COMMIT TRANSACTION; -- Giao dịch thành công, lưu các thay đổi

            PRINT 'Sinh viên đã được xóa thành công.'
            RETURN 1; -- Trả về 1 để chỉ ra thành công
        END TRY
        BEGIN CATCH
            ROLLBACK TRANSACTION; -- Quay lại trạng thái trước khi bắt đầu giao dịch

            PRINT 'Đã xảy ra lỗi khi xóa sinh viên.'
            RETURN 0; -- Trả về 0 để chỉ ra lỗi
        END CATCH
    END
    ELSE
    BEGIN
        PRINT 'Sinh viên không tồn tại trong hệ thống.'
        RETURN 0; -- Trả về 0 để chỉ ra lỗi
    END
END
GO
USE [master]
GO
ALTER DATABASE [Attendance_System] SET  READ_WRITE 
GO
