USE [master]
GO
/****** Object:  Database [Firma_Transportowa]    Script Date: 17.06.2022 18:39:10 ******/
CREATE DATABASE [Firma_Transportowa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Firma_Transportowa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Firma_Transportowa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Firma_Transportowa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Firma_Transportowa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Firma_Transportowa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Firma_Transportowa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Firma_Transportowa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Firma_Transportowa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Firma_Transportowa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Firma_Transportowa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Firma_Transportowa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET RECOVERY FULL 
GO
ALTER DATABASE [Firma_Transportowa] SET  MULTI_USER 
GO
ALTER DATABASE [Firma_Transportowa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Firma_Transportowa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Firma_Transportowa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Firma_Transportowa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Firma_Transportowa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Firma_Transportowa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Firma_Transportowa', N'ON'
GO
ALTER DATABASE [Firma_Transportowa] SET QUERY_STORE = OFF
GO
USE [Firma_Transportowa]
GO
/****** Object:  Table [dbo].[Kierowca]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kierowca](
	[id_kierowcy] [int] IDENTITY(1,1) NOT NULL,
	[imie] [varchar](25) NOT NULL,
	[nazwisko] [varchar](100) NOT NULL,
	[data_ur] [date] NULL,
	[pesel] [varchar](11) NOT NULL,
	[kod_pocztowy] [varchar](6) NOT NULL,
	[miasto] [varchar](50) NOT NULL,
	[ulica] [varchar](50) NOT NULL,
	[nr_domu] [varchar](7) NOT NULL,
	[nr_lokalu] [varchar](5) NULL,
	[telefon] [varchar](15) NOT NULL,
	[mail] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_kierowcy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klient]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klient](
	[id_klienta] [int] IDENTITY(1,1) NOT NULL,
	[nazwa_firmy] [varchar](30) NULL,
	[imie] [varchar](25) NULL,
	[nazwisko] [varchar](100) NULL,
	[nip] [varchar](10) NULL,
	[kod_pocztowy] [varchar](6) NOT NULL,
	[miasto] [varchar](50) NOT NULL,
	[ulica] [varchar](50) NOT NULL,
	[nr_domu] [varchar](7) NOT NULL,
	[nr_lokalu] [varchar](5) NULL,
	[telefon] [varchar](15) NOT NULL,
	[mail] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_klienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ładunek]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ładunek](
	[id_ładunku] [int] IDENTITY(1,1) NOT NULL,
	[masa_ładunku] [int] NOT NULL,
	[długość] [int] NULL,
	[rodzaj] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ładunku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pojazd]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pojazd](
	[id_pojazdu] [int] IDENTITY(1,1) NOT NULL,
	[model] [varchar](20) NOT NULL,
	[marka] [varchar](20) NOT NULL,
	[nr_rejestracyjny] [varchar](10) NOT NULL,
	[rok_produkcji] [date] NOT NULL,
	[nr_vin] [varchar](25) NOT NULL,
	[przebieg] [int] NOT NULL,
	[rodzaj_pojazdu] [varchar](20) NOT NULL,
	[emisja_spalin] [varchar](10) NOT NULL,
	[fk_nr_polisy] [varchar](30) NULL,
	[fk_id_przyczepy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pojazdu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Przyczepa]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Przyczepa](
	[id_przyczepy] [int] IDENTITY(1,1) NOT NULL,
	[nr_rejestracyjny] [varchar](10) NOT NULL,
	[ładowność] [int] NOT NULL,
	[wysokość] [int] NOT NULL,
	[długość] [int] NOT NULL,
	[fk_id_pojazdu] [int] NULL,
	[fk_nr_polisy] [varchar](30) NULL,
	[nr_vin] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_przyczepy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trasa]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trasa](
	[id_trasy] [int] IDENTITY(1,1) NOT NULL,
	[miejsce_załadunku] [varchar](30) NOT NULL,
	[miejsca_rozładunku] [varchar](30) NOT NULL,
	[długość_trasy] [int] NOT NULL,
	[fk_id_klient] [int] NOT NULL,
	[fk_id_kierowcy] [int] NOT NULL,
	[fk_id_ładunku] [int] NOT NULL,
	[fk_id_przyczepy] [int] NOT NULL,
	[fk_id_pojazdu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_trasy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubezpieczenie]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubezpieczenie](
	[nr_polisy] [varchar](30) NOT NULL,
	[data_rozpoczęcia_ubezpieczenia] [date] NOT NULL,
	[data_zakończenia_ubezpieczenia] [date] NOT NULL,
	[składka] [money] NOT NULL,
	[opłacone] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nr_polisy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pojazd]  WITH CHECK ADD FOREIGN KEY([fk_id_przyczepy])
REFERENCES [dbo].[Przyczepa] ([id_przyczepy])
GO
ALTER TABLE [dbo].[Pojazd]  WITH CHECK ADD FOREIGN KEY([fk_nr_polisy])
REFERENCES [dbo].[Ubezpieczenie] ([nr_polisy])
GO
ALTER TABLE [dbo].[Przyczepa]  WITH CHECK ADD FOREIGN KEY([fk_id_pojazdu])
REFERENCES [dbo].[Pojazd] ([id_pojazdu])
GO
ALTER TABLE [dbo].[Przyczepa]  WITH CHECK ADD FOREIGN KEY([fk_nr_polisy])
REFERENCES [dbo].[Ubezpieczenie] ([nr_polisy])
GO
ALTER TABLE [dbo].[Trasa]  WITH CHECK ADD FOREIGN KEY([fk_id_kierowcy])
REFERENCES [dbo].[Kierowca] ([id_kierowcy])
GO
ALTER TABLE [dbo].[Trasa]  WITH CHECK ADD FOREIGN KEY([fk_id_klient])
REFERENCES [dbo].[Klient] ([id_klienta])
GO
ALTER TABLE [dbo].[Trasa]  WITH CHECK ADD FOREIGN KEY([fk_id_ładunku])
REFERENCES [dbo].[Ładunek] ([id_ładunku])
GO
ALTER TABLE [dbo].[Trasa]  WITH CHECK ADD FOREIGN KEY([fk_id_pojazdu])
REFERENCES [dbo].[Pojazd] ([id_pojazdu])
GO
ALTER TABLE [dbo].[Trasa]  WITH CHECK ADD FOREIGN KEY([fk_id_przyczepy])
REFERENCES [dbo].[Przyczepa] ([id_przyczepy])
GO
ALTER TABLE [dbo].[Pojazd]  WITH CHECK ADD CHECK  (([emisja_spalin]='euro6' OR [emisja_spalin]='euro5' OR [emisja_spalin]='euro4' OR [emisja_spalin]='euro3' OR [emisja_spalin]='euro2' OR [emisja_spalin]='euro1'))
GO
ALTER TABLE [dbo].[Pojazd]  WITH CHECK ADD CHECK  (([rodzaj_pojazdu]='lekki' OR [rodzaj_pojazdu]='3-osiowy' OR [rodzaj_pojazdu]='2-osiowy'))
GO
/****** Object:  StoredProcedure [dbo].[delete_kierowca]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--delete kierowca--
CREATE   PROC [dbo].[delete_kierowca]
		@id_kierowcy_usuwanego int
	   	
AS
BEGIN
	DELETE FROM [dbo].[Kierowca]
      WHERE id_kierowcy= @id_kierowcy_usuwanego
	  PRINT 'Usunięto rekord'
END         
GO
/****** Object:  StoredProcedure [dbo].[delete_klient]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--delete klient--
CREATE   PROC [dbo].[delete_klient]
		@id_klient_usuwanego int
	   	
AS
BEGIN
	DELETE FROM [dbo].[Klient]
      WHERE id_klienta=@id_klient_usuwanego
	  PRINT 'Usunięto rekord'
END         
GO
/****** Object:  StoredProcedure [dbo].[delete_ładunek]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--delete ładunek--
CREATE   PROC [dbo].[delete_ładunek]
		@id_ładunek_usuwanego int
	   	
AS
BEGIN
	DELETE FROM [dbo].[Ładunek]
      WHERE id_ładunku=@id_ładunek_usuwanego
	  PRINT 'Usunięto rekord'
END         
GO
/****** Object:  StoredProcedure [dbo].[delete_pojazd]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--delete pojazd--
CREATE   PROC [dbo].[delete_pojazd]
		@id_pojazdu_usuwanego int
	   	
AS
BEGIN
	DELETE FROM [dbo].[Pojazd]
      WHERE id_pojazdu=@id_pojazdu_usuwanego
	  PRINT 'Usunięto rekord'
END         
GO
/****** Object:  StoredProcedure [dbo].[delete_pojazdu]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--delete pojazd--
CREATE   PROC [dbo].[delete_pojazdu]
		@id_pojazdu_usuwanego int
	   	
AS
BEGIN
	DELETE FROM [dbo].[Pojazd]
      WHERE id_pojazdu=@id_pojazdu_usuwanego
	  PRINT 'Usunięto rekord'
END         
GO
/****** Object:  StoredProcedure [dbo].[delete_przyczepa]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--delete przyczepa--
CREATE   PROC [dbo].[delete_przyczepa]
		@id_przyczepy_usuwanej int
	   	
AS
BEGIN
	DELETE FROM [dbo].[Przyczepa]
      WHERE id_przyczepy=@id_przyczepy_usuwanej
	  PRINT 'Usunięto rekord'
END         
GO
/****** Object:  StoredProcedure [dbo].[delete_trasy]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--delete trasa--
CREATE   PROC [dbo].[delete_trasy]
		@id_trasy_usuwanej int
	   	
AS
BEGIN
	DELETE FROM [dbo].[Trasa]
      WHERE id_trasy=@id_trasy_usuwanej
	  PRINT 'Usunięto rekord'
END         
GO
/****** Object:  StoredProcedure [dbo].[delete_ubezpieczenia]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--delete ubezpieczenia--
CREATE   PROC [dbo].[delete_ubezpieczenia]
		@nr_polisy_usuwanej int
	   	
AS
BEGIN
	DELETE FROM [dbo].[Ubezpieczenie]
      WHERE nr_polisy=@nr_polisy_usuwanej
	  PRINT 'Usunięto rekord'
END         
GO
/****** Object:  StoredProcedure [dbo].[do_końca_ubezpieczenia_pozostało_dni]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[do_końca_ubezpieczenia_pozostało_dni]
@nr_polisy varchar(50)
    AS
	BEGIN
    
	
	IF(SELECT DATEDIFF(day, GETDATE(),[data_zakończenia_ubezpieczenia]) AS do_końca_ubezpieczenia_pozostało_dni
	FROM [dbo].[Ubezpieczenie] WHERE (nr_polisy = @nr_polisy) )< 0
		BEGIN
			PRINT 'Upłynał czas ubezpieczenia'
		END
		ELSE
		BEGIN
			SELECT DATEDIFF(day, GETDATE(),[data_zakończenia_ubezpieczenia]) AS do_końca_ubezpieczenia_pozostało_dni
			FROM [dbo].[Ubezpieczenie] WHERE (nr_polisy = @nr_polisy)
		END
	END
GO
/****** Object:  StoredProcedure [dbo].[dodanie_polisy_do_pojazdu]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--procedura dodawania polisy do pojazdu
CREATE   PROC [dbo].[dodanie_polisy_do_pojazdu]
	@nr_polisy varchar(30), 
	@nr_rejestracyjny varchar(10)

	AS
	BEGIN
	UPDATE [dbo].[Pojazd]
		SET [fk_nr_polisy]=@nr_polisy
		WHERE [nr_rejestracyjny]=@nr_rejestracyjny

		PRINT 'Dodałeś nr polisy:' + @nr_polisy + ' do pojazdu o numerze:' + @nr_rejestracyjny; 
	END
GO
/****** Object:  StoredProcedure [dbo].[dodanie_polisy_do_przyczepy]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--procedura dodawania polisy do przyczepy
CREATE   PROC [dbo].[dodanie_polisy_do_przyczepy]
	@nr_polisy varchar(30), 
	@nr_rejestracyjny varchar(10)

	AS
	BEGIN
	UPDATE [dbo].[Przyczepa]
		SET [fk_nr_polisy]=@nr_polisy
		WHERE [nr_rejestracyjny]=@nr_rejestracyjny

		PRINT 'Dodałeś nr polisy:' + @nr_polisy + ' do pojazdu o numerze:' + @nr_rejestracyjny; 
	END
GO
/****** Object:  StoredProcedure [dbo].[dodawanie_kierowcy]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC dodawanie_klienta
--			@nazwa_firmy= 'MirTrans' ,
--			@imie = 'Mirek' ,
--			@nazwisko ='Nowak',
--			@nip =7687656545,
--			@kod_pocztowy =98288 ,
--			@miasto='Warszawa' ,
--			@ulica ='łódzka' ,
--			@nr_domu =42 ,
--			@nr_lokalu =3 ,
--			@telefon  =432534765,
--			@mail='test@mail.pl'
--GO
--dodawanie kierowcy--

CREATE   PROC [dbo].[dodawanie_kierowcy]	
		    @imie varchar(25)
           ,@nazwisko varchar(100)
           ,@data_ur date
           ,@pesel varchar(11)
           ,@kod_pocztowy varchar(6)
           ,@miasto varchar(50)
           ,@ulica varchar(50)
           ,@nr_domu varchar(7)
           ,@nr_lokalu varchar(5)
           ,@telefon varchar(15)
           ,@mail varchar(50)
AS

DECLARE @error AS NVARCHAR(200);

IF		@imie IS NULL OR
           @nazwisko  IS NULL OR      
           @pesel IS NULL OR
           @kod_pocztowy IS NULL OR
           @miasto IS NULL OR
           @ulica IS NULL OR
           @nr_domu   IS NULL OR    
           @telefon IS NULL OR
           @mail IS NULL 

BEGIN
     SET @error = 'Próba wprowadzenia nieprawidłowych danych!';
     RAISERROR(@error, 16,1);
     RETURN;
END

INSERT INTO [dbo].[Kierowca]
           ([imie]
           ,[nazwisko]
           ,[data_ur]
           ,[pesel]
           ,[kod_pocztowy]
           ,[miasto]
           ,[ulica]
           ,[nr_domu]
           ,[nr_lokalu]
           ,[telefon]
           ,[mail])
     VALUES
           (@imie 
           ,@nazwisko 
           ,@data_ur 
           ,@pesel 
           ,@kod_pocztowy 
           ,@miasto 
           ,@ulica
		   ,@nr_domu 
           ,@nr_lokalu
           ,@telefon 
           ,@mail )



--SELECT * FROM [dbo].[Kierowca] WHERE ([id_kierowcy] = @@IDENTITY)
GO
/****** Object:  StoredProcedure [dbo].[dodawanie_klienta]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[dodawanie_klienta]	
	@nazwa_firmy varchar(30) ,
	@imie varchar(25) ,
	@nazwisko varchar(100),
	@nip varchar(10),
	@kod_pocztowy varchar(6) ,
	@miasto varchar(50) ,
	@ulica varchar(50) ,
	@nr_domu varchar(7) ,
	@nr_lokalu varchar(5) ,
	@telefon varchar(15) ,
	@mail varchar(50) 
AS

DECLARE @error AS NVARCHAR(200);

IF  
	@kod_pocztowy IS NULL OR 
	@miasto IS NULL OR 
	@ulica IS NULL OR 
	@nr_domu IS NULL OR 
	@telefon IS NULL OR 
	@mail IS NULL 

BEGIN
     SET @error = 'Próba wprowadzenia nieprawidłowych danych!';
     RAISERROR(@error, 16,1);
     RETURN;
END

INSERT INTO [dbo].[Klient]
           ([nazwa_firmy]
           ,[imie]
           ,[nazwisko]
           ,[nip]
           ,[kod_pocztowy]
           ,[miasto]
           ,[ulica]
           ,[nr_domu]
           ,[nr_lokalu]
           ,[telefon]
           ,[mail])
     VALUES
           (@nazwa_firmy  ,
			@imie  ,
			@nazwisko ,
			@nip ,
			@kod_pocztowy  ,
			@miasto ,
			@ulica  ,
			@nr_domu  ,
			@nr_lokalu  ,
			@telefon  ,
			@mail )


--SELECT * FROM [dbo].[Klient] WHERE (id_klienta = @@IDENTITY)
GO
/****** Object:  StoredProcedure [dbo].[dodawanie_ładunku]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC dodawanie_przyczepy
--		   @nr_rejestracyjny ='EL DF321',
--           @ładowność = 9,
--           @wysokość =370,
--           @długość =520,
--           @fk_id_pojazdu =2,
--           @fk_nr_polisy = '83873765'
--GO


----------Procedura dodania ładunku------------
CREATE    PROC [dbo].[dodawanie_ładunku]
    @masa_ładunku int ,
    @długość int,
    @rodzaj varchar(100)

AS

DECLARE @error AS NVARCHAR(200);

IF  
    @masa_ładunku IS NULL OR 
    @rodzaj IS NULL


BEGIN
     SET @error = 'Próba wprowadzenia nieprawidłowych danych!';
     RAISERROR(@error, 16,1);
     RETURN;
END

INSERT INTO [dbo].[Ładunek]
           ([masa_ładunku]
           ,[długość]
           ,[rodzaj])

     VALUES(@masa_ładunku,
            @długość ,
            @rodzaj )



--SELECT * FROM [dbo].[Ładunek] WHERE (id_ładunku = @@IDENTITY)
GO
/****** Object:  StoredProcedure [dbo].[dodawanie_pojazdu]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


----------Procedura dodania pojazdu------------
CREATE    PROC [dbo].[dodawanie_pojazdu]
    @model varchar(20) ,
    @marka varchar(20),
    @nr_rejestracyjny varchar(10),
    @rok_produkcji date,
    @nr_vin varchar(25),
    @przebieg int,
    @rodzaj_pojazdu varchar(20),
    @emisja_spalin varchar(10),
    @fk_nr_polisy varchar(30),
	@fk_id_przyczepy int
AS

DECLARE @error AS NVARCHAR(200);

IF   
    @model is null or
    @marka is null or
    @nr_rejestracyjny is null or
    @rok_produkcji is null or
    @nr_vin is null or
    @przebieg is null or
    @rodzaj_pojazdu is null or
    @emisja_spalin is null 
   



BEGIN
     SET @error = 'Próba wprowadzenia nieprawidłowych danych!';
     RAISERROR(@error, 16,1);
     RETURN;
END





BEGIN 
	IF EXISTS (SELECT nr_rejestracyjny,nr_vin FROM [dbo].[Pojazd] WHERE nr_rejestracyjny=@nr_rejestracyjny OR nr_vin=@nr_vin) 
			BEGIN
				PRINT 'Pojazd o podanym numerze vin lub rejestracji istnieje'
				SELECT * FROM [dbo].[Pojazd] WHERE nr_rejestracyjny=@nr_rejestracyjny OR nr_vin=@nr_vin
			END
		ELSE
			BEGIN 
				INSERT INTO [dbo].[Pojazd]
			   ([model],
			   [marka],
			   [nr_rejestracyjny],
			   [rok_produkcji],
			   [nr_vin],
			   [przebieg],
			   [rodzaj_pojazdu],
			   [emisja_spalin],
			   [fk_nr_polisy],
			   [fk_id_przyczepy])

		 VALUES
			   (@model  ,
				@marka ,
				@nr_rejestracyjny,
				@rok_produkcji,
				@nr_vin,
				@przebieg,
				@rodzaj_pojazdu,
				@emisja_spalin,
				@fk_nr_polisy,
				@fk_id_przyczepy)
				PRINT 'Dodano pomyślnie pojazd'
			END
END

			
--SELECT * FROM [dbo].[Pojazd] WHERE (id_pojazdu = @@IDENTITY)
GO
/****** Object:  StoredProcedure [dbo].[dodawanie_przyczepy]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC dodawanie_kierowcy
--			@imie ='Arek'
--           ,@nazwisko ='Dusigrosz'		 
--           ,@data_ur = '1983-03-03'
--           ,@pesel = 83030371376
--           ,@kod_pocztowy = '77-077'
--           ,@miasto ='Sosnowiec'
--           ,@ulica ='piękna'
--		   ,@nr_domu = 23
--           ,@nr_lokalu = 77
--           ,@telefon =698765432
--           ,@mail='bremutoarek@wp.pl'
--GO

--dodanie przyczepy--

CREATE   PROC [dbo].[dodawanie_przyczepy]	
		   @nr_rejestracyjny varchar(10),
		   @nr_vin varchar(25),
           @ładowność int,
           @wysokość int,
           @długość int,
           @fk_id_pojazdu int,
           @fk_nr_polisy varchar(30)
AS

DECLARE @error AS NVARCHAR(200);

IF	       @nr_rejestracyjny IS NULL OR
           @ładowność IS NULL OR
           @wysokość IS NULL OR
           @długość IS NULL OR
			@nr_vin is NULL

BEGIN
     SET @error = 'Próba wprowadzenia nieprawidłowych danych!';
     RAISERROR(@error, 16,1);
     RETURN;
END

INSERT INTO [dbo].[Przyczepa]
           ([nr_rejestracyjny]
		   ,[nr_vin]
           ,[ładowność]
           ,[wysokość]
           ,[długość]
           ,[fk_id_pojazdu]
           ,[fk_nr_polisy])
     VALUES
           (@nr_rejestracyjny,
		   @nr_vin,
           @ładowność ,
           @wysokość ,
           @długość ,
           @fk_id_pojazdu,
           @fk_nr_polisy )



--SELECT * FROM  [dbo].[Przyczepa] WHERE ( [id_przyczepy]= @@IDENTITY)
GO
/****** Object:  StoredProcedure [dbo].[dodawanie_trasy]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--dodawanie trasy--
CREATE   PROCEDURE [dbo].[dodawanie_trasy]
            @miejsce_załadunku varchar(50),
            @miejsca_rozładunku varchar(50),
            @dlugosc_trasy int,
            @klient int,
            @kierowca int,
            @ładunek int,
            @przyczepa int,
            @pojazd int
AS
DECLARE @error AS varchar(50);

    IF  @miejsce_załadunku IS NULL OR
        @miejsca_rozładunku IS NULL OR
        @dlugosc_trasy IS NULL OR
        @klient IS NULL OR
        @kierowca IS NULL OR
        @ładunek IS NULL OR
        @przyczepa IS NULL OR
        @pojazd IS NULL
        BEGIN
            SET @error = 'Próba wprowadzenia nieprawidłowych danych!';
            RAISERROR(@error , 16, 1);
            RETURN;
        END
INSERT INTO [dbo].[Trasa]
            ([miejsce_załadunku],
            [miejsca_rozładunku],
            [długość_trasy],
            [fk_id_klient],
            [fk_id_kierowcy],
            [fk_id_ładunku],
            [fk_id_przyczepy],
            [fk_id_pojazdu])
VALUES
            (@miejsce_załadunku,
            @miejsca_rozładunku,
            @dlugosc_trasy,
            @klient,
            @kierowca,
            @ładunek,
            @przyczepa,
            @pojazd)
--SELECT * FROM [dbo].[Trasa] WHERE ([id_trasy] = @@IDENTITY);
GO
/****** Object:  StoredProcedure [dbo].[dodawanie_ubezpieczenia]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--dodawanie ubezpieczenia--
CREATE   PROCEDURE [dbo].[dodawanie_ubezpieczenia]
@nr_polisy varchar(30),
@data_rozpoczęcia_ubezpieczenia date,
@data_zakończenia_ubezpieczenia date,
@składka money,
@opłacone bit
AS
    DECLARE @error AS varchar(50);
    IF @nr_polisy IS NULL OR
        @data_rozpoczęcia_ubezpieczenia IS NULL OR
        @data_zakończenia_ubezpieczenia IS NULL OR
        @składka IS NULL OR
        @opłacone IS NULL
        BEGIN
        SET @error = 'Próba wprowadzenia nieprawidłowych danych!';
        RAISERROR(@error, 21,1);
        END
INSERT INTO [dbo].[Ubezpieczenie](
            [nr_polisy],
            [data_rozpoczęcia_ubezpieczenia],
            [data_zakończenia_ubezpieczenia],
            [składka],
            [opłacone])
VALUES
            (@nr_polisy ,
            @data_rozpoczęcia_ubezpieczenia ,
            @data_zakończenia_ubezpieczenia ,
            @składka ,
            @opłacone )

--SELECT * FROM [dbo].[Ubezpieczenie] WHERE (nr_polisy = @@IDENTITY);

GO
/****** Object:  StoredProcedure [dbo].[dodawanieładunku]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[dodawanieładunku]
    @idładunku int ,
    @masaładunku int ,
    @długość int,
    @rodzaj varchar(100)

AS

DECLARE @error AS NVARCHAR(200);

IF  @idładunku IS NULL OR
    @masaładunku IS NULL OR 
    @rodzaj IS NULL


BEGIN
     SET @error = 'Próba wprowadzenia nieprawidłowych danych!';
     RAISERROR(@error, 16,1);
     RETURN;
END

INSERT INTO [dbo].[Ładunek]
           ([id_ładunku]
           ,[masa_ładunku]
           ,[długość]
           ,[rodzaj])

     VALUES
           (@idładunku  ,
            @masaładunku  ,
            @długość ,
            @rodzaj )



SELECT * FROM [dbo].[Ładunek] WHERE (id_ładunku = @@IDENTITY)
GO
/****** Object:  StoredProcedure [dbo].[pokaz_nieoplacone_ubezpieczenia]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROC [dbo].[pokaz_nieoplacone_ubezpieczenia]
AS
SELECT * FROM [dbo].[Ubezpieczenie] AS nieopłacone_ubezpieczenia WHERE [opłacone] = 0
GO
/****** Object:  StoredProcedure [dbo].[raport_klient_prywatny_czy_biznesowy]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--raport_klient_prywatny_czy_biznesowy
CREATE   PROC [dbo].[raport_klient_prywatny_czy_biznesowy]
AS
BEGIN
	SELECT * FROM [dbo].[Klient] WHERE nip is null OR nazwa_firmy is null
	PRINT 'Pierwsza tabela generuje raport o klientach prywatnych '
	SELECT * FROM [dbo].[Klient] WHERE nip is not null OR nazwa_firmy is not null
		PRINT 'Pierwsza tabela generuje raport o klientach biznesowych '
END
GO
/****** Object:  StoredProcedure [dbo].[raport_pojazdy_przyczepy_w_firmie]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--raport  pojazdów i przyczep w firmie--
CREATE   PROC [dbo].[raport_pojazdy_przyczepy_w_firmie]
AS
BEGIN
	SELECT * FROM [dbo].[Pojazd] 
	PRINT 'Pierwsza tabela prezentuje wykaz pojazdów'
	SELECT * FROM [dbo].[Przyczepa]
	PRINT 'Druga tabela prezentuje wykaz przyczep'
	SELECT * FROM [dbo].[Pojazd],[dbo].[Przyczepa] WHERE [dbo].[Pojazd].fk_id_przyczepy=id_przyczepy AND fk_id_pojazdu=id_pojazdu
	PRINT 'Trzecia tabela prezentuje wykaz pojazdów z przypisaną przyczepą'
END
GO
/****** Object:  StoredProcedure [dbo].[raport_polis]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--raport polis dla pojazdów i przyczep--
CREATE   PROC [dbo].[raport_polis]

AS
BEGIN
DECLARE
	@suma_składek int = (select sum(składka) from [dbo].[Ubezpieczenie])
	
	PRINT 'Raport polis dla przyczep' 
	select  nr_polisy,składka,nr_rejestracyjny from [dbo].[Ubezpieczenie],[dbo].[Przyczepa] where nr_polisy=[dbo].[Przyczepa].fk_nr_polisy;
	PRINT 'Raport polis dla pojazdów' 
	select  nr_polisy,składka,nr_rejestracyjny from [dbo].[Ubezpieczenie],[dbo].[Pojazd] where nr_polisy=fk_nr_polisy ;
	PRINT 'Suma składek wynosi: ' + CAST(@suma_składek as varchar);
END
GO
/****** Object:  StoredProcedure [dbo].[raport_przyczep_o_danych_parametrach]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[raport_przyczep_o_danych_parametrach]
	@ładowność int =null,
	@długość int = null,
	@wysokość int = null
AS
BEGIN
SET NOCOUNT ON
	SELECT * FROM [dbo].[Przyczepa] WHERE (ładowność>=isNULL(@ładowność,ładowność) AND długość>=isNULL(@długość,długość) AND wysokość>=isNULL(@wysokość,wysokość)) 

END
GO
/****** Object:  StoredProcedure [dbo].[raport_stan_kierowców]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[raport_stan_kierowców]

AS
BEGIN
DECLARE

	@ilość_kierowców_zatrudnionych int = (SELECT COUNT(*) FROM [dbo].[Kierowca] ), 
	@ilość_kierowców_w_trasie int =(SELECT COUNT(fk_id_kierowcy) FROM [dbo].[Trasa] WHERE fk_id_kierowcy is not null),
	@ilość_kierowców_bez_trasy int =((SELECT COUNT(*) FROM [dbo].[Kierowca] )-(SELECT COUNT(fk_id_kierowcy) FROM [dbo].[Trasa] WHERE fk_id_kierowcy is not null))

	PRINT 'Ilość kierowców zatrudnionych wynosi: '+ CAST(@ilość_kierowców_zatrudnionych AS varchar);
	PRINT 'Ilość kierowców w trasie wynosi: ' + 	CAST(@ilość_kierowców_w_trasie AS varchar);
	PRINT 'Ilość kierowców bez wyznaczonej trasy wynosi: ' + 	CAST(@ilość_kierowców_bez_trasy AS varchar);
END
GO
/****** Object:  StoredProcedure [dbo].[raport_wykaz]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--raport tras--
CREATE   PROC [dbo].[raport_wykaz]
AS
BEGIN

	SELECT [id_trasy],[miejsce_załadunku],[miejsca_rozładunku],[długość_trasy],nr_rejestracyjny,nazwa_firmy,[fk_id_ładunku],[dbo].[Kierowca].[imie],[dbo].[Kierowca].[nazwisko]
FROM [dbo].[Kierowca],[dbo].[Trasa],[dbo].[Klient],[dbo].[Pojazd] where fk_id_kierowcy=id_kierowcy AND fk_id_klient=id_klienta AND fk_id_pojazdu=id_pojazdu
	
END
GO
/****** Object:  StoredProcedure [dbo].[roznica_dat_ubezpieczen]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--procedura wyświetlenie końca ubezpieczenia--

CREATE   PROC [dbo].[roznica_dat_ubezpieczen]
@nr_polisy varchar(50)
    AS
    SELECT DATEDIFF(day, [data_rozpoczęcia_ubezpieczenia],[data_zakończenia_ubezpieczenia]) AS do_końca_ubezpieczenia_pozostało_dni
	FROM [dbo].[Ubezpieczenie] WHERE (nr_polisy = @nr_polisy)
GO
/****** Object:  StoredProcedure [dbo].[stan_kierowców]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[stan_kierowców]

AS
BEGIN
DECLARE

	@ilość_kierowców_zatrudnionych int = (SELECT COUNT(*) FROM [dbo].[Kierowca] ), 
	@ilość_kierowców_w_trasie int =(SELECT COUNT(fk_id_kierowcy) FROM [dbo].[Trasa] WHERE fk_id_kierowcy is not null),
	@ilość_kierowców_bez_trasy int =((SELECT COUNT(*) FROM [dbo].[Kierowca] )-(SELECT COUNT(fk_id_kierowcy) FROM [dbo].[Trasa] WHERE fk_id_kierowcy is not null))

	PRINT 'Ilość kierowców zatrudnionych wynosi: '+ CAST(@ilość_kierowców_zatrudnionych AS varchar);
	PRINT 'Ilość kierowców w trasie wynosi: ' + 	CAST(@ilość_kierowców_w_trasie AS varchar);
	PRINT 'Ilość kierowców bez wyznaczonej trasy wynosi: ' + 	CAST(@ilość_kierowców_bez_trasy AS varchar);
END
GO
/****** Object:  StoredProcedure [dbo].[update_Kierowcy]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--update danych Kierowcy z możliwością edycji pojedynczych danych--
CREATE   PROC [dbo].[update_Kierowcy]
            @id_kierowcy_aktualizowanego int
           ,@imie varchar(25) = null
           ,@nazwisko varchar(100) = null
           ,@data_ur date = null
           ,@pesel varchar(11) = null
           ,@kod_pocztowy varchar(6) = null
           ,@miasto varchar(50) = null
           ,@ulica varchar(50) = null
           ,@nr_domu varchar(7) = null
           ,@nr_lokalu varchar(5) = null
           ,@telefon varchar(15) = null
           ,@mail varchar(50) = null
AS
BEGIN
    UPDATE [dbo].[Kierowca]
   SET [imie] = isNull(@imie,imie)
      ,[nazwisko] = isNull(@nazwisko,nazwisko)
      ,[data_ur] = isNull(@data_ur,data_ur)
      ,[pesel] = isNull(@pesel,pesel)
      ,[kod_pocztowy] = isNull(@kod_pocztowy,kod_pocztowy)
      ,[miasto] =isNull(@miasto,miasto)
      ,[ulica] = isNull(@ulica,ulica)
      ,[nr_domu] = isNull(@nr_domu,nr_domu)
      ,[nr_lokalu] =isNull(@nr_lokalu,nr_lokalu)
      ,[telefon] = isNull(@telefon,telefon)
      ,[mail] = isNull(@mail,mail)
 WHERE id_kierowcy = @id_kierowcy_aktualizowanego
END
GO
/****** Object:  StoredProcedure [dbo].[update_klienta]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--update danych klienta z możliwością edycji pojedynczych danych--
CREATE   PROC [dbo].[update_klienta]
        @id_klienta_aktualizowanego int,
        @nazwa_firmy varchar(30)= null ,
        @imie varchar(25) = null,
        @nazwisko varchar(100)= null,
        @nip varchar(10)= null,
        @kod_pocztowy varchar(6)= null ,
        @miasto varchar(50) = null,
        @ulica varchar(50)= null ,
        @nr_domu varchar(7) = null,
        @nr_lokalu varchar(5)= null ,
        @telefon varchar(15)= null ,
        @mail varchar(50) = null
AS
BEGIN
SET NOCOUNT ON
    UPDATE [dbo].[Klient]
   SET [nazwa_firmy] = isNull(@nazwa_firmy,nazwa_firmy)
      ,[imie] =isNull(@imie,imie)
      ,[nazwisko] = isNull(@nazwisko,nazwisko)
      ,[nip] = isNull(@nip,nip)
      ,[kod_pocztowy] = isNull(@kod_pocztowy,kod_pocztowy)
      ,[miasto] =isNull(@miasto,miasto)
      ,[ulica] = isNull(@ulica,ulica)
      ,[nr_domu] =isNull(@nr_domu,nr_domu)
      ,[nr_lokalu] = isNull(@nr_lokalu,nr_lokalu)
      ,[telefon] = isNull(@telefon,telefon)
      ,[mail] = isNull(@mail,mail)
 WHERE id_klienta=@id_klienta_aktualizowanego
END
GO
/****** Object:  StoredProcedure [dbo].[update_ładunku]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--update ładunku z możliwością edycji pojedynczych danych--
 
CREATE   PROC [dbo].[update_ładunku]
		@id_ładunku_aktualizowanego int,
	   	@masa_ładunku int = NULL,
		 @długość int = NULL,
		 @rodzaj varchar(100)= NULL
AS
BEGIN
SET NOCOUNT ON
	UPDATE [dbo].[Ładunek]
	   SET [masa_ładunku] = isNULL(@masa_ładunku,masa_ładunku)
		  ,[długość] = isNULL(@długość,długość)
		  ,[rodzaj] = isNULL(@rodzaj,rodzaj)
	 WHERE id_ładunku=@id_ładunku_aktualizowanego
END         
GO
/****** Object:  StoredProcedure [dbo].[update_pojazdu]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--udpate pojazdu z możliwością edycji pojedynczych danych--
CREATE   PROC [dbo].[update_pojazdu]
			@id_pojazdu_akutalizowanego int,
		    @model varchar(20) = null,
			@marka varchar(20)= null,
			@nr_rejestracyjny varchar(10)= null,
			@rok_produkcji date=null,
			@nr_vin varchar(25)=null,
			@przebieg int= null,
			@rodzaj_pojazdu varchar(20)= null,
			@emisja_spalin varchar(10)= null,
			@fk_nr_polisy varchar(30)= null,
			@fk_id_przyczepy int= null
AS
BEGIN
SET NOCOUNT ON
	UPDATE [dbo].[Pojazd]
   SET [model] =isNULL(@model,model)
      ,[marka] = isNULL(@marka,marka)
      ,[nr_rejestracyjny] =isNULL(@nr_rejestracyjny,nr_rejestracyjny)
      ,[rok_produkcji] =isNULL(@rok_produkcji,rok_produkcji)
      ,[nr_vin] =isNULL(@nr_vin,nr_vin)
      ,[przebieg] =isNULL(@przebieg,przebieg)
      ,[rodzaj_pojazdu] = isNULL(@rodzaj_pojazdu,rodzaj_pojazdu)
      ,[emisja_spalin] = isNULL(@emisja_spalin,emisja_spalin)
      ,[fk_nr_polisy] = isNULL(@fk_nr_polisy,fk_nr_polisy)
      ,[fk_id_przyczepy] = isNULL(@fk_id_przyczepy,fk_id_przyczepy)
 WHERE id_pojazdu = @id_pojazdu_akutalizowanego
END         
GO
/****** Object:  StoredProcedure [dbo].[update_przyczepy]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--update przyczepa z możliwością edycji pojedynczych danych--
CREATE   PROC [dbo].[update_przyczepy]
           @id_przyczepy_aktualizowanej int,
           @nr_rejestracyjny varchar(10) = null,
           @nr_vin varchar(25) = null,
           @ładowność int = null,
           @wysokość int = null,
           @długość int = null,
           @fk_id_pojazdu int = null,
           @fk_nr_polisy varchar(30) = null
AS
BEGIN
SET NOCOUNT ON
    UPDATE [dbo].[Przyczepa]
   SET [nr_rejestracyjny] = isNull(@nr_rejestracyjny,nr_rejestracyjny)
      ,[ładowność] = isNull(@ładowność,ładowność)
      ,[wysokość] = isNull(@wysokość, wysokość)
      ,[długość] = isNull(@długość,długość)
      ,[fk_id_pojazdu] =isNull (@fk_id_pojazdu,fk_id_pojazdu)
      ,[fk_nr_polisy] =isNull (@fk_nr_polisy,fk_nr_polisy)
      ,[nr_vin] =isNull (@nr_vin, nr_vin)
 WHERE id_przyczepy=@id_przyczepy_aktualizowanej
END
GO
/****** Object:  StoredProcedure [dbo].[update_trasy]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--update trasy z możliwością edycji pojedynczych danych--
CREATE   PROC [dbo].[update_trasy]
			@id_trasy_aktualizowanej int,
		    @miejsce_załadunku varchar(50)= NULL,
            @miejsca_rozładunku varchar(50)= NULL,
            @dlugosc_trasy int= NULL,
            @klient int= NULL,
            @kierowca int= NULL,
            @ładunek int= NULL,
            @przyczepa int= NULL,
            @pojazd int= NULL
AS
BEGIN
SET NOCOUNT ON
	UPDATE [dbo].[Trasa]
   SET [miejsce_załadunku] = isNULL(@miejsce_załadunku,miejsce_załadunku)
      ,[miejsca_rozładunku] =isNULL(@miejsca_rozładunku,miejsca_rozładunku)
      ,[długość_trasy] = isNULL(@dlugosc_trasy,długość_trasy)
      ,[fk_id_klient] = isNULL(@klient,fk_id_klient)
      ,[fk_id_kierowcy] =isNULL( @kierowca,fk_id_kierowcy)
      ,[fk_id_ładunku] = isNULL(@ładunek,fk_id_ładunku)
      ,[fk_id_przyczepy] = isNULL(@przyczepa,fk_id_przyczepy)
      ,[fk_id_pojazdu] =isNULL( @pojazd,fk_id_pojazdu)
 WHERE id_trasy=@id_trasy_aktualizowanej
END         
GO
/****** Object:  StoredProcedure [dbo].[update_ubezpieczenia]    Script Date: 17.06.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--update ubezpieczenia z możliwością edycji pojedynczych danych--
CREATE   PROC [dbo].[update_ubezpieczenia]
        @nr_polisy varchar(30),
        @data_rozpoczęcia_ubezpieczenia date = null,
        @data_zakończenia_ubezpieczenia date = null,
        @składka money = null,
        @opłacone bit = null
AS
BEGIN
SET NOCOUNT ON
    UPDATE [dbo].[Ubezpieczenie]
   SET 
      [data_rozpoczęcia_ubezpieczenia] = isNull(@data_rozpoczęcia_ubezpieczenia,data_rozpoczęcia_ubezpieczenia)
      ,[data_zakończenia_ubezpieczenia] = isNull(@data_zakończenia_ubezpieczenia, data_zakończenia_ubezpieczenia)
      ,[składka] = isNull(@składka,składka)
      ,[opłacone] = isNull(@opłacone, opłacone)
 WHERE nr_polisy=@nr_polisy
END
GO
USE [master]
GO
ALTER DATABASE [Firma_Transportowa] SET  READ_WRITE 
GO
