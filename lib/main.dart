import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:mobile_dev/models/pizza.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo - Muhammad Fakhruddin Arif',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter JSON Demo - Muhammad Fakhruddin Arif'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int appCounter = 0; // Practice 3
  List<Pizza> pizzas = []; // Practice 1 and 2

  // Practice 4
  String documentPath = '';
  String tempPath = '';

  // Practice 5
  late File file;
  String fileText = '';

  @override
  void initState() {
    super.initState();
    // Practice 4 and 4
    // getPaths();
    getPaths().then((_) {
      file = File('$documentPath/pizzas.txt');
      writeFile();
    });
    // Practice 3
    // readAndWritePreference();
    // Practice 1 and 2
    /*readJsonFile().then((value) {
      setState(() {
        pizzas = value;
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Path Provider - Muhammad Fakhruddin Arif'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Document Path: $documentPath'),
          Text('Temporary Path: $tempPath'),
          ElevatedButton(onPressed: () => readFile(), child: const Text('Read File')),
          Text(fileText),
        ],
      ),
    );

    // Practice 3
    /*Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('You have opened this app $appCounter times.'),
              ElevatedButton(
                onPressed: () {
                  deletePreference();
                },
                child: const Text('Reset Counter'),
              ),
            ],
          ),
        ),
      ),
    );*/

    //     Practice 1 and 2
    /*Scaffold(
      appBar: AppBar(
        title: const Text('JSON - Muhammad Fakhruddin Arif'),
      ),
      body: ListView.builder(
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pizzas[index].pizzaName),
            subtitle: Text(pizzas[index].description),
          );
        },
      ),
    );*/
  }

  // Practice 1 and 2
  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context).loadString('assets/pizzalist.json');
    List pizzaMap = jsonDecode(myString);
    List<Pizza> pizzas = [];
    for (var pizza in pizzaMap) {
      Pizza p = Pizza.fromJson(pizza);
      pizzas.add(p);
    }
    String json = convertToJson(pizzas);
    print(json);
    return pizzas;
  }

  String convertToJson(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  // Practice 3
  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;
    await prefs.setInt('appCounter', appCounter);

    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  // Practice 4
  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();

    setState(() {
      documentPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  // Practice 5
  Future<bool> writeFile() async {
    try {
      await file.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await file.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    }
    catch (e) {
      return false;
    }
  }
}