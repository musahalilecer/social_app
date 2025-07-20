import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoveryScreen extends StatefulWidget {
  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discovery'),
      ),
      body: Column(
        children: [
          SearchBar(),
          Expanded(child: DiscoveryPosts()),
        ],
      ),
    );
  }
}

Widget DiscoveryPosts() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        // Example: Add a title or search bar here
        
        SizedBox(height: 12),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: 30,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  'https://img.freepik.com/free-photo/misurina-sunset_181624-34793.jpg?semt=ais_hybrid&w=740',
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget SearchBar() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Search',
        prefixIcon: Icon(Icons.search),
      ),
    ),
  );
}
