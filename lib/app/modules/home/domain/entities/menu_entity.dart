import 'dart:ui';

class MenuEntity {
  final String title;
  final String iconAsset; // SVG or PNG path
  final Color backgroundColor;
  final String? badge;

  MenuEntity({
    required this.title,
    required this.iconAsset,
    required this.backgroundColor,
    this.badge,
  });
}
