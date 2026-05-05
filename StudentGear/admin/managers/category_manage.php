<?php
require_once 'C:/xampp/htdocs/định hướng/Btl-group3/StudentGear/config/db.php';



$sql = "SELECT * FROM categories";
$result = $conn->query($sql);   

while ($row = $result->fetch_assoc()) {
    $categories[] = $row;
}
?>
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Slug</th>
            <th>is_active</th>
            <th>Function</th>

        </tr>
    </thead>
    <tbody>
        <?php foreach ($categories as $category): ?>
            <tr>

                <td><?= $category['name'] ?></td>
                <td><?= $category['description'] ?></td>
                <td><?= $category['slug'] ?></td>
                <td><?= $category['is_active'] ? 'Yes' : 'No' ?></td>
                <td>
                    <a href="edit_category.php?id=<?= $category['id'] ?>" class="btn btn-sm btn-warning">Edit</a>
                  
                </td>
            </tr>
        <?php endforeach; ?>
    </tbody>

</table>

