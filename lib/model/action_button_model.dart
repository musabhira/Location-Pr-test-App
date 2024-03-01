import 'dart:ui';

class ActionButtonModel {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final double width;
  final double height;

  const ActionButtonModel({
    required this.text,
    required this.color,
    required this.onTap,
    this.width = double.infinity,
    this.height = 50,
  });
}
