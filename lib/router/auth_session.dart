import 'package:material_ui/material_ui.dart';

import 'user_role.dart';

class AuthSession extends ChangeNotifier {
  bool _isAuthenticated = false;
  UserRole _role = UserRole.admin;

  bool get isAuthenticated => _isAuthenticated;
  UserRole get role => _role;

  void signIn({UserRole role = UserRole.admin}) {
    final roleChanged = _role != role;
    if (_isAuthenticated && !roleChanged) return;
    _isAuthenticated = true;
    _role = role;
    notifyListeners();
  }

  void setRole(UserRole role) {
    if (_role == role) return;
    _role = role;
    notifyListeners();
  }

  void signOut() {
    if (!_isAuthenticated) return;
    _isAuthenticated = false;
    notifyListeners();
  }
}

final AuthSession authSession = AuthSession();
