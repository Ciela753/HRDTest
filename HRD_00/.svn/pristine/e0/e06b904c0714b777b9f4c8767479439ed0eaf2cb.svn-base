package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class DBConn {
	int i;
	String s;
	char c;
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		return con;
	}
	
	
	public static void main(String[] args) {
		DBConn dbc = new DBConn();
		
		System.out.println(dbc.i);
		System.out.println(dbc.s);
		System.out.println(dbc.c == 0);
		
		String str = null;
		Integer x = null;
		System.out.println(str.equals(str));
	}
	
}
