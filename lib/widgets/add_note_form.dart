import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNotesForm extends StatefulWidget {
  const AddNotesForm({super.key});

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextField(hint: 'Title', onSaved: (val) => title = val),
          SizedBox(height: 20),
          CustomTextField(
            hint: 'Content',
            maxLine: 5,
            onSaved: (val) => content = val,
          ),

          SizedBox(height: 24),
          ColorsListView(),
          SizedBox(height: 16),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                text: 'Add',
                onTap: () {
                  if (globalKey.currentState!.validate()) {
                    globalKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formatedCurrentDate = DateFormat(
                      'dd-mm-yyyy',
                    ).format(currentDate);
                    var noteModel = NoteModel(
                      title: title!,
                      content: content!,
                      date: formatedCurrentDate,
                     
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

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
  const ColorsListView({super.key});

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
    return SizedBox(
      height: 36 * 2,
      child: ListView.builder(
        itemCount: colorList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GestureDetector(
                onTap: () {
                  itemIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color =
                      colorList[index];
                  setState(() {});
                },
                child: ColorItem(
                  color: colorList[index],
                  isActive: itemIndex == index,
                ),
              ),
            ),
      ),
    );
  }
}
