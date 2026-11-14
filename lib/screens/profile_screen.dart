import 'package:material_ui/material_ui.dart';

import '../router/auth_session.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return RoleBuilder(
      builder: (context, role) {
        return Scaffold(
          appBar: const AppHeader(title: 'Perfil'),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              AppBannerCard(
                icon: Icons.person_outline,
                title: 'Perfil: ${role.label}',
                description: role.description,
              ),
              const SizedBox(height: 20),
              Text(
                'Simular tipo de usuário',
                style: textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              const RoleSwitcher(),
              const SizedBox(height: 20),
              Text('Configurações', style: textTheme.titleMedium),
              const SizedBox(height: 8),
              RoleGate(
                allowedRoles: const {UserRole.admin},
                child: const AppListCard(
                  icon: Icons.sports_martial_arts_outlined,
                  title: 'Dados do dojang',
                  subtitle: 'Nome da academia, endereço e horários',
                ),
              ),
              RoleGate(
                allowedRoles: const {UserRole.admin},
                child: const AppListCard(
                  icon: Icons.manage_accounts_outlined,
                  title: 'Equipe e permissões',
                  subtitle: 'Gerenciar instrutores subordinados',
                ),
              ),
              const AppListCard(
                icon: Icons.settings_outlined,
                title: 'Preferências',
                subtitle: 'Notificações, tema e conta',
              ),
              const SizedBox(height: 16),
              AppButton(
                label: 'Sair da conta',
                variant: AppButtonVariant.outlined,
                leftIcon: Icons.logout,
                fullWidth: true,
                onPressed: authSession.signOut,
              ),
            ],
          ),
        );
      },
    );
  }
}
