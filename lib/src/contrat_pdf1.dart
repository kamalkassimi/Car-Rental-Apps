import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class ContratPdf extends StatelessWidget {
  final DateTime? dateDebut;
  final DateTime? dateFin;
  final String name;
  final String cin; // Nouveau paramètre
  final String surname; // Nouveau paramètre

  ContratPdf({
    required this.dateDebut,
    required this.dateFin,
    required this.name, // Initialiser le nouveau paramètre
    required this.surname,
    required this.cin, // Initialiser le nouveau paramètre
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contrat Info'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: MaterialButton(
            onPressed: () {
              createPDF();
            },
            height: 50,
            minWidth: double.infinity,
            color: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Text(
              "Download ",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ));
  }

  Future<void> createPDF() async {
    final ByteData bytes = await rootBundle.load('images_Cars/logo_app.jpg');
    final Uint8List byteList = bytes.buffer.asUint8List();
    // Create a new PDF document
    final pdf = pw.Document();

    // Add a page to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Entre :',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold, fontSize: 16.0),
              ),
              pw.SizedBox(height: 8.0),
              pw.Text(
                  'l\'agence ${cin}, domicilié au [Adresse du Propriétaire], ci-après dénommé "le Propriétaire",'),
              pw.SizedBox(height: 8.0),
              pw.Text('Et :'),
              pw.SizedBox(height: 8.0),
              pw.Text(
                  '$name, domicilié au [Adresse du Locataire], ci-après dénommé "le Locataire",'),
              pw.SizedBox(height: 16.0),
              pw.Text('Objet :',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 16.0)),
              pw.SizedBox(height: 8.0),
              pw.Text(
                  'La location d\'un véhicule, décrite ci-dessous, pour une période définie et sous les conditions énoncées dans ce contrat.'),
              pw.SizedBox(height: 16.0),
              pw.Text('Description du Véhicule :',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 16.0)),
              pw.SizedBox(height: 8.0),
              pw.Text('Marque : [Marque du véhicule]'),
              pw.Text('Modèle : [Modèle du véhicule]'),
              pw.Text('Année : [Année de fabrication du véhicule]'),
              pw.Text(
                  'Numéro d\'Immatriculation : [Numéro de plaque d\'immatriculation]'),
              pw.SizedBox(height: 16.0),
              pw.Text('Durée de la Location :',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 16.0)),
              pw.SizedBox(height: 8.0),
              pw.Text(
                  'La période de location débutera le ${dateDebut?.toIso8601String().split('T').first ?? ' '} et se terminera le ${dateFin?.toIso8601String().split('T').first ?? ' '}.'),
              pw.SizedBox(height: 16.0),
              pw.Text('Conditions de Location :',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 16.0)),
              pw.SizedBox(height: 8.0),
              pw.Text(
                  'Le Locataire doit être âgé d\'au moins [Âge minimum requis] ans et être titulaire d\'un permis de conduire valide délivré par les autorités compétentes.'),
              pw.Text(
                  'Le Locataire s\'engage à utiliser le véhicule loué de manière prudente et responsable, conformément à la législation en vigueur, et à ne pas le sous-louer ou le prêter à des tiers sans autorisation écrite du Propriétaire.'),
              pw.Text(
                  'Le Locataire est responsable de tous les dommages causés au véhicule pendant la période de location, sauf en cas de force majeure ou de dommages résultant d\'une usure normale.'),
              pw.Text(
                  'Le Locataire s\'engage à restituer le véhicule au Propriétaire dans le même état que celui dans lequel il a été loué, à l\'exception de l\'usure normale.'),
              pw.Text(
                  'Le Propriétaire se réserve le droit de récupérer le véhicule à tout moment en cas de non-respect des termes du contrat ou en cas de violation des lois de la circulation.'),
              pw.SizedBox(height: 16.0),
              pw.Text('Prix de la Location :',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 16.0)),
              pw.SizedBox(height: 8.0),
              pw.Text(
                  'Le prix total de la location s\'élève à [Montant de la location] euros, payable intégralement au début de la période de location.'),
              pw.SizedBox(height: 16.0),
              pw.Text('Signature des Parties :',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 16.0)),
              pw.SizedBox(height: 8.0),
              pw.Text(
                  'Fait en double exemplaire à [Lieu du contrat], le [Date du contrat].'),
              pw.SizedBox(height: 8.0),
              pw.Text('Le Propriétaire :'),
              pw.Text('[Signature du Propriétaire]'),
              pw.SizedBox(height: 8.0),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text('Le Locataire :'),
                    pw.Text('[Signature du Locataire]'),
                  ])
            ],
          );
        },
      ),
    );
    // Get the device's temporary directory
    final output = await getTemporaryDirectory();

    // Create the PDF file
    final file = File("${output.path}/example.pdf");

    // Write the PDF content to the file
    await file.writeAsBytes(await pdf.save());

    // Open the PDF file
    OpenFile.open(file.path);
  }
}
