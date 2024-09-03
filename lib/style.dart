import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = _getTheme(brightness: Brightness.light);
final darkTheme = _getTheme(brightness: Brightness.dark);

const _primary = Color(0xFF00D7FF);
const _secondary = Color(0xFFFE9E25);

const _background = Color(0xFFF5F5F5);
const _lightest = Color(0xFFF2F7F7);
const _darkest = Color(0xFF005666);
const _darker = Color(0xA4005666);
const _dark = Color(0x1A005666);
const _textFieldColor = Color(0xFF333333);
const _lightThemeLabelColor = Color(0xFF2D2D2D);
const _divider = Color(0xFFE1EBED);
const _disabled = Color(0xFFD3D3D3);

const _red = Color(0xFFFF3B30);

const _darkThemeLabelColor = Color(0xFFE1EBED);
const _darkBackground = Color(0xFF2D2D2D);
const _darkFontColor = Color(0xFFE1FAFF);
const _darkFontColorLight = Color(0xFFB3B3B3);
const _darkSurface = Color(0xFF0A1010);
const _darkDivider = Color(0xFF3F3F3F);
const _darkPrimaryContainer = Color(0xFF054C5A);
const _darkSecondaryContainer = Color(0xFF5B330C);
const _onDarkSecondaryContainer = Color(0xFFFFF4E6);

const _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  // Primary
  primary: _primary,
  onPrimary: _lightest,
  primaryContainer: Color(0xFFE5FBFF),
  onPrimaryContainer: _lightest,
  // Secondary
  secondary: _secondary,
  onSecondary: _darkest,
  secondaryContainer: Color(0xFFFFF4E6),
  onSecondaryContainer: Color(0xFF663900),
  // Error
  error: _red,
  onError: _lightest,
  // Background
  background: _background,
  onBackground: _darkest,
  // Surface
  surface: _lightest,
  onSurface: _darkest,
  surfaceVariant: Colors.white,
  onSurfaceVariant: _darkest,
  // Outline
  outline: _divider,
);

const _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  // Primary
  primary: _primary,
  onPrimary: _darkFontColor,
  primaryContainer: _darkPrimaryContainer,
  onPrimaryContainer: _darkFontColor,
  // Secondary
  secondary: _secondary,
  onSecondary: _darkest,
  secondaryContainer: _darkSecondaryContainer,
  onSecondaryContainer: _onDarkSecondaryContainer,
  // Error
  error: _red,
  onError: _lightest,
  // Background
  background: _darkBackground,
  onBackground: _darkFontColor,
  // Surface
  surface: _darkSurface,
  onSurface: _darkFontColor,
  surfaceVariant: _textFieldColor,
  onSurfaceVariant: _darkFontColorLight,
  // Outline
  outline: _darkDivider,
);

ThemeData _getTheme({required Brightness brightness}) {
  final isAndroid = Platform.isAndroid;
  final isMobile = true;

  final colorScheme = switch (brightness) {
    Brightness.light => _lightColorScheme,
    Brightness.dark => _darkColorScheme,
  };
  final textTheme = _getTextTheme(colorScheme);
  final primaryTextTheme = textTheme.apply(
    displayColor: colorScheme.onPrimary,
    bodyColor: colorScheme.onPrimary,
  );

  final iconTheme = IconThemeData(
    color: brightness == Brightness.dark ? Colors.white : _darkest,
    size: isMobile ? null : 22,
  );

  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32),
  );
  const buttonPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 16,
  );
  final buttonTextStyle = textTheme.titleMedium;

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: colorScheme,
    textTheme: textTheme,
    primaryTextTheme: primaryTextTheme,
    scaffoldBackgroundColor: colorScheme.background,
    disabledColor: _disabled,
    dividerTheme: DividerThemeData(
      color: colorScheme.outline,
      space: 1,
      thickness: 1,
    ),
    chipTheme: ChipThemeData(
      labelStyle: textTheme.titleSmall,
      backgroundColor: colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      iconTheme: IconThemeData(
        color: colorScheme.onBackground,
        size: 18,
      ),
      side: const BorderSide(
        width: 1,
        color: _dark,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide.none,
      ),
      color: colorScheme.surfaceVariant,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
    ),
    popupMenuTheme: PopupMenuThemeData(
      surfaceTintColor: colorScheme.background,
      shadowColor: isAndroid ? _primary.withOpacity(0.3) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData(
      constraints: BoxConstraints(
        minHeight: 16,
        minWidth: 16,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      showDragHandle: false,
      backgroundColor: colorScheme.surfaceVariant,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorScheme.surfaceVariant,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: switch (brightness) {
        Brightness.light => _darkest,
        Brightness.dark => _darkFontColor,
      },
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 0,
      selectedIconTheme: iconTheme,
      unselectedIconTheme: iconTheme,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: textTheme.titleLarge,
      backgroundColor: colorScheme.background,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surface,
      titleTextStyle: textTheme.titleLarge,
      contentTextStyle: textTheme.bodyMedium,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: _darkest,
      contentTextStyle: primaryTextTheme.bodyLarge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.fromLTRB(16, 0, 8, 0),
    ),
    iconTheme: iconTheme,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: switch (brightness) {
        Brightness.light => Colors.white,
        Brightness.dark => _textFieldColor,
      },
      filled: true,
      floatingLabelBehavior:
      isAndroid ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide.none,
      ),
      hintStyle: textTheme.bodyLarge,
      labelStyle: textTheme.bodyLarge!.copyWith(
        color: switch (brightness) {
          Brightness.light => Colors.black38,
          Brightness.dark => null,
        },
        fontWeight: FontWeight.normal,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.secondary,
      foregroundColor: Colors.white,
      iconSize: 24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: buttonShape,
        padding: buttonPadding,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        textStyle: buttonTextStyle,
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: buttonShape,
        padding: buttonPadding,
        side: BorderSide(
          color: colorScheme.primary,
          width: 1,
        ),
        foregroundColor: colorScheme.primary,
        textStyle: buttonTextStyle,
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: buttonShape,
        padding: buttonPadding,
        foregroundColor: colorScheme.primary,
        textStyle: buttonTextStyle,
      ),
    ),
  );
}

TextTheme _getTextTheme(ColorScheme colorScheme) {
  final isDark = colorScheme.brightness == Brightness.dark;
  final headlineColor = isDark ? colorScheme.onBackground : _darkest;
  const headlineWeight = FontWeight.w900;
  const headlineHeight = 1.2;
  const headlineLetterSpacing = 2.5;

  final titleColor = isDark ? _darkFontColorLight : _darkest;
  const titleWeight = FontWeight.bold;
  const titleHeight = 1.2;
  const titleLetterSpacing = -0.96;

  final bodyColor = isDark ? _darkFontColorLight : _darker;
  const bodyWeight = FontWeight.w500;
  const bodyHeight = 1.5;
  const bodyLetterSpacing = 0.0;

  final labelColor = isDark ? _darkThemeLabelColor : _lightThemeLabelColor;

  final textTheme = TextTheme(
    // Headline
    headlineLarge: TextStyle(
      fontSize: 26,
      height: headlineHeight,
      letterSpacing: headlineLetterSpacing,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),
    headlineMedium: TextStyle(
      fontSize: 32,
      height: headlineHeight,
      letterSpacing: titleLetterSpacing,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      height: headlineHeight,
      letterSpacing: headlineLetterSpacing,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),

    // Title
    titleLarge: TextStyle(
      fontSize: 20,
      height: titleHeight,
      letterSpacing: titleLetterSpacing,
      color: titleColor,
      fontWeight: titleWeight,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      height: titleHeight,
      letterSpacing: titleLetterSpacing,
      color: titleColor,
      fontWeight: titleWeight,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      height: titleHeight,
      letterSpacing: titleLetterSpacing,
      color: titleColor,
      fontWeight: titleWeight,
    ),

    // Body
    bodyLarge: TextStyle(
      fontSize: 16,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: bodyColor,
      fontWeight: bodyWeight,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: bodyColor,
      fontWeight: bodyWeight,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      height: bodyHeight,
      color: bodyColor,
      fontWeight: bodyWeight,
    ),

    // Label
    labelLarge: TextStyle(
      fontSize: 16,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: labelColor,
      fontWeight: bodyWeight,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: labelColor,
      fontWeight: bodyWeight,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: labelColor,
      fontWeight: bodyWeight,
    ),
  );

  return GoogleFonts.manropeTextTheme(textTheme);
}
