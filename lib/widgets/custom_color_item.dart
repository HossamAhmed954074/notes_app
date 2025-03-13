
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isActive});
  final Color color;
  // Function(Color color) onTap;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
          radius: 34,
          backgroundColor: Colors.white,
          child: CircleAvatar(radius: 30, backgroundColor: color),
        )
        : CircleAvatar(radius: 32, backgroundColor: color);
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key, this.color});
  final int? color;
  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int itemIndex = 0;
  List<Color> colorList = [
    Colors.blueAccent,
    Colors.tealAccent,
    Colors.pinkAccent,
    Colors.orangeAccent,
    Colors.limeAccent,
    Colors.lightGreen,
    Colors.deepPurple,
    Colors.amber,
  ];
  @override
  Widget build(BuildContext context) {

    if(widget.color!=null){
      List<Color> l =[];
      l.add(Color(widget.color!));
      for(int i = 0 ;i<colorList.length;i++){
        if(Color(widget.color!) != colorList[i]){
          l.add(colorList[i]);
        }else{
          continue;
        }

      }

      colorList = l;
    }

    return SizedBox(
      height: 36 * 2,
      child: ListView.builder(
        itemCount: colorList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: InkWell(
                onTap: () {
                  itemIndex = index;
                  setState(() {

                  });
                  BlocProvider.of<AddNoteCubit>(context).color =
                      colorList[index];
                  setState(() {});
                },
                child: ColorItem(
                  color:colorList[index],
                  isActive: itemIndex == index,
                ),
              ),
            ),
      ),
    );
  }
}
