import 'package:flutter/foundation.dart';

@immutable
class GenreEntity {
  final int id;
  final String name;

  const GenreEntity({
    required this.id,
    required this.name,
  });

  factory GenreEntity.fromMap(Map<String, dynamic> map) {
    return GenreEntity(id: map['id'], name: map['name']);
  }

  @override
  String toString() {
    return 'GenreEntity{id: $id, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
