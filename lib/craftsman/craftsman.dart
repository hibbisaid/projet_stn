import 'package:flutter/material.dart';

import 'login.dart';
import 'singup.dart';

class Pagecraftsman extends StatefulWidget {
  const Pagecraftsman({Key? key}) : super(key: key);
  @override
  State<Pagecraftsman> createState() => _PagecraftsmanState();
}

class _PagecraftsmanState extends State<Pagecraftsman> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Hello There!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Automatic identity verification which enable you to verify your identity",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.grey[700], fontSize: 15),
                            ),
                            Image.asset("images/hi.png"),
                            MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return LoginPage();
                                }));
                              },
                              color: Colors.indigoAccent[400],
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(40)),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white70),
                              ),
                            )
                          ],
                        ),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SignupPage();
                            }));
                          },
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "Sign UP",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
