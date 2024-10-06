import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_dev/models/item.dart';

class ItemPage extends StatelessWidget {
  ItemPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final itemArgs = GoRouterState.of(context).extra as Item;
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: IconButton(onPressed: () {
          GoRouter.of(context).go('/');
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Hero(
                  tag: 'itemPhoto-${itemArgs.name}',
                  child: Image.asset(itemArgs.photo, fit: BoxFit.cover, width: double.infinity, height: MediaQuery.of(context).size.height * 0.3),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                color: Colors.grey.withOpacity(0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rp ${itemArgs.price}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(itemArgs.name, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orangeAccent),
                            Text('${itemArgs.rating}'),
                          ],
                        ),
                        SizedBox(width: 16),
                        Text('Stock: ${itemArgs.stock}'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}