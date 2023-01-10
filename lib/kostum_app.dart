import 'providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kostum/screens/main_screen.dart';

class KostumApp extends StatelessWidget {
  const KostumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        ),
      ],
      child: const MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
