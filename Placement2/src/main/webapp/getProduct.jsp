<%@ page import="java.sql.*, java.util.ArrayList" %>
<%
    String town = request.getParameter("town");
    
    if (town != null && !town.isEmpty()) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/employees", "root", "");
            String query = "SELECT product_name FROM product";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            
            ArrayList<String> productsList = new ArrayList<>();
            while (rs.next()) {
                String product = rs.getString("product_name");
                productsList.add(product);
            }
            
            rs.close();
            pstmt.close();
            conn.close();
            
            StringBuilder jsonBuilder = new StringBuilder("[");
            for (int i = 0; i < productsList.size(); i++) {
                jsonBuilder.append("\"").append(productsList.get(i)).append("\"");
                if (i < productsList.size() - 1) {
                    jsonBuilder.append(",");
                }
            }
            jsonBuilder.append("]");
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(jsonBuilder.toString());
        } catch (SQLException e) {
            e.printStackTrace();
            out.print("[]");
        }
    } else {
        out.print("[]");
    }
%>
