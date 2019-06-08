<?php
include "config.php";    //데이터베이스 연결 설정파일
include "util.php";      //유틸 함수

$conn = dbconnect($host,$dbid,$dbpass,$dbname);

$product_id = $_GET['product_id'];

mysqli_query($conn, "set autocommit = 0");	// autocommit 해제
mysqli_query($conn, "set transation isolation level serializable");	// isolation level 설정
mysqli_query($conn, "begin");	// begins a transation


$ret = mysqli_query($conn, "delete from review where m_id = $product_id");
if (!$ret) {
	mysqli_query($conn, "rollback"); // review 삭제 fail. rollback
	msg('Query Error : '.mysqli_error($conn));
}

$ret2 = mysqli_query($conn, "delete from acts_in where m_id = $product_id");
if (!$ret) {
	mysqli_query($conn, "rollback"); // acts_in 삭제 fail. rollback
	msg('Query Error : '.mysqli_error($conn));
}

$ret3 = mysqli_query($conn, "delete from movie where m_id = $product_id");
if (!$ret3) {
	mysqli_query($conn, "rollback"); // movie 삭제 fail. rollback
	msg('Query Error : '.mysqli_error($conn));
} 
else {
	mysqli_query($conn, "commit"); // movie 삭제 success. commit 
	s_msg ('성공적으로 삭제 되었습니다');
	echo "<meta http-equiv='refresh' content='0;url=product_list.php'>";
}

?>

