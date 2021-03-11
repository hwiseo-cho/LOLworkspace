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
  <div id="content">
  	<div class="row align-items-center my-5">
      <div class="col-lg-7" id="info">
        
      </div>
      <!-- /.col-lg-8 -->
      <div class="col-lg-5">
        <h1 class="font-weight-light">Business Name or Tagline</h1>
        <p>This is a template that is great for small businesses. It doesn't have too much fancy flare to it, but it makes a great use of the standard Bootstrap core components. Feel free to use this template for any project you want!</p>
        <a class="btn btn-primary" href="#">Call to Action!</a>
      </div>
      <!-- /.col-md-4 -->
    </div>
    <!-- /.row -->

    <!-- Call to Action Well -->
    <div class="card text-white bg-secondary my-5 py-4 text-center">
      <div class="card-body">
        <p class="text-white m-0">This call to action card is a great place to showcase some important information or display a clever tagline!</p>
      </div>
    </div>
  </div>
  <div id="loadDiv" style="text-align: center; margin-top: 18%">
  	<img id="loadingImg" src="/images/loading.gif" style="display:none;">
  </div>
</body>
<script>
	$(function(){
		$('#loadingImg').show();
		
		var userName = '${userName}';
		$.ajax({
			url:"/cmm/searchUser.do",
			type:"GET",
			data:{userName:userName},
			success:function(result){
				var text = result.summonerMap.USER_NM+'<br>'
						 + result.summonerMap.USER_LEVEL + '<br>' 
						 + '<img id="userIcon" src="/images/'+result.rankMap.leagueList[0].tier+'.png" style="width:40px; height:40px;">' + '<br>'
						 ;
				$("#info").append('<img class="img-fluid rounded mb-4 mb-lg-0" src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/'+result.summonerMap.USER_ICON+'" style="width:100px; height:100px;">');
			$("#content").append(text);
			$('#loadingImg').hide();			 
			}
		});
		
		
		
		/* var matches = '${result.matchMap.matchList.matches}';
		var text = '${result.summonerMap.USER_NM}' + '<br>'
			 	 + '${result.summonerMap.USER_LEVEL}' + '<br>' 
				 + '<img id="userIcon" src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/${result.summonerMap.USER_ICON}.png" style="width:40px; height:40px;">' + '<br>'
				 + '<img id="userIcon" src="/images/${result.rankMap.leagueList[0].tier}.png" style="width:40px; height:40px;">' + '<br>'
				 + '${result.rankMap.leagueList[0].tier}'
				 + '${result.rankMap.leagueList[0].rank}'
				 for(var i=0; i<matches.length; i++) {
					 + matches[i] +'<br>'
				 }
				 ; */
		
	})
</script>
</html>