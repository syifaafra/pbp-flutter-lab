# Tugas 7 PBP : Elemen Dasar Flutter

## Stateless widget dan Stateful widget

Stateless Widget dapat diartikan sebagai Widget yang tidak dapat dirubah atau tidak akan pernah berubah. Sedangkan Stateful Widget merupakan widget yang dinamis atau dapat berubah. Berbanding terbalik dengan stateless, stateful widget dapat mengupdate tampilan, merubah warna, menambah jumlah baris dll. Jadi dapat disimpulkan bahwa apapun widget yang dapat berubah maka itulah stateful widget.

## Widget yang digunakan pada Tugas 7
* Text: untuk membuat teks.
* Row, Column: untuk menciptakan layout yang flexible
* Container: untuk menciptakan elemen persegi panjang
* MaterialApp: untuk menciptakan widget-widget umum yang mengikuti Material Design
* Scaffold: untuk menciptakan struktur layout Material Design
* StatefulWidget: untuk menciptakan widget yang bisa berubah-ubah statenya
* Statelesswidget: untuk mencipatakan widget yang tidak bisa berubah statenya
* Floating Action Button : sebuah tombol yang berbentuk lingkaran dan ditampilkan seperti melayang untuk suatu primary action

## Fungsi dari setState()
Fungsi setState() yang akan bertugas untuk memberitahu framework bahwa ada object yang berubah pada State, kemudian akan melakukan build ulang pada Widget tersebut. Kita hanya bisa menggunakan fungsi ini pada StatefulWidget, karena seperti yang telah dijelaskan di atas, Stateless widget tidak dapat dirubah. Variabel yang dapat diubah dengan setState() adalah variabel yang diubah di dalam body function setState()

## Perbedaan antara ‘const’ dengan ‘final’
* `final` dan `const` merupakan keyword yang dapat digunakan untuk membuat variabel yang bersifat immutable.
* Perbedaan utama ada pada inialisasi nilai (pemberian nilai) dari variabelnya, `const` mengharuskan variabel harus dinialisasi pada saat kompilasi, nilai bersifat konstan dan secara langsung / eksplisit sehingga pada saat kompilasi variabel `const` sudah memiliki nilai, sedangkan `final` tidak mengharuskan variabel memiliki nilai secara langsung / eskplisit pada saat kompilasi.

## Cara implementasi
1. Membuat projek flutter bernama counter_7 dengan command `flutter create counter_7`
2. Mengubah title pada Material App menjadi `counter_7` serta mengubah title pada MyHomePage menjadi `Program Counter`
3. Pada template flutter, sudah diberikan button untuk increment, maka ditambahkan button untuk decrement serta fungsi decrement pada class `_MyHomePageState`
4. Supaya teks indikator berubah menjadi "GANJIL" dengan warna biru ketika counter bernilai ganjil dan berubah menjadi “GENAP” dengan warna merah ketika counter bernilai genap, digunakan if-else pada list widget
5. Bonus : Memodifikasi tombol decrement supaya hanya muncul saat counter>0 dengan menggunakan `if (_counter > 0)` pada floating action button 

## Referensi
* https://belajarflutter.com/
* https://arbiyanto.medium.com/memahami-perbedaan-stateless-vs-stateful-widget-flutter-e8ea12e46ac

# Tugas 8 : Flutter Form

## Link Assignments
https://pbp-fasilkom-ui.github.io/ganjil-2023/assignments/tugas/tugas-8

## Perbedaan Navigator.push dan Navigator.pushReplacement.
Method push digunakan untuk menambahkan rute lain ke atas tumpukan screen (stack) saat ini sehingga halaman baru ditampilkan di atas halaman sebelumnya. Sedangkan method pushReplacement menghapus rute saat ini dengan menggantinya ke rute yang baru sehingga kita tidak dapat kembali ke halaman sebelumnya.

## Widget yang kamu dipakai di proyek kali ini dan fungsinya.
* Text: untuk membuat teks.
* Row, Column: untuk menciptakan layout yang flexible
* Container: untuk menciptakan elemen persegi panjang
* MaterialApp: untuk menciptakan widget-widget umum yang mengikuti Material Design
* Scaffold: untuk menciptakan struktur layout Material Design
* StatefulWidget: untuk menciptakan widget yang bisa berubah-ubah statenya
* Statelesswidget: untuk mencipatakan widget yang tidak bisa berubah statenya
* ListTile: untuk membuat list berupa tile (ubin)
* TextFormField: untuk form field yang dapat diisi dengan Text
* DropdownButton : untuk button dropdown sebagai form field
* TextButton : untuk button dengan text
* Card : untuk material yang dapat menampilkan informasi

## Jenis-jenis event yang ada pada Flutter 
* `onChange`: event saat terjadi perubahan pada widget atau elemen
* `onTap`: event saat widget diketuk
* `onFocusChange`: event saat fokus dari widget berubah
* `onSaved`: event saat elemen disimpan
* `onPressed`: event saat widget ditekan
* `onLongPressed`: event saat widget ditekan dengan lama
* `onSubmitted`: event saat data sudah disubmit
* `onEditingComplete`: event saat sudah selesai mengedit data

## Cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Widget Navigator menampilkan layar seakan sebagai sebuah tumpukan (stack). Untuk menavigasi sebuah halaman baru, kita dapat mengakses Navigator melalui BuildContext dan memanggil fungsi push() atau pop().

## Cara Implementasi
1. Membuat folder-folder berikut pada folder `lib`:
- `model` yang berisi `budget.dart`
- `page` yang berisi `budget_form_page.dart` dan `budget_data_page.dart`
- `widget` yang berisi `drawer.dart`
2. Pada `drawer.dart` dibuat class MyDrawer yang berisi widget Navigator untuk menavigasi halaman lain
3. Pada `main.dart`, `budget_form_page.dart` dan `budget_data_page.dart` kita hanya perlu menggunakan class MyDrawer tersebut untuk membuat widget drawer
4. Pada `budget_form_page.dart` dibuat class MyFormPage sebagai form untuk menambahkan data budget dengan mengikuti tutorial 7
5. Pada `budget_data_page.dart` dibuat class MyDataBudgetPage untuk menambilkan data seluruh budget yang sudah ditambahkan
6. Pada `budget.dart` dibuat class `Budget` sebagai model dari objek budget dan class `Budgets` untuk menyimpan data sseluruh budget yang sudah ditambahkan


## Referensi
https://pbp-fasilkom-ui.github.io/ganjil-2023/assignments/tutorial/tutorial-7
https://belajarflutter.com/memahami-navigasi-routing-di-flutter/

# Tugas 9 : Integrasi Web Service pada Flutter

## Link Assignments
https://pbp-fasilkom-ui.github.io/ganjil-2023/assignments/tugas/tugas-9

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, kita dapat mengambil data JSON tanpa membuat model dengan menggunakan fungsi `jsonDecode()` dan mengambil value yang dibutuhkan pada `Map<String, dynamic>`. Cara ini tidak memiliki persiapan sehingga baik untuk pembuktian konsep. Namun, jika proyek yang dikerjakan cukup besar, menggunakan cara ini rawan terjadi kesalahan apabila terdapat typo sehinnga rawan terjadi runtime rror.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
* Text: untuk membuat teks.
* Row, Column: untuk menciptakan layout yang flexible
* Container: untuk menciptakan elemen persegi panjang
* ListTile: untuk membuat list judul film dengan bentuk berupa card
* ListView : untuk menampung widget
* Checkbox : untuk menampilkan kotak yang dapat diklik untuk memperbaharui suatu nilai

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
* Membuat model berupa class yang memiliki atribut yang sesuai dengan data yang ingin diambil
* Menggunakan fungsi `fromJson()` untuk mengubah data JSON ke bentuk model
* Membuat map dengan nama `toJson()`
* Membuat fungsi asinkronus untuk melakukan fetching data JSON dari url dengan bantuan http request
* Menampilkan data pada page yang sesuai

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat class `MyWatchListPage` dan menambahkan route nya ke dalam `MyDrawer`
2. Membuat model `MyWatchList` untuk mengubah data JSON dari tugas 3 ke dalam bentuk model
3. Melakukan fetching data dari web service kemudian menampilkannya ke aplikasi dengan membuat fungsi `fetchWatchList()` pada `fetch_mywatchlist.dart`
4. Menambahkan checkbox dan border berwwarna pada `ListTile` untuk masing-masing judul
5. Membuat class `DetailScreen` untuk menampilkan detail masing-masing film