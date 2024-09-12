import 'package:flutter/material.dart';
import 'package:to_do/app_colors.dart';
import 'package:to_do/home/settings/settings.dart';
import 'package:to_do/home/task_list/add_task_bottom_sheet.dart';
import 'package:to_do/home/task_list/task_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ///toolbarHeight: MediaQuery.of(context).size.height*0.18,
        title: Text('To Do List',
            style: Theme.of(context).textTheme.titleLarge,
      )
      ),

      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
            side:BorderSide(
              color: AppColors.whiteColor,
                  width: 4,
            )
        ),
        backgroundColor: AppColors.primaryColor,
        onPressed: (){
          addTaskBottomSheet();
        },
        child: Icon(Icons.add,
          color: AppColors.whiteColor,size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            selectedIndex=index;
            setState(() {
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
            label: 'Task list',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings',
            )

          ],
        ),
      ),
      body:
      Column(
        children: [
          Container(
            color: AppColors.primaryColor,
            height: 120,
            width: double.infinity,
       ),
          Expanded(
              child: selectedIndex==0? const TaskListTab()
                  :const SettingsTab()
          ),
        ],
      ),
    );
  }
  List<Widget>Tabs=[const TaskListTab(),const SettingsTab()];


void addTaskBottomSheet() {
  showModalBottomSheet(
      context: context,
      builder: (context)=>const AddTaskBottomSheet(),
  );
}}

