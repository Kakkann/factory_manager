import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Coleta extends StatefulWidget {
  const Coleta({super.key});

  @override
  State<Coleta> createState() => _ColetaState();
}

class _ColetaState extends State<Coleta> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [Text('data'), Text('data'), Text('data')],
          ),
          Stack(children: [
            ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text('Agendar Coleta'),
                onPressed: () {})
          ]),
        ],
      ),
    );
  }
}
