<?php
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수

$conn = dbconnect($host,$dbid,$dbpass,$dbname);

$product_id = $_POST['m_id'];
$year = $_POST['year'];
$g_id= $_POST['g_id'];
$country = $_POST['country'];
$pathimg = "/home/db2019/2017160339/public_html/images/";
$poster_img= $pathimg.basename($_FILES['poster_img']['name']);
$poster_imgname = basename($_FILES['poster_img']['name']);

$a_ids= $_POST['a_id'];
$a_names= $_POST['a_name'];
$success = true;  //query수행 성공여부 detect하는 변수선언

mysqli_query($conn, "set autocommit = 0");	// autocommit 해제
mysqli_query($conn, "set transation isolation level serializable");	// isolation level 설정
mysqli_query($conn, "begin");	// begins a transation

// rollBack 함수 정의 
function rollBack() {
	$success = false; //detect failure
	mysqli_query($conn, "rollback"); //rollback transaction
	msg('Query Error : '.mysqli_error($conn));
}

//1. update movie info
if (move_uploaded_file($_FILES['poster_img']['tmp_name'], $poster_img)){
	$ret = mysqli_query($conn, "UPDATE movie SET g_id =$g_id, year = $year, country = '$country', image='$poster_imgname' where m_id = $product_id;");
}else{
	$ret = mysqli_query($conn, "UPDATE movie SET g_id =$g_id, year = $year, country = '$country' where m_id = $product_id;");
}

if (!$ret) {	// movie 수정 fail 
	rollBack(); // detect failure & rollback
}


//get 해당 영화에 출연한 a_id array 
$actors = array();
$res = mysqli_query($conn, "select * from movie natural join acts_in where m_id = $product_id"); 
while($row = mysqli_fetch_array($res)) {  
    $actors[$row['a_id']] = $row['a_id'];
}

//2. delete acts_in (unchecked newly)
foreach($actors as $prev) { 
    if(!in_array($prev, $a_ids)){ //(a_id가 updated params에 없을경우 삭제)
    	$ret2 = mysqli_query($conn, "delete from acts_in where a_id = '$prev';");
        if (!$ret2) {	// acts_in 삭제 fail 
			rollBack();
			break;
		}
    }
}
	
//3. insert acts_in (checked newly)
foreach($a_ids as $new) {
	if(!in_array($new, $actors)){ //(새로운 a_id가 기존 acts_in array에 있을 경우 추가)
		$ret3 = mysqli_query($conn, "insert into acts_in (m_id, a_id) values('$product_id','$new');");
	     if (!$ret3) {	// acts_in 등록 fail 
			rollBack();
			break;
		}
	} 
}	

//4. add new actors & acts_in
$n_num = sizeof($a_names); 
if ($n_num > 0) {
	for($i=0;$i<$n_num;$i++) {
    	$a_name = $a_names[$i];
    	$ret4 = mysqli_query($conn, "insert into actors (a_name) values ('$a_name');");
		$ret5 = mysqli_query($conn, "insert into acts_in (m_id, a_id) values('$product_id',last_insert_id());");
		if (!$ret4 || !$ret5) { //새로운 actor 등록 fail or 해당 acts_in 등록 fail
			rollBack();
		}
	}
}

if ($success==true) {	
	mysqli_query($conn, "commit");  // 모든 query 수행 성공. 수행 내역 commit
	s_msg ('성공적으로 입력 되었습니다');
	echo "<meta http-equiv='refresh' content='0;url=product_view.php?product_id=$product_id'>";
} 
// if ($success==false){  //하나의 failure라도 있었을 경우 rollback
// 	mysqli_query($conn, "rollback");
// 	msg('Query Error : '.mysqli_error($conn));	

?>

