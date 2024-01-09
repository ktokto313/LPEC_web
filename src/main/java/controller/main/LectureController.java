package controller.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostDAO;
import model.Comment;
import model.Post;
import model.User;

/**
 * Servlet implementation class LectureController
 */
public class LectureController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("error", null);
		int lecture = Integer.parseInt(request.getParameter("lecture"));
		PostDAO postDAO = new PostDAO();
		ArrayList<Post> al = postDAO.getPostID(lecture + "");
		Post post = null;
		if (!al.isEmpty()) {
			post = al.get(0);
			request.getSession().setAttribute("commentList", postDAO.getComment(post));
			request.getSession().setAttribute("currentLecture", post);
			request.getRequestDispatcher("lecture template.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("index").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		switch(request.getParameter("action")) {
			case "postComment":
				Comment comment = new Comment();
				request.setCharacterEncoding("UTF-8");
				User user = (User)request.getSession().getAttribute("user");
				try {
					comment.setAuthor(user.getUsername());
					comment.setContent(request.getParameter("comment"));
					comment.setPost_ID(((Post)request.getSession().getAttribute("currentLecture")).getId());
					comment.setUser_ID(user.getId());
					if (new PostDAO().comment(comment)) {
						request.getSession().setAttribute("commentList", new PostDAO().getComment((Post)request.getSession().getAttribute("currentLecture")));
						request.getSession().setAttribute("error", "Bình luận thành công");
					} else {
						request.getSession().setAttribute("error", "Xảy ra lỗi, vui lòng thử lại sau");
					}
				} catch(Exception e) {
					e.printStackTrace();
					request.getSession().setAttribute("error", "Xảy ra lỗi, vui lòng thử lại sau");
				}
				response.sendRedirect("lecture template.jsp#anchor");
				break;
			case "deleteComment":
				int commentID = Integer.parseInt(request.getParameter("commentID"));
				new PostDAO().deleteComment(commentID);
				request.getSession().setAttribute("commentList", new PostDAO().getComment((Post)request.getSession().getAttribute("currentLecture")));
				response.sendRedirect("lecture template.jsp#anchor");
		}
	}

}
