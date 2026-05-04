<?php
session_start();
require_once '../config/db.php';

// 2. KIỂM TRA QUYỀN TRUY CẬP (Access Control)
// Nếu không phải admin/staff đã đăng nhập, đá về trang login
if (!isset($_SESSION['admin_id'])) {
    header("Location: login_admin.php");
    exit();
}

// Lấy thông tin admin từ session
$admin_name = $_SESSION['admin_fullname'];
$admin_role = $_SESSION['admin_role'];
?>
<input type="button" value="Logout" onclick="window.location.href='logout.php'">