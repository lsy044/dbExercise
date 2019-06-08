<?
include "header.php";
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수

$conn = dbconnect($host, $dbid, $dbpass, $dbname);

if (array_key_exists("actor_id", $_GET)) {
    $a_id = $_GET["actor_id"];
    $query = "select * from actors where a_id = $a_id";
    $res = mysqli_query($conn, $query);
    $actor= mysqli_fetch_array($res);
   
   // get recorded movies per actor
    $movies = array();  
    $query2= "select * from acts_in natural left outer join movie where a_id = $a_id";
    $res2 = mysqli_query($conn, $query2);
    while ($row= mysqli_fetch_array($res2)){
    	$movies[$row['m_id']] = $row['m_title'];
    }

    if (!$res) {
    	msg("배우가 존재하지 않습니다.");
    }

}

?>
    <div class="container fullwidth">
	  <div class = "actor_info" style="margin:30px 0px;">
        <h3>배우</h3>

        <p>
            <label for="m_title">배우</label><br/>
            <input readonly type="text" id="a_name" value="<?= $actor['a_name'] ?>"/>
        </p>

        <p>
            <label for="genre">출연작</label>
              <?
            	if($movies != null){
            		foreach($movies as $movie) {
                        echo "<input readonly type='text' id ='movies' value='{$movie}'/><br/>";
                	}
            	}else{
            		 echo "<input readonly type='text' id ='movies' value='아직 등록된 영화가 없습니다.'/><br/>";
            	}
            ?>
        </p>
        
	 </div>
    </div>

<? include("footer.php") ?>