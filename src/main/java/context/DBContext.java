package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
	private final String SERVER = "localhost";
	private final String HOST = "3306";
	private final String DATABASE = "Website_LPEC";
	private final String USERNAME = "normaluser";
	private final String PASSWORD = "123456789";
	
	public Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://" + SERVER + ":"  + HOST + "/" + DATABASE, USERNAME,PASSWORD);
	}
}
