import 'package:flutter/material.dart';
import 'package:factory_manager/app.dart';
import 'package:provider/provider.dart';
import 'package:factory_manager/control/page_redirector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    ),
    home: ChangeNotifierProvider(
        create: (context) => PageRedirector(), child: MyApp()),
  ));
}
