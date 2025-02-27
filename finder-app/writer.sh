#!/bin/bash

# writer.sh: Verilen yola (writefile) belirtilen metni (writestr) yazar,
#            yoksa dosyayı ve klasörlerini oluşturur.

# Kontrol: İki parametre verilmeli: 1) writefile, 2) writestr
if [ $# -lt 2 ]
then
    echo "Error: Missing parameters"
    exit 1
fi

writefile=$1
writestr=$2

# Gerekirse dosyanın klasörlerini oluştur
writedir=$(dirname "$writefile")
mkdir -p "$writedir" || {
    echo "Error: Could not create directory $writedir"
    exit 1
}

# Dosyaya (writestr) içeriğini yaz, başarısız olursa çık
echo "$writestr" > "$writefile" || {
    echo "Error: Could not write to file $writefile"
    exit 1
}
