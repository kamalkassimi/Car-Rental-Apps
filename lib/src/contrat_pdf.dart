import 'package:flutter/material.dart';

class ContratInfo extends StatelessWidget {
  final DateTime? dateDebut;
  final DateTime? dateFin;
  final String cin;
  final String permisNumero;
  final String name; // Nouveau paramètre
  final String surname; // Nouveau paramètre

  ContratInfo({
    required this.dateDebut,
    required this.dateFin,
    required this.cin,
    required this.permisNumero,
    required this.name, // Initialiser le nouveau paramètre
    required this.surname, // Initialiser le nouveau paramètre
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contrat Info'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "images_Cars/img_title_contrat_info.jpg",
              width: 300,
              height: 180,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Name : ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 65,
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Text(
                  'Prenom : ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 49,
                ),
                Text(
                  surname,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Text(
                  'Date de début :',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  dateDebut.toString(),
                  style: const TextStyle(fontSize: 18.0),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text(
                  'Date de fin :',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 35,
                ),
                Text(
                  dateFin.toString(),
                  style: const TextStyle(fontSize: 18.0),
                )
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Text(
                  'CIN N° : ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 60,
                ),
                Text(
                  cin,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Text(
                  'Permis N° : ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 40,
                ),
                Text(
                  permisNumero,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Image CIN:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  'Image Permis:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  width: 40,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MaterialButton(
                onPressed: () {
                  // Handle PDF creation here
                },
                height: 50,
                minWidth: double.infinity,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  "Download ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
