# Memo quyết định — Auto-CV Screener Agent

**Nhóm:** Track1_ProMax  
**Ngày lập:** 03/09/2026  
**Quyết định:** **Sửa rồi tiếp tục pilot hẹp; chưa rollout rộng**

## 1. Vấn đề và nguyên nhân gốc

Auto-CV Screener Agent đã có MVP và benchmark nội bộ, nhưng chưa trở thành một bước mặc định trong workflow sơ loại CV. Recruiter vẫn đọc và kiểm tra thủ công gần như toàn bộ hồ sơ vì kết quả AI chưa luôn có evidence, chưa có quy tắc confidence/handoff và chưa có log phản hồi thống nhất.

Hai nguyên nhân gốc:

1. Workflow người–AI và trách nhiệm cuối chưa được thiết kế rõ: AI có thể phân loại nhưng recruiter chưa có một human gate, ngưỡng chuyển người và trạng thái “không đủ bằng chứng”.
2. Độ tin cậy/readiness chưa đủ: rubric HR, golden set, eval pipeline, masking PII và owner chất lượng chưa được gắn vào vận hành thường ngày.

## 2. Framework đã dùng và bằng chứng

- **Mollick:** AI hỗ trợ tìm, trích xuất, tóm tắt và xếp Tier; recruiter giữ quyền duyệt, xử lý ngoại lệ và chịu trách nhiệm kết quả cuối.
- **Gartner-Lite:** Direction đạt vì bài toán giảm thời gian sơ loại đã rõ; Readiness/Absorption chưa đạt do thiếu bộ test chuẩn, data owner, governance và vòng phản hồi lỗi.
- **ADKAR:** điểm nghẽn chính ở Desire/Ability/Reinforcement — recruiter chưa đủ tin để thay đổi hành vi và chưa có cơ chế học từ lỗi.
- **Bằng chứng:** báo cáo Day 27 của cùng dự án ghi nhận benchmark nội bộ 100 CV đạt 86% tương đồng, false negative dưới 5%, chi phí khoảng 0.015 USD/CV; team health đánh giá chất lượng AI 3.3/5 và xác định thiếu eval pipeline là vấn đề ưu tiên. Mốc thủ công hiện tại là khoảng 3–5 phút/CV.

## 3. Thay đổi sau phản biện chéo

Phản biện chéo theo bốn trục đã tạo ra các thay đổi sau:

1. **V1 → V2:** bỏ “số CV xử lý” làm metric chính; thêm product metric “tỷ lệ quyết định có evidence hợp lệ” và “tỷ lệ đồng thuận với rubric HR”.
2. **V1 → V2:** đổi thời gian xử lý từ average tự khai sang median lấy từ timestamp workflow log.
3. **V1 → V2:** bổ sung human gate, ngưỡng confidence 0.75, trạng thái `Needs human review`, QA sample và stop rule cho thiếu citation/PII.

## 4. Quyết định

**Sửa rồi tiếp tục pilot hẹp trên một vị trí và tối đa 50 CV trong vòng hai tuần; chưa rollout rộng.**

Điều kiện này giữ lại cơ hội chứng minh giá trị nhưng không biến kết quả benchmark thành quyền tự động loại ứng viên. Chỉ được đề xuất mở rộng khi chất lượng, tốc độ, rủi ro và khả năng bàn giao cùng đạt ngưỡng trong dashboard v2.

## 5. Lý do, bước tiếp theo và owner

### Lộ trình 30–60–90 ngày

| Giai đoạn | Mục tiêu/gate | Việc chính | Owner | Dấu hiệu hoàn thành |
|---|---|---|---|---|
| 0–30 ngày | Chứng minh vấn đề và khóa phạm vi | Chọn 1 JD, tối đa 50 CV; chốt rubric; hoàn thiện masking; ghi baseline thời gian/evidence; phân quyền và data owner | Hải (rubric), Phước (PII/access), Nam (baseline/eval) | Có AS-IS/TO-BE được HR xác nhận; log đủ timestamp; không có PII ra ngoài; golden set và ngưỡng gate được chốt |
| 31–60 ngày | Chứng minh chất lượng và hành vi | Bật citation; QA mẫu tối thiểu 20%; recruiter dùng human gate; theo dõi agreement, evidence, median time, rework; ghi feedback lỗi | Nam (eval), Hải (adoption), Phước (pipeline) | Evidence ≥95%, agreement ≥90%, median ≤90 giây/CV, rework ≤10% hoặc có kế hoạch sửa được HR chấp nhận |
| 61–90 ngày | Quyết định mở rộng | So với target; rà governance; chốt owner vận hành; thử thêm một vị trí chỉ khi gate đạt | Hải (quyết định nghiệp vụ), Phước (governance), Nam (quality report) | Đạt tất cả gate trong hai chu kỳ liên tiếp; quyết định mở rộng/sửa/dừng được ghi trong release note |

**Bước tiếp theo gần nhất:** Hải chốt rubric với HR; Phước chạy test masking và quyền truy cập; Nam dựng eval log cho 50 CV pilot. Không đưa dữ liệu CV thật chứa PII vào repo công khai.

