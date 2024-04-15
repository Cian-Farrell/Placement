<%@ page import="java.sql.*, java.util.ArrayList" %>
<%
    String town = request.getParameter("town");
    
    if (town != null && !town.isEmpty()) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/employees", "root", "");
            String query = "SELECT ranking_name FROM ranking";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            
            ArrayList<String> ranksList = new ArrayList<>();
            while (rs.next()) {
                String rank = rs.getString("ranking_name");
                ranksList.add(rank);
            }
            
            rs.close();
            pstmt.close();
            conn.close();
            
            StringBuilder jsonBuilder = new StringBuilder("[");
            for (int i = 0; i < ranksList.size(); i++) {
                jsonBuilder.append("\"").append(ranksList.get(i)).append("\"");
                if (i < ranksList.size() - 1) {
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
