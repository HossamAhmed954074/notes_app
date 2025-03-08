import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottonSheet extends StatelessWidget {
  const AddNoteBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: AddNotesForm(),
      ),
    );
  }
}

class AddNotesForm extends StatefulWidget {
  const AddNotesForm({
    super.key,
  });

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {

  final GlobalKey<FormState> globalKey =GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title , content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children:  [
          SizedBox(height: 32),
          CustomTextField(hint: 'Title',onSaved: (val)=> title = val,),
          SizedBox(height: 20),
          CustomTextField(hint: 'Content', maxLine: 5,onSaved: (val) => content = val ,),
          SizedBox(height: 24,),
          CustomButton(text: 'Add',onTap: () {
            if(globalKey.currentState!.validate()){
              globalKey.currentState!.save();
            }else{

              autoValidateMode =AutovalidateMode.always;
              setState(() {

              });
            }
          },),
          SizedBox(height: 32,),
        ],
      ),
    );
  }
}


