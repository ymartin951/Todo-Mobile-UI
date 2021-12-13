import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTodoView extends StatelessWidget {
  CreateTodoView({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Create Todo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              maxLines: 1,
              controller: _titleController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(37, 43, 103, 1),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(37, 43, 103, 1))),
                hintText: 'Enter title of your Todo',
                label: Text(
                  'Title',
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'this field is required';
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              maxLines: 4,
              controller: _descriptionController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(37, 43, 103, 1),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(37, 43, 103, 1))),
                hintText: 'Please describe your todo',
                label: Text(
                  'Description',
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'this field is required';
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365))).then((selectedDate){
                                final DateFormat _dateFormat  =  DateFormat('dd/MM/yyyy');
                                _dateController.text   =  _dateFormat.format(selectedDate!);
                      });
                    },
                    maxLines: 1,
                    controller: _dateController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(37, 43, 103, 1),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(37, 43, 103, 1))),
                      hintText: 'Date',
                      label: Text(
                        'Date created',
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this field is required';
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((selectedTime)  {
                           _timeController.text  = selectedTime!.format(context);
                      });
                    },
                    maxLines: 1,
                    controller: _timeController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(37, 43, 103, 1),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(37, 43, 103, 1))),
                      hintText: 'time created',
                      label: Text(
                        'Time',
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this field is required';
                      }
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.brown,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('Fields are validated');
                } else {
                  print('feilds are not validated');
                }
              },
              child: const Text(
                'Create',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
