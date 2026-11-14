import 'package:material_ui/material_ui.dart';

import '../router/auth_session.dart';
import '../router/user_role.dart';
import 'app_segmented_switcher.dart';

class RoleSwitcher extends StatelessWidget {
  const RoleSwitcher({super.key, this.selectedRole, this.onChanged});

  final UserRole? selectedRole;
  final ValueChanged<UserRole>? onChanged;

  static const _options = [
    SegmentedSwitcherOption(
      value: UserRole.admin,
      label: 'Admin',
      icon: Icons.admin_panel_settings_outlined,
    ),
    SegmentedSwitcherOption(
      value: UserRole.instructor,
      label: 'Instrutor',
      icon: Icons.sports_martial_arts_outlined,
    ),
    SegmentedSwitcherOption(
      value: UserRole.student,
      label: 'Aluno',
      icon: Icons.school_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (selectedRole != null) {
      return _buildSwitcher(selectedRole!);
    }

    return ListenableBuilder(
      listenable: authSession,
      builder: (context, _) => _buildSwitcher(authSession.role),
    );
  }

  Widget _buildSwitcher(UserRole currentRole) {
    return AppSegmentedSwitcher<UserRole>(
      options: _options,
      selected: currentRole,
      onChanged: onChanged ?? authSession.setRole,
    );
  }
}
