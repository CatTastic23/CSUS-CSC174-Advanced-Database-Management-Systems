/*
 * Catherine Nguyen
 * CSC 174
 * 11/30/2020
 * HW 4
 * */

import java.sql.*;

public class nguyen_hw4 {

	public static void main (String args[]) {
		String url= "jdbc:mysql://athena.ecs.csus.edu/cs174119";
		String username= "cs174119";
		String password = "hdhmqwdk";
		
		// Set up for connection // 
		nguyen_hw4 example = new nguyen_hw4();
		example.displayData(url,username,password);
	}
	
	public void displayData(String urlStr,String username,String password) {
		try {
			Class.forName ("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
				
			// Gaining Connection to the MySQL Database //
			Connection conn = DriverManager.getConnection(urlStr,username,password);
		    System.out.println ("Connected to the MySQL database");

		    // SSN and Name of Students in Programming Languages Course //
		    System.out.println("\nThe SSN and Name of students enrolled in Programming Languages.");
		    Statement stmt1 = conn.createStatement();
		    ResultSet rs1=null;
		    rs1=stmt1.executeQuery("SELECT * FROM Student AS S, Enrolled AS E, Course AS C WHERE C.CourseName='Programming Languages' AND C.CourseNo=E.CourseNo AND E.SSN = S.SSN");
		    while (rs1.next()) {
		    	System.out.println("SSN: " + rs1.getString(1) + ", Name: " + rs1.getString(2));
		    }
		    stmt1.close();
		     
		    // Querying the Tuples for TA_Course //
			System.out.println("\nQuerying the tuples of TA_Course.");
 			Statement stmt2 = conn.createStatement();
		    ResultSet rs2=null;
		    rs2=stmt2.executeQuery("SELECT * FROM TA_Course");
		    while (rs2.next()) {
		    	String TA_Name = rs2.getString("TA_Name");
		    	String TA_Email = rs2.getString("TA_Email");
		    	String Course_Name =rs2.getString("Course_Name");
		    	System.out.println("TA_Name: " + TA_Name + ", TA_Email: " + TA_Email + ", Course_Name: " + Course_Name);
		    }
		    stmt2.close();
		    
		    // Calling the Course_Instructor //
		    System.out.println("\nCalling the function Course_Instructor.");
			CallableStatement cstmt = conn.prepareCall("{?= call Course_Instructor(?)}"); //call a function
			cstmt.registerOutParameter(1,Types.VARCHAR);
			cstmt.setString(2,"Programming Languages");
			cstmt.execute();
			System.out.println ("Instructor Name: "+ cstmt.getString(1).toString());
			cstmt.close();
			 
			// Closing the MySQL Connection //
			conn.close();
			System.out.println("\nDisconnected");
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
}