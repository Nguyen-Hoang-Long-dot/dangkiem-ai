<div align="center">

# Hệ thống Quản lý Đăng kiểm Xe cơ giới tích hợp AI

**Backend mô phỏng nghiệp vụ đăng kiểm phương tiện, kết hợp API quản lý và trợ lý AI.**

[![Python](https://img.shields.io/badge/Python-3.11%2B-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-API-009688?logo=fastapi&logoColor=white)](https://fastapi.tiangolo.com/)
[![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-ORM-D71F00)](https://www.sqlalchemy.org/)
[![Pytest](https://img.shields.io/badge/Tests-Pytest-0A9EDC?logo=pytest&logoColor=white)](https://docs.pytest.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-2EA44F.svg)](LICENSE)

</div>

---

## Tổng quan

Dự án xây dựng một backend phục vụ việc mô phỏng quy trình quản lý đăng kiểm xe cơ giới. Hệ thống cung cấp các API để quản lý người dùng, chủ xe, phương tiện, lịch hẹn và hồ sơ kiểm định; đồng thời tích hợp chức năng AI hỗ trợ tra cứu thông tin quy trình, tóm tắt hồ sơ và nhắc lịch.

Dự án được thiết kế cho **học tập, trình diễn kỹ thuật và kiểm thử API**. Đây không phải hệ thống nghiệp vụ đăng kiểm đã được chứng nhận để vận hành thực tế.

> **Lưu ý về AI:** AI chỉ đóng vai trò hỗ trợ thông tin. AI không đưa ra kết luận đạt/không đạt đăng kiểm và không thay thế kiểm định viên hoặc người có thẩm quyền.

## Mục tiêu dự án

- Tổ chức backend theo các nhóm chức năng rõ ràng.
- Cung cấp REST API cho các nghiệp vụ quản lý phương tiện và kiểm định.
- Áp dụng xác thực JWT và băm mật khẩu.
- Hỗ trợ thử nghiệm API qua tài liệu OpenAPI/Swagger.
- Mô phỏng một quy trình có tích hợp AI với giới hạn nghiệp vụ rõ ràng.

## Tính năng

| Nhóm | Mô tả |
|---|---|
| Xác thực và phân quyền | Đăng nhập, JWT và hai vai trò `ADMIN`, `STAFF` |
| Quản lý phương tiện | Tạo, tra cứu, sửa biển số và thông tin phương tiện; trạng thái được tính lại theo hạn đăng kiểm |
| Chủ phương tiện | Quản lý thông tin chủ xe; không cho xóa khi còn phương tiện liên kết |
| Lịch hẹn | Tạo, tra cứu, cập nhật trạng thái và xóa lịch hẹn |
| Hồ sơ kiểm định | Tạo, tra cứu, cập nhật và xóa hồ sơ; hồ sơ đã cấp chứng nhận được bảo vệ |
| Chứng nhận | Cấp chứng nhận từ hồ sơ đạt, quản lý hiệu lực và đồng bộ hạn đăng kiểm của phương tiện |
| Thông báo hoạt động | Lưu thay đổi theo tài khoản STAFF; nhấn thông báo mở đúng trang và bản ghi |
| Trạng thái phương tiện | Theo dõi `SAFE`, `WARNING`, `EXPIRED` |
| Dashboard | API cung cấp số liệu tổng quan |
| Trợ lý AI | Mô phỏng hỗ trợ tra cứu quy trình, tóm tắt hồ sơ và nhắc lịch |
| Health check | Kiểm tra trạng thái dịch vụ |
| Cơ sở dữ liệu | SQLite lưu dữ liệu bền vững qua các lần khởi động |

## Công nghệ

- **Ngôn ngữ:** Python 3.11+
- **Web framework:** FastAPI
- **ORM:** SQLAlchemy
- **Cơ sở dữ liệu:** SQLite lưu trên máy; đường dẫn cấu hình qua `DATABASE_URL`
- **Bảo mật:** JWT, bcrypt
- **Giao diện demo:** Jinja Templates và HTML tĩnh
- **Kiểm thử:** Pytest
- **API documentation:** OpenAPI / Swagger UI

## Kiến trúc thư mục

```text
dangkiem-ai-system/
├── app/
│   ├── api/                 # Các endpoint theo nhóm nghiệp vụ
│   │   ├── ai_services.py
│   │   ├── appointments.py
│   │   ├── auth.py
│   │   ├── certificates.py
│   │   ├── inspections.py
│   │   ├── notifications.py
│   │   ├── owners.py
│   │   ├── stats.py
│   │   └── vehicles.py
│   ├── core/                # Cấu hình và bảo mật
│   │   ├── config.py
│   │   └── security.py
│   ├── db/                  # Kết nối, model và dữ liệu mẫu
│   │   ├── database.py
│   │   ├── models.py
│   │   └── seed.py
│   ├── schemas/             # Schema dữ liệu API
│   ├── templates/           # Trang giao diện demo
│   └── __init__.py
├── docs/                    # Tài liệu và tài nguyên dự án
├── static/                  # Tài nguyên tĩnh
├── tests/                   # Bộ kiểm thử
├── .env.example             # Mẫu cấu hình môi trường
├── .gitignore
├── main.py                  # Điểm khởi chạy ứng dụng
├── pytest.ini
├── requirements.txt
├── LICENSE
└── README.md
```

> Cấu trúc trên là phần tổng quan các thành phần chính. Một số tệp dữ liệu hoặc cấu hình cục bộ có thể không được đưa vào repository.

## Bắt đầu

### Yêu cầu

- Windows với PowerShell (các lệnh bên dưới được viết cho môi trường này).
- Python 3.11 trở lên.
- Git nếu bạn muốn clone repository.

### 1. Clone mã nguồn

```powershell
git clone https://github.com/Nguyen-Hoang-Long-dot/project-ai.git
Set-Location .\project-ai\dangkiem-ai-system
```

Nếu đã có mã nguồn, mở PowerShell tại thư mục chứa `main.py` và `requirements.txt`.

### 2. Tạo môi trường ảo và cài dependencies

```powershell
py -3 -m venv venv
.\venv\Scripts\python.exe -m pip install --upgrade pip
.\venv\Scripts\python.exe -m pip install -r requirements.txt
```

### 3. Thiết lập biến môi trường

Tạo file `.env` từ mẫu:

```powershell
Copy-Item .env.example .env
```

Mở `.env` và thay `SECRET_KEY` bằng một giá trị ngẫu nhiên đủ mạnh. Nếu dùng chức năng AI, hãy điền API key trong môi trường cục bộ của bạn.

**Không commit file `.env` hoặc API key lên Git.** File `.env.example` chỉ dùng để mô tả tên biến và giá trị mẫu.

Ứng dụng tự tạo bảng SQLite khi khởi động và lưu dữ liệu nghiệp vụ vào file được chỉ định bởi `DATABASE_URL` (mặc định `dangkiem.db`). Dữ liệu được giữ lại sau khi tắt/mở ứng dụng; dữ liệu mẫu không còn được tự động thêm khi khởi động. Nếu muốn bắt đầu bằng một cơ sở dữ liệu trống, đổi `DATABASE_URL` sang một đường dẫn file mới trước khi chạy. File cơ sở dữ liệu cũ không bị xóa hay ghi đè.

Để bật gửi tài khoản STAFF và **Quên mật khẩu**, cấu hình SMTP trong `.env`. Ví dụ bên dưới dành cho Gmail/Google Workspace; chỉ dùng `smtp.gmail.com` nếu hộp thư người gửi được Google quản lý:

```dotenv
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USERNAME=your-sender@gmail.com
SMTP_PASSWORD=your-16-character-google-app-password
SMTP_FROM=your-sender@gmail.com
SMTP_STARTTLS=true
PASSWORD_RESET_EMAIL=phungvinhhai@gmail.com
```

Thay `your-sender@gmail.com` bằng hộp thư gửi thật. Với Gmail, bật xác minh 2 bước rồi tạo **App Password** trong phần bảo mật Tài khoản Google và dùng mật khẩu ứng dụng đó cho `SMTP_PASSWORD` — không dùng mật khẩu đăng nhập Gmail. Nếu địa chỉ ICTU của bạn do Microsoft 365 hoặc máy chủ trường quản lý, hãy thay `SMTP_HOST`, `SMTP_PORT`, `SMTP_STARTTLS` và thông tin xác thực theo SMTP do trường cung cấp; không giả định SMTP của trường là Gmail.

Lệnh `Copy-Item .env.example .env` chỉ tạo `.env` lần đầu. Nếu `.env` đã có, mở và sửa trực tiếp các dòng `SMTP_*`, không chép đè file vì có thể làm mất cấu hình riêng. Khởi động lại ứng dụng sau khi sửa. SMTP hiện được dùng cho cả email cấp tài khoản STAFF lẫn mã đặt lại mật khẩu; mã đặt lại hết hạn sau 15 phút và chỉ sử dụng một lần.

Đăng ký tài khoản công khai đã bị tắt. Quản trị viên đăng nhập tại `/login`, vào `/admin`, tạo tài khoản STAFF; hệ thống sinh mật khẩu và gửi thông tin đăng nhập tới `PASSWORD_RESET_EMAIL`. Quản trị viên không có quyền truy cập nghiệp vụ. Nhân viên STAFF có quyền trên các chức năng nghiệp vụ hiện có.

Không gửi lại mật khẩu đang dùng. Chức năng quên mật khẩu gửi mã dùng một lần tới email quản trị để đặt mật khẩu mới. Cấu hình SMTP ở `.env` là cần thiết cho cả gửi tài khoản STAFF và đặt lại mật khẩu.

### 4. Khởi chạy ứng dụng

```powershell
.\venv\Scripts\python.exe -m uvicorn main:app --reload
```

Sau khi server khởi động, mở các địa chỉ sau:

| Thành phần | URL |
|---|---|
| Trang demo | http://127.0.0.1:8000/ |
| Swagger UI | http://127.0.0.1:8000/docs |
| Health check | http://127.0.0.1:8000/health |

> `--reload` phù hợp cho phát triển cục bộ; không nên dùng làm cấu hình chạy production.

## Tạo tài khoản quản trị ban đầu

Cơ sở dữ liệu mới không có sẵn tài khoản hay dữ liệu demo. Chạy lệnh sau một lần để tạo quản trị viên; chương trình sẽ yêu cầu nhập tên đăng nhập, họ tên và mật khẩu (mật khẩu được nhập ẩn):

```powershell
.\venv\Scripts\python.exe -m app.db.bootstrap_admin
```

Sau đó khởi động ứng dụng và đăng nhập bằng tài khoản vừa tạo. Lệnh này chỉ tạo quản trị viên khi cơ sở dữ liệu chưa có tài khoản ADMIN. Nếu đang dùng cơ sở dữ liệu cũ đã có tài khoản, dữ liệu hiện có được giữ nguyên. Hàm seed trong `app/db/seed.py` chỉ dành cho dữ liệu demo/kiểm thử; không chạy trên cơ sở dữ liệu lưu dữ liệu thật.

## API tham khảo

Các endpoint tiêu biểu được khai báo trong dự án:

| Method | Endpoint | Mục đích |
|---|---|---|
| `POST` | `/api/auth/login` | Đăng nhập |
| `POST` | `/api/auth/staff-accounts` | Admin tạo tài khoản STAFF và gửi thông tin qua email |
| `GET` | `/api/vehicles/` | Tra cứu phương tiện |
| `POST` | `/api/vehicles/` | Tạo phương tiện |
| `PUT` | `/api/vehicles/{vehicle_id}` | Cập nhật phương tiện |
| `DELETE` | `/api/vehicles/{vehicle_id}` | Xóa phương tiện |
| `GET`, `POST` | `/api/owners/` | Tra cứu và tạo chủ phương tiện |
| `PUT`, `DELETE` | `/api/owners/{owner_id}` | Sửa hoặc xóa chủ phương tiện |
| `GET`, `POST` | `/api/appointments/` | Tra cứu và tạo lịch hẹn |
| `PUT`, `DELETE` | `/api/appointments/{appointment_id}` | Sửa hoặc xóa lịch hẹn |
| `GET` | `/api/inspections/` | Tra cứu hồ sơ kiểm định |
| `POST` | `/api/inspections/` | Tạo hồ sơ kiểm định |
| `PUT`, `DELETE` | `/api/inspections/{inspection_id}` | Sửa hoặc xóa hồ sơ kiểm định |
| `GET` | `/api/inspections/vehicle/{vehicle_id}` | Tra cứu hồ sơ theo phương tiện |
| `GET`, `POST` | `/api/certificates/` | Tra cứu và cấp chứng nhận |
| `PUT`, `DELETE` | `/api/certificates/{certificate_id}` | Sửa hoặc thu hồi chứng nhận |
| `GET` | `/api/notifications/` | Lấy thông báo hoạt động của tài khoản hiện tại |
| `PUT` | `/api/notifications/{notification_id}/read` | Đánh dấu thông báo đã đọc |
| `GET` | `/api/stats/summary` | Thống kê tổng quan |
| `POST` | `/api/ai/chat` | Gửi yêu cầu tới chức năng AI |
| `GET` | `/health` | Kiểm tra trạng thái dịch vụ |
| `GET` | `/api/health` | Endpoint kiểm tra trạng thái bổ sung |

Xem schema request/response và thử gọi API trực tiếp tại **[Swagger UI](http://127.0.0.1:8000/docs)** sau khi chạy ứng dụng.

## Chạy kiểm thử

Từ thư mục gốc dự án, chạy:

```powershell
.\venv\Scripts\python.exe -m pytest -q
```

Lệnh trên chạy bộ kiểm thử Pytest, bao gồm các kiểm thử tích hợp CRUD và liên kết giữa các API nghiệp vụ.

## Cấu hình môi trường

Các biến môi trường chính được sử dụng trong hướng dẫn dự án:

| Biến | Ý nghĩa | Giá trị mẫu |
|---|---|---|
| `SECRET_KEY` | Khóa bí mật dùng cho chức năng bảo mật | Thay bằng giá trị ngẫu nhiên |
| `DATABASE_URL` | Chuỗi kết nối cơ sở dữ liệu | `sqlite:///./dangkiem.db` |
| `ENV` | Môi trường chạy | `development` |
| `OPENAI_API_KEY` | API key cho chức năng AI (nếu sử dụng) | Để trống trong file mẫu |
| `SMTP_HOST`, `SMTP_PORT` | Máy chủ SMTP và cổng gửi thư | Cấu hình theo nhà cung cấp email |
| `SMTP_USERNAME`, `SMTP_PASSWORD` | Tài khoản SMTP và mật khẩu ứng dụng | Lưu cục bộ trong `.env` |
| `SMTP_FROM`, `SMTP_STARTTLS` | Địa chỉ gửi và bật mã hóa STARTTLS | `SMTP_STARTTLS=true` |
| `PASSWORD_RESET_EMAIL` | Email nhận thông tin tài khoản và mã đặt lại mật khẩu | `phungvinhhai@gmail.com` |

Tham khảo `.env.example` để sao chép cấu hình ban đầu. Tên biến phải khớp với cách ứng dụng đọc cấu hình trong `app/core/config.py`.

## Bảo mật và giới hạn nghiệp vụ

- Không đưa `SECRET_KEY`, API key hoặc thông tin xác thực thật vào repository.
- Không sử dụng tài khoản demo trong môi trường production.
- Chỉ bật chế độ phát triển và auto-reload khi chạy cục bộ.
- AI chỉ hỗ trợ thông tin; kết luận đăng kiểm phải do người có thẩm quyền quyết định.
- Trước khi triển khai thực tế, cần đánh giá bảo mật, kiểm soát truy cập, xác thực dữ liệu, logging, giám sát và xử lý lỗi.

## Hướng phát triển

Một số hạng mục có thể cân nhắc cho các phiên bản tiếp theo:

- Chuyển SQLite sang PostgreSQL hoặc MySQL khi cần triển khai nhiều người dùng.
- Tách cấu hình development và production.
- Bổ sung kiểm thử cho các luồng nghiệp vụ và quyền truy cập.
- Thêm rate limiting, logging và monitoring.
- Hoàn thiện quy trình migration cơ sở dữ liệu.
- Xây dựng tài liệu triển khai và quy trình CI.
