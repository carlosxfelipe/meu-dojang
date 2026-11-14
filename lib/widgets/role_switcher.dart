import 'package:material_ui/material_ui.dart';

import '../router/auth_session.dart';
import '../router/user_role.dart';

class RoleSwitcher extends StatelessWidget {
  const RoleSwitcher({super.key, this.selectedRole, this.onChanged});

  final UserRole? selectedRole;
  final ValueChanged<UserRole>? onChanged;

  @override
  Widget build(BuildContext context) {
    if (selectedRole != null) {
      return _buildSegmentedButton(selectedRole!);
    }

    return ListenableBuilder(
      listenable: authSession,
      builder: (context, _) => _buildSegmentedButton(authSession.role),
    );
  }

  Widget _buildSegmentedButton(UserRole currentRole) {
    return SegmentedButton<UserRole>(
      segments: const [
        ButtonSegment(
          value: UserRole.admin,
          label: Text('Admin'),
          icon: Icon(Icons.admin_panel_settings_outlined),
        ),
        ButtonSegment(
          value: UserRole.instructor,
          label: Text('Instrutor'),
          icon: Icon(Icons.sports_martial_arts_outlined),
        ),
        ButtonSegment(
          value: UserRole.student,
          label: Text('Aluno'),
          icon: Icon(Icons.school_outlined),
        ),
      ],
      selected: {currentRole},
      onSelectionChanged: (selection) {
        final nextRole = selection.first;
        if (onChanged != null) {
          onChanged!(nextRole);
        } else {
          authSession.setRole(nextRole);
        }
      },
    );
  }
}
