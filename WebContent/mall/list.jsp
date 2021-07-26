<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<%@include file="../top.jsp" %> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록</title>
<!-- <link rel="stylesheet" href="../css/freeboard.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript">
function boldButton(btn){ //1번 버튼 함수
	var target1 = document.getElementById(btn);
	target1.style.fontWeight="bold";
	target1.style.color="black";
	}
function searchCheck(){
	var frm = document.frmSearch;
	var d1 = frm.findT.value;
	if(d1==""){
		alert('검색어를 입력해주세요.!!');
	}else{
		frm.submit();
	}
}
</script>
<style>
@font-face {
    font-family: 'twaysky';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twaysky.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
h1,h2,h3,h4,h5{
	font-family: twaysky;
	margin-right:15px;
}
	body,div{
 	/* border:1px solid red; */
 	box-sizing: border-box;
 	}
 	
	.btn:hover{
	font-weight:bold;
	font-size:large;
	color:black;
	}

	.btn{
	margin:20px;
	text-decoration:none;
	color:gray;
	font-family: twaysky;
	font-size:1.3em;
	}
	body{
	width:100%;
	height:1700px;
	background-image: url("./backImg/mallBack.jpg");
	background-size: cover;
	overflow: scroll;
	}
	.container{
	width:100%;
	height:100%;
	background-color: white;
	opacity: 0.9;
	margin-top:70px;
	}
	#wrap{
	width:70%;
	height:80%;
	margin:10px auto;
	padding-top: 30px;
	}
	#menu{
	width:70%;
	height:50px;
	text-align:center;
	margin:10px auto;
	z-index: 4;
	}
	#itembox{
	width:100%;
	height:100%;
	margin:auto;
	}
	
	.pitem{
	width:375px;
	height:375px;
	float:left;
	text-align:center;
	margin:28px;
	}
	.item_img{
	width:375px;
	height:400px;
	border:3px solid #e1bc9d;
	}
	.item_name{
	width:375px;
	height:55px;
	text-align:center;
	}
	#page{
	width:100%;
	height:10%;
	text-align:center;
	overflow:hidden;
	margin:auto;
	clear:both;
	}
	#searchProduct{
	text-align:right;
	margin:auto;
	}
	.pagenum{
		font-family: twaysky;
		font-size:1.5em;
		color:black;
	}
	</style>
</head>
<body onload="boldButton('${btn}')">

<div class="container">
  	<div id="wrap">
  		<div id="menu">
  		<a class="btn" id="btn5" href="listSelect.GGZ?btn=btn5">전체보기</a>
 		<a class="btn" id="btn1" href="./categorySelect.GGZ?category=toy&btn=btn1">장난감</a>
 		<a class="btn" id="btn2" href="./categorySelect.GGZ?category=clothing&btn=btn2" >의류</a>
 		<a class="btn" id="btn4" href="./categorySelect.GGZ?category=snack&btn=btn4" >과자</a>
 		<c:if test="${member.email=='admin' }">
 		<a class="btn" href="./mallIn.GGZ">상품 추가</a><br><br><br>
 		</c:if>
 		</div>
 		<div class="search">
 		<h5 style="text-align:right;">상품 총 개수 : ${blists.totalCount} </h5>
 		<form id="searchProduct" name="frmSearch" method="post" action="./mSearch.GGZ">
 			<input class="form-controll" type="text" name="findT" value="${findT }" placeholder="상품 이름을 검색해주세요" size="50" style="height:40px;">
 			<button type="button" class="btn btn-default" onclick="searchCheck()">
     		<span class="glyphicon glyphicon-search"></span>검색
    		</button>
 		</form>
 		</div>
 		<div id="itembox">
 				
 				<c:forEach var="vo" items="${blists.m_list}">
 				<div class="pitem">
 					<div class="item_img">
		 			<a href="mallDetailSelect.GGZ?pno=${pno }&mallIdx=${vo.idx}"><img src="/mallImg_path/${vo.img_name }" width="100%" height="100%" ></a><br>
 					</div>
 					<div class="item_name">
 					<h5>${vo.name }</h5>
 					</div>
 				</div>
 				</c:forEach>
 			
 		</div>
 		<div id="page">
 		 <!-- 페이지 이동 -->
 		 	
 		 	<a class="pagenum" href="?pno=1&category=${category}">&lt;&lt;</a>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
			<a class="pagenum" href="?pno=${blists.startPage-1 }&category=${category}">&lt;</a>  
			<!-- 현재페이지값을 변경 : blists.getStartPage() -1 -->
			
			  <!-- 페이지목록의 범위  -->
			  <c:forEach var="i" begin="${blists.startPage }" end="${blists.endPage }">
				<a class="pagenum" href="?pno=${i}&category=${category}">${i}</a>&nbsp;&nbsp;&nbsp;     <!-- 현재페이지 i값으로 변경  -->
			  </c:forEach>
			
			<!-- 현재페이지값을 변경 : blists.getEndPage() +1 -->
			<a class="pagenum" href="?pno=${blists.endPage+1 }&category=${category}">&gt;</a> 
			<a class="pagenum" href="?pno=${blists.totalPage }&category=${category}">&gt;&gt;</a>
			
		</div>
	</div>
	</div>	
</body>
</html>








