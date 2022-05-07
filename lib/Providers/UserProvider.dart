import 'package:flutter/cupertino.dart';
import 'package:futurejob/Models/UserModel.dart';

class UserProdiver with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel? newUser) {
    _user = newUser!;
    notifyListeners();
  }
}
