# Backups

## Ciefp E2 Settings 23.09.2026 (إعدادات القنوات)

إعدادات القنوات **Ciefp** (إصدار 23.09.2026) بصيغة `tar.gz`، كل نسخة جاهزة
للاستخراج مباشرة إلى جذر الجهاز `/` (تحتوي على `etc/enigma2/` و `etc/tuxbox/satellites.xml`).

تعمل على: Vu+ وصور OE-Alliance (OpenATV / OpenPLi / OpenViX / OpenBH / VTi ...)
وأجهزة DreamOS (dm520 / dm900 / dm920 / DM ONE / DM TWO).

### النسخ المتوفرة

| # | النسخة | الأقمار |
|---|--------|---------|
| 1 | 1sat | 19E |
| 2 | 2satA | 19E + 13E |
| 3 | 2satB | 19E + 16E |
| 4 | 3satA | 9E + 10E + 13E |
| 5 | 3satB | 19E + 16E + 13E |
| 6 | 4satA | 28E + 19E + 13E + 30W |
| 7 | 4satB | 19E + 16E + 13E + 0.8W |
| 8 | 5sat | 19E + 16E + 13E + 1.9E + 0.8W |
| 9 | 6sat | 23E + 19E + 16E + 13E + 1.9E + 0.8W |
| 10 | 7sat | 23E + 19E + 16E + 13E + 4.8E + 1.9E + 0.8W |
| 11 | 8sat | 28E + 23E + 19E + 16E + 13E + 4.8E + 1.9E + 0.8W |
| 12 | 9sat | 28E + 23E + 19E + 16E + 13E + 9E + 1.9E + 0.8W + 5W |
| 13 | 10sat | 39E + 28E + 23E + 19E + 16E + 13E + 9E + 4.8E + 1.9E + 0.8W |
| 14 | 13sat | 42E + 39E + 28E + 23E + 19E + 16E + 13E + 9E + 7E + 4.8E + 1.9E + 0.8W + 5W |
| 15 | 16sat | 42E + 39E + 28E + 26E + 23E + 19E + 16E + 13E + 10E + 9E + 7E + 4.8E + 1.9E + 0.8W + 4W + 5W |
| 16 | 18sat | 42E + 39E + 36E + 33E + 28E + 26E + 23E + 19E + 16E + 13E + 10E + 9E + 7E + 4.8E + 1.9E + 0.8W + 4W + 5W |
| 17 | 75E-34W | القوس الكامل 75E ... 34W (يشمل هسباسات/أبيرتيس 30W) |

### التثبيت بسكريبت (الطريقة الأسهل)

```sh
wget -q --no-check-certificate https://raw.githubusercontent.com/azroukarim/plugins/main/Backups/install-ciefp-settings.sh -O /tmp/install-ciefp.sh
sh /tmp/install-ciefp.sh
```

ثم اختر رقم النسخة المناسبة من القائمة. أو مباشرة بدون قائمة (مثال النسخة 18sat = رقم 16):

```sh
sh /tmp/install-ciefp.sh 16
```

> السكريبت يتعامل تلقائيًا مع إيقاف/تشغيل الإينغما على الصورتين:
> OE (`init 4` / `init 3`) و DreamOS (`systemctl stop/start enigma2`)،
> ويأخذ نسخة احتياطية من الإعدادات القديمة في `/tmp` قبل الاستبدال.

### التثبيت اليدوي

```sh
# OE images (Vu+...):
init 4
cd /tmp
wget --no-check-certificate https://raw.githubusercontent.com/azroukarim/plugins/main/Backups/ciefp-E2-18sat-42E-39E-36E-33E-28E-26E-23E-19E-16E-13E-10E-9E-7E-4.8E-1.9E-0.8w-4W-5w-23.09.2026.tar.gz
tar -xzf ciefp-E2-18sat-*.tar.gz -C /
init 3

# DreamOS:
# systemctl stop enigma2
# tar -xzf <file>.tar.gz -C /
# rm -f /etc/enigma2/lamedb5
# systemctl start enigma2
```

المصدر: إعدادات Ciefp الأصلية (ciefp settings).
