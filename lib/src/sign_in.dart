import 'package:flutter/material.dart';
import 'package:flutter_car_app/src/customText.dart';
import 'package:flutter_car_app/src/database.dart';
import 'package:flutter_car_app/src/login.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TextField Validation',
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  bool _isVisibility = false;
  bool _isPasswordValid = false;
  bool _hasPasswordOneNumber = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final dbHelper = DatabaseHelper();

  createAccount(BuildContext context) async {
    var formState = this.formState.currentState;
    if (formState!.validate()) {
      Map<String, dynamic> user = {
        'firstName': firstName.text,
        'lastName': lastName.text,
        'email': email.text,
        'password': password.text,
      };
      print("data base kamal =======: ${email.value}");
      await dbHelper.saveUser(user);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  onPasswordChange(String password) {
    final numberRegExp = RegExp(r'[0-9]');
    setState(() {
      _isPasswordValid = password.length >= 8;
      _hasPasswordOneNumber = numberRegExp.hasMatch(password);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Create Your Account ",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: const Text(
                      "SignUp",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Form(
                key: formState,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomTextForm(
                        hintText: "First Name",
                        myController: firstName,
                        textInputType: TextInputType.name,
                        icons: Icons.person,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextForm(
                        hintText: "Last Name",
                        myController: lastName,
                        textInputType: TextInputType.name,
                        icons: Icons.person,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextForm(
                        hintText: "Email",
                        myController: email,
                        textInputType: TextInputType.emailAddress,
                        icons: Icons.email,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: password,
                        validator: (val) {
                          if (val!.length > 30) {
                            return "Password cannot exceed 30 characters";
                          }
                          if (val.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                        onChanged: (password) {
                          return onPasswordChange(password);
                        },
                        obscureText: !_isVisibility,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          hintText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisibility = !_isVisibility;
                              });
                            },
                            icon: _isVisibility
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: _isPasswordValid ? Colors.green : null,
                              border: _isPasswordValid
                                  ? Border.all(color: Colors.green)
                                  : Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Contain at least 8 characters"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color:
                                  _hasPasswordOneNumber ? Colors.green : null,
                              border: _hasPasswordOneNumber
                                  ? Border.all(color: Colors.green)
                                  : Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Contain at least 1 number"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MaterialButton(
                  onPressed: () {
                    createAccount(context);
                  },
                  height: 50,
                  minWidth: double.infinity,
                  color: const Color.fromARGB(255, 66, 125, 252),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 150,
                    child: const Divider(
                      thickness: 1.2,
                      color: Colors.black,
                      indent: 15,
                      height: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Or Login with",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 150,
                    child: const Divider(
                      thickness: 1.2,
                      color: Colors.black,
                      indent: 10,
                      height: 40,
                      endIndent: 8,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    const Text(
                      "Already signed up?",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
