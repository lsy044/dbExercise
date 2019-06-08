<?php

	include "config.php";    //데이터베이스 연결 설정파일
	include "util.php";      //유틸 함수
	$conn = dbconnect($host,$dbid,$dbpass,$dbname);

	$m_id = $_POST['m_id'];
	$r_password = $_POST['r_password'];
	$content = $_POST['content'];
	$score = $_POST['score'];
	
	mysqli_query($conn, "set autocommit = 0");	// autocommit 해제
	mysqli_query($conn, "set transation isolation level serializable");	// isolation level 설정
	mysqli_query($conn, "begin");	// begins a transation

	$sql = "insert into review (m_id,r_password,content,score) values('$m_id', md5('$r_password'),'$content','$score')";
	$ret = mysqli_query($conn, $sql);

	if(!$ret) //review 등록 fail
	{
		mysqli_query($conn, "rollback"); //rollback transaction
		msg('Query Error : '.mysqli_error($conn));
	}
	else //review 등록 success
	{
    	mysqli_query($conn, "commit"); //commit
    	s_msg ('댓글이 정상적으로 입력되었습니다');
    	echo "<meta http-equiv='refresh' content='0;url=product_view.php?product_id=$m_id'>";
	}
?>

