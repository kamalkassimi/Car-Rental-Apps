import 'package:flutter/material.dart';
import 'package:flutter_car_app/src/contrat.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class PaimentPage extends StatelessWidget {
  const PaimentPage({super.key});
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Page  Paiement';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            appTitle,
          ),
        ),
        body: _PaimentPage(),
      ),
    );
  }
}

class _PaimentPage extends StatefulWidget {
  @override
  _PaimentPageState createState() => _PaimentPageState();
}

class _PaimentPageState extends State<_PaimentPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expMonthController = TextEditingController();
  TextEditingController expYearController = TextEditingController();
  TextEditingController cvcController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(""),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 0.0, right: 15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "images_Cars/carte_bancaire.jpg",
                    width: 290,
                    height: 150,
                  ),
                  TextFormField(
                    controller: cardNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Numéro de carte',
                      prefixIcon: const Icon(Icons.credit_card),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: validateParColor(cardNumberController),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer le numéro de la carte';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: expMonthController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Mois d\'expiration',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: validateParColor(expMonthController),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer le mois d\'expiration';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: expYearController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Année d\'expiration',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: validateParColor(expYearController),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer l\'année d\'expiration';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: cvcController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CVC',
                      prefixIcon: const Icon(Icons.security),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: validateParColor(cvcController),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer le code CVC';
                      }
                      return null;
                    },
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                validePaiment(
                                  cardNumberController.text,
                                  expMonthController.text,
                                  expYearController.text,
                                  cvcController.text,
                                  1000,
                                );
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>  ContratPage()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 43, 19, 107),
                            ),
                            child: const Text(
                              'Payer',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              cleareChamps();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 105, 162, 209),
                            ),
                            child: const Text(
                              'Annuler',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Ajouter le code de l'icon PayPal avec position de click
                  Container(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => PaypalCheckout(
                            sandboxMode: true,
                            clientId:
                                "AQxiUkh9Gqok_a_4RLMSjbxaQTLQRIQaylw7mk-zHSaNyTOjX_HrhYGW_jb4bptCGzw4tjDr5lfqZQpF",
                            secretKey:
                                "EP_xBoZeLuUhBSDzIPuFronp_1Twe0CjxCXh2NpPGPUH2TslopgiEtUTQXxlZoWQPX-mf8leQG4vh7BB",
                            returnURL: "success.snippetcoder.com",
                            cancelURL: "cancel.snippetcoder.com",
                            transactions: const [
                              {
                                "amount": {
                                  "total": '70',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '70',
                                    "shipping": '0',
                                    "shipping_discount": 0
                                  }
                                },
                                "description":
                                    "The payment transaction description.",
                                /*"payment_options": {
                                  "allowed_payment_method":
                                      "INSTANT_FUNDING_SOURCE"
                                },*/
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "Apple",
                                      "quantity": 4,
                                      "price": '5',
                                      "currency": "USD"
                                    },
                                    {
                                      "name": "Pineapple",
                                      "quantity": 5,
                                      "price": '10',
                                      "currency": "USD"
                                    }
                                  ],
                                  /*shipping address is not required though
                                    "shipping_address": {
                                      "recipient_name": "Raman Singh",
                                      "line1": "Delhi",
                                      "line2": "",
                                      "city": "Delhi",
                                      "country_code": "IN",
                                      "postal_code": "11001",
                                      "phone": "+00000000",
                                      "state": "Texas"
                                   },*/
                                }
                              }
                            ],
                            note: "Contact us for any questions on your order.",
                            onSuccess: (Map params) async {
                              print("onSuccess: $params");
                            },
                            onError: (error) {
                              print("onError: $error");
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              print('cancelled:');
                            },
                          ),
                        ));
                      },
                      icon: const Icon(Icons.paypal, size: 70),
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color validateParColor(TextEditingController controller) {
    if (_formKey.currentState == null || _formKey.currentState!.validate()) {
      return Color.fromARGB(255, 40, 4, 241);
    } else {
      return Colors.red;
    }
  }

  void validePaiment(String cardNumber, String expMonth, String expYear,
      String cvc, int amountInCents) {
    print('Paiement en cours...');
  }

  void cleareChamps() {
    cardNumberController.clear();
    expMonthController.clear();
    expYearController.clear();
    cvcController.clear();
  }
}
