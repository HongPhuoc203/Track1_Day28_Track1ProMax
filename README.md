# Day28_Track01_Track1_ProMax

## 1. Thành viên và đóng góp

| Họ tên | MSSV | Phần phụ trách | Góp ý đã đưa cho nhóm bạn |
|---|---|---|---|
| Nguyễn Đào Nam Hải | 2A202601037 | Product/domain lead; khóa phạm vi, rubric HR, ADKAR và memo | Nhóm 05: chỉ số số CV xử lý chỉ là activity; cần thêm tỷ lệ đồng thuận với HR và tỷ lệ output có bằng chứng |
| Phùng Hồng Phước | 2A202601215 | Tech lead; Mollick, kiến trúc tin cậy, PII masking và workflow TO-BE | Nhóm 05: TO-BE phải có human gate, ngưỡng chuyển người và hành động khi AI không chắc chắn |
| Nguyễn Trọng Nam | 2A202601529 | AI/Data engineer; Gartner-Lite, eval pipeline, dashboard và roadmap | Nhóm 05: baseline phải truy được về log/eval set; dùng median thay vì chỉ dùng average để giảm ảnh hưởng outlier |

**Nhóm phản biện chéo:** Nhóm 05. Hai góp ý chính được đưa vào bản v2: (1) thay activity metric bằng metric chất lượng có bằng chứng; (2) bổ sung human gate, ngưỡng chuyển người và stop rule.

## 2. Phạm vi

- **Sản phẩm AI:** Auto-CV Screener Agent — AI Agent phân tích mức độ phù hợp giữa CV và Job Description (JD), phân loại Tier 1/2/3 và giải thích bằng bằng chứng trong CV.
- **Nhóm người dùng chính:** Recruiter/HR trực tiếp sơ loại CV trong một đợt tuyển dụng.
- **Bốn workflow:** (1) cấu hình tiêu chí từ JD; (2) lọc CV sơ loại; (3) tạo shortlist kèm lý do; (4) chuyển hồ sơ biên/thiếu bằng chứng cho recruiter duyệt.
- **Vấn đề quan sát được:** MVP đã có benchmark nội bộ nhưng recruiter vẫn đọc và kiểm tra thủ công gần như toàn bộ CV vì output chưa tạo đủ niềm tin, chưa có bước bàn giao và chưa có quy tắc xử lý trường hợp AI không chắc chắn.

## 3. Nguyên nhân gốc

1. **Quy trình và trách nhiệm người–AI chưa được thiết kế thành một workflow chính thức.** Mollick cho thấy AI phù hợp với việc đọc, tóm tắt và tạo nháp; recruiter phải giữ quyền duyệt cuối, xử lý ngoại lệ và chịu trách nhiệm. Bằng chứng: mô tả MVP yêu cầu recruiter bấm duyệt cuối cùng, nhưng bản hiện tại chưa có human gate, ngưỡng chuyển người và log lý do; vì vậy HR quay lại kiểm tra thủ công.
2. **Độ tin cậy và khả năng hấp thụ chưa đủ.** Gartner-Lite: Direction đạt; Readiness và Absorption còn thiếu ở bộ dữ liệu đánh giá chuẩn, rubric HR được xác nhận, PII masking và owner chất lượng. ADKAR xác định điểm nghẽn chính ở Desire/Ability/Reinforcement: HR chưa biết lúc nào có thể tin output và chưa có vòng phản hồi khi AI sai. Bằng chứng: benchmark nội bộ đạt 86% tương đồng, team health đánh giá chất lượng AI chỉ 3.3/5 và báo cáo Day 27 ghi nhận thiếu eval pipeline chuẩn.

**Kết luận chẩn đoán:** sửa kiến trúc tin cậy và workflow trước khi tìm cách tăng số lượt dùng hoặc rollout rộng.

## 4. Cách làm mới

### AS-IS

`Nhận CV → đọc thủ công → đối chiếu JD → tự ghi chú → hỏi ý kiến khi phân vân → shortlist`

- AI nằm ngoài bước làm việc chính thức.
- Không bắt buộc có bằng chứng trích từ CV cho từng tiêu chí.
- Recruiter vừa kiểm tra, vừa quyết định nhưng không có ngưỡng chuyển ca khó.
- Không có feedback loop chuẩn cho trường hợp sai hoặc thiếu thông tin.

### TO-BE

`Nhập JD → khóa rubric và tiêu chí không được dùng → mask PII → AI phân loại + trích bằng chứng → QA mẫu → recruiter duyệt / chuyển người → ghi feedback`

Ba thay đổi bắt buộc:

1. **Nguồn kiểm chứng:** mỗi kết luận phải trỏ về đoạn/kỹ năng/kinh nghiệm trong CV và phiên bản rubric/JD đang dùng; thiếu bằng chứng thì trạng thái là `Needs human review`.
2. **Người chịu trách nhiệm:** recruiter là người giữ quyền duyệt Tier cuối; Hải là owner nghiệp vụ/rubric; Nam là owner chất lượng eval; Phước là owner pipeline, quyền truy cập và masking PII.
3. **Cách xử lý khi AI không chắc chắn:** không tự động loại; chuyển recruiter nếu confidence dưới 0.75, thiếu trích dẫn, tiêu chí mâu thuẫn hoặc có tín hiệu nhạy cảm; ghi lý do vào log để cập nhật bộ test và rubric.

### Phân chia việc theo Mollick

| Vùng | Việc | Kiểm soát |
|---|---|---|
| Người giữ quyền | Duyệt shortlist, xử lý ngoại lệ, quyết định cuối | Recruiter; HR Lead giám sát rubric |
| AI hỗ trợ, người kiểm | Trích xuất kỹ năng, tóm tắt kinh nghiệm, xếp Tier, tạo lý do | Output phải có evidence; recruiter kiểm tra trước khi dùng |
| AI tự động có kiểm soát | Mask PII, kiểm tra schema, gắn cờ thiếu evidence, ghi log | Rule-based check; lỗi thì dừng job và chuyển người |

## 5. Chỉ số ra quyết định

| Chỉ số | Loại | Baseline | Target | Nguồn | Owner | Khi chỉ số xấu |
|---|---|---:|---:|---|---|---|
| Tỷ lệ quyết định AI có evidence hợp lệ | Product-level / chất lượng | 0% theo thiết kế hiện tại chưa bắt buộc evidence; xác nhận lại trên 50 CV đầu pilot | ≥95% | Output audit + eval log | Nguyễn Trọng Nam | Tắt auto-triage, bắt buộc recruiter review 100%, phân tích lỗi citation/prompt |
| Thời gian sơ loại đến quyết định Tier | Workflow-level / năng suất | 3–5 phút/CV thủ công | ≤90 giây/CV ở pilot | Timestamp upload → decision trong workflow log | Nguyễn Đào Nam Hải | Quan sát lại bước gây chậm, giảm phạm vi, tối ưu batch/UX; không mở rộng |
| Tỷ lệ đồng thuận với rubric HR | Product-level / giá trị | 86% trên benchmark nội bộ 100 CV | ≥90% trên golden set 200 CV | Eval pipeline so với nhãn HR | Nguyễn Trọng Nam | Freeze rollout, rà lại rubric và nhóm lỗi false negative |
| Tỷ lệ CV bị làm lại sau QA | Workflow-level / kiểm soát | Đo tuần 1 pilot | ≤10% | QA sample log | Phùng Hồng Phước | Tăng QA lên 100% nhóm lỗi, sửa rule/schema và cập nhật hướng dẫn recruiter |
| Tỷ lệ PII bị gửi ra ngoài pipeline masking | Risk / governance | Chưa có bằng chứng log hoàn chỉnh | 0 trường hợp | API request log + masking test | Phùng Hồng Phước | Dừng kết nối model, xoay sang dữ liệu đã mask, kiểm tra incident và quyền truy cập |

Các chỉ số được ưu tiên từ tầng 3 đến tầng 5; số login và số CV chạy chỉ dùng để theo dõi hoạt động, không dùng làm căn cứ rollout.

## 6. Quyết định

**SỬA rồi TIẾP TỤC PILOT HẸP, chưa rollout rộng.** Lý do: benchmark 86% và tốc độ tiềm năng tốt nhưng độ tin cậy, human handoff và governance chưa đủ để tự động loại ứng viên. Hai thay đổi chính so với v1 là thay metric “số CV xử lý” bằng “tỷ lệ quyết định có evidence hợp lệ/đồng thuận rubric”, và bổ sung human gate + stop rule theo confidence, citation và PII.

### Đầu ra trong repo

- [Dashboard v2](./dashboard/dashboard_hanh_dong_v2.xlsx): bản sau phản biện chéo.
- [Memo quyết định](./memo/memo_quyet_dinh.md): năm phần bắt buộc của đề bài.
- [Dashboard v1](./v1/dashboard_hanh_dong_v1.xlsx): bản trước phản biện để đối chiếu thay đổi.

> Dữ liệu trong bộ hồ sơ là dữ liệu minh hoạ/ẩn danh phục vụ lab; không chứa CV, tên ứng viên, email, số điện thoại hoặc dữ liệu doanh nghiệp nhạy cảm.

## Checklist trước khi nộp

- [x] README có bảng thành viên gồm họ tên, MSSV, phần phụ trách, góp ý cho nhóm bạn.
- [x] Phạm vi gồm đúng 1 sản phẩm, 1 nhóm người dùng, 4 workflow.
- [x] Có 2 nguyên nhân gốc, framework phù hợp và bằng chứng.
- [x] Có AS-IS/TO-BE, nguồn kiểm chứng, owner và cách xử lý khi AI sai.
- [x] Có roadmap 30–60–90 và cổng quyết định.
- [x] Dashboard v1 và v2 có product metric, workflow metric, baseline, target, source, owner, hành động khi xấu.
- [x] Có ít nhất 2 thay đổi sau phản biện và quyết định sửa/tiếp tục pilot.
- [ ] Trên GitHub: đổi tên repo thành `Day28_Track01_Track1_ProMax` (đang là `Track1_Day28_Track1ProMax`, sai thứ tự theo mẫu `Day28_Track01_<Ten_Nhom>`), bật Public, giữ branch `main`, rồi dán cùng một link vào LMS.
