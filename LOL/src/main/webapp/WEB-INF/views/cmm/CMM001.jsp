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
      <a class="navbar-brand" href="/">LOL</a>
    </div>
  </nav>
  <div id="loadDiv" style="text-align: center; z-index: 99; position:fixed; width:100%; height:100%; background-color: black; opacity: 0.3; display:none;">
  	<img id="loadingImg" src="/images/loading.gif" style="z-index: 100; position: absolute; top: 38%; left: 50%; margin-top: -25px; margin-left: -25px;">
  </div>
  <div id="content">
  	<div class="row align-items-center my-5">
      <div class="col-lg-7" id="info">
        
      </div>
      <!-- /.col-lg-8 -->
      <div class="col-lg-5">
        <h1 class="font-weight-light">Business Name or Tagline</h1>
        <a class="btn btn-primary" href="#">Call to Action!</a>
      </div>
      <!-- /.col-md-4 -->
    </div>
    <!-- /.row -->

    <!-- Call to Action Well -->
    <div class="card text-white bg-secondary text-center" style="height: 30px;">  
      <div class="card-body">
      </div>
    </div>
  </div>
</body>
<script>
	$(function(){
		$('#loadDiv').show();
		
		var userName = '${userName}';
		$.ajax({
			url:"/cmm/searchUser.do",
			type:"GET",
			data:{userName:userName},
			success:function(result){
				if(result.error != null) {
					alert(result.error);
					$('#loadDiv').hide();	
				}
				var text = 
						 result.summonerMap.USER_LEVEL + '<br>' 
						 + '<img id="userIcon" src="/images/'+result.rankMap.leagueList[0].tier+'.png" style="width:40px; height:40px;">' + '<br>'
						 ;
				$("#info").append('<img class="img-fluid rounded mb-4 mb-lg-0" src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/'+result.summonerMap.USER_ICON+'.png" style="width:100px; height:100px; margin-left: 400px;">');
				$("#info").append('<p style="float: right; font-size: 30px; margin-right: 30%;">'+result.summonerMap.USER_NM+'</p>');
				$("#content").append(text);
				$('#loadDiv').hide();			 
			},
			error:function(){
				$('#loadDiv').hide();	
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