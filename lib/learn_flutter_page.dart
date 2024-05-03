import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
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
      body: SingleChildScrollView(
        child: Column(
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
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('Elevated Button');
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: const Text('Water'),
            ),
            TextButton(
              onPressed: () {
                debugPrint('Elevated Button');
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: const Text('Water'),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                debugPrint('Row Tapped');
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.water_drop,
                    color: Colors.green,
                  ),
                  Text('Row Widget'),
                  Icon(
                    Icons.cut,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.water,
                    color: Colors.green,
                  )
                ],
              ),
            ),
            Switch(
                value: isSwitch,
                onChanged: (bool newBool) {
                  setState(() {
                    isSwitch = newBool;
                  });
                }),
            Image.network(
                'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1660073901-best-indoor-plants-zz-plant-1660073875.png?crop=1.00xw:0.802xh;0,0.168xh&resize=980:*')
          ],
        ),
      ),
    );
  }
}
