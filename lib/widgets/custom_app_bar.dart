import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.title,required this.icon,super.key, this.onPressd});
final String title;
final IconData icon;
final Function()? onPressd;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          title,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),

        ),
        Spacer(),
        CustomSearchIcon(icon: icon,onPressd: onPressd,),
      ],
    );
  }
}
