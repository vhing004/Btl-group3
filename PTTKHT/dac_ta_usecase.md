### Đặc tả Use Case

#### ***1. Đăng nhập***

**Actor:** User và Admin
**Mô tả:** Người dùng (cả sinh viên và quản trị viên) đăng nhập vào hệ thống bằng chung một form đăng nhập.

**Pre-condition:** Người dùng đã có tài khoản.
**Post-condition:** Hệ thống kiểm tra vai trò và chuyển hướng đến trang phù hợp.

**Main Flow:**

1. Người dùng (User hoặc Admin) nhấn nút “Đăng nhập” trên header.
2. Hệ thống hiển thị form đăng nhập chung (Email/Số điện thoại + Mật khẩu).
3. Người dùng nhập thông tin và nhấn “Đăng nhập”.
4. Hệ thống kiểm tra thông tin đăng nhập.
5. Nếu thông tin đúng:
   * Nếu là **User** → Chuyển về trang chủ (index.php)
   * Nếu là **Admin** → Chuyển vào trang quản trị (admin/dashboard.php)
6. Hệ thống lưu thông tin session và role của người dùng.

**Alternative Flow:**

* Người dùng chọn “Đăng ký” nếu chưa có tài khoản.

**Exception Flow:**

* Sai email hoặc mật khẩu → Hiển thị lỗi “Email hoặc mật khẩu không đúng”.
* Tài khoản bị khóa → Thông báo “Tài khoản của bạn đã bị khóa”.

#### 2. *Đăng ký*

**Actor:** User
**Mô tả:** Người dùng tạo một tài khoản mới để sử dụng các chức năng của website.

**Pre-condition:** Người dùng chưa có tài khoản.
**Post-condition:** Tài khoản được tạo thành công và người dùng có thể đăng nhập ngay.

**Main Flow:**

1. Người dùng nhấn vào nút “Đăng ký” trên trang chủ hoặc trang đăng nhập.
2. Hệ thống hiển thị form đăng ký.
3. Người dùng nhập đầy đủ thông tin: Họ tên, Email/Số điện thoại, Mật khẩu, Xác nhận mật khẩu.
4. Người dùng nhấn nút “Đăng ký”.
5. Hệ thống kiểm tra thông tin và lưu tài khoản vào cơ sở dữ liệu.
6. Hệ thống thông báo “Đăng ký thành công” và chuyển sang trang đăng nhập hoặc tự động đăng nhập.

**Alternative Flow:**

* Người dùng có thể nhấn “Đăng nhập” nếu đã có tài khoản.

**Exception Flow:**

* Email/số điện thoại đã tồn tại → Hệ thống báo lỗi “Email này đã được sử dụng”.
* Mật khẩu và xác nhận mật khẩu không khớp → Hệ thống báo lỗi.
* Không điền đủ thông tin bắt buộc → Hệ thống báo lỗi “Vui lòng nhập đầy đủ thông tin”.

#### **3. Tìm kiếm và lọc sản phẩm**

**Actor:** User
**Mô tả:** Người dùng tìm kiếm và lọc sản phẩm theo từ khóa, danh mục và khoảng giá để dễ dàng tìm được sản phẩm mong muốn.

**Pre-condition:** Không có (có thể thực hiện khi chưa đăng nhập hoặc đã đăng nhập).
**Post-condition:** Hệ thống hiển thị danh sách sản phẩm phù hợp với điều kiện tìm kiếm và lọc.

**Main Flow:**

1. Người dùng nhập từ khóa vào ô tìm kiếm trên thanh header (ví dụ: “tai nghe”, “sạc dự phòng”).
2. Hệ thống hiển thị ngay danh sách sản phẩm liên quan.
3. Người dùng có thể lọc thêm theo:
   * Danh mục sản phẩm (Ốp lưng, Tai nghe, Sạc dự phòng, Chuột bàn phím, …)
   * Khoảng giá (dưới 100k, 100k-200k, 200k-500k, trên 500k)
4. Hệ thống tự động cập nhật danh sách sản phẩm theo điều kiện lọc.
5. Người dùng có thể click vào sản phẩm để xem chi tiết.

**Alternative Flow:**

* Người dùng chỉ lọc theo danh mục mà không nhập từ khóa.
* Người dùng có thể kết hợp nhiều bộ lọc cùng lúc (từ khóa + danh mục + giá).

**Exception Flow:**

* Không tìm thấy sản phẩm nào phù hợp → Hệ thống hiển thị thông báo “Không tìm thấy sản phẩm nào” và gợi ý một số sản phẩm khác.
* Từ khóa quá ngắn hoặc không hợp lệ → Hệ thống báo lỗi nhẹ.

#### 4. Xem chi tiết sản phẩm

**Actor:** User
**Mô tả:** Người dùng xem thông tin chi tiết của một sản phẩm để quyết định có mua hay không.

**Pre-condition:** Không có (có thể xem khi chưa đăng nhập hoặc đã đăng nhập).
**Post-condition:** Hệ thống hiển thị đầy đủ thông tin chi tiết của sản phẩm.

**Main Flow:**

1. Người dùng click vào một sản phẩm từ trang chủ, trang danh sách sản phẩm hoặc kết quả tìm kiếm.
2. Hệ thống chuyển sang trang chi tiết sản phẩm.
3. Hệ thống hiển thị:
   * Nhiều hình ảnh sản phẩm (ảnh chính + ảnh phụ)
   * Tên sản phẩm
   * Giá bán
   * Thông số kỹ thuật (mô tả chi tiết)
   * Danh mục sản phẩm
   * Số lượng tồn kho
   * Nút “Thêm vào giỏ hàng”
4. Người dùng có thể xem thêm các sản phẩm liên quan ở dưới cùng trang.

**Alternative Flow:**

* Người dùng nhấn nút “Thêm vào giỏ hàng” ngay trên trang chi tiết.

**Exception Flow:**

* Sản phẩm không tồn tại hoặc đã bị xóa → Hệ thống báo lỗi “Sản phẩm không tìm thấy” và chuyển về trang danh sách sản phẩm.
* Sản phẩm hết hàng → Hiển thị thông báo “Sản phẩm tạm hết hàng” và nút “Thêm vào giỏ hàng” bị vô hiệu hóa.

#### 5. Quản lý giỏ hàng

**Actor:** User
**Mô tả:** Người dùng thêm sản phẩm vào giỏ hàng, xem, sửa số lượng và xóa sản phẩm trong giỏ hàng.

**Pre-condition:** Người dùng đã đăng nhập vào tài khoản.
**Post-condition:** Giỏ hàng được cập nhật và tổng tiền được tính lại chính xác.

**Main Flow:**

1. Người dùng nhấn nút “Thêm vào giỏ hàng” ở trang chi tiết sản phẩm.
2. Hệ thống thêm sản phẩm vào giỏ hàng và thông báo “Đã thêm vào giỏ hàng”.
3. Người dùng vào trang Giỏ hàng (cart.php).
4. Hệ thống hiển thị danh sách sản phẩm trong giỏ hàng gồm: hình ảnh, tên sản phẩm, giá, số lượng, thành tiền.
5. Người dùng có thể:
   * Sửa số lượng sản phẩm
   * Xóa một sản phẩm
   * Xóa toàn bộ giỏ hàng
6. Hệ thống tự động tính lại tổng tiền mỗi khi thay đổi số lượng hoặc xóa sản phẩm.
7. Người dùng nhấn nút “Đặt hàng” để chuyển sang bước đặt hàng.

**Alternative Flow:**

* Người dùng có thể thêm nhiều sản phẩm cùng lúc từ danh sách sản phẩm.

**Exception Flow:**

* Sản phẩm hết hàng → Hệ thống thông báo “Sản phẩm đã hết hàng” và không cho thêm vào giỏ.
* Giỏ hàng trống → Hiển thị thông báo “Giỏ hàng của bạn đang trống” và nút gợi ý quay về mua sắm.

#### 6. Đặt hàng

**Actor:** User
**Mô tả:** Người dùng xác nhận giỏ hàng và tạo đơn hàng mới bằng cách nhập thông tin nhận hàng.

**Pre-condition:** Người dùng đã đăng nhập và có ít nhất một sản phẩm trong giỏ hàng.
**Post-condition:** Đơn hàng được tạo thành công, giỏ hàng được xóa, đơn hàng xuất hiện trong lịch sử đơn hàng.

**Main Flow:**

1. Người dùng vào trang Giỏ hàng và nhấn nút “Đặt hàng” hoặc là đặt hàng trực tiếp tại trang chi tiết sản phẩm.
2. Hệ thống chuyển sang trang Đặt hàng và hiển thị thông tin giỏ hàng (danh sách sản phẩm + tổng tiền).
3. Người dùng nhập thông tin nhận hàng: Họ tên, Số điện thoại, Địa chỉ giao hàng (có thể chọn địa chỉ mặc định nếu đã lưu).
4. Người dùng kiểm tra lại thông tin đơn hàng.
5. Người dùng nhấn nút “Xác nhận đặt hàng”.
6. Hệ thống tạo đơn hàng mới, chuyển trạng thái đơn hàng thành “Chờ xác nhận”, xóa giỏ hàng hiện tại.
7. Hệ thống hiển thị thông báo “Đặt hàng thành công” và chuyển về trang lịch sử đơn hàng hoặc trang chủ.

**Alternative Flow:**

* Người dùng có thể hủy đặt hàng và quay lại giỏ hàng.

**Exception Flow:**

* Thông tin nhận hàng thiếu hoặc sai định dạng → Hệ thống báo lỗi và yêu cầu nhập lại.
* Giỏ hàng trống khi xác nhận → Hệ thống thông báo lỗi và chuyển về trang giỏ hàng.
* Sản phẩm trong giỏ hết hàng trước khi đặt → Hệ thống thông báo và loại bỏ sản phẩm đó khỏi đơn hàng.

#### 7. Lịch sử mua hàng

**Actor:** User
**Mô tả:** Người dùng xem danh sách tất cả các đơn hàng đã đặt trước đây và trạng thái của từng đơn hàng.

**Pre-condition:** Người dùng đã đăng nhập vào tài khoản.
**Post-condition:** Hệ thống hiển thị danh sách đơn hàng theo thứ tự thời gian.

**Main Flow:**

1. Người dùng nhấn vào mục “Lịch sử mua hàng” hoặc “Đơn hàng của tôi” trên trang cá nhân.
2. Hệ thống hiển thị danh sách các đơn hàng đã đặt, bao gồm:
   * Mã đơn hàng
   * Ngày đặt hàng
   * Danh sách sản phẩm (tóm tắt)
   * Tổng tiền
   * Trạng thái đơn hàng (Chờ xác nhận, Đang giao, Hoàn thành, Đã hủy)
3. Người dùng có thể click vào một đơn hàng để xem chi tiết.
4. Hệ thống sắp xếp đơn hàng mới nhất ở trên.

**Alternative Flow:**

* Người dùng có thể lọc đơn hàng theo trạng thái (ví dụ: chỉ xem đơn hàng đang giao).

**Exception Flow:**

* Người dùng chưa có đơn hàng nào → Hệ thống hiển thị thông báo “Bạn chưa có đơn hàng nào” và gợi ý quay về mua sắm.
* Lỗi tải dữ liệu → Hiển thị thông báo lỗi và nút tải lại.

#### 8. Chi tiết đơn hàng đã đặt

**Actor:** User
**Mô tả:** Người dùng xem thông tin chi tiết của một đơn hàng đã đặt trước đó.

**Pre-condition:** Người dùng đã đăng nhập và đã có ít nhất một đơn hàng.
**Post-condition:** Hệ thống hiển thị đầy đủ thông tin chi tiết của đơn hàng.

**Main Flow:**

1. Người dùng vào mục “Lịch sử mua hàng”.
2. Người dùng click vào một đơn hàng bất kỳ trong danh sách.
3. Hệ thống chuyển sang trang chi tiết đơn hàng và hiển thị các thông tin sau:
   * Mã đơn hàng
   * Ngày đặt hàng
   * Trạng thái đơn hàng (Chờ xác nhận, Đang giao, Hoàn thành, Đã hủy)
   * Danh sách sản phẩm trong đơn hàng (tên sản phẩm, số lượng, giá, thành tiền)
   * Tổng tiền thanh toán
   * Thông tin người nhận (Họ tên, Số điện thoại, Địa chỉ giao hàng)
4. Người dùng có thể xem lại toàn bộ thông tin đơn hàng.

**Alternative Flow:**

* Từ trang chi tiết đơn hàng, người dùng có thể quay lại danh sách đơn hàng.

**Exception Flow:**

* Đơn hàng không tồn tại hoặc không thuộc về người dùng → Hệ thống báo lỗi và chuyển về trang lịch sử đơn hàng.

#### 9. Cập nhật hồ sơ

**Actor:** User
**Mô tả:** Người dùng cập nhật lại thông tin cá nhân của mình (họ tên, số điện thoại, địa chỉ).

**Pre-condition:** Người dùng đã đăng nhập vào tài khoản.
**Post-condition:** Thông tin cá nhân được cập nhật và lưu vào cơ sở dữ liệu.

**Main Flow:**

1. Người dùng nhấn vào mục “Hồ sơ cá nhân” hoặc “Tài khoản của tôi”.
2. Hệ thống hiển thị form thông tin hiện tại của người dùng.
3. Người dùng chỉnh sửa các thông tin: Họ tên, Số điện thoại, Địa chỉ giao hàng.
4. Người dùng nhấn nút “Cập nhật” hoặc “Lưu thay đổi”.
5. Hệ thống kiểm tra và lưu thông tin mới vào cơ sở dữ liệu.
6. Hệ thống thông báo “Cập nhật thông tin thành công”.

**Alternative Flow:**

* Người dùng có thể hủy bỏ và quay lại mà không lưu thay đổi.

**Exception Flow:**

* Nhập số điện thoại sai định dạng → Hệ thống báo lỗi “Số điện thoại không hợp lệ”.
* Để trống các trường bắt buộc → Hệ thống báo “Vui lòng nhập đầy đủ thông tin”.
* Lỗi hệ thống khi lưu → Hiển thị thông báo lỗi và giữ nguyên dữ liệu cũ.

#### 10. Đổi mật khẩu

**Actor:** User
**Mô tả:** Người dùng thay đổi mật khẩu tài khoản của mình để tăng tính bảo mật.

**Pre-condition:** Người dùng đã đăng nhập vào tài khoản.
**Post-condition:** Mật khẩu mới được cập nhật thành công.

**Main Flow:**

1. Người dùng vào mục “Hồ sơ cá nhân” hoặc “Tài khoản của tôi”.
2. Người dùng chọn chức năng “Đổi mật khẩu”.
3. Hệ thống hiển thị form đổi mật khẩu gồm 3 trường:
   * Mật khẩu cũ
   * Mật khẩu mới
   * Xác nhận mật khẩu mới
4. Người dùng nhập đầy đủ thông tin và nhấn nút “Đổi mật khẩu”.
5. Hệ thống kiểm tra mật khẩu cũ có đúng không.
6. Nếu đúng, hệ thống cập nhật mật khẩu mới vào cơ sở dữ liệu.
7. Hệ thống thông báo “Đổi mật khẩu thành công”.

**Alternative Flow:**

* Người dùng có thể hủy bỏ thao tác đổi mật khẩu.

**Exception Flow:**

* Nhập sai mật khẩu cũ → Hệ thống báo lỗi “Mật khẩu cũ không đúng”.
* Mật khẩu mới và xác nhận mật khẩu không khớp → Báo lỗi “Mật khẩu xác nhận không khớp”.
* Mật khẩu mới quá ngắn hoặc không đủ mạnh → Hệ thống báo “Mật khẩu phải có ít nhất 6 ký tự”.

#### 11. Quản lý người dùng

**Actor:** Admin
**Mô tả:** Cho phép Admin quản lý toàn bộ tài khoản người dùng trong hệ thống.

* Xem thông tin chi tiết của người dùng
* Theo dõi lịch sử mua hàng của người dùng

Nhằm phục vụ việc quản lý tài khoản, hỗ trợ khách hàng và phân tích hành vi mua sắm.

**Pre-condition:** 

* Admin đã đăng nhập vào hệ thống
* Hệ thống đã có dữ liệu người dùng


**Post-condition:** 

* Thông tin người dùng và lịch sử đơn hàng được hiển thị
* Không làm thay đổi dữ liệu hệ thống

**Main Flow:**

1. Admin truy cập vào trang “Quản lý người dùng” trong Admin Dashboard.
2. Hệ thống hiển thị danh sách người dùng: Id, họ tên, email, số điện thoại, trạng thái tài khoản.
3. Admin chọn chức năng xem chi tiét đơn hàng của một người dùng
4. Hệ thống sẽ hiển thị ra thông tin lịch sử mua hàng của người dùng đó.

**Alternative Flow:**

* Tìm kiếm người dùng theo tên/email
* Lọc người dùng theo trạng thái
* Lọc đơn hàng theo trạng thái (chờ xác nhận, đang giao,...)
* Sắp xếp đơn hàng theo thời gian

**Exception Flow:**

* Người dùng không tồn tại → Hiển thị lỗi
* Người dùng chưa có đơn hàng → Hiển thị “Chưa có đơn hàng nào”
* Lỗi tải dữ liệu → Hiển thị thông báo và cho phép tải lại

#### 12. Quản lý danh mục

**Actor:** Admin
**Mô tả:** Quản trị viên thực hiện thêm, sửa, xóa các danh mục sản phẩm (ví dụ: Tai nghe, Ốp lưng, Sạc dự phòng, Chuột bàn phím, Phụ kiện laptop…).

**Pre-condition:** Admin đã đăng nhập vào trang quản trị.
**Post-condition:** Danh mục được cập nhật và ảnh hưởng đến việc phân loại sản phẩm trên website.

**Main Flow:**

1. Admin truy cập vào trang “Quản lý danh mục” trong Admin Dashboard.
2. Hệ thống hiển thị danh sách tất cả danh mục hiện có.
3. Admin có thể thực hiện các chức năng sau:
   * **Thêm danh mục mới** : Nhấn nút “Thêm danh mục”, nhập tên danh mục (ví dụ: “Tai nghe Bluetooth”), mô tả ngắn và nhấn lưu.
   * **Sửa danh mục** : Chọn danh mục → Nhấn “Sửa” → Chỉnh sửa tên hoặc mô tả → Lưu thay đổi.
   * **Xóa danh mục** : Chọn danh mục → Nhấn “Xóa” → Xác nhận xóa.
4. Hệ thống cập nhật dữ liệu ngay lập tức vào cơ sở dữ liệu.
5. Danh sách danh mục được làm mới.

**Alternative Flow:**

* Khi xóa danh mục, nếu có sản phẩm đang thuộc danh mục đó, hệ thống có thể yêu cầu chuyển sản phẩm sang danh mục khác trước khi xóa.

**Exception Flow:**

* Tên danh mục đã tồn tại → Hệ thống báo lỗi “Danh mục này đã tồn tại”.
* Xóa danh mục đang có sản phẩm → Hệ thống cảnh báo “Danh mục đang chứa sản phẩm, không thể xóa” hoặc yêu cầu chuyển sản phẩm trước.
* Để trống tên danh mục → Báo lỗi “Vui lòng nhập tên danh mục”.

#### 13. Quản lý sản phẩm

**Actor:** Admin
**Mô tả:** Quản trị viên thực hiện thêm, sửa, xóa các sản phẩm, có thể thêm sản phẩm mới, thay đổi thông tin sản phẩm, hay là xóa các sản phẩm cũ đã hết hàng hoặc không bán nữa.

**Pre-condition:** Admin đã đăng nhập vào trang quản trị.
**Post-condition:**

* Dữ liệu sản phẩm được cập nhật vào cơ sở dữ liệu
* Thông tin sản phẩm hiển thị chính xác trên website cho người dùng

**Main Flow:**

1. Admin truy cập vào trang “Quản lý sản phẩm” trong Admin Dashboard.
2. Hệ thống hiển thị danh sách tất cả sản phẩm dưới dạng bảng (tên, giá, danh mục, tồn kho, hình ảnh,...).
3. Admin có thể thực hiện các chức năng sau:
   * **Thêm sản phẩm mới** : Nhấn nút “Thêm danh mục”, nhập tên sản phẩm, giá cả, mô tả, số lượng hàng, danh mục, hình ảnh..  → Lưu → Hệ thống lưu sản phẩm vào cơ sở dữ liệu.
   * **Sửa sản phẩm**: Chọn sản phẩm cần sửa → Nhấn “Sửa” → Chỉnh sửa thông tin cần thết của sản phẩm → Lưu thay đổi → Hệ thống cập nhật dữ liệu.
   * **Xóa sản phẩm** : Chọn sản phẩm càn xáo → Nhấn “Xóa” → Xác nhận xóa → Hệ thống xóa sản phẩm khỏi cơ sở dữ liệu.
4. Hệ thống cập nhật dữ liệu ngay lập tức vào cơ sở dữ liệu.
5. Danh sách sản phẩm được làm mới và cập nhật giao diện.

**Alternative Flow:**

* Admin có thể tìm kiếm sản phẩm theo tên hoặc lọc sản phẩm theo danh mục dễ dàng trong việc thay đổi sản phẩm cũng như là dễ dàng quản lý.

**Exception Flow:**

* Upload hình ảnh không hợp lệ → Hiển thị lỗi *“Hình ảnh không hợp lệ”*
* Thiếu thông tin bắt buộc (tên, giá,...) → Hiển thị *“Vui lòng nhập đầy đủ thông tin”*
* Xóa sản phẩm đang tồn tại trong đơn hàng:

  * Hệ thống hiển thị cảnh báo trước khi xóa
  * Có thể yêu cầu xác nhận thêm hoặc không cho xóa

#### 14. Quản lý đơn hàng

**Actor:** Admin
**Mô tả:** Cho phép Quản trị viên quản lý các đơn hàng do người dùng đặt, đặc biệt là các đơn hàng ở trạng thái  **“Chờ xác nhận”** .

Quản trị viên có thể:

* Xem danh sách đơn hàng
* Xem chi tiết đơn hàng
* Xác nhận đơn hàng
* Cập nhật trạng thái đơn hàng (đang giao, hoàn thành, hủy)

**Pre-condition:**

* Admin đã đăng nhập vào hệ thống quản trị
* Có ít nhất một đơn hàng được tạo từ phía người dùng

**Post-condition:**

* Trạng thái đơn hàng được cập nhật chính xác trong hệ thống
* Dữ liệu đơn hàng được lưu vào cơ sở dữ liệu
* Người dùng có thể xem trạng thái đơn hàng đã được cập nhật

**Main Flow:**

1. Admin truy cập vào trang “Quản lý đơn hàng” trong Admin Dashboard.
2. Hệ thống hiển thị danh sách các đơn hàng, bao gồm: Mã đơn hàng, Mã khách hàng, Tên khách hàng, Tên đơn hàng, Ngày đặt, Tổng tiền, Trạng thái (Chờ xác nhận / Đang giao / Đã hủy).
3. Admin chọn một đơn hàng có trạng thái **“Chờ xác nhận”**
4. Hệ thống hiển thị chi tiết đơn hàng:
   * Danh sách sản phẩm (tên, số lượng, giá)
   * Tổng tiền
   * Thông tin người nhận (tên, SĐT, địa chỉ)
5. Admin thực hiện một trong các hành động:

* Xác nhận đơn hàng:
  * Nhấn nút **“Xác nhận”**
  * Hệ thống cập nhật trạng thái → **“Đang giao”**
* Hủy đơn hàng:
  * Nhấn nút **“Hủy đơn”**
  * Nhập lý do hủy (tuỳ chọn)
  * Hệ thống cập nhật trạng thái → **“Đã hủy”**
* Cập nhật trạng thái giao hàng:

6. Hệ thống cập nhật dữ liệu và làm mới danh sách đơn hàng.

**Alternative Flow:**

* Tìm kiếm đơn hàng theo mã đơn
* Lọc theo trạng thái (Chờ xác nhận, Đang giao, Hoàn thành, Đã hủy)
* Sắp xếp theo thời gian đặt hàng

**Exception Flow:**

* Đơn hàng không tồn tại → Hiển thị lỗi và quay về danh sách
* Lỗi tải dữ liệu → Hiển thị thông báo lỗi và nút “Tải lại”
* Không thể cập nhật trạng thái:
  * Do lỗi hệ thống → Thông báo thất bại
  * Do trạng thái không hợp lệ (ví dụ: đã hủy rồi vẫn cập nhật)

**Quy tắc nghiệp vụ:**

* Đơn hàng phải đi theo thứ tự trạng thái:

  * **Chờ xác nhận → Đang giao → Hoàn thành**
* Đơn hàng đã **hủy** hoặc **hoàn thành** không thể chỉnh sửa
* Khi hủy đơn:

  * Có thể hoàn lại số lượng sản phẩm vào kho
* Khi xác nhận đơn:

  * Có thể trừ số lượng tồn kho

#### 15. Xem thống kê báo cáo

**Actor:** Admin
**Mô tả:** Cho phép Admin xem các số liệu thống kê tổng quan của hệ thống nhằm theo dõi tình hình kinh doanh và hoạt động của website.

Các thông tin thống kê có thể bao gồm:

* Doanh thu
* Số lượng đơn hàng
* Số lượng sản phẩm đã bán
* Số lượng người dùng
* Biểu đồ theo thời gian (ngày/tháng/năm)

**Pre-condition:**

* Admin đã đăng nhập vào hệ thống quản trị
* Hệ thống đã có dữ liệu (đơn hàng, sản phẩm, người dùng,...)

**Post-condition:**

* Các dữ liệu thống kê được hiển thị chính xác
* Không làm thay đổi dữ liệu hệ thống

**Main Flow:**

1. Admin truy cập vào chức năng **“Thống kê”** trong Admin Dashboard
2. Hệ thống hiển thị màn hình thống kê tổng quan, bao gồm:
   * Tổng doanh thu
   * Tổng số đơn hàng
   * Tổng số sản phẩm đã bán
   * Tổng số người dùng
3. Admin chọn khoảng thời gian cần xem:
   * Theo ngày
   * Theo tháng
   * Theo năm
4. Hệ thống hiển thị chi tiết đơn hàng:
   * Danh sách sản phẩm (tên, số lượng, giá)
   * Tổng tiền
   * Thông tin người nhận (tên, SĐT, địa chỉ)
5. Hệ thống cập nhật dữ liệu và biểu đồ tương ứng với khoảng thời gian đã chọn

**Alternative Flow:**

* Lọc theo loại thống kê (doanh thu, đơn hàng, sản phẩm)
* Xem chi tiết từng phần (ví dụ: click vào biểu đồ để xem danh sách đơn hàng)
* Xuất báo cáo (PDF/Excel)

**Exception Flow:**

* Không có dữ liệu trong khoảng thời gian chọn → Hiển thị “Không có dữ liệu”
* Lỗi tải dữ liệu → Hiển thị thông báo lỗi và nút “Tải lại”
* Khoảng thời gian không hợp lệ → Hệ thống yêu cầu chọn lại

**Quy tắc nghiệp vụ:**

* Doanh thu chỉ tính các đơn hàng **đã hoàn thành**
* Đơn hàng bị **hủy** không được tính vào thống kê
* Dữ liệu thống kê phải đồng bộ với cơ sở dữ liệu theo thời gian thực hoặc gần thời gian thực
