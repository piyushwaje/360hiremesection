import 'package:flutter/material.dart';

class ImageStateProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void nextImage(int length) {
    _currentIndex = (_currentIndex + 1) % length;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
