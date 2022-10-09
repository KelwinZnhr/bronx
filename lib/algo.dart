import 'package:flutter/material.dart';

class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  void push(E element) => _storage.add(element);
  E pop() => _storage.removeLast();

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }
}

void main(List<String> args) {
  List<int> myList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  debugPrint(myList.reversed.toString());
}
