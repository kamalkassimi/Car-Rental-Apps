import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_car_app/src/contrat_pdf.dart';
import 'package:flutter_car_app/src/database.dart';
import 'package:image_picker/image_picker.dart';
class Contract {
  final int id;
  final String name;
  final String surname;
  final String dateDebut;
  final String dateFin;
  final String cin;
  final String permis;
  final String imageCin;
  final String imagePermis;

  Contract({
    required this.id,
    required this.name,
    required this.surname,
    required this.dateDebut,
    required this.dateFin,
    required this.cin,
    required this.permis,
    required this.imageCin,
    required this.imagePermis,
  });

  factory Contract.fromMap(Map<String, dynamic> map) {
    return Contract(
      id: map['id'],
      name: map['name'],
      surname: map['surname'],
      dateDebut: map['dateDebut'],
      dateFin: map['dateFin'],
      cin: map['cin'],
      permis: map['permis'],
      imageCin: map['imageCin'],
      imagePermis: map['imagePermis'],
    );
  }
   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'dateDebut': dateDebut,
      'dateFin': dateFin,
      'cin': cin,
      'permis': permis,
      'imageCin': imageCin,
      'imagePermis': imagePermis,
    };
  }
}

class Contrat extends StatelessWidget {
  const Contrat({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContratPage(),
    );
  }
}
class ContratPage extends StatefulWidget {
  @override
  _ContratPageState createState() => _ContratPageState();
}

class _ContratPageState extends State<ContratPage> {
  DateTime? dateDebut;
  DateTime? dateFin;
  final TextEditingController _cinController = TextEditingController();
  final TextEditingController _permisController = TextEditingController();
  XFile? imageCin;
  XFile? imagePermis;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();

  Future<void> _pickDate(BuildContext context, bool isDebut) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        if (isDebut) {
          dateDebut = picked;
        } else {
          dateFin = picked;
        }
      });
    }
  }
  Future<void> _pickImage(bool isCin) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isCin) {
          imageCin = pickedFile;
        } else {
          imagePermis = pickedFile;
        }
      });
    }
  }

  bool validationChamps() {
    return dateDebut != null &&
        dateFin != null &&
        _cinController.text.isNotEmpty &&
        _permisController.text.isNotEmpty &&
        imageCin != null &&
        imagePermis != null &&
        _nameController.text.isNotEmpty &&
        _surnameController.text.isNotEmpty;
  }

  void message(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void clearChamps() {
    setState(() {
      dateDebut = null;
      dateFin = null;
      _cinController.clear();
      _permisController.clear();
      imageCin = null;
      imagePermis = null;
      _nameController.clear();
      _surnameController.clear();
    });
  }

  Future<void> navigateToContratInfo() async {
    if (validationChamps()) {
      await DatabaseHelper().saveContract({
        'name': _nameController.text,
        'surname': _surnameController.text,
        'dateDebut': dateDebut.toString(),
        'dateFin': dateFin.toString(),
        'cin': _cinController.text,
        'permis': _permisController.text,
        'imageCin': imageCin!.path,
        'imagePermis': imagePermis!.path,
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContratInfo(
            dateDebut: dateDebut,
            dateFin: dateFin,
            cin: _cinController.text,
            permisNumero: _permisController.text,
            imageCinPath: imageCin!.path,
            imagePermisPath: imagePermis!.path,
            name: _nameController.text,
            surname: _surnameController.text,
          ),
        ),
      );
    } else {
      message("Les champs ne sont pas valides.");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contrat'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name ',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: TextField(
                controller: _surnameController,
                decoration: const InputDecoration(
                  labelText: 'Prenom ',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                ),
              ),
            ),
            ListTile(
              title: Text(
                  'Date de début: ${dateDebut?.toIso8601String().split('T').first ?? ' '}'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _pickDate(context, true),
            ),
            ListTile(
              title: Text(
                  'Date de fin: ${dateFin?.toIso8601String().split('T').first ?? ' '}'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _pickDate(context, false),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: TextField(
                controller: _cinController,
                decoration: const InputDecoration(
                  labelText: 'CIN',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                ),
              ),
            ),
            Container(              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: TextField(
                controller: _permisController,
                decoration: const InputDecoration(
                  labelText: 'Permis N°',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () => _pickImage(true),
                    child: const Text('Choisir image CIN'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => _pickImage(false),
                    child: const Text('Choisir image Permis'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 180,
                  height: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color.fromARGB(255, 228, 227, 227),
                      width: 1.0,
                    ),
                  ),
                  child: imageCin != null
                      ? Image.file(File(imageCin!.path), fit: BoxFit.cover)
                      : const Placeholder(),
                ),
                const Spacer(),
                Container(
                  width: 180,
                  height: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color.fromARGB(255, 228, 227, 227),
                      width: 1.0,
                    ),
                  ),
                  child: imagePermis != null
                      ? Image.file(File(imagePermis!.path), fit: BoxFit.cover)
                      : const Placeholder(),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: navigateToContratInfo,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 97, 175, 240),
                      ),
                      child: const Text(
                        'Confirmer',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: clearChamps,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 127, 228, 130),
                      ),
                      child: const Text('Annuler'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
