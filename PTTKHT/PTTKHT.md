# PHÂN TÍCH THIẾT KẾ HỆ THỐNG

### MÔN: CHUYÊN ĐỀ (ĐỊNH HƯỚNG DOANH NGHIỆP PHẦN MÊM)

### Đề Tài: Website Bán Đồ Điện Tử Giá Rẻ StudentGear

**Giảng viên hướng dẫn**: Ngô Ngọc Anh

**Nhóm**: 03

**Sinh viên thực hiện:**

1. Nguyễn Hữu Vinh - 2221050601
2. Vũ Minh Hào - 2221050480
3. Ngô Hoàng Long - 2221050283


#### **CHƯƠNG 1. KHẢO SÁT HỆ THỐNG**

##### **1.2 Chức năng hệ thống**

###### 1.2.1 Chức năng cho Viewer

Viewer là những người truy cập website mà chưa có tài khoản sử dụng hoặc là chưa đăng nhập. Nhu cầu của họ chỉ là dùng website xem thông tin các sản phẩm, tìm kiếm các mặt hàng họ muốn và tham khảo giả cả sản phẩm.

Họ có thể sử dụng các chức năng:

* Truy cập trang web.
* Xem trang chủ với banner khuyến mãi, sản phẩm nổi bật, sản phẩm mới và các sản phẩm giá rẻ.
* Tìm kiếm sản phẩm theo từ khóa.
* Lọc sản phẩm theo danh mục.
* Xem chi tiết sản phẩm.
* Xem các sản phẩm liên quan.
* Thêm vào giỏ hàng tạm thời.
* Quản lý giỏ hàng tạm thời (thêm, xóa, thay đổi số lượng).
* Đặt hàng (Hệ thống sẽ yêu cầu đăng nhập trước khi hoàn tất khách hàng).

NOTE: Viewer không thể xem lịch sử đơn hàng, không thể lưu giỏ hàng lâu dài và một số tính năng cần yêu cầu đăng nhập để sử dụng.

###### 1.2.2 Chức năng cho User

Đối với người dùng thì họ có thể sử dụng tất cả các tính năng của Viewer và các chức năng quan trọng:

* Duy trì giỏ hàng lâu dài (giỏ hàng được lưu theo tài khoản).
* Thêm sản phẩm vào giỏ hàng.
* Quản lý giỏ hàng: xem, sửa số lượng, xóa sản phẩm.
* Đặt hàng: Nhập thông tin nhận hàng và xác nhận đặt hàng.
* Nhập / cập nhật thông tin giao hàng (địa chỉ, số điện thoại).
* Xem lịch sử đơn hàng cá nhân.
* Xem chi tiết trạng thái đơn hàng.
* Cập nhật thông tin cá nhân (tên, email, số điện thoại, địa chỉ).
* Đổi mật khẩu.

NOTE: User có thể sử dụng web thoải mái và dữ liệu sẽ được lưu lại ngay cả khi tắt trình duyệt.

###### 1.2.3 Chức năng cho Admin

* Đăng nhập và sử dụng trang quản trị.
* Quản lý danh mục sản phẩm (Thêm, sửa, xóa danh mục).
* Quản lý sản phẩm:
  * Thêm sản phẩm mới (tên, giá, mô tả, hình ảnh, số lượng tồn kho, danh mục).
  * Chỉnh sửa thông tin sản phẩm.
  * Xóa sản phẩm.
  * Upload và thay đổi hình ảnh sản phẩm.
* Quản lý đơn hàng:
  * Xem đơn hàng của khách.
  * Xem chi tiết đơn hàng.
  * Cập nhật trạng thái đơn hàng (Chờ xác nhận → Đang giao → Hoàn thành → Đã hủy).
  * Xem thống kê cơ bản (số lượng đơn hàng, tổng doanh thu theo ngày/tháng).
  * Quản lý tài khoản người dùng (xem danh sách user - tùy chọn).

NOTE:

* Chỉ có admin mới có quyền truy cập trang quản trị.
* Giao diện đơn giản tập trung vào quản lý dữ liệu cho trang web.

###### 1.2.4 Các yêu cầu kỹ thuật và giao diện

**Phía Người dùng:**

* Trang chủ (Home): Banner, sản phẩm nổi bật, sản phẩm giá rẻ.
* Trang danh sách sản phẩm: Có thanh tìm kiếm, lọc theo danh mục và giá.
* Trang chi tiết sản phẩm: Hiển thị nhiều ảnh, mô tả, giá, nút thêm giỏ hàng.
* Trang giỏ hàng: Danh sách sản phẩm đã chọn, tổng tiền, nút đặt hàng.
* Trang đặt hàng: Form nhập thông tin nhận hàng.
* Trang lịch sử đơn hàng: Danh sách đơn + trạng thái.
* Trang đăng nhập / Đăng ký.

**Phía Admin:**

* Trang đăng nhập Admin.
* Dashboard (tổng quan số đơn hàng, doanh thu).
* Trang quản lý sản phẩm (bảng danh sách + nút thêm/sửa/xóa).
* Trang quản lý đơn hàng (bảng đơn hàng + cập nhật trạng thái).
* Trang quản lý danh mục.
