<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* --페이지 관련-- */
*{
	text-align: center;
}
body * {
	text-align: center;
	/* border: 1px solid #f00; */
	margin: 0px;
	padding: 5px 0px;
}

#page-wrapper {
	width: 1400px;
	margin: 0px auto;
}

#content-section {
	border: 1px solid black;
	width: 1000px;
	margin: 10px auto;
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
	color: black;
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

/* --주문 페이지-- */
#left-iteminfo-section {
	margin-right: 120px;
	width: fit-content;
	float: left;
}

#right-order-section {
	margin-right: 80px;
	width: fit-content;
	float: left;
	
}


#right-order-section table * {
	text-align: left;
}

#right-order-section input {
	margin-right: 10px;
}

.counting{
	width:50px;
	padding-left:20px;
}
.number {
	width:40px;
	padding-left: 28px;
}

</style>
</head>
<body>
	<div id="page-wrapper">
		<div id="content-section">
			<div id="title-section">
				<div class="title">
					<h1>주문기</h1>
				</div>
				<div id="category-section">
					<ul class="categories">
						<li id="category-pizza"><a href="#">피자</a></li>
						<li id="category-side"><a href="#">사이드</a></li>
						<li id="category-drinks"><a href="#">음료</a></li>
					</ul>
				</div>
			</div>
			<!-- 메뉴판 -->
			<div id="menu-section">
				<!-- 메뉴판 아이템 -->
				<div id="menu-item-section">
					<!-- 메뉴 상세 정보 -->
					<div id="left-iteminfo-section">
						<table>
							<tr>
								<!-- 메뉴판 -->
								<td class="menu-item" colspan="2">
									<div class="menu-item-box">
										<img alt="${menuVO.menu_title }"
											src="/images/menu/${menuVO.menu_alias}.jpg"><br>
										<p>${menuVO.menu_title}</p>
										<p>(L)${menuVO.menu_lprice}원</p>
										<p>(R)${menuVO.menu_rprice}원</p>
									</div>
								</td>
							</tr>
							<tr>
								<!-- 메뉴 영양정보 -->
								<td></td>
							</tr>
						</table>
					</div>
					<!-- 메뉴 상세 주문 -->
					<div id="right-order-section">
						 <form action="/order" method="post">
							<table id="order-option-table">
								<tr>
									<td><h2>사이즈</h2></td>
								</tr>
								<tr>
									<td><input type="radio" id="largeSize" class="size" name="order_size" value="large"><label for="largeSize">LARGE</label>
										<input type="radio" id="regularSize" class="size" name="order_size" value="regular" checked="checked"><label for="regularSize">REGULAR</label></td>
								</tr>
								<tr>
									<td><h2>엣지</h2></td>
								</tr>
								<tr>
									<td><input type="radio" id="defaultEdge" class="edge" name="order_edge" value="default" checked="checked"><label for="defaultEdge">기본</label><br> 
									<input type="radio" id="creamEdge" class="edge" name="order_edge" value="cream"><label for="creamEdge">크림치즈링</label><br> 
									<input type="radio" id="goldEdge" class="edge" name="order_edge" value="gold"><label for="goldEdge">고구마골드링</label><br></td>
								</tr>
								<tr>
									<td><h2>토핑 추가</h2></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="cheeseTopping" class="topping" name="order_topping" value="cheese"><label for="cheeseTopping">치즈</label><br> 
									<input type="checkbox" id="onionTopping" class="topping" name="order_topping" value="onion"><label for="onionTopping">양파</label><br> 
									<input type="checkbox" id="pineappleTopping" class="topping" name="order_topping" value="pineapple"><label for="pineappleTopping">파인애플</label><br>
									<input type="checkbox" id="pepperoniTopping" class="topping" name="order_topping" value="pepperoni"><label for="pepperoniTopping">페페로니</label><br> 
									<input type="checkbox" id="vagetableiTopping" class="topping" name="order_topping" value="vagetable"><label for="vagetableiTopping">채소 믹스</label><br></td>
								</tr>
								<tr>
									<td><h2>수량</h2></td>
								</tr>
								<tr>
									<td class="textCenter">
										<input type="button" id="minusBtn" class="counting" value="-" onclick='count("minus")'>
										<input type="text" id="result" class="number" name="order_count" readonly="readonly" value="1">
										<input type="button" id="plusBtn" class="counting" value="+" onclick='count("plus")'>
										</td>
								</tr>
								<tr>
									<td><h2>담기</h2></td>
								</tr>
								<tr>
									<td ><input type="submit" class="textCenter" value="담기"></td>
								</tr>
								<tr>
									<td><input type="hidden" name="menu_id" value="${menuVO.menu_id }">
								</tr>
							</table>
						 </form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function count(type) {
			// 결과를 출력하기 위한
			const result_ = document.getElementById("result");
			
			// 내부에서 사용할 String/Int
			let number = result_.value;
			let number_ = parseInt(number);
			console.log(number_);
			
			if (type == 'minus') {
				if (number_ > 1){
					number_ -= 1;
				}else {
					alert("최소 1판은 주문해주세요.")
				}
			}
			if (type == 'plus') {
				if (number_ < 10){
					number_ += 1;
				}else {
					alert("최대 10판까자 주문 가능합니다.")
				}
			}
			result_.value = number_;
		}
		
	</script>
</body>


</html>