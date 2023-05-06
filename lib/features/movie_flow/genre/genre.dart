import 'package:flutter/foundation.dart';

@immutable
class Genre {
  final String name;
  final bool isSelected;
  final int id;

   const Genre({required this.name, this.id = 0, this.isSelected = false});

  Genre toggleSelected() {
    return Genre(name: name,
    id: id,
    isSelected: !isSelected);
  }

  @override
  String toString() {
    return 'Genre{name: $name, isSelected: $isSelected, id: $id}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Genre &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          isSelected == other.isSelected &&
          id == other.id;

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode ^ id.hashCode;
}
