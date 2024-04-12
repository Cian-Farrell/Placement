<%@ page import="java.sql.*, java.util.ArrayList" %>
<%
    // Check if the 'town' parameter is present in the request
    String town = request.getParameter("town");
    
    // Check if the 'town' parameter is not null or empty
    if (town != null && !town.isEmpty()) {
        try {
            // Establish database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/employees", "root", "");
            
            // Prepare SQL query to fetch stores based on the selected town
            String query = "SELECT store FROM stores WHERE town = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, town);
            
            // Execute query and retrieve stores
            ResultSet rs = pstmt.executeQuery();
            
            // Create an ArrayList to store store names
            ArrayList<String> storesList = new ArrayList<>();
            
            // Iterate through the result set and add store names to the ArrayList
            while (rs.next()) {
                String store = rs.getString("store");
                storesList.add(store);
            }
            
            // Close resources
            rs.close();
            pstmt.close();
            conn.close();
            
            // Construct JSON response manually
            StringBuilder jsonBuilder = new StringBuilder("[");
            for (int i = 0; i < storesList.size(); i++) {
                jsonBuilder.append("\"").append(storesList.get(i)).append("\"");
                if (i < storesList.size() - 1) {
                    jsonBuilder.append(",");
                }
            }
            jsonBuilder.append("]");
            
            // Write JSON response
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(jsonBuilder.toString());
        } catch (SQLException e) {
            e.printStackTrace();
            // Return an empty JSON array in case of any error
            out.print("[]");
        }
    } else {
        // Return an empty JSON array if 'town' parameter is missing or empty
        out.print("[]");
    }
%>