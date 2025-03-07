import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 24,bottom: 24,left: 16),
      decoration: BoxDecoration(
        color:const Color(0xffFFCC80),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text('Flutter Tips', style: TextStyle(color: Colors.black,fontSize: 26)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'build Your Carer',
                style: TextStyle(color: Colors.black.withValues(alpha: 0.5),fontSize: 18),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.trash, color: Colors.black,size: 24,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text('may 21,2022', style: TextStyle(color: Colors.black.withValues(alpha: 0.5))),
          ),
        ],
      ),
    );
  }
}