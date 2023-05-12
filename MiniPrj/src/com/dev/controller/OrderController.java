package com.dev.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.vo.OrderVO;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/order")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int menu_id = Integer.parseInt(request.getParameter("menu_id"));
		String order_size = request.getParameter("order_size");
		String order_edge = request.getParameter("order_edge");
		String[] order_topping_ = request.getParameterValues("order_topping");
		String order_topping = joinTopping(order_topping_);
		int order_count = Integer.parseInt(request.getParameter("order_count"));
		
		OrderVO orderVO = new OrderVO(menu_id,order_size,order_edge,order_topping,order_count);
		
		request.setAttribute("orderVO", orderVO);
		request.getRequestDispatcher("/WEB-INF/menu/test.jsp").forward(request,response);
	}

	private String joinTopping(String[] order_topping_) {
		String result = "";
		if (order_topping_ != null) {
			for (int i = 0; i < order_topping_.length; i++) {
				result += order_topping_[i] + "/";
			}
		}
		
		return result;
	}
	


}
