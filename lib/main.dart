import 'package:flutter/material.dart';
import 'package:flutter_car_app/drop.dart';
import 'package:flutter_car_app/src/SideMenu.dart';
import 'package:flutter_car_app/src/details_car.dart';
import 'package:flutter_car_app/src/premier_page.dart';

class Voiture {
  Voiture({
    required this.marque,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
  String price;
  String name;
  String marque;
  String imageUrl;
}

// const  items = [
//   Voiture(marque: 'Mercedes-Benz', name: "Item 1", price: '16', imageUrl: 'images_Cars/ertiga-exterior-right-front-three-quarter-5.webp'),
//   Voiture(marque: 'Mercedes-Benz', name: "Item 2", price: "19", imageUrl: 'images_Cars/i20-exterior-right-front-three-quarter-7.webp')
//   {
//     "marque": 'Mercedes-Benz',
//     "name": "Item 3",
//     "image":
//         'images_Cars/innova-crysta-exterior-right-front-three-quarter-2.webp',
//     "price": "10"
//   },

//   {
//     "marque": 'Peugeot',
//     "name": "Item 2",
//     "image": 'images_Cars/i20-exterior-right-front-three-quarter-7.webp',
//     "price": "9"
//   },
//   {
//     "marque": 'Peugeot',
//     "name": "Item 3",
//     "image":
//         'images_Cars/innova-crysta-exterior-right-front-three-quarter-2.webp',
//     "price": "84"
//   },
//   {
//     "marque": 'Peugeot',
//     "name": "Item 1",
//     "image": 'images_Cars/ertiga-exterior-right-front-three-quarter-5.webp',
//     "price": "17"
//   },
//   {
//     "marque": 'Peugeot',
//     "name": "Item 2",
//     "image": 'images_Cars/i20-exterior-right-front-three-quarter-7.webp',
//     "price": "29"
//   },
//   {
//     "marque": "Dacia",
//     "name": "Item 3",
//     "image":
//         'images_Cars/innova-crysta-exterior-right-front-three-quarter-2.webp',
//     "price": "36"
//   },
//   {
//     "marque": "Dacia",
//     "name": "Item 1",
//     "image": 'images_Cars/ertiga-exterior-right-front-three-quarter-5.webp',
//     "price": "27"
//   },
//   {
//     "marque": 'Bentley',
//     "name": "Item 2",
//     "image": 'images_Cars/i20-exterior-right-front-three-quarter-7.webp',
//     "price": "32"
//   },
//   {
//     "marque": 'Mercedes-Benz',
//     "name": "Item 3",
//     "image":
//         'images_Cars/innova-crysta-exterior-right-front-three-quarter-2.webp',
//     "price": "29"
//   },
//   {
//     "marque": 'Peugeot',
//     "name": "Item 1",
//     "image": 'images_Cars/ertiga-exterior-right-front-three-quarter-5.webp',
//     "price": "14"
//   },
//   {
//     "marque": 'Opel',
//     "name": "Item 2",
//     "image": 'images_Cars/i20-exterior-right-front-three-quarter-7.webp',
//     "price": "24"
//   },
//   {
//     "marque": "Dacia",
//     "name": "Item 3",
//     "image":
//         'images_Cars/innova-crysta-exterior-right-front-three-quarter-2.webp',
//     "price": "8"
//   },
//   // Add more items as needed
// ];
var items = <Voiture>[
  Voiture(
      marque: 'Mercedes-Benz',
      name: "Item 1",
      price: '16',
      imageUrl: 'images_Cars/ertiga-exterior-right-front-three-quarter-5.webp'),
  Voiture(
      marque: 'Mercedes-Benz',
      name: "Item 2",
      price: "19",
      imageUrl: 'images_Cars/i20-exterior-right-front-three-quarter-7.webp'),
  Voiture(
      marque: 'Mercedes-Benz',
      name: "Item 3",
      price: "10",
      imageUrl:
          'images_Cars/innova-crysta-exterior-right-front-three-quarter-2.webp'),
  Voiture(
      marque: 'Peugeot',
      name: "Item 4",
      price: "29",
      imageUrl: 'images_Cars/i20-exterior-right-front-three-quarter-7.webp'),
  Voiture(
      marque: 'Peugeot',
      name: "Item 4",
      price: "39",
      imageUrl: 'images_Cars/i20-exterior-right-front-three-quarter-7.webp'),
  Voiture(
      marque: 'Peugeot',
      name: "Item 5",
      price: "49",
      imageUrl: 'images_Cars/i20-exterior-right-front-three-quarter-7.webp'),
  Voiture(
      marque: 'Peugeot',
      name: "Item 5",
      price: "59",
      imageUrl: 'images_Cars/i20-exterior-right-front-three-quarter-7.webp'),
  Voiture(
      marque: "Dacia",
      name: "Item 4",
      price: "69",
      imageUrl: 'images_Cars/i20-exterior-right-front-three-quarter-7.webp'),
  Voiture(
      marque: "Dacia",
      name: "Item 6",
      price: "79",
      imageUrl: 'images_Cars/i20-exterior-right-front-three-quarter-7.webp'),
  Voiture(
      marque: 'Bentley',
      name: "Item 7",
      price: "89",
      imageUrl: 'images_Cars/i20-exterior-right-front-three-quarter-7.webp'),
  Voiture(
      marque: 'Bentley',
      name: "Item 7",
      price: "99",
      imageUrl: 'images_Cars/i20-exterior-right-front-three-quarter-7.webp'),
  Voiture(
      marque: 'Opel',
      name: "Item 6",
      price: "109",
      imageUrl: 'images_Cars/i20-exterior-right-front-three-quarter-7.webp'),
];
void main() {
  runApp(PremierPage());
}

class GridItem extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  GridItem({required this.name, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image.asset(
                    image,
                    height: 120,
                    width: 120,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                  child: Row(
                    children: [
                      const ImageIcon(
                        AssetImage('images_Cars/user.png'),
                        color: Colors.black,
                        size: 15,
                      ),
                      const Text(
                        '5',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const ImageIcon(
                        AssetImage('images_Cars/door.png'),
                        color: Colors.black,
                        size: 15,
                      ),
                      const Text(
                        '4',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const ImageIcon(
                        AssetImage('images_Cars/bags.png'),
                        color: Colors.black,
                        size: 15,
                      ),
                      const Text(
                        '3',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          price + "\$ /month",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class SearchBarDelegate extends SearchDelegate<List<Map<String, dynamic>>> {
  String name = 'name';
  String image = 'image';
  String price = 'price';
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: serchFct(name, query).length,
      itemBuilder: (BuildContext context, int index) {
        return GridItem(
          name: serchFct(name, query)[index].name,
          image: serchFct(name, query)[index].imageUrl,
          price: serchFct(name, query)[index].price,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: suggsetionFct(name, query).length,
      itemBuilder: (BuildContext context, int index) {
        return GridItem(
          name: suggsetionFct(name, query)[index].name,
          image: suggsetionFct(name, query)[index].imageUrl,
          price: suggsetionFct(name, query)[index].price,
        );
      },
    );
  }
}

class ListViewWidgetd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        items.sort(
          (a, b) => int.parse(a.price).compareTo(int.parse(b.price)),
        );
        return  GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyAppDetails(
                    model_cars: items[index].marque,
                    brand: items[index].marque,
                    image: items[index].imageUrl)));
          },
          child: GridItem(
            name: items[index].marque,
            image: items[index].imageUrl,
            price: items[index].price,
          ),
        );
      },
    );
  }
}

class PlaceholderWidgetd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        items.sort(
          (a, b) => int.parse(b.price).compareTo(int.parse(a.price)),
        );
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyAppDetails(
                    model_cars: items[index].marque,
                    brand: items[index].marque,
                    image: items[index].imageUrl)));
          },
          child: GridItem(
            name: items[index].marque,
            image: items[index].imageUrl,
            price: items[index].price,
          ),
        );
        
      },
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  _DarkView createState() => _DarkView();
}

class _DarkView extends State<MyApp> {
  bool isDark = false;
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);
    return MaterialApp(
        theme: themeData,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Cars View"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchBarDelegate(),
                  );
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                  isSelected: isDark,
                  onPressed: () {
                    setState(() {
                      isDark = !isDark;
                    });
                  },
                  icon: isDark
                      ? Icon(Icons.wb_sunny_outlined)
                      : Icon(Icons.brightness_2_outlined)),
              IconButton(
                onPressed: () {
                  ;
                },
                icon: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images_Cars/3135715.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          drawer: const SideMenu(),
          body: const HomePageDrop(),
        ));
  }
}

List<Voiture> serchFct(String name, String value) {
  final List<Voiture> searchResults = items
      .where((element) => element.name.toString().contains(value.toLowerCase()))
      .toList();
  return searchResults;
}

List<Voiture> suggsetionFct(String name, String value) {
  final List<Voiture> searchResults = value.isEmpty
      ? []
      : items
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
  return searchResults;
}
