import 'package:flutter/material.dart';
import 'package:to_do/app_colors.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(18)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            color: AppColors.primaryColor,
            height: 80,
            width: 4,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('title',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryColor),
                ),
                Text('desc',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height*0.01,
              horizontal: MediaQuery.of(context).size.width*0.05,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:AppColors.primaryColor,
            ),
            child: Icon(Icons.check,
              color:AppColors.whiteColor ,
            size: 25,),
          )
        ],
      ),
    );
  }
}
