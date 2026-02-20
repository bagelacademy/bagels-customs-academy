#!/bin/bash

BASE_URL="https://www.cbp.gov"

# Array of all PDFs to download
declare -a pdfs=(
    "/sites/default/files/2025-11/october_2025_cble_exam_0.pdf:october_2025_exam.pdf"
    "/sites/default/files/2025-11/october_2025_cble_answer_key_0.pdf:october_2025_answer_key.pdf"
    "/sites/default/files/2024-05/may_2024_customs_broker_license_exam_0.pdf:may_2024_exam.pdf"
    "/sites/default/files/2023-Nov/October%202023%20Customs%20Broker%20License%20Exam%20_0.pdf:october_2023_exam.pdf"
    "/sites/default/files/2023-Nov/October%202023%20Customs%20Broker%20License%20Exam%20Answer%20Key.pdf:october_2023_answer_key.pdf"
    "/sites/default/files/2023-May/April%202023%20Customs%20Broker%20License%20Exam_1.pdf:april_2023_exam.pdf"
    "/sites/default/files/2023-May/April%202023%20CBLE%20Answer%20Sheet%20CBP_0.pdf:april_2023_answer_key.pdf"
)

# Download each PDF
for pdf_info in "${pdfs[@]}"; do
    url_path="${pdf_info%%:*}"
    filename="${pdf_info##*:}"
    
    if [ -f "$filename" ]; then
        echo "✓ Already have: $filename"
    else
        echo "Downloading: $filename"
        curl -L -o "$filename" "${BASE_URL}${url_path}"
        sleep 1
    fi
done

echo ""
echo "Download complete! Files in directory:"
ls -lh *.pdf
