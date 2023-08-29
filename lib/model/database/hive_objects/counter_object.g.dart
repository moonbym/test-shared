// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_object.dart';

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
      name: fields[0] as String,
      daytime: fields[1] as String,
      id: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CounterObject obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.daytime)
      ..writeByte(2)
      ..write(obj.id);
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
