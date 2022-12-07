import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List myTiles = ['1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drag Drop List"),
      ),
      body: ReorderableListView(
        onReorder: ((oldIndex, newIndex) =>
            {updateMyTiles(oldIndex, newIndex)}),
        children: [
          for (final tile in myTiles)
            ListTile(
              key: ValueKey(tile),
              title: Text(tile),
            ),
        ],
      ),
    );
  }

  updateMyTiles(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }
      final tile = myTiles.removeAt(oldIndex);
      myTiles.insert(newIndex, tile);
    });
  }
}
