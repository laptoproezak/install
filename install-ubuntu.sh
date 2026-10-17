
#!/bin/bash

clear
echo "=================================================="
echo "       INSTAL ULANG OS VPS - UBUNTU 22.04"
echo "=================================================="
echo
echo "Target OS : Ubuntu 22.04 LTS"
echo "Metode    : Reinstall melalui reinstall.sh"
echo
echo "PERINGATAN:"
echo "- Sistem operasi VPS akan diganti."
echo "- Data dan konfigurasi lama berisiko hilang."
echo "- Pastikan backup dan akses VPS tersedia."
echo
read -r -p "Ketik INSTALL untuk melanjutkan: " KONFIRMASI

if [ "$KONFIRMASI" != "INSTALL" ]; then
    echo "Instalasi dibatalkan."
    exit 1
fi

echo
echo "[1/3] Mengunduh skrip instalasi..."
if ! curl -fL --proto '=https' \
  --tlsv1.2 \
  https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh \
  -o reinstall.sh; then
    echo "Gagal mengunduh skrip. Proses dihentikan."
    exit 1
fi

echo
echo "[2/3] Memeriksa skrip yang diunduh..."
if [ ! -s reinstall.sh ]; then
    echo "File skrip kosong. Proses dihentikan."
    exit 1
fi

echo "File berhasil diunduh."
echo "Periksa isi skrip sebelum menjalankannya:"
echo "  less reinstall.sh"
echo
read -r -p "Ketik JALANKAN untuk memulai reinstall: " JAWABAN

if [ "$JAWABAN" != "JALANKAN" ]; then
    echo "Proses dibatalkan. File reinstall.sh tetap tersimpan."
    exit 1
fi

echo
echo "[3/3] Memulai reinstall Ubuntu 22.04..."
bash reinstall.sh Ubuntu 22.04

STATUS=$?
if [ "$STATUS" -ne 0 ]; then
    echo "Skrip berakhir dengan kode kesalahan: $STATUS"
    exit "$STATUS"
fi

echo
echo "Skrip selesai. Periksa petunjuk reboot dari skrip."
echo "Jangan reboot jika proses reinstall belum benar-benar selesai."
