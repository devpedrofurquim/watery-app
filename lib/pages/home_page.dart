import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:watery/auth.dart';
import 'package:watery/models/plant.dart'; // Import your Plant model here

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  final List<Plant> userPlants = [
    Plant(name: 'Rose', imageUrl: 'images/plant.jpg'),
    Plant(name: 'Lavender', imageUrl: 'images/plant.jpg'),
    Plant(name: 'Sunflower', imageUrl: 'images/plant.jpg'),
    Plant(name: 'Cactus', imageUrl: 'images/plant.jpg'),
  ];

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Watery');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(onPressed: signOut, child: const Text('Sign Out'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        actions: [
          IconButton(
            onPressed: () => signOut(),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${_userUid()}',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Your Plants'),
            const SizedBox(height: 10),
            userPlants.isEmpty
                ? const Center(child: Text('You have no plants listed'))
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: userPlants.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(userPlants[index].imageUrl),
                                fit: BoxFit.cover)),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
