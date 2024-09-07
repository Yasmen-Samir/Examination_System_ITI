USE [ExaminationSystem]
GO
/****** Object:  StoredProcedure [dbo].[StudentDepartment]    Script Date: 9/7/2024 12:24:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[StudentDepartment]
as
	begin
	    declare @para int
		select s.St_name,s.St_age,s.St_email,s.gender,d.Dept_Name,d.Dept_ID
		from Student s inner join tracks t
		on s.track_ID = t.track_ID
		inner join department d
		on t.Dept_ID=d.Dept_ID 

	end

exec StudentDepartment

