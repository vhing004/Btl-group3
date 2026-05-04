<?php
session_start();
require_once '../config/db.php';

// Xóa tất cả các biến session
$_SESSION = array();

if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(
        session_name(),
        '',
        time() - 42000,
        $params["path"],
        $params["domain"],
        $params["secure"],
        $params["httponly"]
    );
}

// 3. Hủy bỏ session
session_destroy();

// 4. Chuyển hướng về trang chủ
header("Location: " . BASE_URL . "index.php");
exit();
