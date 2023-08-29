// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_objects.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CounterObjectAdapter extends TypeAdapter<CounterObject> {
  @override
  final int typeId = 0;

  @override
  CounterObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CounterObject(
      number: fields[0] as int,
      id: fields[1] as String,
      date: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CounterObject obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
