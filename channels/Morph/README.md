# Morph883 E2 Settings 12.10.2026 (إعدادات القنوات)

إعدادات القنوات **Morpheus883** (إصدار 12.10.2026) بصيغة `tar.gz`، كل نسخة جاهزة
للاستخراج مباشرة إلى جذر الجهاز `/` (تحتوي على `etc/enigma2/` و `etc/tuxbox/satellites.xml`).

تعمل على صور Enigma2 (OpenATV / OpenPLi / OpenViX / OpenBH / VTi ...) وأجهزة DreamOS.

> المصدر: <https://morpheus883.altervista.org/> — جميع الحقوق محفوظة لـ Morpheus883.
>
> 📄 لكل ملف على حدة (الرابط المباشر + سكريبت التثبيت الكامل): راجع **[readme2.md](readme2.md)**

## النسخ المتوفرة

| # | الملف | الأقمار |
|---|-------|---------|
| 1 | `Morph883-E2-13E-12.10.2026.tar.gz` | Hotbird 13E |
| 2 | `Morph883-E2-13E-19.2E-12.10.2026.tar.gz` | 13E + Astra 19.2E |
| 3 | `Morph883-E2-30W-13E-12.10.2026.tar.gz` | Hispasat 30W + 13E |
| 4 | `Morph883-E2-30W-13E-19.2E-12.10.2026.tar.gz` | 30W + 13E + 19.2E |
| 5 | `Morph883-E2-0.8W-13E-12.10.2026.tar.gz` | Thor 0.8W + 13E |
| 6 | `Morph883-E2-0.8W-13E-19.2E-12.10.2026.tar.gz` | 0.8W + 13E + 19.2E |
| 7 | `Morph883-E2-4.8E-13E-12.10.2026.tar.gz` | Astra 4.8E + 13E |
| 8 | `Morph883-E2-4.8E-13E-19.2E-12.10.2026.tar.gz` | 4.8E + 13E + 19.2E |
| 9 | `Morph883-E2-9E-13E-12.10.2026.tar.gz` | Eutelsat 9E + 13E |
| 10 | `Morph883-E2-9E-13E-19.2E-12.10.2026.tar.gz` | 9E + 13E + 19.2E |
| 11 | `Morph883-E2-13E-16E-12.10.2026.tar.gz` | 13E + Eutelsat 16E |
| 12 | `Morph883-E2-13E-16E-19.2E-12.10.2026.tar.gz` | 13E + 16E + 19.2E |
| 13 | `Morph883-E2-13E-23.5E-12.10.2026.tar.gz` | 13E + Astra 23.5E |
| 14 | `Morph883-E2-13E-19.2E-23.5E-12.10.2026.tar.gz` | 13E + 19.2E + 23.5E |
| 15 | `Morph883-E2-13E-28.2E-12.10.2026.tar.gz` | 13E + Astra 28.2E |
| 16 | `Morph883-E2-13E-19.2E-28.2E-12.10.2026.tar.gz` | 13E + 19.2E + 28.2E |
| 17 | `Morph883-E2-13E-42E-12.10.2026.tar.gz` | 13E + Turksat 42E |
| 18 | `Morph883-E2-13E-19.2E-42E-12.10.2026.tar.gz` | 13E + 19.2E + 42E |
| 19 | `Morph883-E2-0.8W-4.8E-13E-12.10.2026.tar.gz` | 0.8W + 4.8E + 13E |
| 20 | `Morph883-E2-0.8W-13E-19.2E-28.2E-12.10.2026.tar.gz` | 0.8W + 13E + 19.2E + 28.2E |
| 21 | `Morph883-E2-13E-16E-19.2E-23.5E-12.10.2026.tar.gz` | 13E + 16E + 19.2E + 23.5E |
| 22 | `Morph883-E2-13E-19.2E-23.5E-28.2E-12.10.2026.tar.gz` | 13E + 19.2E + 23.5E + 28.2E |
| 23 | `Morph883-E2-Motor-12.10.2026.tar.gz` | Motor — القوس الكامل 45W ... 76.5E |

بالإضافة إلى:

- `satellites.xml` — ملف الأقمار المستقل لكل الأقمار الـ88 (Ku Band)، يوضع في `/etc/tuxbox/satellites.xml`.

## التثبيت بسكريبت (الطريقة الأسهل)

```sh
wget -q --no-check-certificate https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/install-morph-settings.sh -O /tmp/install-morph.sh
sh /tmp/install-morph.sh
```

ثم اختر رقم النسخة المناسبة من القائمة. أو مباشرة بدون قائمة (مثال النسخة 13E = رقم 1):

```sh
sh /tmp/install-morph.sh 1
```

> السكريبت يتعامل تلقائياً مع إيقاف/تشغيل الإينغما على الصورتين:
> OE (`init 4` / `init 3`) و DreamOS (`systemctl stop/start enigma2`)،
> ويأخذ نسخة احتياطية من الإعدادات القديمة في `/tmp/morph-oldsettings-*` قبل الاستبدال.

## التثبيت اليدوي

```sh
# 1) إيقاف الإينغما
init 4                      # OE images
# systemctl stop enigma2    # DreamOS

# 2) نسخة احتياطية
cp -a /etc/enigma2 /tmp/enigma2-backup

# 3) حذف القائمة القديمة
rm -f /etc/enigma2/lamedb /etc/enigma2/lamedb5 /etc/enigma2/userbouquet.*

# 4) فك الحزمة على الجذر
cd /tmp
wget --no-check-certificate https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/Morph883-E2-13E-12.10.2026.tar.gz
tar -xzf Morph883-E2-13E-12.10.2026.tar.gz -C /

# 5) حذف lamedb5 (يعيد Enigma2 بناءه) ثم التشغيل
rm -f /etc/enigma2/lamedb5
init 3                      # OE images
# systemctl start enigma2   # DreamOS
```

لتحديث ملف الأقمار فقط:

```sh
wget --no-check-certificate https://raw.githubusercontent.com/azroukarim/plugins/main/channels/Morph/satellites.xml -O /etc/tuxbox/satellites.xml
```

> **ملاحظة:** يجب إيقاف Enigma2 قبل استبدال القوائم، وإلا أُعيدت القائمة القديمة عند الإغلاق.
