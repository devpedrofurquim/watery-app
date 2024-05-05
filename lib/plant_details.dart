import 'package:flutter/material.dart';
import 'package:watery/models/plant.dart'; // Import your Plant model here

class PlantDetailsScreen extends StatelessWidget {
  final Plant plant;

  const PlantDetailsScreen({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              plant.imageUrl,
              fit: BoxFit.cover,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Watering Schedule:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              plant.wateringSchedule,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Care Instructions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              plant.careInstructions,
              style: const TextStyle(fontSize: 16),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
