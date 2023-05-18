import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import '../pages/screens/chat_screen.dart';
import '../pages/screens/welcome_screen.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController firstnameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController craftnameController = TextEditingController();
    TextEditingController locationController = TextEditingController();

    String uid = "";
    Future<void> saveUserData(
        String userId) async {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      final CollectionReference usersCollection =
          firestore.collection('craftman');
      final DocumentReference userDocument = usersCollection.doc(userId);

      final Map<String, dynamic> userData = {
        'firstname': firstnameController.text,
        'lastname': lastnameController.text,
        'email': emailController.text,
        'phonenumber': phoneController.text,
        'craftname': craftnameController.text,
        'location': locationController.text,
      };

      try {
        await userDocument.set(userData);
        print('User data saved successfully!');
      } catch (error) {
        print('Error saving user data: $error');
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(20)),
              const SizedBox(height: 60),
              const Icon(
                Icons.app_registration_outlined,
                size: 100,
              ),
              const SizedBox(height: 25),
              Text(
                'Welcome to our application',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              const SizedBox(height: 5),
              TextFormField(
                controller: firstnameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "First name",
                    prefixIcon: Icon(Icons.account_circle),
                    filled: true,
                    fillColor: Color.fromARGB(255, 215, 223, 215)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: lastnameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Last name",
                    prefixIcon: Icon(Icons.account_circle),
                    filled: true,
                    fillColor: Color.fromARGB(255, 215, 223, 215)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.mail_outlined,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 215, 223, 215)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "phone number",
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 215, 223, 215)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: craftnameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Craft name",
                    prefixIcon: Icon(
                      Icons.hardware,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 215, 223, 215)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Location",
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 215, 223, 215)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
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
              const SizedBox(height: 30),

              // sign in button
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: usernameController.text,
                          password: passwordController.text)
                      .then((UserCredential userCredential) {
                    uid = userCredential.user!.uid;
                    if (uid != "") {
                      saveUserData(uid);
                    }
                  });
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const WelcomeScreen();
                  }));
                },
                child: const Text(
                  "Sing Up",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 4),
                    Text(
                      'If already have account',
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

Widget makeInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
      const SizedBox(
        height: 30,
      )
    ],
  );
}
