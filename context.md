Day 28 Track 01 - AI Adoption & Change Management — Dashboard Hành Động Cho Áp Dụng AI v2

Focus

Notes
0

Support

English

2

Back

Next
1. Thuật ngữ cần biết
Lab map

Read before you begin
120 min
Intermediate
Đã mua công cụ, nhưng công việc vẫn như cũ. Nhân viên dùng thử vài lần rồi quay lại cách làm cũ, quản lý nhìn thấy số lượt dùng nhưng chưa thấy giá trị. Lab này đi từ triệu chứng đó xuống nguyên nhân gốc, rồi ra một Dashboard Hành Động đủ rõ để trả lời: tiếp tục, sửa hay dừng.

What is this Lab about?
Năm mức độ ứng dụng AI: Usage, Pilot, Deployment, Adoption, Normalization

Năm câu hỏi chẩn đoán: workflow, con người, mức sẵn sàng, độ tin cậy, cách đo lường

ADKAR để tìm điểm nghẽn ở người dùng thay vì mặc định là chống đối

Gartner-Lite: hướng đi, mức sẵn sàng, khả năng hấp thụ — dùng trước khi mở rộng

Mollick: phân chia việc giữa người giữ quyền, AI hỗ trợ và AI tự động có kiểm soát

Kiến trúc tin cậy: nguồn, trích nguồn, QA mẫu, chuyển người, phản hồi

Năm tầng đo lường từ mức sử dụng đến giá trị nghiệp vụ

Lộ trình 30–60–90 là ba cổng quyết định dựa trên bằng chứng, không phải lịch triển khai

Sử dụng nhiều không đồng nghĩa với đã áp dụng — ứng dụng bắt đầu khi công việc, trách nhiệm và cách kiểm soát thay đổi
Ít dùng thường chỉ là triệu chứng; nguyên nhân gốc hay nằm ở độ tin cậy và quy trình
Chẩn đoán đúng nguyên nhân → mới chọn được giải pháp đúng, thay vì mặc định mở lớp đào tạo
Workflow được thiết kế lại phải chỉ ra ba thứ: nguồn kiểm chứng, người chịu trách nhiệm, cách xử lý khi AI không chắc chắn
Mỗi chỉ số phải gắn với một quyết định; chỉ số không dẫn tới hành động là chỉ số vô nghĩa
Lộ trình 30–60–90 chỉ chuyển giai đoạn khi bằng chứng đã đủ
How does the Lab run?
0–40 phút
Nhóm
Chặng 1 — Chọn và chẩn đoán
Khoá phạm vi một sản phẩm AI, một nhóm người dùng và 2–4 quy trình; chạy Gartner-Lite, Mollick và ADKAR; chốt 1–2 nguyên nhân gốc kèm ít nhất một bằng chứng.

40–80 phút
Nhóm
Chặng 2 — Thiết kế bản v1
Vẽ lại quy trình AS-IS và TO-BE, chọn giải pháp theo đúng nguyên nhân, lập lộ trình 30–60–90 ngày và điền Dashboard Hành Động bản v1.

80–120 phút
Nhóm khác + nhóm chủ
Chặng 3 — Kiểm tra chéo và hoàn thiện
Đổi nhóm phản biện theo bốn trục, ghi ít nhất hai góp ý cụ thể, sửa thành bản v2, chốt quyết định tiếp tục / sửa / dừng và nộp.

What will you have at the end?
Phạm vi đã khoá: 1 sản phẩm AI, 1 nhóm người dùng chính, 2–4 quy trình
1–2 nguyên nhân gốc có căn cứ, phân biệt rõ với triệu chứng
Workflow AS-IS / TO-BE kèm nguồn kiểm chứng, người chịu trách nhiệm và cách xử lý khi AI sai
Lộ trình 30–60–90 ngày với owner và dấu hiệu hoàn thành từng giai đoạn
Dashboard Hành Động v2: tối thiểu 1 product metric và 1 workflow metric, đủ baseline, target, nguồn dữ liệu, người phụ trách và hành động khi chỉ số xấu
Memo quyết định ngắn: tiếp tục, sửa hay dừng, kèm lý do và bước tiếp theo
No need to worry

Không cần số liệu đẹp và không cần đọc hết tài liệu tham khảo. Cái được chấm là logic: phạm vi có cụ thể không, nguyên nhân có căn cứ không, và chỉ số có dẫn tới một quyết định không.

Thuật ngữ gốc	Bản chất khái niệm	Minh hoạ trực quan
Usage	Một cá nhân tự dùng riêng, chưa ai khác biết	Một nhân viên tự mở ChatGPT viết email, không ai trong quy trình biết việc đó
Pilot	Một nhóm thử một use case trong phạm vi hẹp	Phòng vận hành thử trợ lý tra cứu trong 2 tuần
Deployment	Công cụ đã được cấp phát và IT cho phép dùng	Tài khoản đã tạo cho 200 người — nhưng công việc chưa đổi
Adoption	Workflow, owner và handoff đã thay đổi — đây mới là điểm bắt đầu của ứng dụng thật	Bước "tra cứu" trong quy trình đã ghi rõ: hỏi AI → xem nguồn → người kiểm chứng
Normalization	AI trở thành cách làm việc mặc định, không cần nhắc	Không ai còn hỏi "có nên dùng AI cho việc này không"
Triệu chứng vs nguyên nhân gốc	"Ít người dùng" là thứ quan sát được; nguyên nhân thường nằm ở độ tin cậy và quy trình	Người dùng ít quay lại vì câu trả lời không có nguồn và ngày cập nhật — không phải vì "chưa được đào tạo"
ADKAR	Năm điểm nghẽn có thể xảy ra ở người dùng: Awareness, Desire, Knowledge, Ability, Reinforcement	Ngại tin câu trả lời vì không thấy nguồn = nghẽn ở Desire, mở lớp đào tạo không giải quyết được
Gartner-Lite	Ba câu hỏi trước khi mở rộng: Direction (hướng đi rõ chưa), Readiness (dữ liệu, quyền, governance, kỹ năng, ngân sách đủ chưa), Absorption (có owner, hỗ trợ vận hành, cơ chế học từ lỗi chưa)	Hướng đi ĐẠT nhưng dữ liệu và governance THIẾU → pilot nhỏ để sửa readiness, chưa rollout rộng
Mollick — phân chia việc	Ba vùng: Người giữ quyền (phê duyệt cuối, ngoại lệ, chịu trách nhiệm) · AI hỗ trợ, người kiểm (AI tìm/tóm tắt/tạo nháp) · AI tự động (chỉ khi tác vụ lặp lại, rủi ro thấp, có tiêu chí kiểm tra)	AI tìm nguồn và tóm tắt; người kiểm chứng và chịu trách nhiệm kết quả cuối
Kiến trúc tin cậy	Chuỗi cơ chế để khi AI sai thì hệ thống phát hiện, chuyển giao và học lại: nguồn → trích nguồn → QA mẫu → chuyển người → phản hồi	Câu trả lời kèm nguồn và ngày cập nhật; có cách báo lỗi rõ ràng
Năm tầng đo lường	Sử dụng → Hành vi → Năng suất → Chất lượng & độ tin cậy → Giá trị. Theo dõi từ dưới lên, ra quyết định dựa trên giá trị	Đếm login là tầng 1; "tỷ lệ hoàn thành không cần QA làm lại" là tầng 4
Activity metric vs decision metric	Chỉ số dễ đo nhưng không đủ để ra quyết định, so với chỉ số đủ mạnh để quyết	Dễ đo: số login, số câu hỏi, thời gian tiết kiệm tự khai. Đủ mạnh: thời gian xử lý từ log tác vụ, tỷ lệ câu trả lời có nguồn kiểm chứng
Baseline · Target · Source · Owner	Bốn thứ bắt buộc đi kèm mọi chỉ số, cộng thêm hành động khi chỉ số xấu	"Thời gian xử lý · đo hiện trạng · mục tiêu nhóm · log tác vụ · chủ quy trình · xem lại cách làm"
Product-level vs workflow-level metric	Một chỉ số cho cả sản phẩm AI, một chỉ số cho từng quy trình cụ thể	Product: tỷ lệ câu trả lời có nguồn. Workflow: thời gian hoàn thành một lượt tra cứu
AS-IS / TO-BE	Quy trình hiện tại và quy trình sau khi thiết kế lại, vẽ cạnh nhau để thấy chỗ nào thật sự đổi	TRƯỚC: tìm file → hỏi người → dùng tài liệu. SAU: hỏi AI → xem nguồn → kiểm tra → dùng / báo lỗi
Gate 30–60–90	Ba cổng quyết định dựa trên bằng chứng, không phải lịch triển khai cứng	Chỉ chuyển sang giai đoạn 2 khi đã có mốc ban đầu và data owner
VLearn Codelabs | Học AI thực chiến qua Lab
Beta
0 / 10
used queries
1






Day 28 Track 01 - AI Adoption & Change Management — Dashboard Hành Động Cho Áp Dụng AI v2

Focus

Notes
0

Support

English

2

Back

Next
2. Mục tiêu & đầu ra
2.1 Bốn năng lực
Phân biệt usage, deployment và adoption.
Chẩn đoán điểm nghẽn bằng năm câu hỏi thực tế.
Thiết kế lại workflow và kế hoạch 30–60–90 ngày.
Xây dashboard đo từ mức sử dụng đến chất lượng và giá trị.
2.2 Mốc cần nhớ trước khi làm bài
Việc ứng dụng bắt đầu khi công việc, trách nhiệm và cách kiểm soát đã thay đổi.

Muốn nói là "đã ứng dụng", phải nhìn thấy đủ năm thứ:

#	Yếu tố	Nội dung
1	Công việc	AI xuất hiện trong một bước công việc cụ thể
2	Trách nhiệm	Có người chịu trách nhiệm cho kết quả cuối
3	Kiểm soát	Có kiểm tra, nguồn kiểm chứng và cách xử lý khi AI sai
4	Hành vi	Người dùng biết khi nào nên dùng và không nên dùng AI
5	Đo lường	Có mốc ban đầu, mục tiêu và hành động khi chỉ số xấu
2.3 Bằng chứng đầu ra
Bạn hoàn thành khi nhóm nộp Dashboard Hành Động Cho Áp Dụng AI v2 kèm memo quyết định ngắn, trong đó:

Phạm vi đã khoá: 1 sản phẩm AI · 1 nhóm người dùng chính · 2–4 quy trình.
1–2 nguyên nhân gốc có framework và ≥1 bằng chứng đi kèm.
Giải pháp + lộ trình 30–60–90 ngày có owner từng giai đoạn.
≥1 product metric và ≥1 workflow metric, mỗi chỉ số đủ baseline, target, nguồn dữ liệu, người phụ trách và hành động khi chỉ số xấu.
≥2 thay đổi so với bản v1 sau khi kiểm tra chéo.
Một quyết định rõ: tiếp tục / sửa / dừng.
VLearn Codelabs | Học AI thực chiến qua Lab
Beta
0 / 10
used queries
1

Day 28 Track 01 - AI Adoption & Change Management — Dashboard Hành Động Cho Áp Dụng AI v2

Focus

Notes
0

Support

English

2

Back

Next
3. Chuẩn bị
3.1 Điều kiện tối thiểu
Điều kiện	Ghi chú
Làm theo nhóm	Chặng 3 bắt buộc đổi nhóm phản biện chéo
Một tình huống thực tế — sản phẩm hoặc công cụ AI đã có nhưng chưa dùng hiệu quả	Lấy từ hoạt động mở đầu của lớp hoặc từ chính doanh nghiệp của nhóm. Không dùng case tưởng tượng
Ít nhất một căn cứ cho phần chẩn đoán	1 case tham khảo · 1 quan sát, log hoặc phỏng vấn ngắn · dấu hiệu xuất hiện trong workflow
Mẫu Dashboard Hành Động (§4.5) và mẫu memo (§6.2)	Điền trực tiếp, không cần công cụ đặc biệt
3.2 Hoạt động mở đầu — 20 phút, không cần dùng AI
Đây là đầu vào cho toàn bộ lab:

Cá nhân — viết 1–2 tình huống AI đã có nhưng chưa được dùng hiệu quả.
Chia sẻ — mỗi người kể một tình huống; tránh đưa giải pháp quá sớm.
Gom nhóm — nhóm các tình huống thành 3–5 mẫu vấn đề lặp lại.
Output: danh sách thách thức thực tế của nhóm.

3.3 Ví dụ xuyên suốt — trợ lý AI tra cứu tài liệu nội bộ
Tình huống minh hoạ, không phải số liệu của một doanh nghiệp cụ thể.

Hiện trạng	Bài toán
Công cụ đã triển khai nhưng nhân viên ít quay lại	Làm sao để AI trở thành một bước đáng tin cậy trong workflow tra cứu?
Câu trả lời không chỉ rõ nguồn và ngày cập nhật	
Người dùng vẫn tìm file hoặc hỏi đồng nghiệp	Không bắt đầu bằng câu hỏi "làm sao tăng usage?"
Dashboard chỉ đếm login và số câu hỏi	
3.4 Tài liệu tự học
Đọc phần giới thiệu trước; quay lại tài liệu sâu khi làm bài. Mỗi nhóm chỉ chọn 1–2 nguồn trực tiếp liên quan đến nguyên nhân gốc của mình.

Nguồn	Đọc khi nào	Địa chỉ
Prosci — ADKAR Model	Cần tìm điểm nghẽn ở người dùng	prosci.com/methodology/adkar
Gartner — AI Maturity Model	Đánh giá readiness và governance	gartner.com · tìm: AI Maturity Model
Mollick — Jagged Frontier	Cần phân chia công việc người–AI	oneusefulthing.org · tìm: Centaurs and Cyborgs
NIST AI RMF	Khung quản trị rủi ro AI	airc.nist.gov · mở: AI RMF
NIST Playbook	Gợi ý hành động triển khai	airc.nist.gov
Google PAIR Guidebook v2	Thiết kế AI lấy người dùng làm trung tâm	pair.withgoogle.com
Gartner-Lite là khung rút gọn dùng trong bài — xem lại §4.2 trước khi áp dụng, đừng dùng thẳng mô hình Gartner đầy đủ.

VLearn Codelabs | Học AI thực chiến qua Lab
Beta
0 / 10
used queries
1



Day 28 Track 01 - AI Adoption & Change Management — Dashboard Hành Động Cho Áp Dụng AI v2

Focus

Notes
0

Support

English

2

Back

Next
4. Thực hành
120 phút, ba chặng, mỗi chặng có đầu ra rõ ràng. Checkpoint ở phút 40 và phút 80: giảng viên kiểm tra phạm vi và logic chỉ số.

Chặng	Thời gian	Nội dung	Đầu ra
1	0–40'	Chọn và chẩn đoán	Phạm vi + 1–2 nguyên nhân gốc có bằng chứng
2	40–80'	Thiết kế bản v1	Workflow mới + lộ trình 30–60–90 + dashboard v1
3	80–120'	Kiểm tra chéo và hoàn thiện	Dashboard v2 + memo quyết định
Dùng đúng framework ở đúng bước:

Bước	Framework	Trả lời câu hỏi
1. Khoá phạm vi	—	1 sản phẩm AI, 2–4 quy trình, người dùng chính
2. Đánh giá sẵn sàng	Gartner-Lite	Hướng đi, mức sẵn sàng, khả năng hấp thụ
3. Phân chia công việc	Mollick	Phần nào cho người, phần nào AI hỗ trợ, phần nào tự động có kiểm soát
4. Xử lý thay đổi	ADKAR	Người dùng kẹt ở đâu → giải pháp → lộ trình → chỉ số ra quyết định
4.1 Bước 1 — Chọn một vấn đề đủ cụ thể (khoảng 10 phút)
Phải xác định đủ bốn thứ:

1 sản phẩm hoặc công cụ AI cụ thể
1 nhóm người dùng chính
2–4 quy trình liên quan
1 vấn đề có thể quan sát hoặc đo được
Ví dụ đủ rõ:

Product:  trợ lý tra cứu tài liệu nội bộ
User:     nhân viên vận hành
Workflow: tìm → tóm tắt → kiểm chứng
Problem:  vẫn quay lại tìm file thủ công
Copy
Kết quả mong đợi: một dòng phạm vi viết được thành câu, không nói chung chung về "AI trong công ty".

4.2 Bước 2 — Chẩn đoán trước khi chọn giải pháp (khoảng 30 phút)
Dùng 2–3 framework và ít nhất một bằng chứng. Chốt 1–2 nguyên nhân gốc.

Năm câu hỏi mở đầu
#	Trục	Câu hỏi
01	Workflow	AI có nằm trong công việc thật không?
02	Con người	Người dùng thiếu động lực, kiến thức hay khả năng?
03	Sẵn sàng	Dữ liệu, quyền truy cập và governance đã đủ chưa?
04	Tin cậy	AI sai thì phát hiện, kiểm tra và xử lý thế nào?
05	Đo lường	Chúng ta đang đo activity hay giá trị?
Áp dụng vào ví dụ trợ lý tra cứu:

Trục	Nhận định	Mức
Workflow	AI nằm ngoài bước tra cứu chính thức; chưa có bàn giao	GỐC
Con người	Người dùng chưa biết khi nào có thể tin câu trả lời	Liên quan
Sẵn sàng	Nguồn tài liệu thiếu người phụ trách và lịch cập nhật	Liên quan
Tin cậy	Không có trích nguồn, kiểm tra mẫu hoặc cách báo lỗi	GỐC
Đo lường	Chỉ đo lượt dùng; chưa đo thời gian, làm lại hay chất lượng	Liên quan
Kết luận mẫu: sửa độ tin cậy và quy trình trước khi tìm cách tăng mức sử dụng.

Gartner-Lite — tổ chức đã sẵn sàng chưa?
Trục	Câu hỏi
Direction	Vấn đề, người dùng, giá trị và phạm vi AI đã được xác định chưa?
Readiness	Dữ liệu, quyền truy cập, governance, kỹ năng và ngân sách đã đủ chưa?
Absorption	Có owner, hỗ trợ vận hành và cơ chế học từ lỗi để duy trì cách làm mới không?
Ví dụ trợ lý tra cứu:

Hạng mục	Nhận định	Kết quả
Hướng đi	Mục tiêu rõ: giảm thời gian tìm tài liệu nội bộ	ĐẠT
Dữ liệu	Nguồn tài liệu thiếu người phụ trách và lịch cập nhật	THIẾU
Governance	Quyền truy cập và phạm vi tài liệu chưa thống nhất	THIẾU
Vận hành	Chưa có owner cho chất lượng câu trả lời	THIẾU
Hấp thụ	Người dùng chưa có hỗ trợ và vòng phản hồi lỗi	THIẾU
Kết luận mẫu: pilot nhỏ để sửa readiness; chưa nên rollout rộng.

Mollick — việc chia người–AI đã rõ chưa?
Vùng	Nguyên tắc	Nội dung
Người làm	Giữ quyền quyết định	Phê duyệt cuối, xử lý ngoại lệ, đánh giá rủi ro, chịu trách nhiệm
AI hỗ trợ	AI làm, người kiểm tra	AI tìm kiếm, tóm tắt hoặc tạo bản nháp; người dùng kiểm chứng trước khi dùng
AI tự động	Chỉ với tác vụ rõ	Chỉ tự động khi tác vụ lặp lại, rủi ro thấp và có tiêu chí kiểm tra
Mục đích: tránh giao quá nhiều cho AI, cũng tránh chỉ thêm AI mà không đổi cách chia việc. Nguyên tắc trong ví dụ: AI tăng tốc tìm và tổng hợp; con người kiểm chứng và chịu trách nhiệm.

ADKAR — người dùng đang kẹt ở đâu?
Bước	Nghĩa	Cách xử lý
Awareness	Hiểu vì sao công việc cần thay đổi	Giải thích vấn đề và tác động
Desire	Có lý do để muốn thay đổi	Giảm trở ngại, xử lý nỗi lo
Knowledge	Biết cách làm	Hướng dẫn theo quy trình
Ability	Làm được trong thực tế	Thực hành, hỗ trợ, người dẫn dắt
Reinforcement	Duy trì hành vi mới	Phản hồi, quản lý theo sát, chỉ số phù hợp
Ví dụ trợ lý tra cứu:

Bước	Nhận định	Trạng thái
Awareness	Chưa rõ AI nên dùng cho loại câu hỏi nào	NGHẼN
Desire	Ngại tin câu trả lời vì không thấy nguồn	NGHẼN
Knowledge	Chưa biết cách hỏi và kiểm chứng nguồn	Cần làm
Ability	Chưa thực hành trong quy trình tra cứu thật	Cần làm
Reinforcement	Chưa có phản hồi lỗi và theo dõi hành vi mới	Cần làm
Kết luận mẫu: training là chưa đủ; cần nguồn kiểm chứng, hướng dẫn và hỗ trợ ngay tại workflow.

Bằng chứng — bắt buộc có ít nhất một
1 case hoặc bài học tham khảo
1 quan sát, log hoặc phỏng vấn ngắn
Dấu hiệu xuất hiện trong chính workflow của nhóm
Ba bài học từ tình huống có thật (nhớ bài học thiết kế, không cần nhớ con số): Morgan Stanley — độ tin cậy phải đi trước mở rộng: kiến thức chuyên ngành, đánh giá và tuân thủ đi cùng việc ứng dụng. DWP / GDS — cách đo quyết định độ tin cậy: ước tính thận trọng nhưng có nhóm so sánh đáng tin hơn số liệu tự khai. Klarna / Watson — số liệu nổi bật chưa đủ: khối lượng tự động hoá hoặc mô hình nổi tiếng không thay thế chất lượng, dữ liệu và quy trình.

Kết quả mong đợi (Checkpoint phút 40): phạm vi đã khoá + 1–2 nguyên nhân gốc, mỗi nguyên nhân gắn với framework đã dùng và ≥1 bằng chứng.

4.3 Bước 3 — Thiết kế cách làm mới (khoảng 20 phút)
Vẽ AS-IS / TO-BE. Ví dụ trợ lý tra cứu:

TRƯỚC	SAU
Tìm file — nhiều thư mục	Hỏi AI — theo quy trình
Hỏi người — phụ thuộc kinh nghiệm	Xem nguồn — có nguồn + ngày cập nhật
Dùng tài liệu — khó biết bản mới nhất	Kiểm tra — có người chịu trách nhiệm
Dùng / báo lỗi — cách báo lỗi rõ ràng
Ba thay đổi bắt buộc: nguồn kiểm chứng · người chịu trách nhiệm · cách xử lý khi AI không chắc chắn.

Chọn giải pháp theo đúng nguyên nhân — không mặc định mọi vấn đề đều giải bằng đào tạo:

Nguyên nhân nằm ở	Giải pháp tương ứng
Chia việc người–AI chưa rõ	Mollick — phân chia phần việc, thiết kế bàn giao và người phụ trách
Người dùng	ADKAR — xử lý đúng điểm nghẽn; hướng dẫn và hỗ trợ thực hành
Tổ chức chưa sẵn sàng	Gartner-Lite — đánh giá hướng đi, mức sẵn sàng và khả năng hấp thụ
Độ tin cậy	Kiểm soát — đánh giá, trích nguồn, kiểm tra mẫu và cách báo lỗi
Cách đo	Đo lường — mốc ban đầu, mục tiêu, nguồn dữ liệu và quy tắc quyết định
Kiến trúc tin cậy phải thiết kế cùng quy trình:

Nguồn → Trích nguồn → QA mẫu → Chuyển người → Phản hồi
Copy
Cộng với bốn điều kiện về mức sẵn sàng: nguồn dữ liệu có người phụ trách và lịch cập nhật · quyền truy cập đúng người đúng mục đích · phạm vi dùng AI được định nghĩa rõ · chi phí, năng lực vận hành và cơ chế quản trị.

4.4 Bước 4 — Lộ trình 30–60–90 ngày (khoảng 10 phút)
Mỗi giai đoạn là một cổng quyết định, không phải một danh sách việc. Mỗi giai đoạn phải có owner và dấu hiệu hoàn thành.

0–30 ngày	31–60 ngày	61–90 ngày
Chứng minh vấn đề	Chứng minh chất lượng	Quyết định mở rộng
Vẽ AS-IS / TO-BE	Bật trích nguồn	So với mục tiêu
Khoá phạm vi và nguồn	QA theo mẫu	Chốt owner vận hành
Chọn pilot nhỏ, một nhóm	Hỗ trợ người dùng	Kiểm tra governance
Chỉ định data owner	Theo dõi tỷ lệ làm lại	Mở rộng / sửa / dừng
Ghi mốc ban đầu	Theo dõi hành vi sử dụng	
Gate được thông qua khi chất lượng, hành vi và giá trị đạt mục tiêu nhóm đã xác nhận — không phải khi hết 30 ngày.

4.5 Bước 5 — Điền Dashboard Hành Động (khoảng 20 phút)
Đo từ mức sử dụng đến giá trị. Theo dõi từ dưới lên, ra quyết định dựa trên giá trị:

Tầng	Câu hỏi tầng đó trả lời
1. Sử dụng	AI có được dùng trong quy trình không?
2. Hành vi	Cách làm việc có thay đổi không?
3. Năng suất	Nỗ lực và thời gian có giảm không?
4. Chất lượng & độ tin cậy	Ít lỗi, ít làm lại, có kiểm chứng?
5. Giá trị	Kết quả nghiệp vụ có tốt hơn không?
Mỗi chỉ số phải gắn với một quyết định:

Dễ đo nhưng chưa đủ	Đủ mạnh để ra quyết định
Số tài khoản đăng nhập	Thời gian xử lý từ log tác vụ
Số câu hỏi hoặc lượng sử dụng	Tỷ lệ hoàn thành không cần QA làm lại
Thời gian tiết kiệm do người dùng tự khai	Tỷ lệ câu trả lời có nguồn kiểm chứng
Tỷ lệ nội dung "có dùng AI"	Kết quả nghiệp vụ theo từng workflow
Mẫu bảng cần điền — không cần số liệu đẹp; cần nguồn dữ liệu và logic ra quyết định:

Chỉ số	Mốc đầu	Mục tiêu	Nguồn dữ liệu	Phụ trách	Khi chỉ số xấu
Mức dùng theo quy trình	Đo tuần 1	Mục tiêu nhóm	Log quy trình	Trưởng nhóm	Tìm điểm vướng
Thời gian / năng suất	Đo hiện trạng	Mục tiêu nhóm	Log tác vụ	Chủ quy trình	Xem lại cách làm
Chất lượng / tin cậy	Đo mẫu	Mục tiêu nhóm	Kiểm tra mẫu	Phụ trách QA	Tăng kiểm soát
Kết quả nghiệp vụ	Số hiện tại	Mục tiêu nhóm	Hệ thống nghiệp vụ	Chủ nghiệp vụ	Điều chỉnh / dừng
Rủi ro / bàn giao	Ghi hiện trạng	Ngưỡng nhóm	Log lỗi	Phụ trách AI	Bổ sung xử lý
Mỗi nhóm tự xác nhận mốc đầu và mục tiêu bằng dữ liệu có thể thu thập — đừng đặt mục tiêu cho một chỉ số mà nhóm không lấy được số liệu.

Kết quả mong đợi (Checkpoint phút 80): dashboard v1 có ≥1 product metric và ≥1 workflow metric, đủ năm cột, kèm hành động khi chỉ số xấu.

4.6 Bước 6 — Kiểm tra chéo (20 phút góp ý · 15 phút sửa · 5 phút chốt và nộp)
Đổi nhóm, phản biện theo bốn trục:

Trục	Câu hỏi phản biện
Phạm vi	Sản phẩm, người dùng và 2–4 quy trình đã rõ chưa?
Framework	Gartner-Lite, Mollick hoặc ADKAR có thật sự giúp tìm nguyên nhân, hay chỉ dán nhãn?
Chỉ số	Có đo quy trình, chất lượng, giá trị và có ghi nguồn dữ liệu không?
Hành động	Lộ trình, người phụ trách và cách xử lý khi chỉ số xấu đã rõ chưa?
Sau kiểm tra chéo: ít nhất 2 góp ý cụ thể · 2 thay đổi trong bản v2 · 1 quyết định cuối.

VLearn Codelabs | Học AI thực chiến qua Lab
Beta
0 / 10
used queries
1




Day 28 Track 01 - AI Adoption & Change Management — Dashboard Hành Động Cho Áp Dụng AI v2

Focus

Notes
0

Support

English

2

Back

Next
5. Kiểm tra kết quả
5.1 Hai checkpoint bắt buộc
Mốc	Giảng viên kiểm tra	✅ Pass	❌ Fail
Phút 40	Phạm vi và chẩn đoán	Nêu được sản phẩm, người dùng, 2–4 quy trình và 1–2 nguyên nhân gốc có bằng chứng	Phạm vi còn là "AI trong công ty"; nguyên nhân vẫn là triệu chứng ("ít người dùng")
Phút 80	Logic chỉ số	Mỗi chỉ số đủ baseline, target, nguồn, owner và hành động khi xấu	Chỉ có tên chỉ số; không nói được lấy số ở đâu và ai chịu trách nhiệm
5.2 Năm dấu hiệu bài đạt
#	Dấu hiệu
1	Phạm vi cụ thể, không nói chung về AI
2	Framework được dùng đúng chỗ — Gartner-Lite cho readiness, Mollick cho chia việc, ADKAR cho người dùng
3	Không chỉ đo đăng nhập hay số câu hỏi
4	Chỉ số có nguồn dữ liệu và cách xử lý khi xấu
5	Có quyết định rõ: tiếp tục, sửa hoặc dừng
5.3 Lỗi thường gặp
Lỗi	Dấu hiệu	Sửa thế nào
Nhầm triệu chứng với nguyên nhân	Nguyên nhân gốc ghi là "ít người dùng"	Hỏi tiếp: ít dùng vì sao? — thường xuống tới độ tin cậy hoặc quy trình
Mặc định mọi vấn đề đều do đào tạo	Giải pháp duy nhất là "mở lớp hướng dẫn"	Chạy ADKAR: nếu nghẽn ở Desire hoặc Reinforcement thì đào tạo không giải quyết được
Đo activity thay vì giá trị	Dashboard chỉ có login và số câu hỏi	Đẩy lên tầng 3–5: thời gian từ log, tỷ lệ không phải làm lại, kết quả nghiệp vụ
Chỉ số không dẫn tới hành động	Cột "khi chỉ số xấu" để trống	Mỗi dòng phải viết được một hành động cụ thể
Phạm vi quá rộng	Chọn "toàn bộ AI của công ty", hoặc hơn 4 quy trình	Quay lại Bước 1, khoá đúng 1 sản phẩm và 2–4 quy trình
Chỉ thêm AI mà không đổi cách chia việc	TO-BE giống AS-IS, chỉ chèn thêm một bước "hỏi AI"	Dùng Mollick: chỉ rõ ai giữ quyền, ai kiểm chứng, ai chịu trách nhiệm kết quả cuối
Roadmap thành danh sách việc	30–60–90 không có tiêu chí chuyển giai đoạn	Mỗi giai đoạn phải có dấu hiệu hoàn thành và owner
Không có bằng chứng	Chẩn đoán chỉ dựa trên cảm nhận	Bổ sung ≥1 quan sát, log, phỏng vấn ngắn hoặc case tham khảo
5.4 Năm câu tự kiểm trước khi kết thúc
[ ] 1. AI đi vào quy trình nào?
[ ] 2. Nguyên nhân gốc nằm ở đâu?
[ ] 3. Framework nào giúp trả lời?
[ ] 4. Chỉ số nào chứng minh giá trị?
[ ] 5. Khi nào tiếp tục, sửa hoặc dừng?
Copy
VLearn Codelabs | Học AI thực chiến qua Lab
Beta
0 / 10
used queries
1




Day 28 Track 01 - AI Adoption & Change Management — Dashboard Hành Động Cho Áp Dụng AI v2

Focus

Notes
0

Support

English

2

Back

Submit to complete
6. Nộp bài
6.1 Hình thức nộp
Mục	Yêu cầu
Nộp khi nào	Cuối buổi (phút 120)
Nộp thế nào	Dán link GitHub repo public vào ô nộp bài trên LMS
Ai nộp	Một repo cho cả nhóm. Mỗi thành viên dán cùng một link vào LMS của mình
Tên repo	Day28_Track01_<Ten_Nhom> — không dấu, không khoảng trắng, nối bằng _<br>Ví dụ: Day28_Track01_Van_Hanh
Nhánh	main
Quyền truy cập	Public. Repo private = người chấm không mở được = không có điểm
6.2 Cấu trúc repo
Day28_Track01_<Ten_Nhom>/
├── README.md                     ← bắt buộc, xem §6.3
├── dashboard/
│   └── dashboard_hanh_dong_v2.xlsx   ← bản v2 sau kiểm tra chéo
├── memo/
│   └── memo_quyet_dinh.md            ← 5 phần ở §6.4
└── v1/
    └── dashboard_hanh_dong_v1.xlsx   ← bản trước phản biện, để đối chiếu
Copy
Giữ lại bản v1 là bắt buộc: tiêu chí "≥2 thay đổi sau kiểm tra chéo" chỉ chứng minh được khi so được v1 với v2. Nếu nhóm làm trên Google Sheets thì export ra .xlsx rồi mới đẩy lên repo — đừng chỉ để link Sheets, vì quyền truy cập có thể tắt sau buổi học.

6.3 README.md — thứ người chấm mở đầu tiên
Mục 1 là bảng thành viên, ghi đủ ba cột sau. Đây là căn cứ để chấm đóng góp của từng người, không phải thủ tục:

Họ tên	MSSV	Phần phụ trách	Góp ý đã đưa cho nhóm bạn
(ví dụ) Nguyễn Văn A	2A20260xxxx	Gartner-Lite + phần readiness	Nhóm 05: chỉ số "số câu hỏi" là activity, đề xuất đổi sang tỷ lệ làm lại
…	…	…	…
Ghi rõ nhóm nào bạn phản biện. Ô "góp ý" trống nghĩa là chưa tham gia chặng 3, và tiêu chí "≥2 góp ý cụ thể" của nhóm đó không có căn cứ.

"Phần phụ trách" là ai chịu trách nhiệm viết ra phần đó, không có nghĩa các thành viên khác không tham gia. Một nhóm chia việc cơ học kiểu "A làm Gartner-Lite, B làm ADKAR, ghép lại là xong" sẽ lộ ngay ở chỗ ba framework không dẫn tới cùng một nguyên nhân gốc — và mất điểm ở dấu hiệu số 2 (§5.2).

Năm mục còn lại, mỗi mục 1–3 dòng:

#	Mục	Nội dung
2	Phạm vi	1 sản phẩm AI · 1 nhóm người dùng chính · 2–4 quy trình
3	Nguyên nhân gốc	1–2 nguyên nhân + framework đã dùng + bằng chứng (loại nào, lấy ở đâu)
4	Cách làm mới	Ba thay đổi bắt buộc: nguồn kiểm chứng · người chịu trách nhiệm · cách xử lý khi AI không chắc
5	Chỉ số	≥1 product metric + ≥1 workflow metric, mỗi cái ghi baseline · target · nguồn · owner
6	Quyết định	Tiếp tục / sửa / dừng + lý do một câu + 2 thay đổi so với v1
6.4 Dashboard v2 — yêu cầu tối thiểu
≥1 product-level metric
≥1 workflow-level metric
Mỗi chỉ số đủ: baseline · target · nguồn dữ liệu · owner
Hành động khi chỉ số xấu
Dữ liệu có thể thu thập được trong thực tế
6.5 Memo quyết định — năm phần
#	Nội dung
1	Vấn đề và nguyên nhân gốc
2	Framework đã dùng và bằng chứng
3	Ít nhất 2 thay đổi sau phản biện
4	Quyết định: tiếp tục / sửa / dừng
5	Lý do, bước tiếp theo và owner
6.6 Checklist trước khi dán link
[ ] 1. Mở link repo ở cửa sổ ẩn danh (chưa đăng nhập) — vẫn xem được
[ ] 2. Tên repo đúng mẫu Day28_Track01_<Ten_Nhom> — đúng số track, không dấu, không khoảng trắng
[ ] 3. Có đủ 3 thứ: dashboard v2 · memo · dashboard v1 để đối chiếu
[ ] 4. README có bảng thành viên đủ 4 cột: tên · MSSV · phần phụ trách · góp ý cho nhóm bạn
[ ] 5. README có đủ 5 mục còn lại, số liệu khớp file dashboard
[ ] 6. Không có dữ liệu nội bộ nhạy cảm của doanh nghiệp trong file
[ ] 7. Mọi thành viên đã dán CÙNG một link vào LMS của mình
Copy
6.7 Bốn điều mang về
Phân biệt sử dụng, triển khai và ứng dụng.
Chẩn đoán bằng Gartner-Lite, Mollick và ADKAR.
Thiết kế lại quy trình và lộ trình 30–60–90.
Đo từ mức sử dụng đến chất lượng và giá trị.
Việc ứng dụng AI chỉ có ý nghĩa khi quy trình thay đổi và kết quả được đo bằng dữ liệu.

Share feedback about this Lab
Optional and does not affect your submission. Staff only see anonymous feedback.

Give Lab feedback
Submit your work and rate the Lab
Paste your GitHub, Drive, or LMS link. Grades and feedback are not shown here.

Loading submission status…

VLearn Codelabs | Học AI thực chiến qua Lab
Beta
0 / 10
used queries
1




