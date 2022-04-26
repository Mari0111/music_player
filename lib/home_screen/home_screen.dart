import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const Card(
            child: ListTile(
              title: Text('Song Name'),
            ),
          );
        },
      ),
    );
  }
}
