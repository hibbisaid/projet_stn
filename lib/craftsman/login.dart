import 'package:flutter/material.dart';
import 'package:projet_stn/Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_stn/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errormessage = '';
  bool isLogin = true;
  // ignore: unused_field
  final TextEditingController _controllerEmail = TextEditingController();
  // ignore: unused_field
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseException catch (e) {
      setState(() {
        errormessage = e.message;
      });
    }
  }

  // ignore: unused_element
  Widget _title() {
    return const Text('Firbase Auth');
  }

  // ignore: unused_element
  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  // ignore: unused_element
  Widget _errorMessage() {
    return Text(errormessage == '' ? '' : 'Humm ? $errormessage');
  }

  // ignore: unused_element
  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead.'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),

              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 30),

              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                    prefixIcon: Icon(Icons.account_circle),
                    filled: true,
                    fillColor: Color.fromARGB(255, 215, 223, 215)),
              ),

              const SizedBox(height: 10),

              // password textfield
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.password_outlined,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 215, 223, 215)),
              ),
              const SizedBox(height: 25),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Dashboard();
                  }));
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 4),
                    Text(
                      'If you do not have an account',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      //onTap: (){},
                      child: Text("Click Here",
                          style: TextStyle(
                              color: Color.fromARGB(255, 12, 12, 13))),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
