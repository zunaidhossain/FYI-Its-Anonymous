package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Helper {
	public static Connection createConnection(){
		Connection con = null;
		
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://sqldB", "username", "password");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return con;
	}
	
	public static void closeAll(Connection con, PreparedStatement ps, ResultSet rs) throws SQLException {
		if(con!=null)
			con.close();
		if(ps!=null)
			ps.close();
		if(rs!=null)
			rs.close();
	}
}

