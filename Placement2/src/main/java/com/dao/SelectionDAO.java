package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Selection;

public class SelectionDAO {

    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Establish database connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/employees", "root", "");
            System.out.println("Successfully connected to DB");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public int saveSelection(Selection selection) {
        String INSERT_SELECTION_SQL = "INSERT INTO selection (town, store, ranking, product, facings) VALUES (?, ?, ?, ?, ?);";

        int result = 0;

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SELECTION_SQL)) {

            preparedStatement.setString(1, selection.getTown());
            preparedStatement.setString(2, selection.getStore());
            preparedStatement.setString(3, selection.getRank());
            preparedStatement.setString(4, selection.getProduct());
            preparedStatement.setString(5, selection.getFacing());

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    public List<Selection> getAllSelections() {
        Connection connection = getConnection();
        List<Selection> selectionList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM selection");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Selection selection = new Selection(rs.getString("town"), rs.getString("store"),
                                                     rs.getString("ranking"), rs.getString("product"),
                                                     rs.getString("facings"));
                selectionList.add(selection);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return selectionList;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
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