# readme2 — لكل ملف: الرابط المباشر وسكريبت التثبيت

📄 ملف مرجعي لإعدادات **Morph883 12.10.2026**: لكل واحد من ملفات القنوات الـ23 + ملف الأقمار
ستجد هنا **رابطه المباشر** + **سكريبت التثبيت الكامل** الجاهز للنسخ واللصق.

**معلومات مهمة:**

- الملفات بصيغة `tar.gz` وتُستخرج مباشرة إلى `/` (تحتوي `etc/enigma2/` و `etc/tuxbox/satellites.xml`).
- السكريبت يعمل على **Vu+** وصور **OE-Alliance** (OpenATV / OpenPLi / OpenViX / OpenBH / VTi ...) وأجهزة **DreamOS** (dm520 / dm900 / dm920 / DM ONE / DM TWO).
- يتعامل تلقائياً مع إيقاف/تشغيل الإينغما في النظامين (`init 4/3` أو `systemctl`)، ويحذف `lamedb5` لإعادة بنائه، ويأخذ نسخة احتياطية في `/tmp/morph-bak`.
- الطريقة الأسهل بدل هذا الملف: استخدم السكريبت الرئيسي واختر الرقم من القائمة، أو مباشرةً:
  `sh /tmp/install-morph.sh 1`

---

## 1) 13E — Hotbird 13E

**الملف:** `Morph883-E2-13E-12.10.2026.tar.gz`  (بحجم ~41 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-12.10.2026.tar.gz"
LABEL="13E (Hotbird 13E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 2) 13E-19.2E — 13E + Astra 19.2E

**الملف:** `Morph883-E2-13E-19.2E-12.10.2026.tar.gz`  (بحجم ~69 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-19.2E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-19.2E-12.10.2026.tar.gz"
LABEL="13E-19.2E (13E + Astra 19.2E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 3) 30W-13E — Hispasat 30W + Hotbird 13E

**الملف:** `Morph883-E2-30W-13E-12.10.2026.tar.gz`  (بحجم ~55 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-30W-13E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-30W-13E-12.10.2026.tar.gz"
LABEL="30W-13E (Hispasat 30W + Hotbird 13E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 4) 30W-13E-19.2E — 30W + 13E + Astra 19.2E

**الملف:** `Morph883-E2-30W-13E-19.2E-12.10.2026.tar.gz`  (بحجم ~83 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-30W-13E-19.2E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-30W-13E-19.2E-12.10.2026.tar.gz"
LABEL="30W-13E-19.2E (30W + 13E + Astra 19.2E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 5) 0.8W-13E — Thor 0.8W + 13E

**الملف:** `Morph883-E2-0.8W-13E-12.10.2026.tar.gz`  (بحجم ~65 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-0.8W-13E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-0.8W-13E-12.10.2026.tar.gz"
LABEL="0.8W-13E (Thor 0.8W + 13E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 6) 0.8W-13E-19.2E — 0.8W + 13E + 19.2E

**الملف:** `Morph883-E2-0.8W-13E-19.2E-12.10.2026.tar.gz`  (بحجم ~93 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-0.8W-13E-19.2E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-0.8W-13E-19.2E-12.10.2026.tar.gz"
LABEL="0.8W-13E-19.2E (0.8W + 13E + 19.2E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 7) 4.8E-13E — Astra 4.8E + 13E

**الملف:** `Morph883-E2-4.8E-13E-12.10.2026.tar.gz`  (بحجم ~48 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-4.8E-13E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-4.8E-13E-12.10.2026.tar.gz"
LABEL="4.8E-13E (Astra 4.8E + 13E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 8) 4.8E-13E-19.2E — 4.8E + 13E + 19.2E

**الملف:** `Morph883-E2-4.8E-13E-19.2E-12.10.2026.tar.gz`  (بحجم ~76 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-4.8E-13E-19.2E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-4.8E-13E-19.2E-12.10.2026.tar.gz"
LABEL="4.8E-13E-19.2E (4.8E + 13E + 19.2E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 9) 9E-13E — Eutelsat 9E + 13E

**الملف:** `Morph883-E2-9E-13E-12.10.2026.tar.gz`  (بحجم ~56 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-9E-13E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-9E-13E-12.10.2026.tar.gz"
LABEL="9E-13E (Eutelsat 9E + 13E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 10) 9E-13E-19.2E — 9E + 13E + 19.2E

**الملف:** `Morph883-E2-9E-13E-19.2E-12.10.2026.tar.gz`  (بحجم ~84 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-9E-13E-19.2E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-9E-13E-19.2E-12.10.2026.tar.gz"
LABEL="9E-13E-19.2E (9E + 13E + 19.2E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 11) 13E-16E — 13E + Eutelsat 16E

**الملف:** `Morph883-E2-13E-16E-12.10.2026.tar.gz`  (بحجم ~63 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-16E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-16E-12.10.2026.tar.gz"
LABEL="13E-16E (13E + Eutelsat 16E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 12) 13E-16E-19.2E — 13E + 16E + 19.2E

**الملف:** `Morph883-E2-13E-16E-19.2E-12.10.2026.tar.gz`  (بحجم ~90 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-16E-19.2E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-16E-19.2E-12.10.2026.tar.gz"
LABEL="13E-16E-19.2E (13E + 16E + 19.2E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 13) 13E-23.5E — 13E + Astra 23.5E

**الملف:** `Morph883-E2-13E-23.5E-12.10.2026.tar.gz`  (بحجم ~58 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-23.5E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-23.5E-12.10.2026.tar.gz"
LABEL="13E-23.5E (13E + Astra 23.5E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 14) 13E-19.2E-23.5E — 13E + 19.2E + 23.5E

**الملف:** `Morph883-E2-13E-19.2E-23.5E-12.10.2026.tar.gz`  (بحجم ~85 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-19.2E-23.5E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-19.2E-23.5E-12.10.2026.tar.gz"
LABEL="13E-19.2E-23.5E (13E + 19.2E + 23.5E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 15) 13E-28.2E — 13E + Astra 28.2E

**الملف:** `Morph883-E2-13E-28.2E-12.10.2026.tar.gz`  (بحجم ~57 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-28.2E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-28.2E-12.10.2026.tar.gz"
LABEL="13E-28.2E (13E + Astra 28.2E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 16) 13E-19.2E-28.2E — 13E + 19.2E + 28.2E

**الملف:** `Morph883-E2-13E-19.2E-28.2E-12.10.2026.tar.gz`  (بحجم ~85 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-19.2E-28.2E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-19.2E-28.2E-12.10.2026.tar.gz"
LABEL="13E-19.2E-28.2E (13E + 19.2E + 28.2E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 17) 13E-42E — 13E + Turksat 42E

**الملف:** `Morph883-E2-13E-42E-12.10.2026.tar.gz`  (بحجم ~63 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-42E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-42E-12.10.2026.tar.gz"
LABEL="13E-42E (13E + Turksat 42E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 18) 13E-19.2E-42E — 13E + 19.2E + 42E

**الملف:** `Morph883-E2-13E-19.2E-42E-12.10.2026.tar.gz`  (بحجم ~91 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-19.2E-42E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-19.2E-42E-12.10.2026.tar.gz"
LABEL="13E-19.2E-42E (13E + 19.2E + 42E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 19) 0.8W-4.8E-13E — 0.8W + 4.8E + 13E

**الملف:** `Morph883-E2-0.8W-4.8E-13E-12.10.2026.tar.gz`  (بحجم ~72 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-0.8W-4.8E-13E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-0.8W-4.8E-13E-12.10.2026.tar.gz"
LABEL="0.8W-4.8E-13E (0.8W + 4.8E + 13E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 20) 0.8W-13E-19.2E-28.2E — 0.8W + 13E + 19.2E + 28.2E

**الملف:** `Morph883-E2-0.8W-13E-19.2E-28.2E-12.10.2026.tar.gz`  (بحجم ~109 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-0.8W-13E-19.2E-28.2E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-0.8W-13E-19.2E-28.2E-12.10.2026.tar.gz"
LABEL="0.8W-13E-19.2E-28.2E (0.8W + 13E + 19.2E + 28.2E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 21) 13E-16E-19.2E-23.5E — 13E + 16E + 19.2E + 23.5E

**الملف:** `Morph883-E2-13E-16E-19.2E-23.5E-12.10.2026.tar.gz`  (بحجم ~107 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-16E-19.2E-23.5E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-16E-19.2E-23.5E-12.10.2026.tar.gz"
LABEL="13E-16E-19.2E-23.5E (13E + 16E + 19.2E + 23.5E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 22) 13E-19.2E-23.5E-28.2E — 13E + 19.2E + 23.5E + 28.2E

**الملف:** `Morph883-E2-13E-19.2E-23.5E-28.2E-12.10.2026.tar.gz`  (بحجم ~101 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-19.2E-23.5E-28.2E-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-19.2E-23.5E-28.2E-12.10.2026.tar.gz"
LABEL="13E-19.2E-23.5E-28.2E (13E + 19.2E + 23.5E + 28.2E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 23) Motor — full arc 45W ... 76.5E

**الملف:** `Morph883-E2-Motor-12.10.2026.tar.gz`  (بحجم ~368 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-Motor-12.10.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-Motor-12.10.2026.tar.gz"
LABEL="Motor (full arc 45W ... 76.5E)"

wget -q --no-check-certificate "$URL" -O /tmp/morph.tar.gz || wget -q "$URL" -O /tmp/morph.tar.gz
if ! tar -tzf /tmp/morph.tar.gz >/dev/null 2>&1; then
    echo "!! Download failed - nothing changed."; exit 1
fi

mkdir -p /tmp/morph-bak
cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /tmp/morph-bak/ 2>/dev/null
cp -f /etc/tuxbox/satellites.xml /tmp/morph-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio
tar -xzf /tmp/morph.tar.gz -C / || {
    echo "!! Extraction failed - restoring backup."
    cp -f /tmp/morph-bak/lamedb /tmp/morph-bak/bouquets.tv /tmp/morph-bak/bouquets.radio /etc/enigma2/ 2>/dev/null
    cp -f /tmp/morph-bak/userbouquet.* /etc/enigma2/ 2>/dev/null
}
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: $LABEL"
```

---

## 24) satellites.xml — كل الأقمار الـ88 (Ku Band)

**الملف:** `satellites.xml`  (بحجم ~254 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/satellites.xml
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/satellites.xml"

cp -f /etc/tuxbox/satellites.xml /tmp/satellites.xml.bak 2>/dev/null
wget -q --no-check-certificate "$URL" -O /tmp/satellites.new.xml || wget -q "$URL" -O /tmp/satellites.new.xml
if grep -q "<satellites>" /tmp/satellites.new.xml 2>/dev/null; then
    mv -f /tmp/satellites.new.xml /etc/tuxbox/satellites.xml
    sync
    echo ">> Done: satellites.xml (88 sats) - restart Enigma2 to apply."
else
    echo "!! Download failed - nothing changed."
fi
```

> `satellites.xml` لا يحتاج إيقاف Enigma2، لكن يُفضّل إعادة تشغيله ليُقرأ الملف الجديد.

---

المصدر: إعدادات Morpheus883 الأصلية — https://morpheus883.altervista.org/
