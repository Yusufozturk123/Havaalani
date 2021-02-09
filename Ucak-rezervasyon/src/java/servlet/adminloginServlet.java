package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.adminLoginDao;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;

@WebServlet("/loginadmin")
public class adminloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public adminloginServlet() {
		super();
	}
        
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
                adminLoginDao adminDao = new adminLoginDao();
		
		try {
			
                        Admin admin = adminDao.checkLogin(email, password);
			String destPage = "adminGiris.jsp";
			
			
                        if (admin != null) {
				HttpSession session = request.getSession();
				session.setAttribute("admin", admin);
				destPage = "admin.jsp";
			} else {
				String message = "Invalid email/password";
				request.setAttribute("message", message);
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
			dispatcher.forward(request, response);
			
		} catch (ClassNotFoundException ex) {
			throw new ServletException(ex);
		} catch (SQLException ex) {
                Logger.getLogger(adminloginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
	}
        
        
}
