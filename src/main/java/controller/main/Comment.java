package model;

public class Comment {
	private int ID;
	private String author;
	private String content;
	private int post_ID;
	private int user_ID;
	
	public Comment() {}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPost_ID() {
		return post_ID;
	}

	public void setPost_ID(int post_ID) {
		this.post_ID = post_ID;
	}

	public int getUser_ID() {
		return user_ID;
	}

	public void setUser_ID(int user_ID) {
		this.user_ID = user_ID;
	}
	
	
}
