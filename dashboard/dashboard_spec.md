# Đặc tả Dashboard Hành Động — dùng để dựng workbook v1/v2

File Excel phải có các sheet: `Dashboard`, `Workflow`, `Roadmap`, `Evidence`.

## Dashboard v2 — bảng chỉ số bắt buộc

| Metric | Level | Baseline | Target | Data source | Owner | Khi chỉ số xấu |
|---|---|---|---|---|---|---|
| Tỷ lệ quyết định AI có evidence hợp lệ | Product | 0% theo thiết kế hiện tại; xác nhận trên 50 CV pilot | ≥95% | Output audit + eval log | Nguyễn Trọng Nam | Tắt auto-triage, review 100%, phân tích citation/prompt |
| Thời gian sơ loại đến quyết định Tier | Workflow | 3–5 phút/CV thủ công | ≤90 giây/CV | Timestamp upload → decision | Nguyễn Đào Nam Hải | Quan sát bước gây chậm, tối ưu UX/batch, không mở rộng |
| Tỷ lệ đồng thuận với rubric HR | Product | 86% / 100 CV benchmark | ≥90% / golden set 200 CV | Eval pipeline + nhãn HR | Nguyễn Trọng Nam | Freeze rollout, rà rubric và false negative |
| Tỷ lệ CV bị làm lại sau QA | Workflow | Đo tuần 1 pilot | ≤10% | QA sample log | Phùng Hồng Phước | QA 100% nhóm lỗi, sửa schema/rule |
| Tỷ lệ PII bị gửi ra ngoài pipeline masking | Risk | Chưa có log hoàn chỉnh | 0 trường hợp | API request log + masking test | Phùng Hồng Phước | Dừng kết nối model, kiểm tra incident |

## Dashboard v1 — bản trước phản biện

| Metric | Level | Baseline | Target | Data source | Owner | Khi chỉ số xấu |
|---|---|---|---|---|---|---|
| Số CV được AI xử lý | Activity | Đo tuần 1 | 50 CV pilot | Agent run log | Nguyễn Trọng Nam | Tìm lỗi upload hoặc onboarding |
| Thời gian xử lý trung bình/CV | Workflow | 3–5 phút thủ công | <15 giây AI output | Agent log + tự khai | Phùng Hồng Phước | Kiểm tra latency và batch |
| Độ chính xác tương đồng HR | Product | 86% / 100 CV | ≥85% | Benchmark nội bộ | Nguyễn Trọng Nam | Rà prompt và dữ liệu test |
| Chi phí/CV | Product | 0.015 USD/CV | ≤0.02 USD/CV | API usage log | Phùng Hồng Phước | Giảm token hoặc dùng fallback |

## Workflow TO-BE

1. Recruiter nhập JD và khóa rubric phiên bản.
2. Hệ thống loại bỏ PII trước khi gọi model.
3. Agent trích xuất tiêu chí, phân loại Tier và trả evidence cho từng kết luận.
4. Nếu confidence < 0.75, thiếu evidence, tiêu chí mâu thuẫn hoặc có tín hiệu nhạy cảm → `Needs human review`.
5. QA kiểm tra mẫu; recruiter duyệt cuối và có thể sửa Tier.
6. Hệ thống ghi timestamp, kết quả, lý do sửa và lỗi để đưa vào eval pipeline.

## Roadmap gate

| Giai đoạn | Gate |
|---|---|
| 0–30 ngày | 1 JD/50 CV; rubric được HR xác nhận; masking đạt; log và golden set sẵn sàng |
| 31–60 ngày | Evidence ≥95%; agreement ≥90%; median time ≤90 giây/CV; rework ≤10% |
| 61–90 ngày | Hai chu kỳ liên tiếp đạt gate; governance và owner vận hành được chốt; sau đó mới cân nhắc mở rộng |

## Evidence register

| Evidence | Loại | Nội dung dùng trong chẩn đoán | Nguồn |
|---|---|---|---|
| Benchmark 100 CV | Benchmark nội bộ | 86% tương đồng HR; false negative <5%; chi phí khoảng 0.015 USD/CV | Báo cáo Day 27 của dự án |
| Thời gian sơ loại thủ công | Quan sát/ước lượng workflow | 3–5 phút/CV; cho thấy giá trị năng suất cần đo bằng timestamp | Báo cáo Day 27 |
| Team health | Đánh giá nhóm | Chất lượng AI 3.3/5; thiếu eval pipeline là gap ưu tiên | Báo cáo Day 27 |
