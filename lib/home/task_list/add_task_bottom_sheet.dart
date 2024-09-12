
import 'package:flutter/material.dart';
import 'package:to_do/firebase_utils.dart';
import 'package:to_do/model/task.dart';


class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now();
  String title='';
  String description='';

  //get color => null;
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.all(4),
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add new task',
              textAlign: TextAlign.center,
              style:
              Theme
                  .of(context)
                  .textTheme
                  .titleMedium
          ),
          Form(
              key: formKey,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    onChanged: (text){
                      title=text;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter task title',
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'pls enter task title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextFormField(
                    onChanged: (text){
                      description=text;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter task descrebtion',
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'pls enter task descrebtion';
                      }
                      return null;
                    },

                    maxLines: 3,
                  ),
                  Padding(padding: const EdgeInsets.all(8.8),
                    child: Text('select time', textAlign: TextAlign.start,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.8),
                    child: InkWell(
                      onTap: () {
                        showCalender();
                      },
                      child: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,),
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    addTask();
                  },
                      child: Text('Add task',
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .bodySmall,)
                  )
                ],
              )
          )
        ],
      ),
    );
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      Task task=Task(title: title,
          description: description,
          dateTime: selectedDate);
      FirebaseUtils.addTaskToFireStore(task).timeout(Duration(seconds: 2),
        onTimeout: (){
        print('task added successfully');
        }
      );
    }
  }

  void showCalender() async {
    var context;
    var choosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: (365)
      ),
      ),
    );
    selectedDate=choosenDate??selectedDate;
  setState(() {

  });
  }
}
