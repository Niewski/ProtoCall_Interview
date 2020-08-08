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
-- Description:	Updates single record in People table
-- =============================================
CREATE PROCEDURE spUpdatePerson 
	-- Add the parameters for the stored procedure here
	@Id bigint, 
	@FirstName nvarchar(400) = NULL,
	@LastName nvarchar(400) = NULL,
	@PreferredName nvarchar(256) = NULL,
	@BirthDate datetime = NULL,
	@PrimaryPhoneNumber nvarchar(25) = NULL,
	@SecondaryPhoneNumber nvarchar(25) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Check for NULL Id
	IF @Id IS NULL 
		BEGIN
			PRINT 'Must provide Id of person being edited.'
			RETURN(1)
		END
	ELSE
		IF NOT EXISTS(SELECT *
		FROM People
		WHERE Id = @Id)
			BEGIN
				PRINT 'Could not find person with provided Id.'
				RETURN(2)
			END
		ELSE
			UPDATE People 
			SET FirstName = @FirstName,
			LastName = @LastName,
			PreferredName = @PreferredName,
			BirthDate = @BirthDate,
			PrimaryPhoneNumber = @PrimaryPhoneNumber,
			SecondaryPhoneNumber = @SecondaryPhoneNumber
			WHERE Id = @Id 
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
