import 'package:flutter/material.dart';
import 'package:my_trainings_app/home/screen/screen.dart';
import 'package:my_trainings_app/home/service/service.dart';
import 'package:provider/provider.dart';

import 'home/provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TrainingProvider(trainingCards)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Trainings App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}
