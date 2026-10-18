#!/bin/sh
###############################################################################
#  Ciefp E2 Settings 23.09.2026 - Installer for Enigma2
#  ---------------------------------------------------------------------------
#  Compatible with :
#    - Vu+ / OE-Alliance images (OpenATV, OpenPLi, OpenViX, OpenBH, VTi...)
#    - DreamOS (dm520 / dm900 / dm920 / DM ONE / DM TWO ... systemd images)
#
#  Repository : https://github.com/azroukarim/plugins   (folder: Backups)
#
#  Usage (interactive menu):
#    wget -q --no-check-certificate https://raw.githubusercontent.com/azroukarim/plugins/main/Backups/install-ciefp-settings.sh -O /tmp/install-ciefp.sh
#    sh /tmp/install-ciefp.sh
#
#  Usage (non interactive, example: option 16 = 18sat):
#    sh /tmp/install-ciefp.sh 16
#
#  Usage with a local archive already on the box:
#    sh /tmp/install-ciefp.sh 16 /tmp/ciefp-E2-18sat-....tar.gz
###############################################################################

BASE="https://raw.githubusercontent.com/azroukarim/plugins/main/Backups"
TMP="${TMPDIR:-/tmp}"
FILE=""
DOWNLOADED=0

echo ""
echo "========================================================="
echo "   Ciefp E2 Settings 23.09.2026  -  Installer"
echo "   github.com/azroukarim/plugins"
echo "========================================================="

show_menu() {
cat <<EOF

Choose your satellite setup:

   1)   1sat    19E
   2)   2satA   19E + 13E
   3)   2satB   19E + 16E
   4)   3satA   9E + 10E + 13E
   5)   3satB   19E + 16E + 13E
   6)   4satA   28E + 19E + 13E + 30W
   7)   4satB   19E + 16E + 13E + 0.8W
   8)   5sat    19E + 16E + 13E + 1.9E + 0.8W
   9)   6sat    23E + 19E + 16E + 13E + 1.9E + 0.8W
  10)   7sat    23E + 19E + 16E + 13E + 4.8E + 1.9E + 0.8W
  11)   8sat    28E + 23E + 19E + 16E + 13E + 4.8E + 1.9E + 0.8W
  12)   9sat    28E + 23E + 19E + 16E + 13E + 9E + 1.9E + 0.8W + 5W
  13)  10sat    39E + 28E + 23E + 19E + 16E + 13E + 9E + 4.8E + 1.9E + 0.8W
  14)  13sat    42E + 39E + 28E + 23E + 19E + 16E + 13E + 9E + 7E + 4.8E + 1.9E + 0.8W + 5W
  15)  16sat    42E + 39E + 28E + 26E + 23E + 19E + 16E + 13E + 10E + 9E + 7E + 4.8E + 1.9E + 0.8W + 4W + 5W
  16)  18sat    42E + 39E + 36E + 33E + 28E + 26E + 23E + 19E + 16E + 13E + 10E + 9E + 7E + 4.8E + 1.9E + 0.8W + 4W + 5W
  17)  75E-34W  full arc  75E ... 34W (incl. 30W Hispasat/Abertis)
   0)  Exit

EOF
}

pick_file() {
case "$1" in
   1) FILE="ciefp-E2-1sat-19E-23.09.2026.tar.gz" ;;
   2) FILE="ciefp-E2-2satA-19E-13E-23.09.2026.tar.gz" ;;
   3) FILE="ciefp-E2-2satB-19E-16E-23.09.2026.tar.gz" ;;
   4) FILE="ciefp-E2-3satA-9E-10E-13E-23.09.2026.tar.gz" ;;
   5) FILE="ciefp-E2-3satB-19E-16E-13E-23.09.2026.tar.gz" ;;
   6) FILE="ciefp-E2-4satA-28E-19E-13E-30W-23.09.2026.tar.gz" ;;
   7) FILE="ciefp-E2-4satB-19E-16E-13E-0.8W-23.09.2026.tar.gz" ;;
   8) FILE="ciefp-E2-5sat-19E-16E-13E-1.9E-0.8W-23.09.2026.tar.gz" ;;
   9) FILE="ciefp-E2-6sat-23E-19E-16E-13E-1.9E-0.8W-23.09.2026.tar.gz" ;;
  10) FILE="ciefp-E2-7sat-23E-19E-16E-13E-4.8E-1.9E-0.8W-23.09.2026.tar.gz" ;;
  11) FILE="ciefp-E2-8sat-28E-23E-19E-16E-13E-4.8E-1.9E-0.8W-23.09.2026.tar.gz" ;;
  12) FILE="ciefp-E2-9sat-28E-23E-19E-16E-13E-9E-1.9E-0.8W-5W-23.09.2026.tar.gz" ;;
  13) FILE="ciefp-E2-10sat-39E-28E-23E-19E-16E-13E-9E-4.8E-1.9E-0.8W-23.09.2026.tar.gz" ;;
  14) FILE="ciefp-E2-13sat-42E-39E-28E-23E-19E-16E-13E-9E-7E-4.8E-1.9E-0.8w-5w-23.09.2026.tar.gz" ;;
  15) FILE="ciefp-E2-16sat-42E-39E-28E-26E-23E-19E-16E-13E-10E-9E-7E-4.8E-1.9E-0.8w-4W-5w-23.09.2026.tar.gz" ;;
  16) FILE="ciefp-E2-18sat-42E-39E-36E-33E-28E-26E-23E-19E-16E-13E-10E-9E-7E-4.8E-1.9E-0.8w-4W-5w-23.09.2026.tar.gz" ;;
  17) FILE="ciefp-E2-75E-34W-23.09.2026.tar.gz" ;;
   *) return 1 ;;
esac
return 0
}

# ---- interactive menu ----
SEL="$1"
if [ -z "$SEL" ]; then
    show_menu
    printf "Your choice: "
    read SEL
fi

if [ "$SEL" = "0" ]; then echo "Cancelled."; exit 0; fi
pick_file "$SEL" || { echo "!! Invalid choice: $SEL"; exit 1; }

# ---- root check ----
if [ "$(id -u 2>/dev/null)" != "0" ]; then
    echo "!! Please run this script as root."
    exit 1
fi

ZIP="$TMP/ciefp-settings.tar.gz"
URL="$BASE/$FILE"

if [ -n "$2" ] && [ -f "$2" ]; then
    ZIP="$2"
    echo ""
    echo ">> Using local archive: $ZIP"
else
    echo ""
    echo ">> Selected : $FILE"
    echo ">> Downloading ..."
    DL=0
    if command -v curl >/dev/null 2>&1; then
        curl -k -L --fail -o "$ZIP" "$URL" && DL=1
    fi
    if [ "$DL" = "0" ] && command -v wget >/dev/null 2>&1; then
        wget -q --no-check-certificate -O "$ZIP" "$URL" || wget -q -O "$ZIP" "$URL"
        [ -s "$ZIP" ] && DL=1
    fi
    if [ "$DL" = "0" ]; then
        rm -f "$ZIP"
        echo "!! Download failed. Check internet connection."
        exit 1
    fi
    DOWNLOADED=1
    echo ">> Download OK"
fi

# ---- verify archive ----
if ! tar -tzf "$ZIP" >/dev/null 2>&1; then
    if ! gzip -dc "$ZIP" 2>/dev/null | tar -t >/dev/null 2>&1; then
        echo "!! Archive is corrupted."
        rm -f "$ZIP"
        exit 1
    fi
fi

# ---- stop enigma2 ----
echo ">> Stopping Enigma2 ..."
START_CMD=""
if [ -d /run/systemd/system ] && command -v systemctl >/dev/null 2>&1; then
    systemctl stop enigma2 >/dev/null 2>&1 && START_CMD="systemctl start enigma2"
fi
if [ -z "$START_CMD" ]; then
    init 4 >/dev/null 2>&1
    START_CMD="init 3"
fi
sleep 2
if command -v pidof >/dev/null 2>&1 && pidof enigma2 >/dev/null 2>&1; then
    killall -9 enigma2 >/dev/null 2>&1
    sleep 2
fi

# ---- backup current settings ----
BK="$TMP/ciefp-oldsettings-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BK" 2>/dev/null
for f in /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /etc/tuxbox/satellites.xml; do
    [ -f "$f" ] && cp -f "$f" "$BK/" 2>/dev/null
done
SZK=$(du -sk /etc/enigma2 2>/dev/null | awk '{print $1}')
if [ -n "$SZK" ] && [ "$SZK" -lt 8192 ]; then
    cp -f /etc/enigma2/userbouquet.* "$BK/" 2>/dev/null
fi
echo ">> Old settings backed up to: $BK"

# ---- install ----
echo ">> Installing new settings ..."
rm -f /etc/enigma2/userbouquet.*.tv
rm -f /etc/enigma2/userbouquet.*.radio
rm -f /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio
rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5
rm -f /etc/enigma2/blacklist /etc/enigma2/whitelist
sync

if ! tar -xzf "$ZIP" -C / 2>/dev/null; then
    gzip -dc "$ZIP" | tar -x -C /
fi

if [ ! -f /etc/enigma2/lamedb ]; then
    echo "!! Extraction failed! Restoring backup ..."
    cp -f "$BK/lamedb" /etc/enigma2/ 2>/dev/null
    cp -f "$BK/bouquets.tv" /etc/enigma2/ 2>/dev/null
    cp -f "$BK/bouquets.radio" /etc/enigma2/ 2>/dev/null
    cp -f "$BK/userbouquet."* /etc/enigma2/ 2>/dev/null
    sync
    $START_CMD >/dev/null 2>&1
    exit 1
fi

chmod 644 /etc/enigma2/lamedb /etc/enigma2/bouquets.* /etc/enigma2/blacklist /etc/enigma2/whitelist /etc/enigma2/userbouquet.* 2>/dev/null
[ -f /etc/tuxbox/satellites.xml ] && chmod 644 /etc/tuxbox/satellites.xml 2>/dev/null
sync

CNT=$(ls /etc/enigma2/userbouquet.*.tv 2>/dev/null | wc -l | tr -d ' ')
echo ">> Installed ($CNT TV bouquets)."

# ---- restart enigma2 ----
echo ">> Starting Enigma2 ..."
$START_CMD >/dev/null 2>&1
[ "$DOWNLOADED" = "1" ] && rm -f "$ZIP"

echo ""
echo "========================================================="
echo "  Done! Ciefp E2 Settings 23.09.2026 installed."
echo "  Backup of old settings : $BK"
echo "========================================================="
echo ""
exit 0
