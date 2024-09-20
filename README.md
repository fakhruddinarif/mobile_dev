``` text
Nama   : Muhammad Fakhruddin Arif
NIM    : 2241720030
Kelas  : TI-3C
```
### Praktikum 1
#### 1. Membuat project Flutter Langkah 1
![screenshoot project flutter](images/w4_p1_1.png)
#### 2. Membuat project Flutter Langkah 2
![screenshoot project flutter](images/w4_p1_2.png)
#### 3. Membuat project Flutter Langkah 3
![screenshoot project flutter](images/w4_p1_3.png)
#### 4. Membuat project Flutter Langkah 4
![screenshoot project flutter](images/w4_p1_4.png)

### Praktikum 2
#### 1. Membuat repository baru
![screenshoot repository baru](images/w4_p2_1.png)
#### 2. Tampilan awal repository
![screenshoot tampilan awal repository](images/w4_p2_2.png)
#### 3. Membuat git init
![screenshoot git init](images/w4_p2_3.png)
#### 4. Membuat git add
![screenshoot git add](images/w4_p2_4.png)
#### 5. Membuat git commit
![screenshoot git commit](images/w4_p2_5.png)
#### 6. Push ke repository
![screenshoot push ke repository](images/w4_p2_6.png)
#### 7 dan 8. Tambahkan remote repository ke local repository
![screenshoot remote repository](images/w4_p2_10.png)
#### 9. Push .gitignore
![screenshoot push gitignore](images/w4_p2_7.png)
#### 10. Push project flutter
![screenshoot push project flutter](images/w4_p2_8.png)
#### 11. Run project flutter
![screenshoot run project flutter](images/w4_p2_9.png)
#### 12. Membuat teks dengan nama lengkap
![screenshoot nama lengkap](images/01.png)

### Praktikum 3
#### 1. Membuat text widget
![screenshoot text widget](images/02.png)
#### 2. Image Widget
![screenshoot image widget](images/03.png)

### Praktikum 4
#### 1. Cupertino Button dan Loading Bar
``` dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLoadingCupertino extends StatelessWidget {
  const MyLoadingCupertino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        margin: const EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CupertinoButton(
              child: const Text("Contoh button"),
              onPressed: () {},
            ),
            const CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }
}
```
#### 2. Floating Action Button (FAB)
``` dart
import 'package:flutter/material.dart';

class MyFabWidget extends StatelessWidget {
  const MyFabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
```
#### 3. Scaffold Widget
![screenshoot scaffold widget](images/04.png)
#### 4. Dialog Widget
![screenshoot dialog widget](images/05.png)
#### 5. Input dan Selection Widget
![screenshoot input dan selection widget](images/06.png)
#### 6. Date and Time Pickers
![screenshoot date and time pickers](images/07.png)

### Codelabs: Your First Flutter App
