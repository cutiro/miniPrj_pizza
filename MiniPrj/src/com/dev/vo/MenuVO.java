package com.dev.vo;

public class MenuVO {
	private int menu_id;
	private String menu_title;
	private String menu_alias;
	private int menu_lprice;
	private int menu_rprice;
	private int category_id;
	
	public MenuVO(int menu_id, String menu_title, String menu_alias, int menu_lprice, int menu_rprice) {
		this.menu_id = menu_id;
		this.menu_title = menu_title;
		this.menu_alias = menu_alias;
		this.menu_lprice = menu_lprice;
		this.menu_rprice = menu_rprice;
	}
	
	public MenuVO(int menu_id, String menu_title, String menu_alias, int menu_lprice, int menu_rprice, int category_id) {
		this.menu_id = menu_id;
		this.menu_title = menu_title;
		this.menu_alias = menu_alias;
		this.menu_lprice = menu_lprice;
		this.menu_rprice = menu_rprice;
		this.category_id = category_id;
	}

	public int getmenu_id() {
		return this.menu_id;
	}

	public void setmenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public String getmenu_title() {
		return this.menu_title;
	}

	public void setmenu_title(String menu_title) {
		this.menu_title = menu_title;
	}

	public String getmenu_alias() {
		return this.menu_alias;
	}

	public void setmenu_alias(String menu_alias) {
		this.menu_alias = menu_alias;
	}

	public int getmenu_lprice() {
		return this.menu_lprice;
	}

	public void setmenu_lprice(int menu_lprice) {
		this.menu_lprice = menu_lprice;
	}

	public int getmenu_rprice() {
		return this.menu_rprice;
	}

	public void setmenu_rprice(int menu_rprice) {
		this.menu_rprice = menu_rprice;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	
	
	

	
	
}
