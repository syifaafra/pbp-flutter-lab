# Tugas 7 PBP

Elemen Dasar Flutter

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
