import 'package:flutter/material.dart';

class DepartMentProvider with ChangeNotifier {
  List<Departments> _departments = [];

  List<Departments> get departments {
    return [..._departments];
  }

  void getDepartements(BuildContext context) async {
    final List<Departments> loaded = [];

    List<Departments> list = [
      Departments(id: 1, name: 'انف واذن', selected: false),
      Departments(id: 2, name: 'نفسيه', selected: false),
      Departments(id: 3, name: 'عظام', selected: false),
    ];

    print("get departments sucsseful");

    list.forEach((e) {
      loaded.add(Departments(id: e.id, name: e.name, selected: false));
    });
    _departments = loaded.reversed.toList();
    notifyListeners();
  }
}

class Departments {
  Departments({
    @required this.id,
    @required this.name,
    @required this.selected,
  });
  int id;
  String name;
  bool selected;
}
