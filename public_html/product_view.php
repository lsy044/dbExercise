<?
include "header.php";
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수

$conn = dbconnect($host, $dbid, $dbpass, $dbname);

if (array_key_exists("product_id", $_GET)) {
    $product_id = $_GET["product_id"];
    $query = "select * from movie natural left outer join genre where m_id = $product_id";
    $res = mysqli_query($conn, $query);
    $movie= mysqli_fetch_array($res);
       
    //actors acted in
    $actors = array();
    $query2 = "select * from movie natural left outer join acts_in natural left outer join actors where m_id = $product_id";
    $res2 = mysqli_query($conn, $query2);
	while($row = mysqli_fetch_array($res2)) {
    	$actors[$row['a_id']] = $row['a_name'];
	}
    
 
    if (!$res) {
    	msg("영화가 존재하지 않습니다.");
    }
}

?>
    <div class="container fullwidth">
	  <div class = "movie_info" style="margin:30px 0px;">
        <h3>영화 정보 상세 보기</h3>

        <p>
            <label for="m_title">영화</label><br/>
            <?
            if (!$movie['image']){
            	echo "<img src ='images/movie.png' width='180' height='250'/></a>";
            } else {
            	echo "<img src ='./images/{$movie['image']}' width='180' height='250'/></a>";
            }
            ?>
            <input readonly type="text" id="m_title" value="<?= $movie['m_title'] ?>"/>
        </p>

        <p>
            <label for="genre">대표 장르</label>
            <input readonly type="text" id="g_type" value="<?= $movie['g_type'] ?>"/>
        </p>
        
        <p>
            <label for="year">개봉 연도</label>
            <input readonly type="text" id="year" value="<?= $movie['year'] ?>"/>
        </p>

        <p>
            <label for="country">국가</label>
            <input readonly type="text" id="country" value="<?= $movie['country'] ?>"/>
        </p>
        
        <p>
            <label for="country">배우</label>
             <?
                foreach($actors as $actor) {
                        echo "<label><input type='text'value='{$actor}'/></label><br/>";
                }
            ?>
        </p>
        
        <p>
            <a href='product_form.php?product_id=<?=$movie['m_id']?>'><button class='button danger small'>틀린 정보나 추가할 정보가 있으면 수정해주세요!</button></a>
            <button onclick='javascript:deleteConfirm(<?=$movie['m_id']?>)' class='button primprary small'>삭제</button>
        </p>

       
	  </div>
    </div>

	<hr>
	<div class="container">
		<? include("review_list.php")?>

		<hr>
		<? include("review_form.php")?>
	</div>
	<script>
        function deleteConfirm(product_id) {
            if (confirm("정말 삭제하시겠습니까?") == true){    //확인
                window.location = "product_delete.php?product_id=" + product_id;
            }else{   //취소
                return;
            }
        }
    </script>
<? include("footer.php") ?>