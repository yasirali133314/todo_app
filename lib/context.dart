import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension Context on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ThemeData get theme => Theme.of(this);

  AppLocalizations get l10n => AppLocalizations.of(this)!;

  void closeKeyboard() => FocusScope.of(this).unfocus();

  void showSnackBarMessage(
    String message, {
    bool isError = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    final theme = Theme.of(this);
    final Color? foregroundColor;
    final Color? backgroundColor;
    if (isError) {
      foregroundColor = theme.colorScheme.onError;
      backgroundColor = theme.colorScheme.error;
    } else {
      foregroundColor = null;
      backgroundColor = null;
    }

    ScaffoldMessenger.of(this).removeCurrentSnackBar();

    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: InkWell(
        onTap: () {
          ScaffoldMessenger.of(this).hideCurrentSnackBar();
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          message,
          style: TextStyle(color: foregroundColor),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration,
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  Rect? createRenderObject() {
    final box = findRenderObject() as RenderBox?;
    if (box == null) {
      return null;
    }

    final position = box.localToGlobal(Offset.zero);

    return Rect.fromPoints(
      position,
      position + Offset(box.size.width, box.size.height),
    );
  }
}
