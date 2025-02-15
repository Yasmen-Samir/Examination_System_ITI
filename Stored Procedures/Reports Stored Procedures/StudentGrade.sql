USE [ExaminationSystem]
GO
/****** Object:  StoredProcedure [dbo].[StudentGrade]    Script Date: 9/7/2024 12:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[StudentGrade] @StudentID int
AS
BEGIN
  IF EXISTS (SELECT * FROM Student WHERE St_ID = @StudentID)
  BEGIN
    SELECT st.St_ID,st.St_name,sp.St_Phone,t.Track_name,ik.Intake_name,
      
      concat(CAST(ROUND(SUM(ste.Exam_Percentage) / COUNT(ste.ex_ID), 2) AS DECIMAL(10, 2)),'%') AS Courses_Grade 
    FROM 
		Student st inner join student_exam ste
		on st.St_ID=ste.Std_ID and st.St_ID=@StudentID
		inner join Tracks t
		on st.track_ID=t.track_ID
		inner join Intake ik
		on st.Intake_ID= ik.Intake_ID
		inner join Student_Phone sp
		on st.St_ID=sp.St_ID
    GROUP BY st.St_ID,st.St_name,t.Track_name,ik.Intake_name,sp.St_Phone;

      
  END
  ELSE
  BEGIN
    SELECT 'Student does not exist' AS St_ID;
  END
END

exec StudentGrade 1