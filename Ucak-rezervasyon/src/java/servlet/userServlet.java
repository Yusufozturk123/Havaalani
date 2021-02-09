/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AdminDAO;
import dao.UcakDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Ucak;
import model.User;

/**
 * ControllerServlet.java
 * This servlet acts as a page controller for the application, handling all
 * requests from the user.
 * @email Ramesh Fadatare
 */

@WebServlet("/")
public class userServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO;
    private UcakDAO ucakDAO;
    

    @Override
    public void init() {
        adminDAO = new AdminDAO();
        ucakDAO = new UcakDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();
       
        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/newUcak":
                    showNewFormUcak(request, response);
                    break;
                    
                case "/insert":
                    insertUser(request, response);
                    break;
                    
                case "/insertUcak":
                    insertUcak(request, response);
                    break;    
      
                case "/delete":
                    deleteUser(request, response);
                    break;
                    
                case "/deleteUcak":
                    deleteUcak(request, response);
                    break;    
                    
                case "/edit":
                    showEditForm(request, response);
                    break;
                    
                case "/editucak":
                    showEditFormUcak(request, response);
                    break;    
                    
                case "/update":
                    updateUser(request, response);
                    break;
                    
                case "/updateUcak":
                    updateUcak(request, response);
                    break;    
                    
                case "/listUcak":
                    listUcak(request, response);
                    break;
                  
                default:
                    listUser(request, response);
                    break;
                    
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    private void listUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List<User> listUser = adminDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-user.jsp");
        dispatcher.forward(request, response);
    }
    
    //
    private void listUcak(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List<Ucak> listUcak = ucakDAO.selectAllUcaks();
        request.setAttribute("listUcak", listUcak);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-ucak.jsp");
        dispatcher.forward(request, response);
    }
    
    
    //
    
  
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        dispatcher.forward(request, response);
    }
    //
    
    private void showNewFormUcak(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("ucak-form.jsp");
        dispatcher.forward(request, response);
    }
    
    //
    
    

  private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = adminDAO.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);

    }
  
  
  //
  private void showEditFormUcak(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int iducak = Integer.parseInt(request.getParameter("iducak"));
        Ucak existingUcak = ucakDAO.selectUcak(iducak);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ucak-form.jsp");
        request.setAttribute("ucak", existingUcak);
        dispatcher.forward(request, response);

    }
  
  //

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User newUser = new User(fullname, email, password);
        adminDAO.insertUser(newUser);
        response.sendRedirect("list");
    }
    //
    private void insertUcak(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        String kalkis = request.getParameter("kalkis");
        String inis = request.getParameter("inis");
        String tarih = request.getParameter("tarih");
        Ucak newUcak = new Ucak(kalkis, inis, tarih);
        ucakDAO.insertUcak(newUcak);
        response.sendRedirect("listUcak");
    }
    
    //

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User book = new User(id, name, email, password);
        adminDAO.updateUser(book);
        response.sendRedirect("list");
    }
    
    //
    
    private void updateUcak(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int iducak = Integer.parseInt(request.getParameter("iducak"));
        String kalkis = request.getParameter("kalkis");
        String inis = request.getParameter("inis");
        String tarih = request.getParameter("tarih");

        Ucak ucak = new Ucak(iducak, kalkis, inis, tarih);
        ucakDAO.updateUcak(ucak);
        response.sendRedirect("listUcak");
    }
    //
    
    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        adminDAO.deleteUser(id);
        response.sendRedirect("list");
    }
    
    //
     private void deleteUcak(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int iducak = Integer.parseInt(request.getParameter("iducak"));
        ucakDAO.deleteUcak(iducak);
        response.sendRedirect("listUcak");
    }
    //
    
    
}