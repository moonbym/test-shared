import 'package:hive/hive.dart';
part 'counter_objects.g.dart';

@HiveType(typeId: 0)
class CounterObject {
  CounterObject({required this.number, required this.id, required this.date});
  @HiveField(0)
  final int number;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String date;
}
