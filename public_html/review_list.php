<?
//get reviews
$sql = "select * from movie natural join review where m_id = $product_id";
$rs = mysqli_query($conn, $sql);

?>
<div class= "reviews" style ="margin:30px 0px 30px;">
		<h4>한줄평</h4>
        <?
        $row_index = 1;
        while ($row = mysqli_fetch_array($rs)) {
        	$row['avg_score']=$avg;
        	echo "<input type='hidden' name='r_id' value='{$row['r_id']}'/>";
            echo "<p><b>No.{$row_index}</b><br/>{$row['content']} 평점: {$row['score']}점</p>";
            echo "<p>
                <a href='product_view.php?product_id={$row['m_id']}&review_id={$row['r_id']}'><button data-toggle='modal'data-target='#Vmodal' class='button primprary small'>수정</button></a>
                </p>";
            $row_index++;
        }
        ?>
	</div>
	<script>
        function deleteConfirm(review_id) {
            if (confirm("정말 삭제하시겠습니까?") == true){    //확인
                window.location = "review_delete.php?review_id=" + review_id;
            }else{   //취소
                return;
            }
        }
    </script>