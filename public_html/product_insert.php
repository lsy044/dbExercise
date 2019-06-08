<?php
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수

$conn = dbconnect($host,$dbid,$dbpass,$dbname);

$m_title = $_POST['m_title'];
$year = $_POST['year'];
$g_id = $_POST['g_id'];
$country = $_POST['country'];
$explain= $_POST['explain'];
$pathimg = "/home/db2019/2017160339/public_html/images/";
$poster_img= $pathimg.basename($_FILES['poster_img']['name']);
$poster_imgname = basename($_FILES['poster_img']['name']);

$a_ids= $_POST['a_id'];
$a_names= $_POST['a_name'];
$success = true;  //query수행 성공여부 detect하는 변수선언

mysqli_query($conn, "set autocommit = 0");	// autocommit 해제
mysqli_query($conn, "set transation isolation level serializable");	// isolation level 설정
mysqli_query($conn, "begin");	// begins a transation

//편의상 rollBack 함수 정의 
function rollBack() {
	$success = false; //detect failure
	mysqli_query($conn, "rollback"); //rollback transaction
	msg('Query Error : '.mysqli_error($conn));
}

//1. insert movie
if (move_uploaded_file($_FILES['poster_img']['tmp_name'], $poster_img)){
	$sql = "insert into movie (m_title, year, g_id, country, image) values ('$m_title', '$year', '$g_id', '$country','$poster_imgname');";
}else{
	$sql = "insert into movie (m_title, year, g_id, country) values ('$m_title', '$year', '$g_id', '$country');";
}
$ret = mysqli_query($conn, $sql);
$m_id = mysqli_insert_id($conn); 

if (!$ret) {	// movie 등록 fail 
	rollBack(); // detect failure & rollback
}


//2. insert multiple existing actors (if checkbox checked) 
$e_num = sizeof($a_ids); 
for($i=0;$i<$e_num;) {
    $a_id = $a_ids[$i];
    $sql2= "insert into acts_in (mm_id, a_id) values('$m_id','$a_id') ";
	$ret2 = mysqli_query($conn, $sql2);
	if ($ret2) {  //각 query 수행 성공시 loop진행
		$i++; 
	}else{ // query수행 fail 
		rollBack();
		break;
	}
}


//3. insert multiple new actors (if input field filled) 
$n_num = sizeof($a_names);
for($t=0;$t<$n_num;) {
    $a_name = $a_names[$t];
    $sql3= "insert into actors (a_name) values ('$a_name');";
    $ret3 = mysqli_query($conn, $sql3);
	$sql4= "insert into acts_in (m_id, a_id) values('$m_id',last_insert_id());";
	$ret4 = mysqli_query($conn, $sql4);
	if ($ret3 && $ret4){
		$t++;
	} else{
		rollBack();
		break;
	}	
}

//if (mysqli_errno($conn) || $t != $n_num) {
// 	$success = false;
// 	mysqli_query($conn, "rollback");	
// 	msg('Query Error : '.mysqli_error($conn));
// }


if ($success==true){ // 모든 query 수행 성공. 수행 내역 commit
	mysqli_query($conn, "commit"); 
	s_msg ('성공적으로 입력 되었습니다');
	echo "<meta http-equiv='refresh' content='0;url=product_view.php?product_id=$m_id'>";
} else{
	rollBack();
}	
	

?>


