<?
$mode = "남기기";
$action="review_insert.php";

if (array_key_exists("review_id", $_GET)) {
    $review_id = $_GET["review_id"];
    $product_id = $_GET["product_id"];
    $query =  "select * from review where r_id = $review_id";
    $res = mysqli_query($conn, $query);
    $review = mysqli_fetch_array($res);

    if(!$review) {
        msg("리뷰가 존재하지 않습니다.");
    }
    $mode = "수정";
    $action = "review_modify.php";
}

//for pw validation

?>

<form action="<?=$action?>" method="post">
	<input type="hidden" name="m_id" value="<?=$product_id?>"/>
	<input type="hidden" name="r_id" value="<?=$review['r_id']?>"/>
	<h4>한줄평 <?=$mode?></h4><br/>
	<table>
		<tbody>
			<tr>
				<th scope="row">
				<label for="r_password">비밀번호</label></th>
				<td><input type="password" id="r_password" name="r_password" placeholder = "수정시 비밀번호 필요"><i>&nbsp;6~10자리</i></td> 
			</tr>
			<tr>
				<th scope="row"><label for="content">간단 한줄평</label></th>
				<td><textarea name="content" id = "content" placeholder = "삭제가 불가능하니 신중하게 입력해주세요!"><?=$review['content']?></textarea></td>
			</tr>
			<tr>
				<th scope="row"><label for="score">5점만점에?</label></th>
				<td><input type="number" id="score" name="score" value ="<?=$review['score']?>"></td>
			</tr>
		</tbody>
	</table>

	<div class="btnSet">
		<input type="submit" value="<?=$mode?>"onclick="javascript:return validate();">
	</div>

</form>

<script>
 var score = document.getElementById("score");
 var pw =  document.getElementById("r_password");
 var content =document.getElementById("content");

  function validate() {
        if(score.value > 5 || score.value<0) {
           	alert ("평점은 0~5점에서 매겨주세용"); return false;
        } else if ( pw.value == "" ){
        	alert("비밀번호를 입력해주세요! ");return false;
        } else if ( pw.value.length <6 || pw.value.length >10 ){
        	alert("비밀번호는 6~10자리로 입력해주세요!");return false;
        } else if (content.value == ""){
        	alert("한줄평을 입력해주세요! ");return false;
        }else if (score.value == ""){
        	alert("평점을 입력해주세요! ");return false;
        }
        return true;
    }
</script>