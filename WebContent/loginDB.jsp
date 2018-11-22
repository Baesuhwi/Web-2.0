<%@page import="org.json.*"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String idt = request.getParameter("id");
		String pwt = request.getParameter("pw");
		
		int x = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONObject jsonObject;
		JSONArray jsonArray = new JSONArray();

		try {

			Class.forName("org.mariadb.jdbc.Driver");

			String url = "jdbc:mariadb://localhost:3306/test";
			String id = "root";
			String pw = "1234";
			conn = DriverManager.getConnection(url, id, pw);

			
			pstmt = conn.prepareStatement("select * from member where mid = ?");
			pstmt.setString(1, idt);
			rs = pstmt.executeQuery();

			if (rs.next()) { //아이디 존재
				if(pwt.equals(rs.getString("mpw"))){//비밀번호 맞음
					jsonObject = new JSONObject();
					jsonObject.put("id", rs.getString("mid"));
					jsonObject.put("pw", rs.getString("mpw"));
					jsonObject.put("name", rs.getString("mname"));
					
					jsonArray.put(jsonObject);
					out.print(jsonArray);
				}else{//비밀번호 틀림
					x = 1;
					out.print(x);
				}
			}else{//아이디 없을때
				x = -1;
			out.print(x);
			}
		} catch (Exception e) {
			out.println(e);
		} finally {
			if (rs != null)
				try {rs.close();} catch (SQLException ex) {}
			if (pstmt != null)
				try {pstmt.close();} catch (SQLException ex) {}
			if (conn != null)
				try {conn.close();} catch (SQLException ex) {}
		}
%>