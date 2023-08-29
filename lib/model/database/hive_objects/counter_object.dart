import 'package:hive_flutter/hive_flutter.dart';
part 'counter_object.dart';

@HiveType(typeId: 0)
class CounterObject {
  CounterObject({required this.name, required this.daytime, required this.id});
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String daytime;
  @HiveField(2)
  final String id;
}
