<!DOCTYPE html>
<html lang='ko'>
<head>
    <title>쿠플릭스</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<form action="product_list.php" method="post">
    <div class='navbar fixed'>
        <div class='container'>
            <a class='pull-left title' href="index.php">KU플릭스</a>
            <ul class='pull-right'>
                <li>
                    <input type="text" name="search_keyword" placeholder="통합검색">
                </li>
                <li><a href='product_list.php'>영화 목록</a></li>
                <li><a href='product_form.php'>영화 등록</a></li>
                <li><a href='actors_list.php'>배우 목록</a></li>
            </ul>
        </div>
    </div>
</form>