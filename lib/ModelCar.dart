import 'package:flutter/material.dart';
import 'package:flutter_car_app/ViewFiltre.dart';
import 'package:flutter_car_app/src/SideMenu.dart';

const Color darkBlue = Color.fromARGB(255, 18, 40, 47);

// void main() {
//   runApp(const MyApp11_part());
// }

class MyApp11_part extends StatelessWidget {
  
   final String email1 ;
  // ignore: use_super_parameters
  const MyApp11_part({required this.email1 ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "page Home",
            style: TextStyle(fontSize: 32),
          ),
          centerTitle: true,
        ),
        drawer:  SideMenu(email : email1),
        body: Center(
          child: ExampleParallax(),
        ),
      ),
    );
  }
}

class ExampleParallax extends StatelessWidget {
  const ExampleParallax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final location in locations)
            LocationListItem(
              imageUrl: location.imageUrl,
              name: location.name,
              country: location.place,
              onTap: () {
                //  event onclick on image
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FiltreView(name: location.name)));
              },
            ),
        ],
      ),
    );
  }
}

class LocationListItem extends StatelessWidget {
  LocationListItem({
    required this.imageUrl,
    required this.name,
    required this.country,
    required this.onTap,
  });

  final String imageUrl;
  final String name;
  final String country;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: onTap,
            child: Stack(
              children: [
                Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
                _buildGradient(),
                _buildTitleAndSubtitle(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            country,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

















class Location {
  const Location({
    required this.name,
    required this.place,
    required this.imageUrl,
  });

  final String name;
  final String place;
  final String imageUrl;
}

const locations = [
  Location(
    name: 'Dacia',
    place: 'Dacia',
    imageUrl: 'images/icons/Dacia2.png',
  ),
  Location(
    name: 'Opel',
    place: 'opel',
    imageUrl: 'images/icons/opel.jpg',
  ),
  Location(
    name: 'Peugeot',
    place: 'peugeot',
    imageUrl: 'images/icons/fait.jpg',
  ),
  Location(
    name: 'Mercedes-Benz',
    place: 'Mercedes-Benz',
    imageUrl: 'images/icons/Mercides.jpg',
  ),
  Location(
    name: 'Bentley',
    place: 'Bentley',
    imageUrl: 'images/icons/bentley.png',
  ),
];
 
 
