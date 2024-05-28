// class Contract {
//   int? id;
//   DateTime? startDate;
//   DateTime? endDate;
//   String cin;
//   String permisNumero;
//   String imageCinPath;
//   String imagePermisPath;
//   String name;
//   String surname;

//   Contract({
//     this.id,
//     required this.startDate,
//     required this.endDate,
//     required this.cin,
//     required this.permisNumero,
//     required this.imageCinPath,
//     required this.imagePermisPath,
//     required this.name,
//     required this.surname,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'startDate': startDate?.millisecondsSinceEpoch,
//       'endDate': endDate?.millisecondsSinceEpoch,
//       'cin': cin,
//       'permisNumero': permisNumero,
//       'imageCinPath': imageCinPath,
//       'imagePermisPath': imagePermisPath,
//       'name': name,
//       'surname': surname,
//     };
//   }
//   // Contract.fromMap(Map<String, dynamic> map) {
//   //   id = map['id'];
//   //   startDate = DateTime.fromMillisecondsSinceEpoch(map['startDate']);
//   //   endDate = DateTime.fromMillisecondsSinceEpoch(map['endDate']);
//   //   cin = map['cin'];
//   //   permisNumero = map['permisNumero'];
//   //   imageCinPath = map['imageCinPath'];
//   //   imagePermisPath = map['imagePermisPath'];
//   //   name = map['name'];
//   //   surname = map['surname'];
//   // }
// }
