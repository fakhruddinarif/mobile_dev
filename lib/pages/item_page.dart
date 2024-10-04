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
        title: Row(
          children: [
            IconButton(onPressed: () {
              GoRouter.of(context).go('/');
            }, icon: Icon(Icons.arrow_back)),
            Text(itemArgs.name),
          ],
        ),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Hero(
                  tag: 'itemPhoto-${itemArgs.name}',
                  child: Image.asset(itemArgs.photo, fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemArgs.name),
                  Text('Rp ${itemArgs.price}'),
                  Text('Stock: ${itemArgs.stock}'),
                  Text('Rating: ${itemArgs.rating}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}