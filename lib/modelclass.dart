class modelclass{
  final int? id;
  final String? name;
  final int? age;
  final String? course;

  modelclass({
    required this.id,
    required this.name,
    required this.age,
    required this.course});

  factory modelclass.fromJson(Map<String,dynamic>json) =>
      modelclass(
          id: json['id'],
          name: json['name'],
          age: json['age'],
          course: json['course']);
}

//List<modelclass> model = [];

class emp_Model{
  final int? id;
  final String? name;
  final int? age;
  final String? address;

  emp_Model({
    required this.id,
    required this.name,
    required this.age,
    required this.address});

  factory emp_Model.fromJson(Map<String,dynamic>json) =>
      emp_Model(
          id: json['id'],
          name: json['name'],
          age: json['age'],
          address: json['address']);
}