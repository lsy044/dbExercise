<?
include "header.php";
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수

$conn = dbconnect($host, $dbid, $dbpass, $dbname);
$mode = "입력";
$action = "product_insert.php";

if (array_key_exists("product_id", $_GET)) {
    $product_id = $_GET["product_id"];
    $query =  "select * from movie where m_id = $product_id";
    $res = mysqli_query($conn, $query);
    $movie = mysqli_fetch_array($res);
	
	$m_actors = array(); //actors acted in movie checked when modify
    $res3 = mysqli_query($conn, "select a_id from movie natural left outer join acts_in where m_id = $product_id");
    while($row = mysqli_fetch_array($res3)) {
    	$m_actors[$row['a_id']] = $row['a_id'];
	}
	
    if(!$movie) {
        msg("영화가 존재하지 않습니다.");
    }
    $mode = "수정";
    $action = "product_modify.php";
}

$genres = array();
$query = "select * from genre";
$res = mysqli_query($conn, $query);
while($row = mysqli_fetch_array($res)) {
    $genres[$row['g_id']] = $row['g_type'];
}

//all actors
$actor = array();
$query2 = "select * from actors order by a_name asc";
$res2 = mysqli_query($conn, $query2);
while($row2 = mysqli_fetch_array($res2)) {
    $actor[$row2['a_id']] = $row2['a_name'];
}
?>

    <div class="container">
        <form enctype="multipart/form-data" name="product_form" action="<?=$action?>" method="post" class="fullwidth">
            <input type="hidden" id="m_id" name="m_id" value="<?=$movie['m_id']?>"/>
            <h3>영화 정보 <?=$mode?></h3>
        	<p>
            	<label for="m_title">영화 제목</label>
                <? if ($mode == "수정"){
                		echo "<input readonly type='text' id='m_title' name='m_title' value='{$movie['m_title']}'/>";
                	}else{
                		echo" <input type='text' placeholder = '제목은 이후 수정이 불가능하니 정확히 입력해주세요' id='m_title' name='m_title'/>";
                	}
                ?>
        	</p>
        	
        	<p>
            	<label for="g_id">대표 장르</label>
            	<select name="g_id" id="g_id">
                	<option value="-1">선택해 주십시오.</option>
                    <?
                        foreach($genres as $g_id => $g_type) {
                            if($g_id == $movie['g_id']){
                                echo "<option value='{$g_id}'selected>{$g_type}</option>";
                            } else {
                                echo "<option value='{$g_id}'>{$g_type}</option>";
                            }
                        }
                    ?>
            	</select>
        	</p>
        	<p>
               <label for="year">개봉 연도</label>
               <input type="number" placeholder="YYYY" name="year" value="<?=$movie['year']?>"/>
        	</p>
        	
        	<p>
               <label for="country">개봉 국가</label>
               <input type="text" placeholder="ex.한국" name="country" value="<?=$movie['country']?>" />
        	</p>

        	<p>
            	<label for="a_name">출연 배우</label>
            	<div class="scroll">
            	    <?
                        foreach($actor as $a_id => $a_name) {
                            if(in_array($a_id, $m_actors)){
                                echo "<label><input type='checkbox' name='a_id[]' value='{$a_id}'checked> {$a_name}</label><br/>";
                            } else {
                                echo "<label><input type='checkbox' name='a_id[]' value='{$a_id}'> {$a_name}</label><br/>";
                            }
                        }
                    ?>
                 </div>
                 <div class="input_fields">
    				<button class="add_field">배우 추가</button>
				</div>
        	</p>
           
            <!--<p>-->
            <!--    <label for="explain">한줄 설명</label>-->
            <!--   <input type="text" placeholder="ex.한국" name="explain" value="<?=$movie['explain']?>" />-->
            <!--</p>-->
           	
           	<p>
        		<label for="country">포스터</label>
        		<? if ($movie['image']){
        			$img=$movie['image'];
        			echo "<img src ='./images/$img' id = 'poster_img' width='90' height='150' />";
        		}?>
        		<input type="hidden" name="MAX_FILE_SIZE" value="134217728"/>
            	<input type="file" id = "poster_img" name="poster_img" /></td></tr>
        	</p>
        	
    		<p align="center"><button class="button primary large" onclick="javascript:return validate();"><?=$mode?></button></p>

            
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=" crossorigin="anonymous"></script>
			<script>
				$(document).ready(function() {
					var max_fields      = 10; //maximum input boxes
					var x = 1; 
					$(".add_field").click(function(e){ //add
						e.preventDefault();
						if(x < max_fields){ 
							x++; 
							$(".input_fields").append('<div><input type="text" name="a_name[]"/><a href="#" class="remove_field">Remove</a></div>'); //add input box
						}
					});
	
					$(".input_fields").on("click",".remove_field", function(e){ //remove
						e.preventDefault(); 
						$(this).parent('div').remove(); 
						x--;
					})
				});
			
           
                function validate() {
                    if(document.getElementById("m_title").value == "") {
                        alert ("영화제목을 입력해주세요"); return false;
                    }
                    else if(document.getElementById("g_id").value == "-1") {
                        alert ("장르를 등록해주세요"); return false;
                    } 
                    // else if(document.getElementById("poster_img").value == "") {
                    //     alert ("포스터사진을 등록해주세요"); return false;
                    // }
                    return true;
                }

            </script>

        </form>
    </div>
    
    <style>
    	.scroll { border:2px solid #ccc; width:300px; height: 100px; overflow-y: scroll; }
    </style>
    
<? include("footer.php") ?>