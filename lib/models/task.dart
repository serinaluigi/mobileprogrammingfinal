

class Task{
  final int id;
  final String title;
  final int mileage;
  final int nextinterval;
  final int partcost;
  final int labor;
  final String details;
  Task({this.id, this.title, this.mileage, this.nextinterval, this.partcost, this.labor, this.details});

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'title' : title,
      'mileage' : mileage,
      'nextinterval' : nextinterval,
      'partcost' : partcost,
      'labor' : labor,
      'details' : details,
    };
  }

}