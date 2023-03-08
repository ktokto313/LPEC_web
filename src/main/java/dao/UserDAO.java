package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import context.DBContext;
import model.User;

public class UserDAO {
	private DBContext dbContext;
	
	public UserDAO() {
		this.dbContext = new DBContext();
	}
	
	public Boolean validateUser(User user) {
		try {
			Connection c = dbContext.getConnection();
			String sql = "select count(*) from user where Username = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) == 0) {
					return true;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Boolean registerUser(User user) {
		if (validateUser(user)) {
			try {
				Connection c = dbContext.getConnection();
				String sql = "insert into user(Username, Password) values (?, ?)";
				PreparedStatement ps = c.prepareStatement(sql);
				ps.setString(1, user.getUsername());
				ps.setString(2, user.getPassword());
				ps.execute();
				return true;
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean loginUser(User user) {
		try {
			Connection c = dbContext.getConnection();
			String sql = "select count(*) from user where Username = ? and Password = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ResultSet rs = ps.executeQuery();
			if (rs.next() && rs.getInt(1) == 1) {
				sql = "select ID, Role from user where Username = ? and Password = ?";
				ps = c.prepareStatement(sql);
				ps.setString(1, user.getUsername());
				ps.setString(2, user.getPassword());
				rs = ps.executeQuery();
				rs.next();
				user.setId(rs.getInt(1));
				user.setRole(rs.getString(2));
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
}
