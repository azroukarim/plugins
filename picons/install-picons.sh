#!/bin/sh
###############################################################################
#  Picons 220x132 (13.0E + 19.2E) - Installer for Enigma2
#  ---------------------------------------------------------------------------
#  22,818 transparent picons (source: picon.cz - picons by chocholousek)
#  Download  : https://github.com/azroukarim/plugins/releases  (asset: picon_transparant-220x132.tar.gz)
#
#  Install path is selected automatically:
#    1) /media/hdd/picon           if HDD   is mounted and has free space
#    2) /media/usb/picon           if USB   is mounted and has free space
#    3) /usr/share/enigma2/picon   internal flash (last resort)
#
#  Repository : https://github.com/azroukarim/plugins   (folder: picons)
#
#  Usage:
#    wget -q --no-check-certificate https://raw.githubusercontent.com/azroukarim/plugins/main/picons/install-picons.sh -O /tmp/install-picons.sh
#    sh /tmp/install-picons.sh
###############################################################################

URL="https://github.com/azroukarim/plugins/releases/download/picon_transparant-220x132/picon_transparant-220x132.tar.gz"
NEED_KB=230000         # required free space (~225 MB, extracted size is ~214 MB)

echo ""
echo "========================================================="
echo "   Picons 220x132 (13.0E + 19.2E)  -  Installer"
echo "   github.com/azroukarim/plugins"
echo "========================================================="
echo ""

# ---- root check ----
if [ "$(id -u 2>/dev/null)" != "0" ]; then
    echo "!! Please run this script as root."
    exit 1
fi

# ---- helpers ----
check_mount() {
    # $1 = mount point : mounted ? writable ? enough free space ?
    grep -qs " $1 " /proc/mounts || return 1
    touch "$1/.picon_wtest" 2>/dev/null || return 1
    rm -f "$1/.picon_wtest"
    FKB=$(df -k "$1" 2>/dev/null | awk 'END{print $4}')
    case "$FKB" in ''|*[!0-9]*) return 1 ;; esac
    [ "$FKB" -ge "$NEED_KB" ] || return 1
    FREE_KB="$FKB"
    return 0
}

pick_dest() {
    FREE_KB=""
    if check_mount /media/hdd; then
        DEST_BASE="/media/hdd"
    elif check_mount /media/usb; then
        DEST_BASE="/media/usb"
    else
        DEST_BASE="/usr/share/enigma2"
    fi
}

# ---- 1) choose install path ----
pick_dest

if [ -n "$FREE_KB" ]; then
    echo ">> Target : $DEST_BASE/picon   (free: $((FREE_KB / 1024)) MB)"
else
    echo ">> Target : $DEST_BASE/picon   (no HDD/USB with enough space -> internal flash)"
fi
echo ">> Downloading and extracting ... (approx. 165 MB, please wait)"
echo ""

# ---- 2) download + extract ----
OK=0
if command -v curl >/dev/null 2>&1; then
    curl -k -L --fail -sS "$URL" | tar -xz -C "$DEST_BASE" 2>/dev/null && OK=1
fi
if [ "$OK" = "0" ] && command -v wget >/dev/null 2>&1; then
    wget -q --no-check-certificate -O - "$URL" | tar -xz -C "$DEST_BASE" 2>/dev/null && OK=1
fi

if [ "$OK" = "0" ]; then
    echo ""
    echo "!! Install failed (download tool missing or bad connection)."
    echo "!! Try again, or install manually (see README.md in the picons folder)."
    exit 1
fi

sync
CNT=$(ls -1 "$DEST_BASE/picon"/*.png 2>/dev/null | wc -l | tr -d ' ')

echo ""
echo "========================================================="
echo "  Done! Picons installed to : $DEST_BASE/picon/"
echo "  PNG files found           : $CNT"
echo ""
echo "  Note: make sure the Picon path in your image settings"
echo "        matches : $DEST_BASE/picon"
echo "========================================================="
echo ""
exit 0
