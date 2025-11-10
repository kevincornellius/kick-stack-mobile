## Tugas Individu
### Kevin Cornellius Widjaja - NPM: 2406428781 - Kelas: PBP E 


<details><summary>Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements</summary>

## **Q1**: Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

**A:** `Navigator.push()` adalah metode yang digunakan untuk menambahkan halaman baru ke tumpukan navigasi (navigation stack) tanpa menghapus halaman sebelumnya. Ini memungkinkan pengguna untuk kembali ke halaman sebelumnya dengan menekan tombol kembali. Sebaliknya, `Navigator.pushReplacement()` menggantikan halaman saat ini dengan halaman baru, sehingga halaman sebelumnya dihapus dari tumpukan navigasi. Pengguna tidak dapat kembali ke halaman sebelumnya setelah menggunakan `pushReplacement()`. Dalam aplikasi saya, saya menggunakan `Navigator.push()` ketika pengguna menavigasi ke halaman formulir tambah produk baru agar mereka dapat kembali ke halaman utama setelah menyelesaikan formulir. Sedangkan `Navigator.pushReplacement()` dapat digunakan ketika pengguna menyelesaikan proses tertentu, seperti logout, di mana tidak perlu kembali ke halaman sebelumnya.

---

## **Q2:** Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

**A:** Saya memanfaatkan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk menciptakan struktur halaman yang konsisten di seluruh aplikasi dengan cara berikut:
- `Scaffold`: Saya menggunakan widget `Scaffold` sebagai kerangka dasar untuk setiap halaman dalam aplikasi. `Scaffold` menyediakan struktur standar yang mencakup area untuk `AppBar`, `Drawer`, dan konten utama halaman. Dengan menggunakan `Scaffold`, saya memastikan bahwa setiap halaman memiliki tata letak yang seragam dan mudah dinavigasi.
- `AppBar`: Saya menambahkan widget `AppBar` di bagian atas setiap halaman untuk menampilkan judul halaman dan menyediakan akses cepat, seperti tombol menu. 
- `Drawer`: Saya menggunakan widget `Drawer` untuk menyediakan navigasi samping yang konsisten di seluruh aplikasi. Drawer ini berisi opsi navigasi seperti Halaman Utama dan Tambah Produk, sehingga pengguna dapat dengan mudah berpindah antar halaman tanpa kehilangan konteks aplikasi.
  
---

## **Q3:** Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

**A:** Dalam konteks desain antarmuka, penggunaan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` memiliki beberapa kelebihan saat menampilkan elemen-elemen form:
- `Padding`: Widget ini memungkinkan saya untuk menambahkan ruang di sekitar elemen form, sehingga tampilan menjadi lebih rapi dan mudah dibaca. Contohnya, saya menggunakan `Padding` di sekitar setiap elemen input (nama produk, harga, deskripsi, kategori, thumbnail, dan switch unggulan) pada formulir tambah produk untuk memberikan jarak yang cukup antara elemen-elemen tersebut.
- `SingleChildScrollView`: Widget ini memungkinkan konten form untuk di-scroll jika melebihi batas layar. Ini sangat berguna untuk formulir yang panjang, sehingga pengguna dapat mengakses semua elemen input tanpa masalah. Dalam aplikasi saya, saya membungkus seluruh `Column` yang berisi elemen-elemen form dengan `SingleChildScrollView` pada halaman `ProductFormPage` agar pengguna dapat melakukan scroll ke bawah untuk melihat semua bidang input.
- `ListView`: Widget ini berguna untuk menampilkan daftar item yang dapat di-scroll dengan performa yang baik. Dalam aplikasi saya, `ListView` digunakan di dalam `Drawer` untuk menampilkan menu navigasi seperti "Halaman Utama" dan "Tambah Produk" secara vertikal.

---

## **Q4:** Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

**A:** Saya menggunakan skema warna biru sebagai warna utama untuk konsistensi visual aplikasi KickStack:
- **Theme Global**: Di `main.dart`, saya set `primarySwatch: Colors.blue` yang otomatis digunakan oleh semua komponen.
- **AppBar dan Drawer**: Menggunakan `Theme.of(context).colorScheme.primary` agar konsisten dengan tema global.
- **Tombol Save**: Menggunakan `Theme.of(context).colorScheme.secondary` untuk memberikan penekanan visual.

---
Checklist untuk tugas ini adalah sebagai berikut:
- [X] Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah produk baru dengan ketentuan sebagai berikut:
  - [X] Memakai minimal tiga elemen input, yaitu name, price, dan description.
  - [X] Tambahkan elemen input lain sesuai dengan model pada aplikasi Football Shop Django yang telah kamu buat (misalnya thumbnail, category, dan isFeatured).
- [X] Memiliki sebuah tombol Save.
- [X] Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
  - [X] Setiap elemen input tidak boleh kosong.
  - [X] Setiap elemen input harus berisi data dengan tipe data atribut modelnya.
- [X] Mengarahkan pengguna ke halaman form tambah produk baru ketika menekan tombol Tambah Produk pada halaman utama.
- [X] Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman form tambah produk baru.
- [X] Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
  - [X] Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Produk.
  - [X] Ketika memilih opsi Halaman Utama, aplikasi akan mengarahkan pengguna ke halaman utama.
  - [X] Ketika memilih opsi Tambah Produk, aplikasi akan mengarahkan pengguna ke halaman form tambah produk baru.
- [X] Menjawab beberapa pertanyaan berikut pada README.md pada root folder (silakan modifikasi README.md yang telah kamu buat sebelumnya dan tambahkan subjudul untuk setiap tugas):
  - [X] Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
  - [X] Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
  - [X] Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
  - [X] Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
- [X] Melakukan add, commit, dan push ke GitHub.

</details>

<details><summary>Tugas 7: Elemen Dasar Flutter</summary>


## **Q1:** Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

**A:** Widget tree pada Flutter adalah struktur hierarkis yang menggambarkan bagaimana widget-widget dalam aplikasi saling berhubungan satu sama lain. Setiap widget dapat memiliki satu atau lebih widget anak (child widgets) yang berada di dalamnya, membentuk hubungan parent-child. Parent widget bertanggung jawab untuk mengatur tata letak dan perilaku dari child widgets-nya. Misalnya, sebuah `Column` widget dapat menjadi parent dari beberapa `Text` widget sebagai child-nya, di mana `Column` mengatur bagaimana `Text` widgets tersebut ditampilkan secara vertikal.


---

## **Q2:** Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

**A:** Dalam proyek ini, saya menggunakan beberapa widget, antara lain:

1. `MaterialApp`: Widget ini adalah widget root yang membungkus seluruh aplikasi dan menyediakan tema serta navigasi.
2. `Scaffold`: Widget ini menyediakan struktur dasar untuk halaman, termasuk AppBar, Body, dan FloatingActionButton.
3. `AppBar`: Widget ini adalah bilah aplikasi yang biasanya terletak di bagian atas layar dan menampilkan judul serta tindakan terkait aplikasi.
4. `Column`: Widget ini digunakan untuk menampilkan widget anak secara vertikal.
5. `Row`: Widget ini digunakan untuk menampilkan widget anak secara horizontal.
6. `Text`: Widget ini digunakan untuk menampilkan teks di layar.
7. `Card`: Widget ini digunakan untuk membuat kartu dengan bayangan yang menampilkan informasi NPM, Nama, dan Kelas.
8. `GridView`: Widget ini digunakan untuk menampilkan item dalam bentuk grid dengan 3 kolom.
9. `Material`: Widget ini memberikan efek visual Material Design pada ItemCard.
10. `InkWell`: Widget ini memberikan efek ripple saat kartu ditekan dan menangani gesture tap.
11. `Container`: Widget ini digunakan untuk mengatur padding dan layout dari konten di dalam kartu.
12. `Icon`: Widget ini digunakan untuk menampilkan ikon pada setiap tombol.
13. `SnackBar`: Widget ini digunakan untuk menampilkan pesan singkat di bagian bawah layar saat tombol ditekan.

---

## **Q3:** Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

**A:** Widget `MaterialApp` adalah widget yang menyediakan kerangka dasar untuk aplikasi Flutter dengan menerapkan Material Design dari Google. Widget ini sering digunakan sebagai widget root karena menyediakan banyak fitur penting, seperti:

1. **Tema:** `MaterialApp` memungkinkan kita untuk mendefinisikan tema aplikasi secara global, termasuk warna, font, dan gaya lainnya.
2. **Navigasi:** Widget ini menyediakan sistem navigasi yang mudah digunakan, termasuk pengelolaan rute dan transisi antar halaman.
3. **Localization:** `MaterialApp` mendukung lokalizasi, memungkinkan aplikasi untuk menampilkan teks dalam berbagai bahasa.
4. **Widget Builder:** Widget ini menyediakan `builder` yang memungkinkan kita untuk membangun widget berdasarkan keadaan aplikasi saat ini.

Dengan semua fitur ini, `MaterialApp` menjadi pilihan yang ideal untuk widget root dalam aplikasi Flutter.

---

## **Q4:** Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

**A:** Perbedaan utama antara `StatelessWidget` dan `StatefulWidget` terletak pada kemampuan mereka untuk menyimpan dan mengelola keadaan (state).
- `StatelessWidget`: Widget ini tidak memiliki keadaan yang dapat berubah. Setelah dibuat, tampilannya tetap sama selama siklus hidupnya. Kita memilih `StatelessWidget` ketika kita tahu bahwa widget tersebut tidak akan berubah atau memerlukan pembaruan berdasarkan interaksi pengguna atau data eksternal.
- `StatefulWidget`: Widget ini memiliki keadaan yang dapat berubah selama siklus hidupnya. Widget ini dapat memperbarui tampilannya berdasarkan perubahan state. Kita memilih `StatefulWidget` ketika kita perlu menangani interaksi pengguna, pembaruan data, atau perubahan tampilan yang dinamis.

---

## **Q5:** Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

**A:** `BuildContext` adalah objek yang memberikan informasi tentang lokasi widget dalam tree widget. `BuildContext` penting di Flutter karena memungkinkan kita untuk mengakses informasi tentang widget di sekitarnya, seperti tema, ukuran, dan orientasi. Selain itu, `BuildContext` juga digunakan untuk menavigasi antar halaman dan mengakses provider yang terdaftar di atas widget saat ini.

Penggunaan `BuildContext` di metode `build` umumnya melibatkan pemanggilan metode atau widget yang memerlukan konteks saat ini. Misalnya, kita dapat menggunakan `BuildContext` untuk mengakses tema aplikasi dengan `Theme.of(context)` atau untuk menampilkan dialog dengan `showDialog(context: context)`.

---

## **Q6:** Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

**A:** "Hot reload" adalah fitur di Flutter yang memungkinkan pengembang untuk melihat perubahan kode secara instan tanpa harus memulai ulang aplikasi. Ketika kita melakukan hot reload, Flutter menyisipkan kode yang telah diubah ke dalam aplikasi yang sedang berjalan, mempertahankan keadaan (state) aplikasi saat ini. Ini sangat berguna untuk mempercepat proses pengembangan dan debugging.

Di sisi lain, "hot restart" adalah proses yang lebih menyeluruh di mana aplikasi dimulai ulang dari awal. Semua keadaan (state) aplikasi akan direset, dan aplikasi akan memuat ulang semua kode dari awal. Hot restart biasanya digunakan ketika perubahan kode mempengaruhi struktur aplikasi secara signifikan atau ketika kita ingin memastikan bahwa semua perubahan diterapkan dengan benar.
---

Checklist untuk tugas ini adalah sebagai berikut:
- [X] Membuat sebuah program Flutter baru dengan tema Football shop yang sesuai dengan tugas-tugas sebelumnya.
- [X] Membuat tiga tombol sederhana dengan ikon dan teks untuk product kamu:
  - [X] All Products
  - [X] My Products
  - [X] Create Product
- [X] Mengimplementasikan warna-warna yang berbeda untuk setiap tombol:
  - [X] Warna biru untuk tombol All Products
  - [X] Warna hijau untuk tombol My Products
  - [X] Warna merah untuk tombol Create Product
- [X] Memunculkan Snackbar dengan tulisan:
  - [X] "Kamu telah menekan tombol All Products" ketika tombol All Products ditekan.
  - [X] "Kamu telah menekan tombol My Products" ketika tombol My Products ditekan.
  - [X] "Kamu telah menekan tombol Create Product" ketika tombol Create Product ditekan.
- [X] Jawab pertanyaan-pertanyaan berikut di file README.md pada folder root:
  - [X] Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
  - [X] Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
  - [X] Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
  - [X] Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
  - [X] Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
  - [X] Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
- [X] Melakukan add-commit-push ke suatu repositori baru di GitHub.

</details>