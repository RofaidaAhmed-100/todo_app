import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/model/task.dart';

class FirebaseUtils{
  static CollectionReference<Task> getTasksCollection(){
    return  FirebaseFirestore.instance.collection(Task.collectionName)
        .withConverter<Task>(
        fromFirestore: (snapshot,options)=>Task.fromFireStore(snapshot.data()!),
        toFirestore: (task,option)=>task.toFireStore()
    );
}
  static Future<void> addTaskToFireStore( Task task ){
    var taskCollection =getTasksCollection();
var taskDocRef= taskCollection.doc();
task.id=taskDocRef.id;
return taskDocRef.set(task);

  }
}