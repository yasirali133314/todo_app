import 'package:flutter/material.dart';

extension ColorExt on Color {
  bool get isDark => computeLuminance() < 0.5;
}
