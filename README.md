## Tugas Individu
### Kevin Cornellius Widjaja - NPM: 2406428781 - Kelas: PBP E 

<details><summary>Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter</summary>

## **Q1:** Mengapa perlu membuat model Dart saat mengambil/mengirim data JSON? (konsekuensi jika langsung memetakan `Map<String, dynamic>`: validasi tipe, null-safety, maintainability)

**A:** Membuat model Dart saat mengambil/mengirim data JSON sangat penting karena beberapa alasan:
1. **Validasi Tipe**: Dengan menggunakan model Dart, kita dapat memastikan bahwa data yang diterima atau dikirim memiliki tipe yang sesuai dengan yang diharapkan. Ini membantu mencegah kesalahan runtime yang dapat terjadi jika data tidak sesuai dengan struktur yang diharapkan.
2. **Null-Safety**: Model Dart memungkinkan kita untuk menentukan atribut mana yang dapat bernilai null dan mana yang tidak. Ini sangat penting dalam konteks null-safety di Dart, karena kita dapat menghindari potensi kesalahan null reference dengan mendefinisikan atribut secara eksplisit.
3. **Maintainability**: Dengan menggunakan model Dart, kode menjadi lebih terstruktur dan mudah dipelihara. Model memberikan representasi yang jelas tentang data yang digunakan dalam aplikasi, sehingga memudahkan pengembang lain (atau diri kita sendiri di masa depan) untuk memahami struktur data dan melakukan perubahan jika diperlukan.
4. **Kemudahan Penggunaan**: Model Dart menyediakan metode dan properti yang memudahkan manipulasi data, seperti konversi dari dan ke JSON, yang membuat kode lebih bersih dan mudah dibaca dibandingkan dengan penggunaan `Map<String, dynamic>` secara langsung.
5. **Autocompletion dan Dokumentasi**: Dengan model Dart, IDE dapat memberikan autocompletion dan dokumentasi yang lebih baik, sehingga mempercepat proses pengembangan dan mengurangi kesalahan penulisan kode.
6. **Konsistensi Data**: Model Dart membantu menjaga konsistensi data di seluruh aplikasi, karena semua bagian aplikasi yang berinteraksi dengan data tersebut akan menggunakan struktur yang sama.
---
## **Q2:** Apa fungsi package `http` dan `CookieRequest` dalam tugas ini? Jelaskan perbedaan peran `http` vs `CookieRequest`

**A:** Dalam tugas ini, package `http` dan `CookieRequest` memiliki peran yang berbeda dalam mengelola komunikasi antara aplikasi Flutter dan backend Django.
1. **Package `http`**: Package ini digunakan untuk melakukan permintaan HTTP dasar seperti GET, POST, PUT, dan DELETE. Package ini menyediakan cara sederhana untuk mengirim dan menerima data dari server. Namun, package `http` tidak secara otomatis mengelola cookie atau sesi autentikasi, sehingga kita perlu menangani cookie secara manual jika menggunakan package ini.
2. **CookieRequest**: kelas dari package `pbp_django_auth` yang memudahkan manajemen cookie dan sesi saat berinteraksi dengan backend Django. Kelas ini secara otomatis menangani penyimpanan dan pengiriman cookie yang diperlukan untuk menjaga sesi pengguna tetap aktif selama interaksi dengan backend Django. Dengan menggunakan `CookieRequest`, kita dapat dengan mudah melakukan login, logout, dan mengakses endpoint yang memerlukan autentikasi tanpa harus mengelola cookie secara manual.

Sehingga, perbedaan utama antara `http` dan `CookieRequest` adalah bahwa `http` adalah package umum untuk melakukan permintaan HTTP, sedangkan `CookieRequest` adalah kelas khusus yang memfasilitasi manajemen sesi autentikasi berbasis cookie dalam konteks aplikasi Flutter yang berinteraksi dengan backend Django.

---

## **Q3:** Mengapa instance `CookieRequest` perlu dibagikan ke semua komponen di aplikasi Flutter?

**A:** Instance `CookieRequest` perlu dibagikan ke semua komponen di aplikasi Flutter karena beberapa alasan penting:
1. **Konsistensi Sesi**: Dengan membagikan instance `CookieRequest`, semua komponen aplikasi dapat mengakses sesi autentikasi yang sama. Ini memastikan bahwa pengguna tetap terautentikasi saat berinteraksi dengan berbagai bagian aplikasi, seperti halaman daftar item, detail item, dan fitur lainnya.
2. **Pengelolaan Cookie yang Efisien**: `CookieRequest` secara otomatis mengelola cookie yang diperlukan untuk menjaga sesi pengguna. Dengan membagikan instance ini, kita tidak perlu membuat ulang atau mengelola cookie di setiap komponen, sehingga mengurangi kompleksitas kode dan potensi kesalahan.
3. **Akses Mudah ke Fungsi Autentikasi**: Dengan instance `CookieRequest` yang dibagikan, komponen-komponen aplikasi dapat dengan mudah mengakses fungsi-fungsi autentikasi seperti login, logout, dan pengecekan status autentikasi tanpa perlu membuat instance baru atau mengulang kode.
   
Catatan: `CookieRequest` bersifat stateful — harus dipakai sebagai satu instance bersama (misalnya via Provider) agar cookie/sesi tidak hilang ketika berpindah widget.

---

## **Q4:** Jelaskan konfigurasi konektivitas agar Flutter dapat berkomunikasi dengan Django (mengapa menambahkan `10.0.2.2` pada `ALLOWED_HOSTS`, mengaktifkan CORS, pengaturan `SameSite`/cookie, dan menambahkan izin akses internet di Android). Apa yang terjadi jika konfigurasi tidak benar? 

**A:**  Agar aplikasi Flutter dapat berkomunikasi dengan backend Django, beberapa konfigurasi konektivitas perlu dilakukan:
1. **Menambahkan `10.0.2.2` pada `ALLOWED_HOSTS`**: Alamat `10.0.2.2` adalah alamat IP khusus yang digunakan oleh emulator Android untuk mengakses localhost pada mesin pengembangan. Dengan menambahkannya ke `ALLOWED_HOSTS` di Django, kita mengizinkan backend menerima permintaan dari emulator Flutter.
2. **Mengaktifkan CORS (Cross-Origin Resource Sharing)**: CORS perlu diaktifkan di Django untuk mengizinkan permintaan dari domain atau port yang berbeda (dalam hal ini, dari aplikasi Flutter). Tanpa pengaturan CORS yang benar, browser akan memblokir permintaan lintas asal, sehingga aplikasi Flutter tidak dapat berkomunikasi dengan backend Django.
3. **Pengaturan `SameSite`/cookie**: Pengaturan ini penting untuk memastikan bahwa cookie autentikasi dapat dikirim bersama permintaan cross-origin. Jika cookie tidak dikonfigurasi dengan benar (misalnya, `SameSite=None` dan `Secure=True` untuk koneksi HTTPS), maka cookie mungkin tidak akan dikirim, yang menyebabkan masalah autentikasi.
4. **Menambahkan Izin Akses Internet di Android**: Di file `AndroidManifest.xml`, perlu menambahkan izin akses internet (`<uses-permission android:name="android.permission.INTERNET"/>`) agar aplikasi Flutter dapat melakukan permintaan jaringan. Tanpa izin ini, aplikasi tidak akan dapat mengakses internet, sehingga komunikasi dengan backend Django akan gagal. Jika konfigurasi ini tidak benar, aplikasi Flutter mungkin mengalami berbagai masalah, seperti:
- Tidak dapat terhubung ke backend Django.
- Permintaan ditolak karena masalah CORS.
- Cookie tidak dikirim, sehingga autentikasi gagal.
- Aplikasi tidak dapat mengakses internet sama sekali.

---

## **Q5:** Jelaskan mekanisme pengiriman data mulai dari input hingga tampil di Flutter

**A:** Mekanisme pengiriman data dari input hingga tampil di Flutter melibatkan beberapa langkah berikut:
1. **Input Data**: Pengguna memasukkan data melalui formulir di aplikasi Flutter, seperti halaman registrasi atau login.
2. **Membuat Permintaan HTTP**: Setelah pengguna mengisi formulir dan menekan tombol submit, aplikasi Flutter menggunakan instance `CookieRequest` untuk membuat permintaan HTTP (misalnya, POST) ke endpoint Django yang sesuai. Data yang dimasukkan oleh pengguna dikemas dalam format JSON dan dikirim sebagai bagian dari permintaan.
3. **Pengolahan di Backend Django**: Backend Django menerima permintaan, memproses data yang dikirim, dan melakukan tindakan yang diperlukan, seperti menyimpan data ke database atau memvalidasi kredensial pengguna.
4. **Mengirim Respons**: Setelah memproses permintaan, Django mengirimkan respons kembali ke aplikasi Flutter. Respons ini biasanya berisi informasi tentang hasil operasi, seperti status sukses atau data yang diminta.
5. **Menerima dan Menampilkan Data di Flutter**: Aplikasi Flutter menerima respons dari Django. Jika respons berisi data (misalnya, daftar item), aplikasi akan mengurai data tersebut dan memperbarui state aplikasi untuk menampilkan data di UI. Jika respons berisi status operasi (misalnya, sukses atau gagal), aplikasi dapat menampilkan pesan yang sesuai kepada pengguna.
   
---

## **Q6:** Jelaskan mekanisme autentikasi: login, register, logout (alur dari Flutter → Django → response → tampilan menu)

**A:** Mekanisme autentikasi melibatkan beberapa langkah berikut:
1. **Registrasi (Register)**:
   - Pengguna mengisi formulir registrasi di aplikasi Flutter dengan informasi seperti username, password, dan email.
   - Aplikasi Flutter mengirimkan permintaan POST ke endpoint registrasi Django menggunakan `CookieRequest`, mengirimkan data dalam format JSON.
   - Django memproses data, membuat akun baru, dan mengirimkan respons kembali ke Flutter yang menunjukkan status registrasi (sukses/gagal).
   - Aplikasi Flutter menampilkan pesan sesuai dengan respons yang diterima.
2. **Login**:
   - Pengguna mengisi formulir login di aplikasi Flutter dengan username dan password.
   - Aplikasi Flutter mengirimkan permintaan POST ke endpoint login Django menggunakan `CookieRequest`.
   - Django memvalidasi kredensial, membuat sesi autentikasi, dan mengirimkan respons kembali ke Flutter yang menunjukkan status login (sukses/gagal).
   - Jika login sukses, `CookieRequest` menyimpan cookie yang dikirim Django (misalnya sessionid, csrftoken), sehingga permintaan berikutnya membawa cookie tersebut.
   - Aplikasi Flutter memperbarui UI untuk menampilkan menu utama atau halaman yang sesuai
   - Jika login gagal, aplikasi menampilkan pesan kesalahan kepada pengguna.
3. **Logout**:
   - Pengguna memilih opsi logout di aplikasi Flutter.
   - Aplikasi Flutter mengirimkan permintaan POST ke endpoint logout Django menggunakan `CookieRequest`.
   - Django menghapus sesi autentikasi dan mengirimkan respons kembali ke Flutter yang menunjukkan
   - status logout (sukses/gagal).
   - Aplikasi Flutter menghapus cookie sesi dari `CookieRequest` dan memperbarui UI untuk menampilkan halaman login atau menu awal.

---

## **Q7:** Jelaskan langkah-langkah bagaimana kamu mengimplementasikan checklist ini secara **step-by-step** (bukan sekadar mengikuti tutorial)

**A:** Berikut adalah langkah-langkah yang saya lakukan untuk mengimplementasikan checklist tugas ini secara step-by-step:
1. **Mempersiapkan Proyek**: Saya mulai dengan memastikan bahwa proyek Django sudah berjalan dengan baik dan dapat diakses dari aplikasi Flutter.
2. **Membuat Model Kustom di Django**: Saya membuat model kustom di Django sesuai dengan kebutuhan aplikasi, termasuk atribut seperti `name`, `price`, `description`, `stock`, `brand`, `rating`, `thumbnail`, `category`, dan `is_featured`.
3. **Membuat Endpoint JSON di Django**: Saya membuat endpoint API di Django yang mengembalikan data item dalam format JSON (`/json/` untuk semua produk dan `/json/my-products/` untuk produk user), serta endpoint untuk registrasi, login, dan logout.
4. **Mengonfigurasi CORS dan ALLOWED_HOSTS**: Saya mengonfigurasi CORS di Django untuk mengizinkan permintaan dari aplikasi Flutter dan menambahkan `localhost` ke `ALLOWED_HOSTS` untuk Chrome development.
5. **Membuat Model Dart di Flutter**: Saya membuat model `ProductEntry` di Flutter yang sesuai dengan model Django, dengan semua field termasuk `stock`, `brand`, `rating`, dan `userId` untuk memudahkan pemetaan data JSON ke objek Dart dan sebaliknya.
6. **Mengatur CookieRequest di Flutter**: Saya menggunakan package `pbp_django_auth` dan membuat instance `CookieRequest` dengan Provider untuk mengelola sesi autentikasi berbasis cookie di seluruh aplikasi.
7. **Membuat Halaman Registrasi dan Login di Flutter**: Saya membuat halaman registrasi dan login dengan UI modern (blue background, white card design) yang mengirimkan data ke endpoint Django menggunakan `CookieRequest`.
8. **Membuat Halaman Daftar Item di Flutter**: Saya membuat halaman `ProductEntryListPage` yang mengambil data dari endpoint JSON Django dan menampilkannya dalam bentuk card dengan informasi lengkap (thumbnail, name, brand, category, price, rating, stock status).
9. **Membuat Halaman Detail Item di Flutter**: Saya membuat halaman `ProductDetailPage` yang menampilkan semua atribut produk secara detail termasuk price, rating, stock, brand, category, description, featured badge, dan tombol "Add to Cart" dan "Back to Products".
10. **Menambahkan Filter pada Halaman Daftar Item**: Saya mengimplementasikan filter client-side dengan button di AppBar yang memfilter produk berdasarkan `product.userId == loggedInUser.id` menggunakan `request.jsonData['user_id']`, sehingga pengguna dapat toggle antara "All Products" dan "My Products".
11. **Membuat Form Tambah Produk dengan Field Lengkap**: Saya membuat halaman `ProductFormPage` dengan semua field yang diperlukan: name, brand, category, description, price, stock, rating, thumbnail, dan featured switch. Form ini memiliki validasi lengkap dan mengirim data ke endpoint `/create-flutter/`.
12. **Meningkatkan UI/UX**: Saya mengimplementasikan Material 3 theme dengan primary color `#0066FF`, membuat login/register page dengan modern blue background design, dan product cards dengan badges (Featured, In Stock, Out of Stock).
13. **Menjawab Pertanyaan di README.md**: Saya menjawab semua pertanyaan yang diberikan di README.md sesuai dengan pengalaman implementasi saya.
14. **Melakukan Commit dan Push ke GitHub**: Setelah semua langkah selesai, saya melakukan `git add`, `git commit`, dan `git push` untuk mengunggah perubahan ke repository GitHub.
  
---
Checklist Tugas:
- [X] Memastikan deployment proyek Django sudah berjalan dengan baik 
- [X] Mengimplementasikan fitur registrasi akun pada proyek Flutter 
- [X] Membuat halaman login pada proyek Flutter 
- [X] Mengintegrasikan sistem autentikasi Django dengan proyek Flutter 
- [X] Membuat model kustom sesuai dengan proyek aplikasi Django 
- [X] Membuat halaman daftar item (mengambil dari endpoint JSON Django) 
- [X] Menampilkan untuk tiap item: `name`, `price`, `description`, `thumbnail`, `category`, `is_featured`, `brand`, `rating`, `stock`
- [X] Membuat halaman detail untuk setiap item 
- [X] Halaman dapat diakses dengan menekan salah satu card pada halaman daftar 
- [X] Menampilkan seluruh atribut model item pada halaman detail (kecuali `created_at` dan `updated_at`)
- [X] Menambahkan tombol untuk kembali ke halaman daftar item 
- [X] Menambahkan filter pada halaman daftar item: hanya tampilkan item yang terasosiasi dengan pengguna yang login (implementasi client-side filtering berdasarkan `userId`)
- [X] Menjawab pertanyaan-pertanyaan berikut di `README.md` (tambahkan subjudul untuk tiap pertanyaan) 
- [X] Mengapa perlu membuat model Dart saat mengambil/mengirim data JSON? (konsekuensi jika langsung memetakan `Map<String, dynamic>`: validasi tipe, null-safety, maintainability) 
- [X] Apa fungsi package `http` dan `CookieRequest` dalam tugas ini? Jelaskan perbedaan peran `http` vs `CookieRequest` 
- [X] Mengapa instance `CookieRequest` perlu dibagikan ke semua komponen di aplikasi Flutter? 
- [X] Jelaskan konfigurasi konektivitas agar Flutter dapat berkomunikasi dengan Django (mengapa menambahkan `10.0.2.2` pada `ALLOWED_HOSTS`, mengaktifkan CORS, pengaturan `SameSite`/cookie, dan menambahkan izin akses internet di Android). Apa yang terjadi jika konfigurasi tidak benar? 
- [X] Jelaskan mekanisme pengiriman data mulai dari input hingga tampil di Flutter 
- [X] Jelaskan mekanisme autentikasi: login, register, logout (alur dari Flutter → Django → response → tampilan menu) 
- [X] Jelaskan langkah-langkah bagaimana kamu mengimplementasikan checklist ini secara **step-by-step** (bukan sekadar mengikuti tutorial) 
- [X] Melakukan `add` → `commit` → `push` ke GitHub
- [X] BONUS: Membuat form tambah produk dengan field lengkap (`name`, `price`, `description`, `stock`, `brand`, `rating`, `thumbnail`, `category`, `is_featured`)
- [X] BONUS: Meningkatkan UI/UX aplikasi dengan Material 3 theme, modern login/register design, dan product cards dengan badges 

---

</details>

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
