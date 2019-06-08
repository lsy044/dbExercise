<?php 
include ("header.php"); 
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수

$conn = dbconnect($host, $dbid, $dbpass, $dbname);

$genres = array();
$query = "select * from genre";
$res = mysqli_query($conn, $query);
while($row = mysqli_fetch_array($res)) {
    $genres[$row['g_id']] = $row['g_type'];
}

?>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://rochestb.github.io/jQuery.YoutubeBackground/src/jquery.youtubebackground.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
    <div id="video" class="background-video"></div>
    <script>
       // $('#video').YTPlayer({
       //     fitToBackground: true,
        //    videoId: 'ZbofJucjkSU'
       // });
    </script>
    <style>
    	body{
    		background-color:black;
    		color:white;
    	}
        .background-video {
            background-position: top center;
            background-repeat: no-repeat;
            bottom: 0;
            left: 0;
            overflow: hidden;
            position: fixed;
            right: 0;
            top: 0;
        }
        .navbar {
            z-index:999;
        }
        h1, p {
            padding: 0px 30px 0px 30px;
            text-align:center;
        }
        h1 {
            font-weight:800;
        }
        .container {
            position: relative;
            
        }
        .ref {
            font-weight:200;
            font-size:0.5em;
        }
    </style>
    <div class='container'>
        <p align="center"><img src="images/banner2.png" width="50%" style="margin-top:10%;"></p>
        
        	<h1>KU플릭스</h1><br/>
              <div class="row" style="margin-left:10%;">
        		<div style="margin-right:30px;width:40%;float:left;">
        			<form action="product_list.php" method="post">
        			<select name="search_keyword" style="color:black;float:left;width:90%;">
                		<option value="-1">장르로 고르기</option>
                    	<?
                        foreach($genres as $g_id => $g_type) {
                                echo "<option value='{$g_id}' >{$g_type}</option>";
                        }
                    	?>
            		</select>
        			<button type="submit" style="width:9%;color:black;float:right;" >GO</button>
            		</form>
				</div>
				
				<div style="width:40%;float:left;">
        			<form action="product_list.php" method="post">	
	        			<input class="form-control" type="text" name="search_keyword" style="border:2px solid white;color:black;float:left;width:90%;" placeholder="출연배우로 검색 ">
	        			<button type="submit" style="width:9%;color:black;margin-left:4px;" >GO</button>
        			</form>
        		</div>
        	</div><br/>
        	<p>영화에 대한 간단한 정보와 사람들이 남긴 감상평을 볼 수 있고 참여할 수 있는 사이트입니다. <br/>
        	<b>둘러보세요!</b></p>
       
    </div>
<?php include ("footer.php"); ?>