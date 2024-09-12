class Task{
  static const String collectionName='tasks';
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;
  Task({this.id='', required this.title, required this.description
  ,required this.dateTime, this.isDone=false});
  Task.fromFireStore(Map<String,dynamic>date): this(
    id: date ['id'] as String,
    title: date['title']as String,
    description: date['description']as String,
    dateTime: DateTime.fromMillisecondsSinceEpoch(date['dateTime']),
    isDone: date['isDone'] as bool
  );
  Map<String,dynamic> toFireStore(){
    return{
      'id':id,
      'title':title,
      'description':description,
      'dateTime':dateTime,
      'isDone':isDone
    };

  }
}