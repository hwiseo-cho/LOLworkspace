<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!--${ pageContext.request.contextPath } Bootstrap core CSS -->
  <link href="/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template -->
  <link href="/css/all.min.css" rel="stylesheet">
  <link href="/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template -->
  <link href="/css/landing-page.min.css" rel="stylesheet">
  <script src="/js/jquery.min.js"></script>
</head>
<body>
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="#">LOL</a>
    </div>
  </nav>
</body>
<script>
	$(function(){
		var result = '${result}';
		var text = '${result.summonerMap.USER_NM}' + '<br>'
			 	 + '${result.summonerMap.USER_LEVEL}' + '<br>' 
				 + '<img id="userIcon" src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/${result.summonerMap.USER_ICON}.png" style="width:40px; height:40px;">' + '<br>'
				 + '<img id="userIcon" src="/images/${result.rankMap.leagueList[0].tier}.png" style="width:40px; height:40px;">' + '<br>'
				 + '${result.rankMap.leagueList[0].tier}'
				 + '${result.rankMap.leagueList[0].rank}';
		$("body").html(text);
	})
</script>
</html>