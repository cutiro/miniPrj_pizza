package com.dev.vo;

public class OrderVO {
	private String order_size;
	private String order_edge;
	private String order_topping;
	private int order_count;
	private int menu_id;

	public OrderVO(int menu_id, String order_size, String order_edge, String order_topping, int order_count) {
		this.menu_id = menu_id;
		this.order_size = order_size;
		this.order_edge = order_edge;
		this.order_topping = order_topping;
		this.order_count = order_count;
		
	}

	public int getMenu_id() {
		return menu_id;
	}


	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}


	public String getOrder_size() {
		return order_size;
	}

	public void setOrder_size(String order_size) {
		this.order_size = order_size;
	}

	public String getOrder_edge() {
		return order_edge;
	}

	public void setOrder_edge(String order_edge) {
		this.order_edge = order_edge;
	}

	public String getOrder_topping() {
		return order_topping;
	}

	public void setOrder_topping(String order_topping) {
		this.order_topping = order_topping;
	}

	public int getOrder_count() {
		return order_count;
	}

	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	
	
}
