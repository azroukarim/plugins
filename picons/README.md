# Picons

## picontransparent 220x132 — 13.0E + 19.2E (by chocholoušek)

بيكونات شفافة بمقاس **220×132** لقنوات **الهوت بيرد 13.0E** و **الأسترا 19.2E**.
المصدر: [picon.cz](https://picon.cz) — *Picons by chocholoušek*

| الملف | عدد البيكونات | الحجم |
|-------|--------------|-------|
| `picontransparent-220x132-13.0E-19.2E_by_chocholousek.tar.gz` | 8016 picon | ~60 MB |

### التثبيت على الجهاز (Enigma2)

```sh
cd /tmp
wget --no-check-certificate https://raw.githubusercontent.com/azroukarim/plugins/main/picons/picontransparent-220x132-13.0E-19.2E_by_chocholousek.tar.gz -O picons.tar.gz
tar -xzf picons.tar.gz -C /
```

تُستخرج البيكونات تلقائياً إلى المسار القياسي: `/usr/share/enigma2/picon/`

> **ملاحظة:** إذا كان مسار البيكونات على صورتك مختلفاً (مثل `/picon` أو `/media/usb/picon` أو `/data/picon`)، انسخ الملفات من `/usr/share/enigma2/picon/` إلى المسار المناسب:
>
> ```sh
> cp /usr/share/enigma2/picon/*.png /picon/
> ```

بعد التثبيت أعد تشغيل الواجهة (Enigma2) من القائمة أو بالأمر `init 4 && init 3` (OE) / `systemctl restart enigma2` (DreamOS).
