import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({required this.icon,super.key});
 final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Icon(icon,size: 28,),
      ),
    );
  }
}
