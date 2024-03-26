package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Selection;

public class SelectionDAO {

	public static Connection getConnection() {
		
		Connection connection = null;
	    try {
		      //Class.forName("com.mysql.jdbc.Driver");
		      connection = DriverManager.getConnection(
		    		  "jdbc:mysql://localhost:3307/employees", "root", "");
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
		    return connection;
	}
	
	public int registerSelection(Selection selection) throws ClassNotFoundException{
		
		String INSERT_SELECTION_SQL = "INSERT INTO selection" +
	            "  (town, store, ranking, product, facings) VALUES " +
	            " (?, ?, ?, ?, ?);";
		
        int result = 0;

        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SELECTION_SQL)) {
            //preparedStatement.setInt(1, 1);
            preparedStatement.setString(1, selection.getTown());
            preparedStatement.setString(2, selection.getStore());
            preparedStatement.setString(3, selection.getRank());
            preparedStatement.setString(4, selection.getProduct());
            preparedStatement.setString(5, selection.getFacing());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
		
	}
	
//	public static Selection checkSelection(String town, String store, String rank, String product, String facing) {
//	    
//		Connection connection = getConnection();
//	    Selection selection = null ;
//
//	    try {
//	      PreparedStatement psmt = connection.prepareStatement("SELECT * FROM selection WHERE town = ?, store= ?, ranking = ?, product = ? AND facings = ?");
//	      psmt.setString(1, town);
//	      psmt.setString(2, store);
//	      psmt.setString(3, rank);
//	      psmt.setString(4, product);
//	      psmt.setString(5, facing);
//	      ResultSet rs = psmt.executeQuery();
//	      if (rs.next()) {
//	        selection = new Selection(rs.getString("town"), rs.getString("store"), rs.getString("ranking"), rs.getString("product"), rs.getString("facings"));
//	      }
//	    } catch (SQLException e) {
//	      e.printStackTrace();
//	    }
//	    return selection;
//	}
	
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
