# Picons

## Picon Transparant 220x132 — المجموعة الشاملة (22,818 picon)

بيكونات شفافة بمقاس **220×132** لأقمار متعددة: 13E، 19.2E، 39E، 77E، 16E، 7E، 4.8E، 0.8W وغيرها.
المصدر: [picon.cz](https://picon.cz) — *Picons by chocholoušek* + إضافات.

| العنصر | التفاصيل |
|--------|----------|
| **الأرشيف** | `picon_transparant-220x132.tar.gz` — 22,818 picon + about.txt، ~165 MB — من صفحة [Releases](https://github.com/azroukarim/plugins/releases) |
| **السكريبت** | `install-picons.sh` — تثبيت تلقائي |

> رابط التحميل المباشر:
> `https://github.com/azroukarim/plugins/releases/download/picon_transparant-220x132/picon_transparant-220x132.tar.gz`

> داخل الأرشيف مجلد واحد اسمه `picon/` — يمكن فكّ الضغط إلى أي مكان مباشرة ويخرج المجلد جاهزاً.

## التثبيت التلقائي (مستحسن)

يختار السكريبت مسار التثبيت تلقائياً حسب المساحة المتوفرة:

1. `/media/hdd/picon/` — إذا كان الهارد موصولاً ومتوفراً فيه مساحة
2. `/media/usb/picon/` — إذا لم يتوفر الهارد أو مساحته غير كافية
3. `/usr/share/enigma2/picon/` — كحل أخير (الفلاش الداخلي)

```sh
wget -q --no-check-certificate https://raw.githubusercontent.com/azroukarim/plugins/main/picons/install-picons.sh -O /tmp/install-picons.sh && sh /tmp/install-picons.sh
```

## التثبيت اليدوي

```sh
cd /tmp
wget --no-check-certificate https://github.com/azroukarim/plugins/releases/download/picon_transparant-220x132/picon_transparant-220x132.tar.gz -O picons.tar.gz

tar -xzf picons.tar.gz -C /media/hdd           # الهارد        -> /media/hdd/picon
tar -xzf picons.tar.gz -C /media/usb           # الفلاشة       -> /media/usb/picon
tar -xzf picons.tar.gz -C /usr/share/enigma2   # الفلاش داخلي  -> /usr/share/enigma2/picon
```

> **ملاحظة:** بعد التثبيت تأكد أن مسار البيكونات (Picon path) في إعدادات صورتك يطابق المجلد المستخدم.
