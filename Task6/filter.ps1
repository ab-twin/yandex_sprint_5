$LOG_FILE = "audit.log"
$OUTPUT_FILE = "audit-extract.json"

Get-Content $LOG_FILE |
    Select-String '^\{' |
    ForEach-Object { $_.ToString() } |
    jq -c -f "filter.jq" |
    Set-Content $OUTPUT_FILE

Write-Output "Анализ завершен. Результаты сохранены в $OUTPUT_FILE"