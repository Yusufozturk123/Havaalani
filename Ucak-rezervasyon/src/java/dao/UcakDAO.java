/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Ucak;

/**
 * AbstractDAO.java This DAO class provides CRUD database operations for the
 * table users in the database.
 * 
 * @author Ramesh Fadatare
 *
 */

public class UcakDAO {
    
    private final String jdbcURL = "jdbc:mysql://localhost:3306/ucakbileti";
    private final String jdbcUsername = "root"; 
    private final String jdbcPassword = "yusuf";

    private static final String INSERT_PLANE_SQL = "INSERT INTO ucak" + "  (kalkis, inis, tarih) VALUES " +
        " (?, ?, ?);";
    private static final String SELECT_PLANE_BY_ID = "select iducak,kalkis,inis,tarih from ucak where iducak =?";
    private static final String SELECT_PLANE_USERS = "select * from ucak";
    private static final String DELETE_PLANE_SQL = "delete from ucak where iducak = ?;";
    private static final String UPDATE_PLANE_SQL = "update ucak set kalkis = ?, inis= ?, tarih =? where iducak = ?;";
    

    public UcakDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
         
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
           
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void insertUcak(Ucak ucak) throws SQLException {
        System.out.println(INSERT_PLANE_SQL);
        // try-with-resource statement will auto close the connection.
       
        try (           
            Connection connection = getConnection();                                
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PLANE_SQL)) {
            preparedStatement.setString(1, ucak.getKalkis());
            preparedStatement.setString(2, ucak.getInis());
            preparedStatement.setString(3, ucak.getTarih());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Ucak selectUcak(int iducak) {
        Ucak ucak = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PLANE_BY_ID);) {
            preparedStatement.setInt(1, iducak);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String kalkis = rs.getString("kalkis");
                String inis = rs.getString("inis");
                String tarih = rs.getString("tarih");
                ucak = new Ucak(iducak, kalkis, inis, tarih);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return ucak;
    }

    public List<Ucak> selectAllUcaks() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Ucak> ucaks = new ArrayList<> ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PLANE_USERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int iducak = rs.getInt("iducak");
                String kalkis = rs.getString("kalkis");
                String inis = rs.getString("inis");
                String tarih = rs.getString("tarih");
                ucaks.add(new Ucak(iducak, kalkis, inis, tarih));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return ucaks;
    }

    public boolean deleteUcak(int iducak) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_PLANE_SQL);) {
            statement.setInt(1, iducak);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateUcak(Ucak ucak) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_PLANE_SQL);) {
            statement.setString(1, ucak.getKalkis());
            statement.setString(2, ucak.getInis());
            statement.setString(3, ucak.getTarih());
            statement.setInt(4, ucak.getIducak());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}

