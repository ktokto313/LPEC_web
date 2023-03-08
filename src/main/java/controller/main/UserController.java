package controller.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("action") != null? request.getParameter("action"):"";
		switch(param) {
			case "login":
				request.getSession(true).invalidate();
				request.getRequestDispatcher("login.jsp").forward(request, response);
				break;
			case "register":
				request.getSession(true).invalidate();
				request.getRequestDispatcher("register.jsp").forward(request, response);
				break;
			case "logout":
				Cookie[] cookieList = request.getCookies();
				for (Cookie cookie : cookieList) {
					if (cookie.getName().equals("logged-in")) {
						cookie.setValue("false");
						response.addCookie(cookie);
					} else if (cookie.getName().equals("usr") || cookie.getName().equals("pwd")) {
						cookie.setValue("");
						response.addCookie(cookie);
					}
				}
				request.getSession().setAttribute("logged-in", "false");
				request.getSession().setAttribute("user", null);
				String uri = request.getRequestURI().substring(request.getContextPath().length()+1);
				response.sendRedirect(uri);
				break;
			default:
				request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		User user = new User();
		user.setUsername(request.getParameter("username").toLowerCase());
		user.setPassword(request.getParameter("password"));
		switch(request.getParameter("action")) {
			case "login":
				if (userDAO.loginUser(user)) {
					response.addCookie(new Cookie("logged-in", "true"));
					if (request.getParameter("remember") != null && request.getParameter("remember").equals("on")) {
						Cookie usr = new Cookie("usr", user.getUsername());
						Cookie pwd = new Cookie("pwd", user.getPassword());
						usr.setMaxAge(-1);
						pwd.setMaxAge(-1);
						response.addCookie(usr);
						response.addCookie(pwd);
					}
					request.getSession().setAttribute("user", user);
					request.getSession().setAttribute("error", null);
					response.sendRedirect("index");
				} else {
					request.getSession().setAttribute("usr", user.getUsername());
					request.getSession().setAttribute("pwr", user.getPassword());
					request.getSession().setAttribute("error", "Username or password not found");
					response.sendRedirect("login.jsp");
				}
				break;
			case "register":
				if (userDAO.registerUser(user)) {
					request.getSession().setAttribute("error", "Đăng kí tài khoản mới thành công");
					response.sendRedirect("register.jsp");
				} else {
					request.getSession().setAttribute("error", "Tài khoản đã có trong cơ sở dữ liệu");
					response.sendRedirect("register.jsp");
				}
		}
	}

}
