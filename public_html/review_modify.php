<?php
	include "config.php";    //데이터베이스 연결 설정파일
	include "util.php";      //유틸 함수

	$conn = dbconnect($host,$dbid,$dbpass,$dbname);

	$m_id = $_POST['m_id'];
	$r_id = $_POST['r_id'];
	$r_password = $_POST['r_password'];
	$content = $_POST['content'];
	$score = $_POST['score'];
	$pw = md5($r_password);
	
	mysqli_query($conn, "set autocommit = 0");	// autocommit 해제
	mysqli_query($conn, "set transation isolation level serializable");	// isolation level 설정
	mysqli_query($conn, "begin");	// begins a transation
	
	//pw validation
	$sql = "select * from review where r_id = '$r_id';";
	$res = mysqli_query($conn, $sql);
	$saved_pw =  mysqli_fetch_array($res);
	
	if (substr($pw, 0, 10) == $saved_pw['r_password']) { //비밀번호 일치
		$ret = mysqli_query($conn, "update review set content = '$content', score = '$score' where r_id = '$r_id';");
	
		if(!$ret){ // review 수정 query 수행 fail 
			mysqli_query($conn, "rollback"); //rollback transaction
			msg('Query Error : '.mysqli_error($conn));
		} 
		else {	 // review 수정 query수행 성공
    		mysqli_query($conn, "commit");  //commit transaction
			s_msg ('성공적으로 수정 되었습니다'); 
    		echo "<meta http-equiv='refresh' content='0;url=product_view.php?product_id=$m_id'>";
		}
		
	} else { //비밀번호 불일치
		s_msg ('비밀번호가 일치하지 않습니다ㅠㅠ');
		echo "<meta http-equiv='refresh' content='0;url=product_view.php?product_id=$m_id'>";
	}
	
	

?>