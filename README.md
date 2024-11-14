``` text
Nama   : Muhammad Fakhruddin Arif
NIM    : 2241720030
Kelas  : TI-3C
```
### Praktikum 1 - Dart Streams
#### Soal 1
##### Tambahkan nama panggilan anda pada title app sebagai identitas hasil pekerjaan anda.
``` dart
title: 'Stream - Muhammad Fakhruddin Arif',
```
##### Gantilah warna tema aplikasi sesuai dengan warna favorit anda.
``` dart
primarySwatch: Colors.blue,
```
#### Soal 2
##### Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.
``` dart
class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.pinkAccent,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.cyan
  ];
}
```
#### Soal 3
##### Jelaskan fungsi keyword yield* pada kode tersebut!
- `yield*` digunakan untuk mengembalikan nilai dari stream yang lain. Dalam kasus ini, `yield*` digunakan untuk mengembalikan nilai dari stream `colors` yang berisi list warna.
- `yield*` akan mengembalikan nilai satu per satu dari stream yang dijadikan sebagai parameter.
- `yield*` akan mengembalikan nilai dari stream yang dijadikan sebagai parameter sampai stream tersebut selesai.
- `yield*` akan mengembalikan nilai dari stream yang dijadikan sebagai parameter secara berurutan.
##### Apa maksud isi perintah kode tersebut?
- Maksud dari kode tersebut adalah untuk mengembalikan nilai dari stream `colors` yang berisi list warna.
- Setiap warna yang ada pada stream `colors` akan diambil satu per satu dan dikembalikan sebagai nilai stream.
- Setelah semua warna pada stream `colors` diambil, maka stream akan selesai.
#### Soal 4
Hasil dari praktikum 1 adalah sebagai berikut:

![Praktikum 1](images/13_01_04.gif)
#### Soal 5
##### Jelaskan perbedaan menggunakan listen dan await for
- `listen` digunakan untuk mendengarkan perubahan pada stream. Ketika stream mengeluarkan nilai, maka nilai tersebut akan diambil dan diproses.
- `await for` digunakan untuk menunggu stream mengeluarkan nilai. Ketika stream mengeluarkan nilai, maka nilai tersebut akan diambil dan diproses.
- Perbedaan antara `listen` dan `await for` adalah pada cara pengambilan nilai dari stream. `listen` akan mengambil nilai dari stream ketika stream mengeluarkan nilai, sedangkan `await for` akan menunggu stream mengeluarkan nilai.
### Praktikum 2 - Stream Controller dan Sinks
#### Soal 6
##### Jelaskan maksud kode langkah 8 dan 10 tersebut!
- `initState` adalah method yang akan dipanggil ketika state dari widget diinisialisasi. Pada kode langkah 8, method `initState` digunakan untuk menginisialisasi stream controller dan sink.
- Memanggil numberStream, numberStreamController, dan stream kemudian listen pada stream tersebut dengan `lastNumber` = event.
- Untuk bagian langkah 10, membuat method addRandomNumber yang digunakan untuk menambahkan angka random ke dalam stream.
Berikut hasil dari praktikum 2:

![Praktikum 2](images/13_02_06.gif)
#### Soal 7
##### Jelaskan maksud kode langkah 13 sampai 15 tersebut!
- Pada langkah 13, method `addError()` digunakan untuk menambahkan error ke dalam stream.
- Pada langkah 14, menambahkan `onError` pada `initState()`.
- Pada langkah 15, menambahkan `onError` pada `addRandomNumber()` digunakan sebagai pembacaan error.
### Praktikum 3 - Injeksi data ke dalam Stream
#### Soal 8
##### Jelaskan maksud kode langkah 1 sampai 3 tersebut!
- Pada langkah 1, membuat variabel `tranformer` dengan tipe `StreamTransformer` yang digunakan untuk mengubah nilai stream.
- Pada langkah 2, tambahkan handler pada `initState` digunakan sebagai handle pada data.
- Pada langkah 3, stream tranform dengan menggunakan listen untuk memanggil `lastNumber`.
Berikut hasil dari praktikum 3:

![Praktikum 3](images/13_03_08.gif)
### Praktikum 4 - Subscribe ke stream events
#### Soal 9
##### Jelaskan maksud kode dari langkah 2, 6, dan 8!
- Pada langkah 2, membuat variabel `subscription` yang digunakan untuk mendengarkan perubahan pada stream.
- Pada langkah 6, menambahkan `subscription.cancel()` pada `dispose()` untuk membatalkan subscription.
- Pada langkah 8, edit method `addRandomNumber` dengan menambahkan pengecekan apakah subscription sudah dibatalkan atau belum.
Berikut hasil dari praktikum 4:

![Praktikum 4](images/13_04_09.gif)
### Praktikum 5 - Multiple stream subscriptions
#### Soal 10
##### Jelaskan mengapa error itu dapat terjadi?
- Dapat terjadi dikarenakan ketika mencoba listen pada sebuah single-subscription stream lebih dari sekali. Single-subscription stream hanya dapat didengarkan oleh satu listener pada satu waktu. Jika Anda perlu mendengarkan stream yang sama oleh beberapa listener.
#### Soal 11
##### Jelaskan mengapa hal tersebut dapat terjadi?
- Setelah menggunakan `asBroadcastStream()`, stream dapat didengarkan oleh beberapa listener. Dan mengapa ketika button `New Random Number` ditekan text bertambah dua kali, karena stream dapat didengarkan oleh beberapa listener.
Berikut hasil dari praktikum 5:

![Praktikum 5](images/13_05_11.gif)
### Praktikum 6 - StreamBuilder
#### Soal 12
##### Jelaskan maksud kode langkah 3 sampai 7 tersebut!
- Pada langkah 3, membuat fungsi `getNumbers()` yang digunakan untuk mengembalikan stream dari `numberStream` dengan random number.
- Pada langkah 4, membuat build context dengan berisi `Container()`
- Pada langkah 5, membuat variabel `numberStream` didalam main
- Pada langkah 6, edit initState dengan menambahkan `getNumbers()`
- Pada langkah 7, membuat `StreamBuilder` dengan `stream` dan `builder` yang digunakan untuk membangun widget.
Berikut hasil dari praktikum 6:

![Praktikum 6](images/13_06_12.gif)
### Praktikum 7 - BloC Pattern
#### Soal 13
##### Jelaskan maksud praktikum ini ! Dimanakah letak konsep pola BLoC-nya ?
- Praktikum ini adalah untuk membuat aplikasi yang menghasilkan angka random dengan menggunakan BLoC Pattern.
- Konsep pola BLoC terletak pada class `RandomNumberBloc` yang digunakan untuk mengatur stream controller dan sink.
- Pada class `RandomNumberBloc` terdapat method `generateRandom` yang digunakan untuk menambahkan angka random ke dalam stream dan method `randomNumber` yang digunakan untuk mendapatkan angka random dari stream.
- Kemudian pada constructor `RandomNumberBloc`, stream controller `generateRandomController` akan mendengarkan perubahan pada stream dan menambahkan angka random ke dalam stream controller `randomNumberController`.
- Pada method `dispose`, stream controller akan di close.
Berikut hasil dari praktikum 7:

![Praktikum 7](images/13_07_13.gif)