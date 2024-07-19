import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewsBlock extends StatelessWidget {
  const NewsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 500,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Wrap(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginBox(),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class LoginBox extends StatefulWidget {
  LoginBox({
    super.key,
  });

  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  String? _formValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style1 = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final style2 = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    final style3 = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.secondary,
    );
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Bem vindo!",
                style: style1,
              ),
              SizedBox(height: 30),
              Text(
                "Crie sua conta:",
                softWrap: true,
                textAlign: TextAlign.center,
                style: style2,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Nome de Usuário',
                        ),
                        validator: _formValidator,
                      ),
                      TextFormField(
                        controller: password,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Senha',
                        ),
                        validator: _formValidator,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: () async {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: email.text,
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
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                      // Add TextFormFields and ElevatedButton here.
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
