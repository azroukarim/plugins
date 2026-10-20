#!/bin/sh
###############################################################################
#  Morph883 E2 Settings 12.10.2026 - Installer for Enigma2
#  ---------------------------------------------------------------------------
#  Compatible with :
#    - Vu+ / OE-Alliance images (OpenATV, OpenPLi, OpenViX, OpenBH, VTi...)
#    - DreamOS (dm520 / dm900 / dm920 / DM ONE / DM TWO ... systemd images)
#
#  Repository : https://github.com/azroukarim/plugins   (folder: channels/Morph)
#  Source     : https://morpheus883.altervista.org/
#
#  Usage (interactive menu):
#    wget -q --no-check-certificate https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/install-morph-settings.sh -O /tmp/install-morph.sh
#    sh /tmp/install-morph.sh
#
#  Usage (non interactive, example: option 1 = 13E):
#    sh /tmp/install-morph.sh 1
#
#  Usage with a local archive already on the box:
#    sh /tmp/install-morph.sh 1 /tmp/Morph883-E2-13E-12.10.2026.tar.gz
###############################################################################

BASE="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph"
DATE="12.10.2026"
TMP="${TMPDIR:-/tmp}"
FILE=""
DOWNLOADED=0

echo ""
echo "========================================================="
echo "   Morph883 E2 Settings 12.10.2026  -  Installer"
echo "   github.com/azroukarim/plugins"
echo "========================================================="

show_menu() {
cat <<EOF

Choose your satellite setup:

   1)   13E                  Hotbird 13E
   2)   13E-19.2E            13E + Astra 19.2E
   3)   30W-13E              Hispasat 30W + 13E
   4)   30W-13E-19.2E        30W + 13E + 19.2E
   5)   0.8W-13E             Thor 0.8W + 13E
   6)   0.8W-13E-19.2E       0.8W + 13E + 19.2E
   7)   4.8E-13E             Astra 4.8E + 13E
   8)   4.8E-13E-19.2E       4.8E + 13E + 19.2E
   9)   9E-13E               Eutelsat 9E + 13E
  10)   9E-13E-19.2E         9E + 13E + 19.2E
  11)   13E-16E              13E + Eutelsat 16E
  12)   13E-16E-19.2E        13E + 16E + 19.2E
  13)   13E-23.5E            13E + Astra 23.5E
  14)   13E-19.2E-23.5E      13E + 19.2E + 23.5E
  15)   13E-28.2E            13E + Astra 28.2E
  16)   13E-19.2E-28.2E      13E + 19.2E + 28.2E
  17)   13E-42E              13E + Turksat 42E
  18)   13E-19.2E-42E        13E + 19.2E + 42E
  19)   0.8W-4.8E-13E        0.8W + 4.8E + 13E
  20)   0.8W-13E-19.2E-28.2E 0.8W + 13E + 19.2E + 28.2E
  21)   13E-16E-19.2E-23.5E  13E + 16E + 19.2E + 23.5E
  22)   13E-19.2E-23.5E-28.2E 13E + 19.2E + 23.5E + 28.2E
  23)   Motor               full arc 45W ... 76.5E
   0)   Exit

  For satellites.xml only, see readme2.md (section 24).

EOF
}

pick_file() {
case "$1" in
   1) FILE="Morph883-E2-13E-$DATE.tar.gz" ;;
   2) FILE="Morph883-E2-13E-19.2E-$DATE.tar.gz" ;;
   3) FILE="Morph883-E2-30W-13E-$DATE.tar.gz" ;;
   4) FILE="Morph883-E2-30W-13E-19.2E-$DATE.tar.gz" ;;
   5) FILE="Morph883-E2-0.8W-13E-$DATE.tar.gz" ;;
   6) FILE="Morph883-E2-0.8W-13E-19.2E-$DATE.tar.gz" ;;
   7) FILE="Morph883-E2-4.8E-13E-$DATE.tar.gz" ;;
   8) FILE="Morph883-E2-4.8E-13E-19.2E-$DATE.tar.gz" ;;
   9) FILE="Morph883-E2-9E-13E-$DATE.tar.gz" ;;
  10) FILE="Morph883-E2-9E-13E-19.2E-$DATE.tar.gz" ;;
  11) FILE="Morph883-E2-13E-16E-$DATE.tar.gz" ;;
  12) FILE="Morph883-E2-13E-16E-19.2E-$DATE.tar.gz" ;;
  13) FILE="Morph883-E2-13E-23.5E-$DATE.tar.gz" ;;
  14) FILE="Morph883-E2-13E-19.2E-23.5E-$DATE.tar.gz" ;;
  15) FILE="Morph883-E2-13E-28.2E-$DATE.tar.gz" ;;
  16) FILE="Morph883-E2-13E-19.2E-28.2E-$DATE.tar.gz" ;;
  17) FILE="Morph883-E2-13E-42E-$DATE.tar.gz" ;;
  18) FILE="Morph883-E2-13E-19.2E-42E-$DATE.tar.gz" ;;
  19) FILE="Morph883-E2-0.8W-4.8E-13E-$DATE.tar.gz" ;;
  20) FILE="Morph883-E2-0.8W-13E-19.2E-28.2E-$DATE.tar.gz" ;;
  21) FILE="Morph883-E2-13E-16E-19.2E-23.5E-$DATE.tar.gz" ;;
  22) FILE="Morph883-E2-13E-19.2E-23.5E-28.2E-$DATE.tar.gz" ;;
  23) FILE="Morph883-E2-Motor-$DATE.tar.gz" ;;
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

ZIP="$TMP/morph-settings.tar.gz"
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
BK="$TMP/morph-oldsettings-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BK" 2>/dev/null
for f in /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /etc/enigma2/blacklist /etc/enigma2/whitelist /etc/tuxbox/satellites.xml; do
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

rm -f /etc/enigma2/lamedb5
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
echo "  Done! Morph883 E2 Settings 12.10.2026 installed."
echo "  Backup of old settings : $BK"
echo "========================================================="
echo ""
exit 0
