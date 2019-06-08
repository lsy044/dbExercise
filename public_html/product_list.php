<?
include "header.php";
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수
?>
<div class="container">
    <?
    $conn = dbconnect($host, $dbid, $dbpass, $dbname);
    $query = "select * from movie natural left outer join genre";
    if (array_key_exists("search_keyword", $_POST)) {  
    	$search_keyword= $_POST["search_keyword"];
        $query =  "select * from movie natural left outer join genre natural left outer join acts_in natural left outer join actors where m_title like '%$search_keyword%' or a_name like '%$search_keyword' or g_id like'%$search_keyword%' group by m_id";
    }
    
    $res = mysqli_query($conn, $query);
    if (!$res) {
         die('Query Error : ' . mysqli_error());
    }
    ?>

    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>No.</th>
            <th>영화</th>
            <th>대표 장르</th>
            <th>개봉 연도</th>
            <th>국가</th>
        </tr>
        </thead>
        <tbody>
        <?
        $row_index = 1;
        while ($row = mysqli_fetch_array($res)) {
            echo "<tr>";
            echo "<td>{$row_index}</td>";
            if (!$row['image']){
             echo "<td><a href='product_view.php?product_id={$row['m_id']}'><img src ='images/movie.png' width='90' height='100'/></a>";
            } else {
            echo "<td><a href='product_view.php?product_id={$row['m_id']}'><img src ='./images/{$row['image']}' width='90' height='100'/></a>";
            }
            echo "<a href='product_view.php?product_id={$row['m_id']}'><p>{$row['m_title']}</p></a></td>";
            echo "<td>{$row['g_type']}</td>";
        	echo "<td>{$row['year']}</td>";
            echo "<td>{$row['country']}</td>";
            echo "</tr>";
            $row_index++;
        }
        ?>
        	<tr><td colspan='5' style='text-align:center;'><a href = 'product_form.php'>영화를 등록해 보는 건 어때요?</td></tr>
        </tbody>
    </table>

</div>
<? include("footer.php") ?>
