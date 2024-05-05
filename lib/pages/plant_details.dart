import 'package:flutter/material.dart';
import 'package:watery/models/plant.dart';

import 'home_page.dart';

class PlantDetailsScreen extends StatefulWidget {
  final Plant plant;

  const PlantDetailsScreen({required this.plant});

  @override
  _PlantDetailsScreenState createState() => _PlantDetailsScreenState();
}

class _PlantDetailsScreenState extends State<PlantDetailsScreen> {
  late double _health;

  @override
  void initState() {
    super.initState();
    _health = widget.plant.health;
  }

  void _updateHealth(double value) {
    setState(() {
      _health = value;
      widget.plant.health = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plant.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context, _health);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.plant.imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            SizedBox(height: 20),
            PlantHealthBar(value: _health),
            SizedBox(height: 10),
            Text(
              'Estado de Saúde:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              _health >= 0.5
                  ? 'A planta está saudável. Continue assim.'
                  : 'A planta precisa de cuidados. Regue-a e mantenha-a saudável.',
              style: TextStyle(
                fontSize: 16,
                color: _health >= 0.5 ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Horário de Rega:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.plant.wateringSchedule,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Instruções de Cuidado:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.plant.careInstructions,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _updateHealth(_health + 0.2);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Regar',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10), // Add spacing between buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'Deletar Planta',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
