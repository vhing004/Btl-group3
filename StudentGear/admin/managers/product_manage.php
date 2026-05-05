<?php
require_once 'C:/xampp/htdocs/StudentGear/config/db.php';

// Lấy danh sách sản phẩm + tên danh mục
$sql = "SELECT 
            products.*, 
            categories.name AS category_name
        FROM products
        LEFT JOIN categories 
        ON products.category_id = categories.id
        ORDER BY products.id DESC";

$result = $conn->query($sql);

$products = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
}
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background: #f5f5f5;
        }

        h2 {
            margin-bottom: 20px;
        }

        .add-btn {
            display: inline-block;
            padding: 10px 15px;
            background: green;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        table th,
        table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        table th {
            background: #333;
            color: white;
        }

        img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 5px;
        }

        .btn {
            padding: 6px 10px;
            text-decoration: none;
            border-radius: 4px;
            color: white;
            font-size: 14px;
        }

        .btn-warning {
            background: orange;
        }

        .btn-danger {
            background: red;
        }

        .status-active {
            color: green;
            font-weight: bold;
        }

        .status-hide {
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>

    <h2>Quản lý sản phẩm</h2>

    <a href="add_product.php" class="add-btn">+ Thêm sản phẩm</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Danh mục</th>
                <th>Giá</th>
                <th>Kho</th>
                <th>Giảm giá</th>
                <th>Nổi bật</th>
                <th>Mới</th>
                <th>Trạng thái</th>
                <th>Chức năng</th>
            </tr>
        </thead>

        <tbody>

            <?php if (!empty($products)): ?>

                <?php foreach ($products as $product): ?>

                    <tr>

                        <td><?= $product['id'] ?></td>

                        <td>
                            <?php if (!empty($product['image'])): ?>
                                <img src="<?= $product['image'] ?>" alt="">
                            <?php else: ?>
                                No Image
                            <?php endif; ?>
                        </td>

                        <td><?= $product['name'] ?></td>

                        <td><?= $product['category_name'] ?></td>

                        <td>
                            <?= number_format($product['price'], 0, ',', '.') ?> đ
                        </td>

                        <td><?= $product['stock'] ?></td>

                        <td>
                            <?= $product['discount_percent'] ?>%
                        </td>

                        <td>
                            <?= $product['is_featured'] ? 'Yes' : 'No' ?>
                        </td>

                        <td>
                            <?= $product['is_new'] ? 'Yes' : 'No' ?>
                        </td>

                        <td>
                            <?php if ($product['is_active']): ?>
                                <span class="status-active">Hiện</span>
                            <?php else: ?>
                                <span class="status-hide">Ẩn</span>
                            <?php endif; ?>
                        </td>

                        <td>
                            <a href="edit_product.php?id=<?= $product['id'] ?>"
                                class="btn btn-warning">
                                Edit
                            </a>

                            <a href="delete_product.php?id=<?= $product['id'] ?>"
                                class="btn btn-danger"
                                onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?')">
                                Delete
                            </a>
                        </td>

                    </tr>

                <?php endforeach; ?>

            <?php else: ?>

                <tr>
                    <td colspan="11">Không có sản phẩm nào</td>
                </tr>

            <?php endif; ?>

        </tbody>
    </table>

</body>

</html>