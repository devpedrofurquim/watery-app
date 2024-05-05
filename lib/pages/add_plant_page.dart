import 'package:flutter/material.dart';

class AddPlantPage extends StatefulWidget {
  @override
  _AddPlantPageState createState() => _AddPlantPageState();
}

class _AddPlantPageState extends State<AddPlantPage> {
  // Define controllers for input fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _wateringController = TextEditingController();
  TextEditingController _careInstructionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Planta'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input field for plant name
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome da Planta'),
            ),
            SizedBox(height: 20.0),
            // Input field for watering schedule
            TextFormField(
              controller: _wateringController,
              decoration: InputDecoration(labelText: 'Horário de Rega'),
            ),
            SizedBox(height: 20.0),
            // Input field for care instructions
            TextFormField(
              controller: _careInstructionsController,
              decoration: InputDecoration(labelText: 'Instruções de cuidado'),
            ),
            SizedBox(height: 20.0),
            // Button to capture a picture
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  // Implement logic to capture picture
                },
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 30,
                ),
                label: Text(
                  'Foto da Planta',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Button to submit plant details
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  // Implement logic to add plant to the list
                  // You can use the provided controllers to get the input values
                },
                child: Text(
                  'Adicionar Planta',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
