# Picons

## picontransparent 220x132 — 13.0E + 19.2E (by chocholoušek)

بيكونات شفافة بمقاس **220×132** لقنوات **الهوت بيرد 13.0E** (4378) و **الأسترا 19.2E** (3638) — الإجمالي **8016** picon.
المصدر: [picon.cz](https://picon.cz) — *Picons by chocholoušek*

| الملف | التفاصيل |
|-------|----------|
| `picontransparent-220x132-13.0E-19.2E_by_chocholousek.tar.gz` | الأرشيف: مجلد `picon/` يحتوي 8016 صورة + about.txt (~60 MB) |
| `install-picons.sh` | سكريبت التثبيت التلقائي |

> داخل الأرشيف مجلد واحد اسمه `picon/` — أي يمكن فكّ الضغط إلى أي مكان مباشرة ويخرج المجلد جاهزاً.

## التثبيت التلقائي (مستحسن)

يختار السكريبت مسار التثبيت تلقائياً حسب المساحة المتوفرة:

1. `/media/hdd/picon/` — إذا كان الهارد موصولاً ومتوفراً فيه مساحة
2. `/media/usb/picon/` — إذا لم يتوفر الهارد أو مساحته غير كافية
3. `/usr/share/enigma2/picon/` — كحل أخير (الفلاش الداخلي)

```sh
wget -q --no-check-certificate https://raw.githubusercontent.com/azroukarim/plugins/main/picons/install-picons.sh -O /tmp/install-picons.sh && sh /tmp/install-picons.sh
```

## التثبيت اليدوي

حمّل الأرشيف ثم افكّ الضغط إلى المسار الذي تريده:

```sh
cd /tmp
wget --no-check-certificate https://raw.githubusercontent.com/azroukarim/plugins/main/picons/picontransparent-220x132-13.0E-19.2E_by_chocholousek.tar.gz -O picons.tar.gz

tar -xzf picons.tar.gz -C /media/hdd           # الهارد     -> /media/hdd/picon
tar -xzf picons.tar.gz -C /media/usb           # الفلاشة    -> /media/usb/picon
tar -xzf picons.tar.gz -C /usr/share/enigma2   # الفلاش داخلي -> /usr/share/enigma2/picon
```

> **ملاحظة:** بعد التثبيت تأكد أن مسار البيكونات (Picon path) في إعدادات صورتك يطابق المجلد المستخدم.
