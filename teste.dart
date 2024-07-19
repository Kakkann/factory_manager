import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  final emailAddress = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailAddress.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jasper'),
        ),
        body: Center(
          child: Container(
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Log-in",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: emailAddress,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Email',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: password,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: emailAddress.text,
                                password: password.text,
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    'The account already exists for that email.');
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
