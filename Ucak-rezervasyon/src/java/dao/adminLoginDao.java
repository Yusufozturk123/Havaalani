/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;
import model.Admin;

public class adminLoginDao {
 
    public Admin checkLogin(String email, String password) throws SQLException,
            ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/ucakbileti";
        String dbUser = "root";
        String dbPassword = "yusuf";
 
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        String sql = "SELECT * FROM admin WHERE email = ? and password = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);
 
        ResultSet result = statement.executeQuery();
 
        Admin admin = null;
 
        if (result.next()) {
            admin = new Admin();
            admin.setFullname(result.getString("fullname"));
            admin.setEmail(email);
        }
 
        connection.close();
 
        return admin;
    }
}
