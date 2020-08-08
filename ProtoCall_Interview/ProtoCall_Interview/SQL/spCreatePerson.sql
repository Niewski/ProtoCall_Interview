-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jacob Wisniewski
-- Create date: 8/7/2020
-- Description:	Insert record into People table.
-- =============================================
CREATE PROCEDURE spCreatePerson 
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(400), 
	@LastName nvarchar(400),
	@PreferredName nvarchar(256) = NULL,
	@BirthDate datetime = NULL,
	@PrimaryPhoneNumber nvarchar(25) = NULL,
	@SecondaryPhoneNumber nvarchar(25) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Check for NULLs
	If @FirstName IS NULL 
		BEGIN
			PRINT 'You must provide a first name.'
			RETURN(1)
		END
	ELSE IF @LastName IS NULL
		BEGIN
			PRINT 'You must provide a last name.'
			RETURN(2)
		END
	ELSE
		-- Insert record into People table
		INSERT INTO People (EntityId,
							FirstName,
							LastName,
							PreferredName,
							BirthDate,
							PrimaryPhoneNumber,
							SecondaryPhoneNumber)
					VALUES (NEWID(),
							@FirstName,
							@LastName,
							@PreferredName,
							@BirthDate,
							@PrimaryPhoneNumber,
							@SecondaryPhoneNumber)
					-- Check for SQL Server errors.
					IF @@ERROR <> 0
						BEGIN
							RETURN(3)
						END
					ELSE
						--SUCCESS
						RETURN(0)
END
GO
