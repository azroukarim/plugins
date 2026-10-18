# readme2 — لكل ملف: الرابط المباشر وسكريبت التثبيت

📄 ملف مرجعي لإعدادات **Ciefp 23.09.2026**: لكل واحد من الملفات الـ 17 ستجد هنا
**رابطه المباشر** + **سكريبت التثبيت الكامل** الجاهز للنسخ واللصق.

**معلومات مهمة:**

- الملفات بصيغة `tar.gz` وتُستخرج مباشرة إلى `/` (تحتوي `etc/enigma2/` و `etc/tuxbox/satellites.xml`).
- السكريبت يعمل على **Vu+** وصور **OE-Alliance** (OpenATV / OpenPLi / OpenViX / OpenBH / VTi ...) وأجهزة **DreamOS** (dm520 / dm900 / dm920 / DM ONE / DM TWO).
- يتعامل تلقائياً مع إيقاف/تشغيل الإينغما في النظامين (`init 4/3` أو `systemctl`)، ويحذف `lamedb5` لاعادة بنائه، ويأخذ نسخة احتياطية في `/tmp/ciefp-bak`.
- الطريقة الأسهل بدل هذا الملف: استخدم السكريبت الرئيسي واختر الرقم من القائمة، أو مباشرةً:
  `sh /tmp/install-ciefp.sh 16`  (رقم 16 = نسخة 18sat)

---

## 1) 1sat — 19E

**الملف:** `ciefp-E2-1sat-19E-23.09.2026.tar.gz`  (بحجم ~279 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-1sat-19E-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-1sat-19E-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 1sat (19E)"
```

---

## 2) 2satA — 19E + 13E

**الملف:** `ciefp-E2-2satA-19E-13E-23.09.2026.tar.gz`  (بحجم ~319 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-2satA-19E-13E-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-2satA-19E-13E-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 2satA (19E + 13E)"
```

---

## 3) 2satB — 19E + 16E

**الملف:** `ciefp-E2-2satB-19E-16E-23.09.2026.tar.gz`  (بحجم ~309 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-2satB-19E-16E-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-2satB-19E-16E-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 2satB (19E + 16E)"
```

---

## 4) 3satA — 9E + 10E + 13E

**الملف:** `ciefp-E2-3satA-9E-10E-13E-23.09.2026.tar.gz`  (بحجم ~311 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-3satA-9E-10E-13E-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-3satA-9E-10E-13E-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 3satA (9E + 10E + 13E)"
```

---

## 5) 3satB — 19E + 16E + 13E

**الملف:** `ciefp-E2-3satB-19E-16E-13E-23.09.2026.tar.gz`  (بحجم ~349 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-3satB-19E-16E-13E-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-3satB-19E-16E-13E-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 3satB (19E + 16E + 13E)"
```

---

## 6) 4satA — 28E + 19E + 13E + 30W

**الملف:** `ciefp-E2-4satA-28E-19E-13E-30W-23.09.2026.tar.gz`  (بحجم ~347 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-4satA-28E-19E-13E-30W-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-4satA-28E-19E-13E-30W-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 4satA (28E + 19E + 13E + 30W)"
```

---

## 7) 4satB — 19E + 16E + 13E + 0.8W

**الملف:** `ciefp-E2-4satB-19E-16E-13E-0.8W-23.09.2026.tar.gz`  (بحجم ~381 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-4satB-19E-16E-13E-0.8W-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-4satB-19E-16E-13E-0.8W-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 4satB (19E + 16E + 13E + 0.8W)"
```

---

## 8) 5sat — 19E + 16E + 13E + 1.9E + 0.8W

**الملف:** `ciefp-E2-5sat-19E-16E-13E-1.9E-0.8W-23.09.2026.tar.gz`  (بحجم ~387 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-5sat-19E-16E-13E-1.9E-0.8W-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-5sat-19E-16E-13E-1.9E-0.8W-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 5sat (19E + 16E + 13E + 1.9E + 0.8W)"
```

---

## 9) 6sat — 23E + 19E + 16E + 13E + 1.9E + 0.8W

**الملف:** `ciefp-E2-6sat-23E-19E-16E-13E-1.9E-0.8W-23.09.2026.tar.gz`  (بحجم ~410 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-6sat-23E-19E-16E-13E-1.9E-0.8W-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-6sat-23E-19E-16E-13E-1.9E-0.8W-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 6sat (23E + 19E + 16E + 13E + 1.9E + 0.8W)"
```

---

## 10) 7sat — 23E + 19E + 16E + 13E + 4.8E + 1.9E + 0.8W

**الملف:** `ciefp-E2-7sat-23E-19E-16E-13E-4.8E-1.9E-0.8W-23.09.2026.tar.gz`  (بحجم ~417 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-7sat-23E-19E-16E-13E-4.8E-1.9E-0.8W-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-7sat-23E-19E-16E-13E-4.8E-1.9E-0.8W-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 7sat (23E + 19E + 16E + 13E + 4.8E + 1.9E + 0.8W)"
```

---

## 11) 8sat — 28E + 23E + 19E + 16E + 13E + 4.8E + 1.9E + 0.8W

**الملف:** `ciefp-E2-8sat-28E-23E-19E-16E-13E-4.8E-1.9E-0.8W-23.09.2026.tar.gz`  (بحجم ~428 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-8sat-28E-23E-19E-16E-13E-4.8E-1.9E-0.8W-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-8sat-28E-23E-19E-16E-13E-4.8E-1.9E-0.8W-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 8sat (28E + 23E + 19E + 16E + 13E + 4.8E + 1.9E + 0.8W)"
```

---

## 12) 9sat — 28E + 23E + 19E + 16E + 13E + 9E + 1.9E + 0.8W + 5W

**الملف:** `ciefp-E2-9sat-28E-23E-19E-16E-13E-9E-1.9E-0.8W-5W-23.09.2026.tar.gz`  (بحجم ~456 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-9sat-28E-23E-19E-16E-13E-9E-1.9E-0.8W-5W-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-9sat-28E-23E-19E-16E-13E-9E-1.9E-0.8W-5W-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 9sat (28E + 23E + 19E + 16E + 13E + 9E + 1.9E + 0.8W + 5W)"
```

---

## 13) 10sat — 39E + 28E + 23E + 19E + 16E + 13E + 9E + 4.8E + 1.9E + 0.8W

**الملف:** `ciefp-E2-10sat-39E-28E-23E-19E-16E-13E-9E-4.8E-1.9E-0.8W-23.09.2026.tar.gz`  (بحجم ~469 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-10sat-39E-28E-23E-19E-16E-13E-9E-4.8E-1.9E-0.8W-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-10sat-39E-28E-23E-19E-16E-13E-9E-4.8E-1.9E-0.8W-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 10sat (39E + 28E + 23E + 19E + 16E + 13E + 9E + 4.8E + 1.9E + 0.8W)"
```

---

## 14) 13sat — 42E + 39E + 28E + 23E + 19E + 16E + 13E + 9E + 7E + 4.8E + 1.9E + 0.8W + 5W

**الملف:** `ciefp-E2-13sat-42E-39E-28E-23E-19E-16E-13E-9E-7E-4.8E-1.9E-0.8w-5w-23.09.2026.tar.gz`  (بحجم ~505 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-13sat-42E-39E-28E-23E-19E-16E-13E-9E-7E-4.8E-1.9E-0.8w-5w-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-13sat-42E-39E-28E-23E-19E-16E-13E-9E-7E-4.8E-1.9E-0.8w-5w-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 13sat (42E + 39E + 28E + 23E + 19E + 16E + 13E + 9E + 7E + 4.8E + 1.9E + 0.8W + 5W)"
```

---

## 15) 16sat — 42E + 39E + 28E + 26E + 23E + 19E + 16E + 13E + 10E + 9E + 7E + 4.8E + 1.9E + 0.8W + 4W + 5W

**الملف:** `ciefp-E2-16sat-42E-39E-28E-26E-23E-19E-16E-13E-10E-9E-7E-4.8E-1.9E-0.8w-4W-5w-23.09.2026.tar.gz`  (بحجم ~519 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-16sat-42E-39E-28E-26E-23E-19E-16E-13E-10E-9E-7E-4.8E-1.9E-0.8w-4W-5w-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-16sat-42E-39E-28E-26E-23E-19E-16E-13E-10E-9E-7E-4.8E-1.9E-0.8w-4W-5w-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 16sat (42E + 39E + 28E + 26E + 23E + 19E + 16E + 13E + 10E + 9E + 7E + 4.8E + 1.9E + 0.8W + 4W + 5W)"
```

---

## 16) 18sat — 42E + 39E + 36E + 33E + 28E + 26E + 23E + 19E + 16E + 13E + 10E + 9E + 7E + 4.8E + 1.9E + 0.8W + 4W + 5W

**الملف:** `ciefp-E2-18sat-42E-39E-36E-33E-28E-26E-23E-19E-16E-13E-10E-9E-7E-4.8E-1.9E-0.8w-4W-5w-23.09.2026.tar.gz`  (بحجم ~522 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-18sat-42E-39E-36E-33E-28E-26E-23E-19E-16E-13E-10E-9E-7E-4.8E-1.9E-0.8w-4W-5w-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-18sat-42E-39E-36E-33E-28E-26E-23E-19E-16E-13E-10E-9E-7E-4.8E-1.9E-0.8w-4W-5w-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 18sat (42E + 39E + 36E + 33E + 28E + 26E + 23E + 19E + 16E + 13E + 10E + 9E + 7E + 4.8E + 1.9E + 0.8W + 4W + 5W)"
```

---

## 17) 75E-34W — القوس الكامل 75E ... 34W (يشمل 30W هسباسات/أبيرتيس)

**الملف:** `ciefp-E2-75E-34W-23.09.2026.tar.gz`  (بحجم ~556 KB)

**الرابط المباشر:**

```
https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-75E-34W-23.09.2026.tar.gz
```

**سكريبت التثبيت:**

```sh
URL="https://raw.githubusercontent.com/azroukarim/plugins/main/channels/ciefp-E2-75E-34W-23.09.2026.tar.gz"
wget -q --no-check-certificate "$URL" -O /tmp/ciefp.tar.gz || wget -q "$URL" -O /tmp/ciefp.tar.gz

mkdir -p /tmp/ciefp-bak && cp -f /etc/enigma2/lamedb /etc/enigma2/bouquets.tv /etc/enigma2/bouquets.radio /tmp/ciefp-bak/ 2>/dev/null

if [ -d /run/systemd/system ]; then
    systemctl stop enigma2
    ST="systemctl start enigma2"
else
    init 4
    ST="init 3"
fi
sleep 3

rm -f /etc/enigma2/userbouquet.*.tv /etc/enigma2/userbouquet.*.radio /etc/enigma2/lamedb /etc/enigma2/lamedb5
tar -xzf /tmp/ciefp.tar.gz -C /
rm -f /etc/enigma2/lamedb5
sync

$ST
echo ">> Done: 75E-34W (القوس الكامل 75E ... 34W (يشمل 30W هسباسات/أبيرتيس))"
```

---

المصدر: إعدادات Ciefp الأصلية (ciefp settings).
