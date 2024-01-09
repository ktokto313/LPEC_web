package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

import context.DBContext;
import model.Comment;
import model.Post;
import model.User;

public class PostDAO {
	private DBContext dbContext;
	
	public PostDAO() {
		this.dbContext = new DBContext();
	}
	
	public Boolean post(Post post) {
		try {
			Connection c = dbContext.getConnection();
			String sql = "insert into post(Title, Date, Author, ShortContent, Content, UserID) values (?, ?, ?, ?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, post.getTitle());
			ps.setObject(2, post.getDate());
			ps.setString(3, post.getAuthor());
			ps.setString(4, post.getShortContent());
			ps.setString(5, post.getContent());
			ps.setInt(6, post.getUserID());
			ps.execute();
			return true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Post getLastestPost() {
		try {
			Connection c = dbContext.getConnection();
			String sql = "select * from post order by Date desc, Title limit 1";
			PreparedStatement ps = c.prepareStatement(sql);
			ArrayList<Post> result = getPost(ps);
			if (!result.isEmpty()) {
				return result.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Post> getPostID(String pattern) {
		try {
			Connection c = dbContext.getConnection();
			String sql = "select * from post where ID like ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, pattern);
			return getPost(ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<>();
	}
	
	public ArrayList<Post> getAllPost() {
		try {
			Connection c = dbContext.getConnection();
			String sql = "select * from post order by Date desc, Title asc";
			PreparedStatement ps = c.prepareStatement(sql);
			return getPost(ps);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<>();
	}
	
	public ArrayList<Post> getPost(PreparedStatement ps) {
		ArrayList<Post> al = new ArrayList<>();
		try {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Post post = new Post();
				post.setId(rs.getInt(1));
				post.setTitle(rs.getString(2));
				post.setDate(rs.getObject(3, LocalDate.class));
				post.setAuthor(rs.getString(4));
				post.setShortContent(rs.getString(5));
				post.setContent(rs.getString(6));
				post.setUserID(rs.getInt(7));
				al.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public Boolean comment(Comment comment) {
		try {
			Connection c = dbContext.getConnection();
			String sql = "insert into comment(Author, Content, Post_ID, UserID) values (?, ?, ?, ?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, comment.getAuthor());
			ps.setString(2, comment.getContent());
			ps.setInt(3, comment.getPost_ID());
			ps.setInt(4, comment.getUser_ID());
			ps.execute();
			return true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Boolean deleteComment(int id) {
		try {
			Connection c = dbContext.getConnection();
			String sql = "update comment set Deleted = 1 where ID = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			return true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<Comment> getComment(Post post) {
		try {
			ArrayList<Comment> al = new ArrayList<>();
			Connection c = dbContext.getConnection();
			String sql = "select * from comment where Post_ID = ? and Deleted = 0";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, post.getId());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment();
				comment.setID(rs.getInt(1));
				comment.setAuthor(rs.getString(2));
				comment.setContent(rs.getString(3));
				comment.setPost_ID(rs.getInt(4));
				comment.setUser_ID(rs.getInt(5));
				al.add(comment);
			}
			return al;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<>();
	}
}
