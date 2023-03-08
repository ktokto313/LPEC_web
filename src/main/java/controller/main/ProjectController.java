package controller.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import context.DBContext;
import dao.PostDAO;
import model.Comment;
import model.Post;
import model.User;

/**
 * Servlet implementation class ProjectController
 */
public class ProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("error", null);
		PostDAO postDAO = new PostDAO();
		request.getSession().setAttribute("lastestLecture", postDAO.getLastestPost());
		request.getSession().setAttribute("lectureList", postDAO.getAllPost());
		
		String requestedPage = (String) request.getParameter("page");
		if (requestedPage == null) {
			request.getRequestDispatcher("project.jsp?page=1").forward(request, response);
		} else
		request.getRequestDispatcher("project.jsp?page=" + requestedPage).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Post post = new Post();
		User user = (User)request.getSession().getAttribute("user");
		try {
			post.setTitle(request.getParameter("Title"));
			post.setDate(LocalDate.now());
			post.setAuthor(user.getUsername());
			post.setShortContent(request.getParameter("shortContent"));
			post.setContent(request.getParameter("content"));
			post.setUserID(user.getId());
			if (new PostDAO().post(post)) {
				PostDAO postDAO = new PostDAO();
				request.getSession().setAttribute("lastestLecture", postDAO.getLastestPost());
				request.getSession().setAttribute("lectureList", postDAO.getAllPost());
				request.getSession().setAttribute("error", "Đăng bài thành công");
			} else {
				request.getSession().setAttribute("error", "Xảy ra lỗi, vui lòng thử lại sau");
			}
		} catch(Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Xảy ra lỗi, vui lòng thử lại sau");
		}
		String requestedPage = (String) request.getParameter("page");
		if (requestedPage == null) {
			request.getRequestDispatcher("project.jsp?page=1#anchor").forward(request, response);
		} else
		request.getRequestDispatcher("project.jsp?page=" + requestedPage+"#anchor").forward(request, response);
	}

}
