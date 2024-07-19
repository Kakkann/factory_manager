import 'package:flutter/material.dart';

class RegisterProductPage extends StatelessWidget {
  const RegisterProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        ElevatedButton.icon(
            icon: Icon(Icons.add), label: Text('Cadastrar'), onPressed: () {})
      ]),
    );
  }
}
