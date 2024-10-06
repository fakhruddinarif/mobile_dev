import 'package:flutter/material.dart';
import 'package:mobile_dev/models/item.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, photo: 'assets/images/sugar.jpg', stock: 10, rating: 4.5),
    Item(name: 'Salt', price: 2000, photo: 'assets/images/salt.jpg', stock: 20, rating: 4.0),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toko Madura'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.go('/item', extra: items[index]);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadowColor: Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Hero(
                              tag: 'itemPhoto-${items[index].name}',
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(items[index].photo),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(items[index].name),
                                Text('Rp ${items[index].price}', style: TextStyle(fontWeight: FontWeight.bold)),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.orangeAccent),
                                    Text(items[index].rating.toString()),
                                    SizedBox(width: 8),
                                    Text('${items[index].stock} Stock'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          footerSection, // Add the footerSection here
        ],
      ),
    );
  }
}

// Define the footerSection widget
Widget footerSection = Container(
  padding: const EdgeInsets.all(16),
  child: const Text(
    'Nama: Muhammad Fakhruddin Arif | NIM: 2241720030',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
);