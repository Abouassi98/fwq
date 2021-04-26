import 'package:flutter/material.dart';

class ShopsProvider with ChangeNotifier {
  List<Shops> _shops = [];

  List<Shops> get shops {
    return [..._shops];
  }

  Future getShops(int id, String search, BuildContext context) async {
    final List<Shops> loaded = [];

    List<Shops> list = [
      Shops(
          id: 1,
          name: 'محمد احمد',
          departmentId: 1,
          photo: 'https://picsum.photos/250?image=9'),
      Shops(
          id: 2,
          name: 'محمود صالح',
          departmentId: 2,
          photo: 'https://picsum.photos/250?image=10'),
      Shops(
          id: 3,
          name: 'عبدالمنعم فؤاد',
          departmentId: 3,
          photo: 'https://picsum.photos/250?image=11'),
      Shops(
          id: 4,
          name: 'احمد المنسي',
          departmentId: 2,
          photo: 'https://picsum.photos/250?image=19'),
      Shops(
          id: 5,
          name: 'عمر احمد',
          departmentId: 1,
          photo: 'https://picsum.photos/250?image=29'),
    ];

    print("get shops sucsseful");
    await Future.delayed(Duration(seconds: 1), () {
      list.forEach((e) {
        loaded.add(Shops(
            id: e.id,
            name: e.name,
            photo: e.photo,
            departmentId: e.departmentId));
      });
      _shops = loaded.toList();
    });
    notifyListeners();
  }
}

class Shops {
  Shops({
    @required this.id,
    @required this.name,
    @required this.departmentId,
    @required this.photo,
  });
  int id;
  int departmentId;
  String name;
  String photo;
}
