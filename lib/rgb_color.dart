import 'dart:ui';

import 'package:flutter/foundation.dart';

@immutable
class RgbColor {
  const RgbColor(this.hex);

  static const RgbColor white = RgbColor('#FFFFFF');
  static const RgbColor black = RgbColor('#000000');
  static const RgbColor grey = RgbColor('#d2d2d2');

  final String hex;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RgbColor && runtimeType == other.runtimeType && hex == other.hex;

  @override
  int get hashCode => hex.hashCode;
}

extension RgbColorExtension on RgbColor {
  Color get color => Color(int.parse('FF${hex.substring(1)}', radix: 16));
}

extension ColorExtension on Color {
  RgbColor get rgbColor => RgbColor('#${value.toRadixString(16)}');
}
