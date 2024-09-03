import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist/app.dart';
import 'package:todoist/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  runApp(MultiRepositoryProvider(
      providers: [
      ],
      child: MultiBlocProvider(
        providers: [
        ],
        child: const TodoistApp(),
      )));
}

Future<void> _initializeFirebase() async {
  // Wait for Firebase to initialize
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
