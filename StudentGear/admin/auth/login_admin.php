<?php
// 1. Khởi động session và kết nối DB
session_start();
require_once '../config/db.php';

// Nếu đã đăng nhập Admin rồi thì chuyển thẳng vào trang quản trị
if (isset($_SESSION['admin_id'])) {
    header("Location: ../dashboard.php");
    exit();
}

$error = "";

// 2. Xử lý khi nhấn nút Đăng nhập
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['login_submit'])) {

    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    if (empty($username) || empty($password)) {
        $error = "Vui lòng nhập đầy đủ thông tin!";
    } else {
        // Truy vấn dựa trên bảng admin_users
        $stmt = $conn->prepare("SELECT id, username, password, fullname, role, is_active FROM admin_users WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $admin = $result->fetch_assoc();

            // Kiểm tra trạng thái hoạt động (is_active)
            if ($admin['is_active'] == 0) {
                $error = "Tài khoản quản trị này đang bị tạm khóa!";
            } else {
                // Kiểm tra mật khẩu
                if ($password == $admin['password']) {
                    // if (password_verify($password, $admin['password']) || $password == $admin['password']) {

                    // Cập nhật thời gian đăng nhập cuối (last_login)
                    $update_login = $conn->prepare("UPDATE admin_users SET last_login = CURRENT_TIMESTAMP WHERE id = ?");
                    $update_login->bind_param("i", $admin['id']);
                    $update_login->execute();

                    // Lưu Session cho Admin
                    $_SESSION['admin_id'] = $admin['id'];
                    $_SESSION['admin_username'] = $admin['username'];
                    $_SESSION['admin_fullname'] = $admin['fullname'];
                    // $_SESSION['admin_role'] = $admin['role']; // Lưu role để phân quyền staff/admin

                    header("Location: ../dashboard.php");
                    exit();
                } else {
                    $error = "Mật khẩu quản trị không chính xác!";
                }
            }
        } else {
            $error = "Tài khoản quản trị không tồn tại!";
        }
        $stmt->close();
    }
}
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - StudentGear</title>
    <!-- Có thể link tới file CSS riêng của Admin -->
    <style>
        :root {
            --primary-color: #2c3e50;
            /* Màu chuyên nghiệp hơn cho Admin */
            --accent-color: #3498db;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #ecf0f1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .auth-container {
            width: 100%;
            max-width: 400px;
        }

        .auth-form {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .auth-form__heading {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .auth-form__group {
            margin-bottom: 20px;
        }

        .auth-form__input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border 0.3s;
        }

        .auth-form__input:focus {
            border-color: var(--accent-color);
            outline: none;
        }

        .auth-form__error {
            color: #e74c3c;
            background: #fdeaea;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 14px;
            border-left: 4px solid #e74c3c;
        }

        .btn--primary {
            width: 100%;
            padding: 12px;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            transition: background 0.3s;
        }

        .btn--primary:hover {
            background: #1a252f;
        }

        .footer-text {
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
            color: #7f8c8d;
        }
    </style>
</head>

<body>

    <div class="auth-container">
        <div class="auth-form">
            <h2 class="auth-form__heading">Hệ thống Admin</h2>

            <?php if (!empty($error)): ?>
                <div class="auth-form__error"><?php echo $error; ?></div>
            <?php endif; ?>

            <form action="" method="POST">
                <div class="auth-form__group">
                    <label style="font-size: 14px; color: #666;">Tên đăng nhập</label>
                    <input type="text" name="username" class="auth-form__input" placeholder="admin_username" value="<?php echo isset($username) ? htmlspecialchars($username) : ''; ?>" required>
                </div>
                <div class="auth-form__group">
                    <label style="font-size: 14px; color: #666;">Mật khẩu</label>
                    <input type="password" name="password" class="auth-form__input" placeholder="" required>
                </div>

                <button type="submit" name="login_submit" class="btn--primary">ĐĂNG NHẬP HỆ THỐNG</button>
            </form>

            <p class="footer-text">© 2026 StudentGear Management System</p>
        </div>
    </div>

</body>

</html>