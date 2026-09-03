$ErrorActionPreference = 'Stop'

$root = (Get-Location).Path
$dashboardDir = Join-Path $root 'dashboard'
$v1Dir = Join-Path $root 'v1'
New-Item -ItemType Directory -Force -Path $dashboardDir, $v1Dir | Out-Null

$csvDir = Join-Path $env:TEMP 'Day28_Track01_Track1_ProMax_csv'
New-Item -ItemType Directory -Force -Path $csvDir | Out-Null

function OleColor([int]$r, [int]$g, [int]$b) {
    return $r + ($g -shl 8) + ($b -shl 16)
}

function Set-Cell($ws, [int]$row, [int]$col, $value) {
    $cell = $ws.Cells.Item($row, $col)
    if ($null -eq $value) {
        $cell.Value2 = $null
    } elseif ($value -is [string]) {
        $cell.Value2 = [string]$value
    } elseif ($value -is [ValueType]) {
        $cell.Value2 = [double]$value
    } else {
        $cell.Value2 = $value.ToString()
    }
}

function Set-Matrix($ws, [int]$startRow, [int]$startCol, [object[][]]$matrix) {
    for ($r = 0; $r -lt $matrix.Count; $r++) {
        for ($c = 0; $c -lt $matrix[$r].Count; $c++) {
            Set-Cell $ws ($startRow + $r) ($startCol + $c) $matrix[$r][$c]
        }
    }
}

function Style-Title($ws, [string]$title, [string]$subtitle, [int]$lastCol) {
    $ws.Range($ws.Cells.Item(1,1), $ws.Cells.Item(1,$lastCol)).Merge()
    Set-Cell $ws 1 1 $title
    $ws.Range($ws.Cells.Item(1,1), $ws.Cells.Item(1,$lastCol)).Interior.Color = OleColor 15 39 71
    $ws.Range($ws.Cells.Item(1,1), $ws.Cells.Item(1,$lastCol)).Font.Color = OleColor 255 255 255
    $ws.Range($ws.Cells.Item(1,1), $ws.Cells.Item(1,$lastCol)).Font.Bold = $true
    $ws.Range($ws.Cells.Item(1,1), $ws.Cells.Item(1,$lastCol)).Font.Size = 16
    $ws.Range($ws.Cells.Item(1,1), $ws.Cells.Item(1,$lastCol)).HorizontalAlignment = -4108
    $ws.Rows.Item(1).RowHeight = 30
    $ws.Range($ws.Cells.Item(2,1), $ws.Cells.Item(2,$lastCol)).Merge()
    Set-Cell $ws 2 1 $subtitle
    $ws.Range($ws.Cells.Item(2,1), $ws.Cells.Item(2,$lastCol)).Font.Color = OleColor 89 103 122
    $ws.Range($ws.Cells.Item(2,1), $ws.Cells.Item(2,$lastCol)).Font.Italic = $true
    $ws.Rows.Item(2).RowHeight = 24
}

function Style-Header($ws, [string]$rangeAddress) {
    $range = $ws.Range($rangeAddress)
    $range.Interior.Color = OleColor 31 78 121
    $range.Font.Color = OleColor 255 255 255
    $range.Font.Bold = $true
    $range.WrapText = $true
    $range.VerticalAlignment = -4108
    $range.HorizontalAlignment = -4108
    $range.RowHeight = 34
}

function Style-Body($ws, [string]$rangeAddress) {
    $range = $ws.Range($rangeAddress)
    $range.WrapText = $true
    $range.VerticalAlignment = -4160
    $range.Borders.LineStyle = 1
    $range.Borders.Color = OleColor 210 218 226
    $range.Font.Name = 'Aptos'
    $range.Font.Size = 10
}

function Add-ExcelTable($ws, [string]$rangeAddress, [string]$name) {
    $table = $ws.ListObjects.Add(1, $ws.Range($rangeAddress), $null, 1)
    $table.Name = $name
    $table.TableStyle = 'TableStyleMedium2'
}

function Add-MetricStatus($ws, [int]$firstRow, [int]$lastRow) {
    for ($row = $firstRow; $row -le $lastRow; $row++) {
        $formula = '=IF(OR(C{0}="",ISTEXT(C{0})),"Chưa đo",IF(F{0}="≤",IF(C{0}<=D{0},"Đạt","Cần xử lý"),IF(C{0}>=D{0},"Đạt","Cần xử lý")))' -f $row
        $ws.Cells.Item($row,10).Formula = $formula
    }
    $statusRange = $ws.Range("J$firstRow:J$lastRow")
    $statusRange.FormatConditions.Delete()
    $good = $statusRange.FormatConditions.Add(2, $null, '=J' + $firstRow + '="Đạt"')
    $good.Interior.Color = OleColor 226 239 218
    $good.Font.Color = OleColor 47 84 36
    $bad = $statusRange.FormatConditions.Add(2, $null, '=J' + $firstRow + '="Cần xử lý"')
    $bad.Interior.Color = OleColor 255 199 206
    $bad.Font.Color = OleColor 156 0 6
    $todo = $statusRange.FormatConditions.Add(2, $null, '=J' + $firstRow + '="Chưa đo"')
    $todo.Interior.Color = OleColor 255 235 156
    $todo.Font.Color = OleColor 156 101 0
}

function Build-Workbook([string]$version, [string]$outputPath) {
    $metricsV1 = @(
        @('Số CV được AI xử lý','Activity',0,50,'CV','≥','Agent run log','Nguyễn Trọng Nam','Tìm lỗi upload, quyền truy cập và onboarding'),
        @('Thời gian xử lý trung bình/CV','Workflow',240,15,'giây','≤','Agent log + tự khai','Phùng Hồng Phước','Kiểm tra latency, batch và bước gây chậm'),
        @('Độ chính xác tương đồng HR','Product',0.86,0.85,'%','≥','Benchmark nội bộ 100 CV','Nguyễn Trọng Nam','Rà prompt, rubric và dữ liệu test'),
        @('Chi phí mỗi CV','Product',0.015,0.02,'USD','≤','API usage log','Phùng Hồng Phước','Giảm token hoặc dùng fallback model')
    )
    $metricsV2 = @(
        @('Tỷ lệ quyết định AI có evidence hợp lệ','Product / Quality',0,0.95,'%','≥','Output audit + eval log','Nguyễn Trọng Nam','Tắt auto-triage, review 100%, phân tích citation/prompt'),
        @('Thời gian sơ loại đến quyết định Tier','Workflow / Productivity',240,90,'giây','≤','Timestamp upload → decision','Nguyễn Đào Nam Hải','Quan sát bước gây chậm, tối ưu UX/batch, không mở rộng'),
        @('Tỷ lệ đồng thuận với rubric HR','Product / Value',0.86,0.90,'%','≥','Eval pipeline + nhãn HR','Nguyễn Trọng Nam','Freeze rollout, rà rubric và false negative'),
        @('Tỷ lệ CV bị làm lại sau QA','Workflow / Control','Đo tuần 1 pilot',0.10,'%','≤','QA sample log','Phùng Hồng Phước','Tăng QA 100% nhóm lỗi, sửa rule/schema'),
        @('Tỷ lệ PII bị gửi ra ngoài pipeline masking','Risk / Governance','Chưa có log hoàn chỉnh',0,'case','≤','API request log + masking test','Phùng Hồng Phước','Dừng kết nối model, kiểm tra incident và quyền truy cập')
    )
    $metrics = if ($version -eq 'v1') { $metricsV1 } else { $metricsV2 }

    $csvRows = @(@('Metric','Level','Baseline','Target','Unit','Direction','Source','Owner','Action')) + $metrics
    $csvPath = Join-Path $csvDir ("dashboard_{0}.csv" -f $version)
    $csvRows | ForEach-Object { [PSCustomObject]@{ Metric=$_[0]; Level=$_[1]; Baseline=$_[2]; Target=$_[3]; Unit=$_[4]; Direction=$_[5]; Source=$_[6]; Owner=$_[7]; Action=$_[8] } } | Export-Csv -LiteralPath $csvPath -NoTypeInformation -Encoding utf8

    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $excel.DisplayAlerts = $false
    $excel.ScreenUpdating = $false
    try {
        $wb = $excel.Workbooks.Add()
        while ($wb.Worksheets.Count -lt 4) { [void]$wb.Worksheets.Add() }
        while ($wb.Worksheets.Count -gt 4) { $wb.Worksheets.Item($wb.Worksheets.Count).Delete() }
        $wsDashboard = $wb.Worksheets.Item(1); $wsDashboard.Name = 'Dashboard'
        $wsWorkflow = $wb.Worksheets.Item(2); $wsWorkflow.Name = 'Workflow'
        $wsRoadmap = $wb.Worksheets.Item(3); $wsRoadmap.Name = 'Roadmap'
        $wsEvidence = $wb.Worksheets.Item(4); $wsEvidence.Name = 'Evidence'
        foreach ($ws in @($wsDashboard,$wsWorkflow,$wsRoadmap,$wsEvidence)) {
            $ws.Cells.Font.Name = 'Aptos'
            $ws.Cells.Font.Size = 10
            $ws.Activate()
            $excel.ActiveWindow.DisplayGridlines = $false
        }

        # Dashboard
        $dashboardTitle = if ($version -eq 'v1') { 'Dashboard Hành Động — Bản v1 trước phản biện' } else { 'Dashboard Hành Động Cho Áp Dụng AI — Bản v2 sau phản biện' }
        $dashboardSubtitle = 'Auto-CV Screener Agent | Nhóm người dùng: Recruiter/HR | Phạm vi: 1 JD, tối đa 50 CV pilot'
        Style-Title $wsDashboard $dashboardTitle $dashboardSubtitle 10
        Set-Cell $wsDashboard 4 1 'Quyết định hiện tại'
        $wsDashboard.Range('A4:B4').Merge(); $wsDashboard.Range('A4:B4').Interior.Color = OleColor 221 235 247; $wsDashboard.Range('A4:B4').Font.Bold = $true
        $decisionText = if ($version -eq 'v1') { 'Pilot hẹp; cần phản biện thêm về chất lượng và human handoff' } else { 'Sửa rồi tiếp tục pilot hẹp; chưa rollout rộng' }
        Set-Cell $wsDashboard 5 1 $decisionText
        $wsDashboard.Range('A5:D5').Merge(); $wsDashboard.Range('A5:D5').WrapText = $true; $wsDashboard.Range('A5:D5').Interior.Color = OleColor 242 246 250
        Set-Cell $wsDashboard 4 4 'Nguyên tắc gate'
        $wsDashboard.Range('D4:F4').Merge(); $wsDashboard.Range('D4:F4').Interior.Color = OleColor 221 235 247; $wsDashboard.Range('D4:F4').Font.Bold = $true
        $gateText = if ($version -eq 'v1') { 'Không rollout khi chưa chứng minh agreement, tốc độ và chi phí.' } else { 'Chỉ mở rộng khi evidence, agreement, tốc độ, rework và PII cùng đạt ngưỡng.' }
        Set-Cell $wsDashboard 5 4 $gateText
        $wsDashboard.Range('D5:F5').Merge(); $wsDashboard.Range('D5:F5').WrapText = $true; $wsDashboard.Range('D5:F5').Interior.Color = OleColor 242 246 250
        Set-Cell $wsDashboard 7 1 'BẢNG CHỈ SỐ RA QUYẾT ĐỊNH'
        $wsDashboard.Range('A7:J7').Merge(); $wsDashboard.Range('A7:J7').Interior.Color = OleColor 15 39 71; $wsDashboard.Range('A7:J7').Font.Color = OleColor 255 255 255; $wsDashboard.Range('A7:J7').Font.Bold = $true
        $metricHeader = @('Chỉ số','Loại','Baseline','Target','Đơn vị','Hướng','Nguồn dữ liệu','Owner','Khi chỉ số xấu','Trạng thái')
        Set-Matrix $wsDashboard 8 1 (,@($metricHeader))
        Style-Header $wsDashboard 'A8:J8'
        for ($i=0; $i -lt $metrics.Count; $i++) {
            $row = 9 + $i
            Set-Matrix $wsDashboard $row 1 (,@($metrics[$i] + @('')))
            if ($metrics[$i][4] -eq '%') { $wsDashboard.Cells.Item($row,3).NumberFormat = '0%'; $wsDashboard.Cells.Item($row,4).NumberFormat = '0%' }
            elseif ($metrics[$i][4] -eq 'USD') { $wsDashboard.Cells.Item($row,3).NumberFormat = '$0.000'; $wsDashboard.Cells.Item($row,4).NumberFormat = '$0.000' }
            elseif ($metrics[$i][4] -eq 'giây') { $wsDashboard.Cells.Item($row,3).NumberFormat = '0'; $wsDashboard.Cells.Item($row,4).NumberFormat = '0' }
        }
        Add-MetricStatus $wsDashboard 9 (8 + $metrics.Count)
        Style-Body $wsDashboard ("A9:J{0}" -f (8 + $metrics.Count))
        Add-ExcelTable $wsDashboard ("A8:J{0}" -f (8 + $metrics.Count)) ("Metrics_{0}" -f $version)
        Set-Cell $wsDashboard 16 1 'Ghi chú phương pháp'
        $wsDashboard.Range('A16:B16').Merge(); $wsDashboard.Range('A16:B16').Font.Bold = $true; $wsDashboard.Range('A16:B16').Interior.Color = OleColor 221 235 247
        $methodText = if ($version -eq 'v1') { 'V1 ưu tiên activity, average time và cost; sau phản biện cần nâng lên quality/value và human handoff.' } else { 'V2 đo từ hành vi đến chất lượng/giá trị; metric login hoặc số CV chạy chỉ là activity, không dùng làm gate.' }
        Set-Cell $wsDashboard 17 1 $methodText
        $wsDashboard.Range('A17:J18').Merge(); $wsDashboard.Range('A17:J18').WrapText = $true; $wsDashboard.Range('A17:J18').Interior.Color = OleColor 242 246 250
        # Chart helper area
        $agreementTarget = if ($version -eq 'v1') { 0.85 } else { 0.90 }
        $evidenceTarget = if ($version -eq 'v1') { 0 } else { 0.95 }
        Set-Matrix $wsDashboard 20 12 @(@('Gate metric','Baseline','Target'), @('Agreement HR',0.86,$agreementTarget), @('Evidence hợp lệ',0,$evidenceTarget))
        $wsDashboard.Range('M21:N22').NumberFormat = '0%'
        $chartObj = $wsDashboard.ChartObjects().Add(650, 55, 465, 250)
        $chart = $chartObj.Chart
        $chart.SetSourceData($wsDashboard.Range('L20:N22'))
        $chart.ChartType = 51
        $chart.HasTitle = $true
        $chart.ChartTitle.Text = 'Quality gates — baseline vs target'
        $chart.HasLegend = $true
        $chart.Legend.Position = 2
        $chart.Axes(2).TickLabels.NumberFormat = '0%'
        $wsDashboard.Columns.Item('A').ColumnWidth = 34; $wsDashboard.Columns.Item('B').ColumnWidth = 22; $wsDashboard.Columns.Item('C').ColumnWidth = 15; $wsDashboard.Columns.Item('D').ColumnWidth = 13; $wsDashboard.Columns.Item('E').ColumnWidth = 11; $wsDashboard.Columns.Item('F').ColumnWidth = 10; $wsDashboard.Columns.Item('G').ColumnWidth = 29; $wsDashboard.Columns.Item('H').ColumnWidth = 24; $wsDashboard.Columns.Item('I').ColumnWidth = 46; $wsDashboard.Columns.Item('J').ColumnWidth = 15
        $wsDashboard.Columns.Item('L').ColumnWidth = 22; $wsDashboard.Columns.Item('M').ColumnWidth = 13; $wsDashboard.Columns.Item('N').ColumnWidth = 13
        $wsDashboard.Rows.Item(9).RowHeight = 42
        $wsDashboard.Rows.Item(10).RowHeight = 42
        $wsDashboard.Rows.Item(11).RowHeight = 42
        $wsDashboard.Rows.Item(12).RowHeight = 42
        $wsDashboard.Rows.Item(13).RowHeight = 42
        $wsDashboard.Activate(); $wsDashboard.Range('A9').Select(); $excel.ActiveWindow.FreezePanes = $true

        # Workflow
        Style-Title $wsWorkflow 'Workflow AS-IS / TO-BE — Human-in-the-loop' 'Ba điểm bắt buộc: nguồn kiểm chứng · người chịu trách nhiệm · cách xử lý khi AI không chắc chắn' 6
        Set-Matrix $wsWorkflow 4 1 (,@('Bước','AS-IS hiện tại','TO-BE sau thiết kế','Vùng Mollick / Role','Nguồn kiểm chứng','Handoff / xử lý lỗi'))
        Style-Header $wsWorkflow 'A4:F4'
        $workflowRows = @(
            @('1. Nhận JD','Recruiter nhận JD và tự diễn giải tiêu chí','Nhập JD, khóa rubric phiên bản và tiêu chí không được dùng','Người giữ quyền — Recruiter/HR','JD + rubric được HR xác nhận','Nếu rubric mơ hồ → trả lại HR Lead'),
            @('2. Nhận CV','Mở từng file, đọc và ghi chú thủ công','Upload batch; hệ thống ghi job_id và timestamp','AI tự động có kiểm soát','Workflow log','Lỗi file/quyền → dừng batch, ghi log'),
            @('3. Bảo mật','Chưa có bước kiểm tra PII rõ ràng','Mask tên, email, SĐT, tuổi trước khi gọi model','AI tự động có kiểm soát','Masking test + API request log','Có PII → chặn request, chuyển Phước'),
            @('4. Phân loại','Recruiter tự đối chiếu CV với JD','AI trích xuất tiêu chí, xếp Tier, trả evidence từng tiêu chí','AI hỗ trợ, người kiểm','Đoạn evidence trong CV + rubric version','Thiếu evidence/confidence <0.75 → Needs human review'),
            @('5. QA mẫu','Kiểm tra lại không theo tỷ lệ cố định','QA mẫu tối thiểu 20%, ưu tiên nhóm confidence thấp','AI hỗ trợ, người kiểm','QA sample log','Rework >10% → tăng QA 100% nhóm lỗi'),
            @('6. Quyết định','Recruiter tự quyết nhưng không có gate ghi nhận','Recruiter duyệt Tier cuối; không tự động loại ứng viên','Người giữ quyền','Recruiter decision log','Ngoại lệ/tiêu chí mâu thuẫn → chuyển HR Lead'),
            @('7. Phản hồi','Lỗi được sửa rời rạc, khó học lại','Ghi lý do sửa và đưa vào golden set/eval pipeline','AI hỗ trợ, người kiểm','Feedback log + eval set','Lỗi lặp lại → freeze rollout và cập nhật rubric')
        )
        Set-Matrix $wsWorkflow 5 1 $workflowRows
        Style-Body $wsWorkflow 'A5:F11'
        Add-ExcelTable $wsWorkflow 'A4:F11' ("Workflow_{0}" -f $version)
        $wsWorkflow.Columns.Item('A').ColumnWidth = 18; $wsWorkflow.Columns.Item('B').ColumnWidth = 35; $wsWorkflow.Columns.Item('C').ColumnWidth = 42; $wsWorkflow.Columns.Item('D').ColumnWidth = 28; $wsWorkflow.Columns.Item('E').ColumnWidth = 30; $wsWorkflow.Columns.Item('F').ColumnWidth = 42
        $wsWorkflow.Rows.Item('5:11').RowHeight = 60
        $wsWorkflow.Activate(); $wsWorkflow.Range('A5').Select(); $excel.ActiveWindow.FreezePanes = $true

        # Roadmap
        Style-Title $wsRoadmap 'Roadmap 30–60–90 — Các cổng quyết định' 'Mỗi giai đoạn chỉ chuyển tiếp khi bằng chứng đạt ngưỡng; đây không phải lịch rollout cứng.' 5
        Set-Matrix $wsRoadmap 4 1 @(@('Giai đoạn','Mục tiêu / gate','Việc chính','Owner','Dấu hiệu hoàn thành'))
        Style-Header $wsRoadmap 'A4:E4'
        $roadmapRows = @(
            @('0–30 ngày','Chứng minh vấn đề và khóa phạm vi','1 JD/50 CV; chốt rubric; masking; quyền truy cập; baseline timestamp/evidence','Hải / Phước / Nam','HR xác nhận rubric; log đủ; không PII; golden set và gate được chốt'),
            @('31–60 ngày','Chứng minh chất lượng và hành vi','Bật citation; QA ≥20%; recruiter dùng human gate; theo dõi agreement, evidence, median time, rework','Nam / Hải / Phước','Evidence ≥95%; agreement ≥90%; median ≤90 giây; rework ≤10% hoặc có kế hoạch sửa'),
            @('61–90 ngày','Quyết định mở rộng','So với target; rà governance; chốt owner vận hành; chỉ thử thêm vị trí khi gate đạt','Hải / Phước / Nam','Hai chu kỳ liên tiếp đạt gate; release note ghi rõ mở rộng/sửa/dừng')
        )
        Set-Matrix $wsRoadmap 5 1 $roadmapRows
        Style-Body $wsRoadmap 'A5:E7'
        Add-ExcelTable $wsRoadmap 'A4:E7' ("Roadmap_{0}" -f $version)
        $wsRoadmap.Columns.Item('A').ColumnWidth = 17; $wsRoadmap.Columns.Item('B').ColumnWidth = 30; $wsRoadmap.Columns.Item('C').ColumnWidth = 54; $wsRoadmap.Columns.Item('D').ColumnWidth = 26; $wsRoadmap.Columns.Item('E').ColumnWidth = 54
        $wsRoadmap.Rows.Item('5:7').RowHeight = 75
        Set-Cell $wsRoadmap 10 1 'Quy tắc quyết định'
        $wsRoadmap.Range('A10:B10').Font.Bold = $true; $wsRoadmap.Range('A10:B10').Interior.Color = OleColor 221 235 247
        Set-Cell $wsRoadmap 11 1 'Không rollout nếu một trong các gate chất lượng, tốc độ, rework hoặc PII không đạt. Khi xấu: quay lại chẩn đoán nguyên nhân, sửa workflow/rubric/kiểm soát rồi đo lại.'
        $wsRoadmap.Range('A11:E12').WrapText = $true; $wsRoadmap.Range('A11:E12').Interior.Color = OleColor 242 246 250

        # Evidence
        Style-Title $wsEvidence 'Evidence Register & Framework Mapping' 'Dữ liệu minh hoạ/ẩn danh; không đưa CV, tên ứng viên hoặc PII vào repo công khai.' 5
        Set-Matrix $wsEvidence 4 1 (,@('Bằng chứng','Loại','Nhận định sử dụng','Nguồn','Liên kết framework'))
        Style-Header $wsEvidence 'A4:E4'
        $evidenceRows = @(
            @('Benchmark 100 CV','Benchmark nội bộ','86% tương đồng HR; false negative <5%; chi phí khoảng 0.015 USD/CV','Báo cáo Day 27 của dự án','Gartner-Lite Readiness; metric chất lượng'),
            @('Thời gian sơ loại thủ công','Quan sát/ước lượng workflow','Khoảng 3–5 phút/CV; cần đo lại bằng timestamp log','Báo cáo Day 27','Workflow metric; Mollick'),
            @('Team health chất lượng AI','Đánh giá nhóm','Chất lượng AI 3.3/5; thiếu eval pipeline là gap ưu tiên','Báo cáo Day 27','ADKAR Ability/Reinforcement'),
            @('Human-in-the-loop','Thiết kế vận hành','Recruiter duyệt cuối; AI không được tự động loại ứng viên','Bản thiết kế TO-BE của lab','Mollick; kiến trúc tin cậy'),
            @('PII masking','Kiểm soát rủi ro','Mask tên, tuổi, giới tính, email, SĐT trước khi gọi model','Kế hoạch MVP Day 27','Gartner-Lite Readiness; governance')
        )
        Set-Matrix $wsEvidence 5 1 $evidenceRows
        Style-Body $wsEvidence 'A5:E9'
        Add-ExcelTable $wsEvidence 'A4:E9' ("Evidence_{0}" -f $version)
        $wsEvidence.Columns.Item('A').ColumnWidth = 24; $wsEvidence.Columns.Item('B').ColumnWidth = 24; $wsEvidence.Columns.Item('C').ColumnWidth = 58; $wsEvidence.Columns.Item('D').ColumnWidth = 32; $wsEvidence.Columns.Item('E').ColumnWidth = 34
        $wsEvidence.Rows.Item('5:9').RowHeight = 58
        Set-Cell $wsEvidence 12 1 'Framework summary'
        $wsEvidence.Range('A12:B12').Font.Bold = $true; $wsEvidence.Range('A12:B12').Interior.Color = OleColor 221 235 247
        Set-Matrix $wsEvidence 13 1 @(@('Gartner-Lite','Direction đạt; Readiness và Absorption thiếu owner dữ liệu, governance, eval pipeline và vòng phản hồi.'), @('Mollick','AI hỗ trợ; recruiter giữ quyền quyết định; tự động hóa chỉ cho masking/schema/log có kiểm soát.'), @('ADKAR','Nghẽn Desire/Ability/Reinforcement; cần evidence, thực hành trong workflow và feedback loop, không chỉ training.'))
        $wsEvidence.Range('A13:A15').Font.Bold = $true; $wsEvidence.Range('A13:B15').WrapText = $true; $wsEvidence.Range('A13:B15').Borders.LineStyle = 1; $wsEvidence.Rows.Item('13:15').RowHeight = 45; $wsEvidence.Columns.Item('B').ColumnWidth = 92

        foreach ($ws in @($wsDashboard,$wsWorkflow,$wsRoadmap,$wsEvidence)) {
            $ws.PageSetup.Orientation = 2
            $ws.PageSetup.FitToPagesWide = 1
            $ws.PageSetup.FitToPagesTall = 0
            $ws.PageSetup.Zoom = $false
        }
        $excel.CalculateFull()
        $wb.SaveAs($outputPath, 51)
        $wb.Close($true)
    } finally {
        if ($wb) { try { [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($wb) } catch {} }
        $excel.Quit()
        try { [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($excel) } catch {}
    }
}

Build-Workbook 'v1' (Join-Path $v1Dir 'dashboard_hanh_dong_v1.xlsx')
Build-Workbook 'v2' (Join-Path $dashboardDir 'dashboard_hanh_dong_v2.xlsx')
Write-Output 'Created dashboard_hanh_dong_v1.xlsx and dashboard_hanh_dong_v2.xlsx'

