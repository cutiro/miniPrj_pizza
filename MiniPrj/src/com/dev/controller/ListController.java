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

@WebServlet("/menu/list")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int category = Integer.parseInt(request.getParameter("category"));

		System.out.println("ListController 수행하였음");
		
	    String url = "jdbc:mysql://localhost:3306/miniprj";
	    String sql = "SELECT * FROM MENU WHERE category_id=?";
	    List<MenuVO> list = new ArrayList<>();
	    
	    try {
			Class.forName("org.mariadb.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,"root","1234");
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int menu_id = rs.getInt("MENU_ID");
				String menu_title = rs.getString("MENU_TITLE");
				String menu_alias = rs.getString("MENU_ALIAS");
				int menu_lprice = rs.getInt("MENU_LPRICE");
				int menu_rprice = rs.getInt("MENU_RPRICE");
				int category_id = rs.getInt("CATEGORY_ID");
				
				MenuVO menuVO = new MenuVO(menu_id, menu_title, menu_alias, menu_lprice, menu_rprice, category_id);
				
				list.add(menuVO);
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    
	    request.setAttribute("list", list);
	    request.getRequestDispatcher("/WEB-INF/menu/list.jsp").forward(request, response);
	}

}
