# 🧩 My Icon Plus

Aplikasi Flutter berbasis **Clean Architecture** dan menggunakan **GetX** untuk manajemen state dan routing. Cocok untuk dijadikan template awal pengembangan aplikasi modular dengan skala menengah hingga besar.

---

## 🏗️ Arsitektur

Proyek ini mengikuti struktur **Clean Architecture**:


```
lib/
└── app/
├── modules/
│ └── home/
│ ├── data/ → Data source & repository (belum diimplementasi)
│ ├── domain/ → Entitas & usecase
│ │ └── entities/
│ └── presentation/ → Layer UI
│ ├── controllers/
│ ├── bindings/
│ ├── views/
│ └── widgets/
├── routes/ → Manajemen routing (GetX)
├── constants/ → Konstanta global (warna, konfigurasi)
└── main.dart
```


### Layer-Layer Utama:

- **Domain:** Berisi entitas seperti `InternetPromoEntity`, `MenuEntity`, dan `TestimonyEntity`.
- **Data:** Belum diisi, tapi disiapkan untuk mengelola data dari API, database, atau cache.
- **Presentation:** UI menggunakan GetX controller & view modular.
- **Routing:** File `app_pages.dart` dan `app_routes.dart` untuk mendefinisikan navigasi.

---

## 🚀 Fitur

- Modularisasi berdasarkan fitur (saat ini: `home`)
- Arsitektur bersih & scalable
- Integrasi GetX untuk controller, binding, dan route
- Asset management (`icons`, `images`, `logos`)

---

## ▶️ Cara Menjalankan

```bash
git clone https://github.com/ridasukmaraa/my-icon-plus.git
cd my-icon-plus
flutter pub get
flutter run
