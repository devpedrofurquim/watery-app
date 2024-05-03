import 'dart:ffi';

import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Learn Flutter',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context)
            .primaryColor, // Set the app bar color to the primary color
      ),
      body: Column(
        children: [
          Image.asset(
            'images/plant.jpg',
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.green,
            thickness: 15,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(8),
            child: const Center(
                child: Text('Barbosa', style: TextStyle(fontSize: 36))),
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint('Elevated Button');
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
            child: const Text('Delete'),
          )
        ],
      ),
    );
  }
}
