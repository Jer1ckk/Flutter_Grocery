import 'package:flutter/material.dart';
import 'package:w11/ui/groceries/grocery_form.dart';
import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<Grocery> groceries = dummyGroceryItems;

  void onCreate() {
    // TODO-4 - Navigate to the form screen using the Navigator push
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewItem(onCreate: addGrocery)),
    );
  }

  void addGrocery(Grocery grocery) {
    setState(() {
      groceries.add(grocery);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (groceries.isNotEmpty) {
      // TODO-1 - Display groceries with an Item builder and  LIst Tile
      content = ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (context, index) {
          return GroceryTile(grocery: groceries[index]);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    // TODO-2 - Display groceries with an Item builder and  LIst Tile
    return ListTile(
      leading: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(color: grocery.category.color),
      ),
      title: Text(grocery.name),
      subtitle: Text(grocery.quantity.toString()),
      trailing: const Icon(Icons.drag_handle),
    );
  }
}
