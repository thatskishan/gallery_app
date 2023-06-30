import 'package:flutter/cupertino.dart';

import '../../models/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModal themeModal = ThemeModal(isDark: false);

  void changeTheme() {
    themeModal.isDark = !themeModal.isDark;
    notifyListeners();
  }
}
