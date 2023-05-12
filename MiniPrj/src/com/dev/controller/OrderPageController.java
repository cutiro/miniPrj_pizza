package com.dev.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.vo.MenuVO;

@WebServlet("/menu/orderpage")
public class OrderPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("주문 페이지 출력 id=" + id);
		String url = "jdbc:mysql://localhost:3306/miniprj";
		String sql = "SELECT * FROM MENU WHERE MENU_ID=?";
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "1234");
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			String menu_title = rs.getString("MENU_TITLE");
			String menu_alias = rs.getString("MENU_ALIAS");
			int menu_lprice = rs.getInt("MENU_LPRICE");
			int menu_rprice = rs.getInt("MENU_RPRICE");
			
			MenuVO menuVO = new MenuVO(id, menu_title, menu_alias, menu_lprice, menu_rprice);
		
			request.setAttribute("menuVO", menuVO);
			
			rs.close();
			pstmt.close();
			con.close();
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/menu/orderpage.jsp").forward(request, response);
	}


}
