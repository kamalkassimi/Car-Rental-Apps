import 'package:flutter/material.dart';
import 'package:flutter_car_app/ModelCar.dart';
import 'package:flutter_car_app/src/database.dart';
import 'package:flutter_car_app/src/sign_in.dart'; // Ensure SignUp is imported

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TextField Validation',
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final dbHelper = DatabaseHelper();

  bool _isVisibility = false;
  bool ispasswordstatus = false;
  bool hasPasswordOneNumber = false;

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  onpasswordchange(String password) {
    final numberredexp = RegExp(r'[0-9]');
    setState(() {
      ispasswordstatus = false;
      if (password.length >= 8) {
        ispasswordstatus = true;
      }

      hasPasswordOneNumber = false;
      if (numberredexp.hasMatch(password)) {
        hasPasswordOneNumber = true;
      }
    });
  }

  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{3,}$').hasMatch(email);
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      var user = await dbHelper.getUser(email, password);
      print(user);
      if (user != null) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyApp11_part(),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 219, 216, 212),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Login In",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'images_Cars/logo_app.jpg',
                          height: 50,
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 100),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val!.length > 30) {
                                return "Email cannot exceed 30 characters";
                              }
                              if (val.length < 15) {
                                return "Email cannot be less than 15 characters";
                              }
                              return null;
                            },
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            validator: (val) {
                              if (val!.length > 30) {
                                return "Password cannot exceed 30 characters";
                              }
                              if (val.length < 8) {
                                return "Password cannot be less than 8 characters";
                              }
                              return null;
                            },
                            onChanged: (password) {
                              return onpasswordchange(password);
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
                          const SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: MaterialButton(
                              onPressed: () {
                                _submitForm();
                              },
                              height: 50,
                              minWidth: double.infinity,
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "LOGIN IN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.only(left: 230),
                            child: Text(
                              "Forget Password ?",
                              style: TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Row(
                              children: [
                                const Text(
                                  "Create an account ?",
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
                                        builder: (context) => SignUp(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(color: Colors.blue, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
