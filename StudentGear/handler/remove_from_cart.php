<?php
session_start();
require_once '../config/db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: " . BASE_URL . "login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Nhận cart_id từ GET (do dùng thẻ <a>)
$cart_id = isset($_GET['cart_id']) ? (int)$_GET['cart_id'] : 0;

if ($cart_id <= 0) {
    $_SESSION['error'] = "Dữ liệu không hợp lệ!";
    header("Location: " . BASE_URL . "pages/cart.php");
    exit;
}

// Kiểm tra xem cart_id có thuộc về user hiện tại không (an toàn)
$sql = "DELETE FROM cart WHERE id = ? AND user_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $cart_id, $user_id);

if ($stmt->execute()) {
    if ($stmt->affected_rows > 0) {
        $_SESSION['success'] = "Đã xóa sản phẩm khỏi giỏ hàng!";
    } else {
        $_SESSION['error'] = "Không tìm thấy sản phẩm trong giỏ hàng!";
    }
} else {
    $_SESSION['error'] = "Có lỗi xảy ra khi xóa sản phẩm!";
}

header("Location: " . BASE_URL . "pages/cart.php");
exit;