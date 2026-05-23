# StudentGear - Website Bán Đồ Điện Tử Giá Rẻ

## I, Giới thiệu Môn học

- Chuyên đề định hướng doanh nghiệp phần mềm
- Giảng viên hướng dẫn: Ngô Ngọc Anh

## II, Mô Tả Dự Án

**StudentGear** là một website thương mại điện tử (e-commerce) chuyên cung cấp phụ kiện công nghệ giá rẻ dành cho sinh viên. Nền tảng này cung cấp một giải pháp hoàn chỉnh cho việc tìm kiếm, lựa chọn và đặt mua các sản phẩm công nghệ với giao diện thân thiện, dễ sử dụng.

### III, Mục Tiêu Dự Án

- Xây dựng website có đầy đủ chức năng mua hàng cơ bản
- Tạo giao diện đẹp, dễ sử dụng trên mọi thiết bị
- Phát triển hệ thống quản trị (Admin Panel) hoàn chỉnh
- Hỗ trợ quản lý tài khoản, giỏ hàng, đặt hàng và theo dõi đơn hàng
- Cung cấp công cụ quản lý sản phẩm, danh mục và đơn hàng cho quản trị viên

---

## IV, Tính Năng Chính

### 1. Cho Người Dùng Khách Vãng Lai (Viewer)

- Truy cập và duyệt sản phẩm trên trang chủ
- Xem banner khuyến mãi, sản phẩm nổi bật và sản phẩm mới
- Tìm kiếm sản phẩm theo từ khóa
- Lọc sản phẩm theo danh mục và giá
- Xem chi tiết sản phẩm đầy đủ (hình ảnh, mô tả, giá)
- Xem sản phẩm liên quan
- Quản lý giỏ hàng tạm thời (thêm, xóa, cập nhật số lượng)

### 2. Cho Người Dùng Đã Đăng Ký (User)

- Tất cả tính năng của Viewer
- Duy trì giỏ hàng lâu dài (lưu theo tài khoản)
- Đặt hàng với thông tin giao hàng
- Nhập/cập nhật thông tin giao hàng (địa chỉ, số điện thoại)
- Xem lịch sử đơn hàng cá nhân
- Theo dõi trạng thái đơn hàng
- Cập nhật thông tin cá nhân (tên, email, số điện thoại, địa chỉ)
- Đổi mật khẩu

### 3. Cho Quản Trị Viên (Admin)

- Đăng nhập vào trang quản trị
- **Quản lý danh mục sản phẩm**: Thêm, sửa, xóa
- **Quản lý sản phẩm**:
- Thêm sản phẩm mới (tên, giá, mô tả, hình ảnh, số lượng tồn kho)
- Chỉnh sửa thông tin sản phẩm
- Xóa sản phẩm
- Quản lý hình ảnh sản phẩm
- **Quản lý đơn hàng**:
- Xem danh sách đơn hàng
- Xem chi tiết đơn hàng
- Cập nhật trạng thái (Chờ xác nhận → Đang giao → Hoàn thành → Đã hủy)
- Thống kê doanh thu theo ngày/tháng
- Xem danh sách người dùng

---

## V, Stack Công Nghệ

| Phần            | Công Nghệ                                 |
| --------------- | ----------------------------------------- |
| **Backend**     | PHP 7.4+                                  |
| **Frontend**    | HTML5, CSS3, JavaScript (Vanilla)         |
| **Styling**     | SCSS/SASS, Bootstrap (hoặc CSS tuỳ chỉnh) |
| **Database**    | MySQL 5.7+                                |
| **Build Tools** | Vite, SASS                                |
| **Server**      | Apache (Laragon hoặc localhost)           |

---

## VI, Cấu Trúc Dự Án

```
Btl-group3/
├── PTTKHT/                          # Tài liệu phân tích thiết kế hệ thống
│   ├── PTTKHT.md                    # Phân tích thiết kế hệ thống
│   ├── muc_tieu.md                  # Mục tiêu dự án
│   ├── fr_nfr.md                    # Đặc tả chức năng/phi chức năng
│   ├── dac_ta_usecase.md            # Đặc tả Use Case
│   ├── xac_dinh_usecase.md          # Xác định Use Case
│   ├── Sequence_Diagram.md          # Sơ đồ trình tự
│   ├── ActivityDiagram.md           # Sơ đồ hoạt động
│   ├── draw_usecase.md              # Vẽ Use Case
│   ├── chuc_nang.md                 # Chi tiết chức năng
│   └── images/                      # Hình ảnh tài liệu
│
├── StudentGear/                     # Ứng dụng web chính
│   ├── index.php                    # Trang chủ
│   ├── package.json                 # Cấu hình npm
│   │
│   ├── config/
│   │   └── db.php                   # Cấu hình kết nối database
│   │
│   ├── auth/
│   │   ├── login.php                # Trang đăng nhập
│   │   ├── logout.php               # Xử lý đăng xuất
│   │   └── reg.php                  # Trang đăng ký
│   │
│   ├── pages/                       # Các trang người dùng
│   │   ├── home.php                 # Trang chủ
│   │   ├── category.php             # Danh sách sản phẩm theo danh mục
│   │   ├── detail_product.php       # Chi tiết sản phẩm
│   │   └── cart.php                 # Giỏ hàng
│   │
│   ├── handler/                     # Xử lý logic giỏ hàng
│   │   ├── add_to_cart.php
│   │   ├── remove_from_cart.php
│   │   └── update_cart.php
│   │
│   ├── admin/                       # Trang quản trị
│   │   ├── index.php                # Dashboard
│   │   ├── handlers/                # Xử lý cập nhật dữ liệu
│   │   │   ├── add_category.php
│   │   │   ├── add_product.php
│   │   │   ├── edit_category.php
│   │   │   ├── edit_product.php
│   │   │   ├── get_order_details.php
│   │   │   └── update_order_status.php
│   │   ├── includes/
│   │   │   └── sidebar.php          # Sidebar quản trị
│   │   └── pages/                   # Các trang quản trị
│   │       ├── categories.php       # Quản lý danh mục
│   │       ├── products.php         # Quản lý sản phẩm
│   │       ├── orders.php           # Quản lý đơn hàng
│   │       └── users.php            # Quản lý người dùng
│   │
│   ├── includes/                    # Các thành phần dùng lại
│   │   ├── header.php               # Phần header
│   │   └── footer.php               # Phần footer
│   │
│   ├── assets/
│   │   ├── css/                     # CSS biên dịch
│   │   │   ├── main.css             # CSS chính
│   │   │   └── admin.css            # CSS quản trị
│   │   ├── js/                      # JavaScript
│   │   │   ├── index.js             # Script chính
│   │   │   └── cart.js              # Logic giỏ hàng
│   │   ├── scss/                    # SCSS nguồn
│   │   │   ├── main.scss
│   │   │   ├── admin.scss
│   │   │   ├── admin/               # SCSS quản trị
│   │   │   ├── base/                # SCSS cơ bản
│   │   │   ├── components/          # SCSS thành phần
│   │   │   └── pages/               # SCSS trang
│   │   └── images/                  # Hình ảnh
│   │       ├── categories/
│   │       └── products/
│   │
│   ├── sql/
│   │   └── studentgear.sql          # Schema database
│   │
│   ├── README.md
│   └── .gitignore

└── README.md                        # Tài liệu này
```

---

## VII, Cơ Sở Dữ Liệu

Hệ thống sử dụng MySQL với các bảng chính:

- **users**: Lưu trữ thông tin người dùng (tên, email, password, địa chỉ, etc.)
- **admin_users**: Tài khoản quản trị viên
- **categories**: Danh mục sản phẩm
- **products**: Thông tin sản phẩm (tên, giá, mô tả, hình ảnh)
- **orders**: Đơn hàng
- **order_items**: Chi tiết sản phẩm trong đơn hàng

Để xem schema đầy đủ, xem file: `StudentGear/sql/studentgear.sql`

---

## VIII, Cài Đặt & Thiết Lập

### Yêu Cầu Tiên Quyết

- PHP 7.4 trở lên
- MySQL 5.7 trở lên
- Node.js 16+ (cho SASS compilation)
- Apache Web Server (hoặc Laragon)

### Bước 1: Clone Repository

```bash
cd c:\laragon\www
git clone <repository-url>
cd Btl-group3
```

### Bước 2: Cài Đặt Dependencies

```bash
cd StudentGear
npm install
```

### Bước 3: Cấu Hình Database

1. Mở MySQL và tạo database:

   ```sql
   CREATE DATABASE IF NOT EXISTS studentgear;
   ```

2. Import schema:

   ```bash
   mysql -u root -p studentgear < sql/studentgear.sql
   ```

3. Cập nhật cấu hình database trong `config/db.php`:
   ```php
   $localhost = 'localhost';
   $username = 'root';      // Username MySQL
   $password = '';          // Password MySQL
   $dbname = 'studentgear';
   ```

### Bước 4: Cấu Hình Đường Dẫn

Cập nhật `BASE_URL` trong `config/db.php` nếu cần:

```php
define('BASE_URL', 'http://localhost/Btl-group3/StudentGear/');
```

---

## IX, Chạy Ứng Dụng

### Biên Dịch SCSS → CSS

```bash
# Chế độ watch (tự động biên dịch khi thay đổi)
npm run sass

# Hoặc chỉ biên dịch một lần
npm run build
```

### Chạy Ứng Dụng Web

1. **Nếu dùng Laragon:**
   - Đặt folder vào `C:\laragon\www\Btl-group3\StudentGear`
   - Truy cập: `http://localhost/Btl-group3/StudentGear`

2. **Nếu dùng localhost thường:**

   ```bash
   # Từ thư mục StudentGear
   php -S localhost:8000
   ```

   - Truy cập: `http://localhost:8000`

### Truy Cập Admin Panel

- **URL:** `http://localhost/Btl-group3/StudentGear/admin`
- **Tài khoản admin mặc định** (cần tạo trong database hoặc qua SQL)

---

## X, Chức Năng Chi Tiết

### Người Dùng

1. **Trang Chủ (Home)**
   - Banner khuyến mãi
   - Sản phẩm nổi bật
   - Sản phẩm mới nhất
   - Sản phẩm giá rẻ

2. **Danh Sách Sản Phẩm**
   - Thanh tìm kiếm theo tên sản phẩm
   - Lọc theo danh mục
   - Lọc theo khoảng giá
   - Phân trang

3. **Chi Tiết Sản Phẩm**
   - Hiển thị hình ảnh chi tiết
   - Mô tả đầy đủ
   - Giá bán
   - Nút thêm vào giỏ hàng
   - Sản phẩm liên quan

4. **Giỏ Hàng**
   - Danh sách sản phẩm đã chọn
   - Cập nhật số lượng
   - Xóa sản phẩm
   - Tính tổng tiền
   - Nút đặt hàng

5. **Đặt Hàng & Theo Dõi**
   - Form nhập thông tin giao hàng
   - Xác nhận đặt hàng
   - Xem lịch sử đơn hàng
   - Theo dõi trạng thái

6. **Tài Khoản Cá Nhân**
   - Đăng ký tài khoản
   - Đăng nhập
   - Cập nhật thông tin
   - Đổi mật khẩu

### Quản Trị Viên

1. **Dashboard**
   - Thống kê tổng đơn hàng
   - Doanh thu theo ngày/tháng
   - Thông tin tóm tắt hệ thống

2. **Quản Lý Sản Phẩm**
   - Danh sách sản phẩm (bảng)
   - Thêm sản phẩm mới
   - Chỉnh sửa sản phẩm
   - Xóa sản phẩm
   - Upload hình ảnh

3. **Quản Lý Danh Mục**
   - Thêm danh mục
   - Chỉnh sửa danh mục
   - Xóa danh mục

4. **Quản Lý Đơn Hàng**
   - Danh sách đơn hàng
   - Xem chi tiết đơn
   - Cập nhật trạng thái (4 bước)
   - Thống kê đơn hàng

5. **Quản Lý Người Dùng**
   - Xem danh sách user
   - Thông tin người dùng

---

## XI, Bảo Mật

- Mã hóa mật khẩu (Password hashing)
- Xác thực người dùng qua Session
- Phân quyền (Viewer, User, Admin)
- Bảo vệ dữ liệu khỏi truy cập trái phép
- Hạn chế: CSRF protection (cần bổ sung thêm)

---

## XII, Tính Năng Phi Chức Năng

| Yêu Cầu              | Chi Tiết                                                 |
| -------------------- | -------------------------------------------------------- |
| **Hiệu Năng**        | Thời gian tải trang < 3 giây, phản hồi tìm kiếm < 1 giây |
| **Khả Năng Sử Dụng** | Giao diện đơn giản, thân thiện, dễ điều hướng            |
| **Tương Thích**      | Hỗ trợ Chrome, Firefox, Safari; Responsive trên mobile   |
| **Bảo Mật**          | Mã hóa mật khẩu, xác thực người dùng, bảo vệ session     |
| **Mở Rộng**          | Thiết kế modular, dễ thêm tính năng mới                  |
| **Ổn Định**          | Xử lý lỗi toàn diện, hạn chế tối đa bugs                 |

---

## XIII, Nhóm Phát Triển

| STT | Tên             | MSV        | Vai Trò                        |
| --- | --------------- | ---------- | ------------------------------ |
| 1   | Nguyễn Hữu Vinh | 2221050601 | Nhóm Trưởng, Backend Developer |
| 2   | Vũ Minh Hào     | 2221050480 | Frontend Developer             |
| 3   | Ngô Hoàng Long  | 2221050283 | Database, Admin Panel          |

**Giảng viên hướng dẫn:** Ngô Ngọc Anh

---

## XIV, Ghi Chú

- Dự án này là bài tập lớn chuyên đề (Định hướng doanh nghiệp phần mềm)
- Tất cả tài liệu phân tích thiết kế hệ thống nằm trong thư mục `PTTKHT/`
- Database schema được lưu tại `StudentGear/sql/studentgear.sql`
- Sử dụng SCSS cho styling, cần compile ra CSS trước khi sử dụng

---

## XV, License

Dự án này được tạo cho mục đích học tập.

---

**Cập nhật lần cuối:** May 2026
