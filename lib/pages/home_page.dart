import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:watery/auth.dart';
import 'package:watery/models/plant.dart';

import 'add_plant_page.dart';
import 'plant_details.dart'; // Import your Plant model here

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;

  final List<Plant> userPlants = [
    Plant(
      name: 'Rosa',
      imageUrl: 'images/rosa.jpg',
      health: 0.3,
      wateringSchedule: 'Duas vezes por semana',
      careInstructions: 'Mantenha em luz do sol direta',
    ),
    Plant(
      name: 'Girassol',
      imageUrl: 'images/girassol.jpg',
      health: 0.2,
      wateringSchedule: 'Uma vez por semana',
      careInstructions: 'Rega leve',
    ),
    Plant(
      name: 'Bonsai',
      imageUrl: 'images/bonsai.jpg',
      health: 1,
      wateringSchedule: 'A cada dois dias',
      careInstructions: 'Requer exposição direta ao sol',
    ),
    Plant(
      name: 'Espada de São Jorge',
      imageUrl: 'images/espada.jpg',
      health: 0.2,
      wateringSchedule: 'Uma vez por mês',
      careInstructions: 'Evitar regar muito',
    ),
  ];

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Watery');
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPlantPage()),
          );
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        fixedColor: Colors.white,
        currentIndex: 0,
        onTap: (int index) {},
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
            const Text(
              'Seu jardim digital',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            userPlants.isEmpty
                ? const Center(
                    child: Text('Você não possui nenhuma planta listada'))
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0,
                    ),
                    itemCount: userPlants.length,
                    itemBuilder: (context, index) {
                      Plant plant = userPlants[index];
                      return PlantItem(plant: plant);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class PlantItem extends StatefulWidget {
  final Plant plant;

  const PlantItem({super.key, required this.plant});

  @override
  _PlantItemState createState() => _PlantItemState();
}

class _PlantItemState extends State<PlantItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Navigate to the detail screen and wait for a result
        final updatedHealth = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantDetailsScreen(plant: widget.plant),
          ),
        );

        // Check if the returned value is not null and update the health value accordingly
        if (updatedHealth != null) {
          setState(() {
            widget.plant.health = updatedHealth;
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                child: Image.asset(
                  widget.plant.imageUrl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PlantHealthBar(value: widget.plant.health),
                    Text(
                      widget.plant.name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlantHealthBar extends StatefulWidget {
  final double value; // Value between 0 and 1 representing the health status

  const PlantHealthBar({
    super.key,
    required this.value,
  });

  @override
  _PlantHealthBarState createState() => _PlantHealthBarState();
}

class _PlantHealthBarState extends State<PlantHealthBar> {
  late Color _color;

  @override
  void initState() {
    super.initState();
    _updateColor();
  }

  @override
  void didUpdateWidget(covariant PlantHealthBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateColor();
  }

  void _updateColor() {
    setState(() {
      _color = widget.value < 0.5 ? Colors.red : Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 10,
      value: widget.value,
      backgroundColor: _color.withOpacity(0.5),
      valueColor: AlwaysStoppedAnimation<Color>(_color),
    );
  }
}
