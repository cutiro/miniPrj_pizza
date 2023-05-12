<%@page import="com.dev.vo.MenuVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
<style>
/* --페이지 관련-- */
body * {
	text-align: center;
	border: 1px solid #f00;
	margin: 0px;
	padding: 5px 0px;
}

#page-wrapper {
	width: 1400px;
	margin: 0px auto;
}

#content-section {
	float: left;
	border: 1px solid black;
	width: 1000px;
	margin: 10px auto;
}

#baseket-section {
	float:left;
}

/* --타이틀 영역-- */
#title-section {
	height: 120px;
	border-bottom: 1px solid black;
}

#category-section {
	width: fit-content;
	padding: 0px 5px;
	margin: 0px auto;
}

.categories li {
	margin: 0 10px;
	width: 150px;
	border: 1px solid black;
	border-radius: 15px;
	list-style: none;
	float: left;
	color: black;
	font-size: 1.8em;
	font-weight: bold;
}
.categories li a {
	color:black;
	text-decoration: none;
}

/* --메뉴판-- */
#menu-section {
	border-bottom: 1px solid black;
	height: 660px;
}

	/* --메뉴판 아이템-- */
#menu-item-section {
	width: fit-content;
	margin: 0px auto;
}

#menu-item-section .menu-item {
	border: 1px solid black;
	padding: 5px;
	border-radius: 25px;
	padding: 5px;
}

#menu-item-section .menu-item img {
	width: 300px;
	height: 200px;
	border-radius: 25px;
}

#menu-item-section .menu-item a {
	text-decoration: none;
}

/* --장바구니-- */
#basket-section * {
	border: 1px solid black;
}

#basket-section .countButton {
	margin-left: 5px;
	width: 2em;
}
</style>
</head>
<body>
	<div id="page-wrapper">
		<div id="content-section">
			<div id="title-section">
				<span class="title">
					<h1>주문기</h1>
				</span>
				<div id="category-section">
					<ul class="categories">
						<li id="category-pizza"><a href="/menu/list?category=100">피자</a></li>
						<li id="category-side"><a href="/menu/list?category=200">사이드</a></li>
						<li id="category-drinks"><a href="/menu/list?category=300">음료</a></li>
					</ul>
				</div>
			</div>
			<!-- 메뉴판 -->
			<div id="menu-section">
				<!-- 메뉴판 아이템 -->
				<div id="menu-item-section">
					<table>
						<c:set var="index" value="0"></c:set>
						<c:set var="maxlength" value="3"></c:set>
						<c:forEach var="n" items="${list }" varStatus="">
						<c:if test="${index % maxlength == 0 }">
						<tr>
						</c:if>
							<!-- 메뉴판 -->
							<td class="menu-item">
								<div class="menu-item-box">
									<a href="/menu/orderpage?id=${n.menu_id }"><img alt="${n.menu_title }" src="/images/menu/${n.menu_alias}.jpg"><br>
										<p>${n.menu_title}</p>
										<c:if test="${n.category_id == 100 }">
											<c:if test="${n.menu_lprice != 0}">
												<p>(L)${n.menu_lprice}원</p>
											</c:if>
											<c:if test="${n.menu_rprice != 0}">
												<p>(R)${n.menu_rprice}원</p>
											</c:if>
										</c:if>
										<c:if test="${n.category_id == 200 || n.category_id == 300}">
											<p>${n.menu_rprice }원</p>
										</c:if>
									</a>
								</div>
							</td>
						<c:if test="${index % maxlength == maxlength-1 }">
						</tr>
						</c:if>
						<c:set var="index" value="${index+1 }"></c:set>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div id="basket-section">
			<table>
				<tr><td>피자</td></tr>
				<tr><td>#주문한피자</td><br></tr>
				<tr><td>사이드</td></tr>
				<tr><td>#주문한사이드1<br>버튼--1--버튼</td></tr>
				<tr><td>#주문한사이드2<br>버튼--1--버튼</td></td></tr>
				<tr><td>음료</td></tr>
				<tr><td>#주문한음료<br>버튼--1--버튼</td></td></tr>
			</table>
		</div>

	</div>
	<script>
		
	</script>
</body>
</html>