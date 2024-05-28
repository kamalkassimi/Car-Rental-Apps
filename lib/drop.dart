import 'package:flutter/material.dart';
import 'package:flutter_car_app/main.dart';

class HomePageDrop extends StatefulWidget {
  const HomePageDrop({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePageDrop> {
  bool isListViewEnabled = false;
  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.visibility),
            const SizedBox(width: 10),
            DropdownButton<bool>(
              value: isListViewEnabled,
              onChanged: (value) {
                setState(() {
                  isListViewEnabled = value!;
                });
              },
              items: const [
                DropdownMenuItem<bool>(
                  value: true,
                  child: Text('moins au plus'),
                ),
                DropdownMenuItem<bool>(
                  value: false,
                  child: Text('plus au moins'),
                ),
              ],
            ),
          
          ],
        ),
        const SizedBox(height: 20),
        isListViewEnabled
            ? Expanded(child: ListViewWidgetd())
            : Expanded(child: PlaceholderWidgetd()),
      ],
    );
  }
}
