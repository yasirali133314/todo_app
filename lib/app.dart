import 'package:flutter/material.dart';
import 'package:todoist/context.dart';
import 'package:todoist/navigation/router.dart';
import 'package:todoist/style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoistApp extends StatefulWidget {
  const TodoistApp({super.key});

  @override
  State<TodoistApp> createState() => _TodoistAppState();
}

class _TodoistAppState extends State<TodoistApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.general_timeFinder_title,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: router(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (_, child) {
        return child!;
      },
    );
  }
}
