import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:watery/auth.dart';
import 'package:watery/models/plant.dart';

import '../plant_details.dart'; // Import your Plant model here

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  final List<Plant> userPlants = [
    Plant(
      name: 'Rose',
      imageUrl: 'images/plant.jpg',
      health: 0.8,
      wateringSchedule: 'Twice a week',
      careInstructions: 'Keep in direct sunlight',
    ),
    Plant(
      name: 'Lavender',
      imageUrl: 'images/plant.jpg',
      health: 0.5,
      wateringSchedule: 'Once a week',
      careInstructions: 'Water lightly',
    ),
    Plant(
      name: 'Sunflower',
      imageUrl: 'images/plant.jpg',
      health: 1,
      wateringSchedule: 'Every other day',
      careInstructions: 'Requires lots of sunlight',
    ),
    Plant(
      name: 'Cactus',
      imageUrl: 'images/plant.jpg',
      health: 0.2,
      wateringSchedule: 'Once a month',
      careInstructions: 'Avoid overwatering',
    ),
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
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: _title(),
        actions: [
          IconButton(
            onPressed: () => signOut(),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Add new button clicked');
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        fixedColor: Colors.white,
        currentIndex:
            0, // Current index of the selected tab (default is the first tab)
        onTap: (int index) {
          // Add functionality to switch between tabs
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: userPlants.length,
                    itemBuilder: (context, index) {
                      Plant plant = userPlants[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PlantDetailsScreen(plant: plant),
                              ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              plant.imageUrl,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              plant.name,
                              style: const TextStyle(fontSize: 16),
                            ),
                            PlantHealthBar(value: plant.health),
                          ],
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}

class PlantHealthBar extends StatelessWidget {
  final double value; // Value between 0 and 1 representing the health status
  final Color color;

  const PlantHealthBar({
    super.key,
    required this.value,
    this.color = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: color.withOpacity(0.5),
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}
