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
  <style type="text/css">
  	div{border:1px solid black;}
  	
  	#info{
  		height:130px;
  	}
  	
  	#info>div{
  		height:100%;
  		float: left;
  	}
  	
  	#userIcon{width:50%;}
  	#userInfo{width:50%;}
  	#userName{font-size: 30px;}
  	#userLevel{font-size: 15px;}
  	
  </style>
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
      	<div id="userIcon">
      	  <img alt="" src="#" style="height:100%; width:130px;">
      	</div>
      	<div id="userInfo">
      	  <div id="userName">sfd</div>	
      	  <div id="userLevel">sfd</div>	
      	  <div id="tier">sfd</div>	
      	  <div id="rate">sfd</div>	
      	</div>
      </div>
      <!-- /.col-lg-8 -->
      <div class="col-lg-5">
        <h1 class="font-weight-light"></h1>
        <a class="btn btn-primary" href="#"></a>
      </div>
      <!-- /.col-md-4 -->
    </div>
    <!-- /.row -->

    <!-- Call to Action Well -->
    <div class="card text-white bg-secondary text-center" style="height: 30px; border:1px solid black;">    
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
						 + '<br>' 
						 + '<img id="userIcon" src="/images/'+result.rankMap.leagueList[0].tier+'.png" style="width:40px; height:40px; float: right; margin-right: 30px;">' + '<br>'
						 ;
				$("#userIcon").append('<img class="img-fluid rounded mb-4 mb-lg-0" src="http://ddragon.leagueoflegends.com/cdn/9.24.2/img/profileicon/'+result.summonerMap.USER_ICON+'.png" style="height:100%; width:130px;">');
				$("#userName").text(result.summonerMap.USER_NM);
				$("#userLevel").text(result.summonerMap.USER_LEVEL);
				
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