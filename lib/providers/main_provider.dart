import 'package:flutter/foundation.dart';

class MainProvider with ChangeNotifier {
  int stackToView = 1;

  get index => stackToView;

  void changeState() {
    stackToView = 0;
    notifyListeners();
  }
}
