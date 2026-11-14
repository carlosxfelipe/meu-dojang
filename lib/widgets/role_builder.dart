import 'package:material_ui/material_ui.dart';

import '../router/auth_session.dart';
import '../router/user_role.dart';

export '../router/user_role.dart';

class RoleBuilder extends StatelessWidget {
  const RoleBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, UserRole role) builder;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: authSession,
      builder: (context, _) => builder(context, authSession.role),
    );
  }
}

class RoleGate extends StatelessWidget {
  const RoleGate({
    super.key,
    required this.allowedRoles,
    required this.child,
    this.fallback,
  });

  final Set<UserRole> allowedRoles;
  final Widget child;
  final Widget? fallback;

  @override
  Widget build(BuildContext context) {
    return RoleBuilder(
      builder: (context, role) {
        if (allowedRoles.contains(role)) {
          return child;
        }
        return fallback ?? const SizedBox.shrink();
      },
    );
  }
}
