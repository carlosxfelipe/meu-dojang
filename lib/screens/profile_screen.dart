import 'package:material_ui/material_ui.dart';

import '../router/auth_session.dart';
import '../theme/app_theme.dart';
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
                  icon: Icons.manage_accounts_outlined,
                  title: 'Equipe e permissões',
                  subtitle: 'Gerenciar instrutores subordinados',
                ),
              ),
              ValueListenableBuilder<ThemeMode>(
                valueListenable: themeModeNotifier,
                builder: (context, mode, _) {
                  return AppListCard(
                    icon: Icons.settings_outlined,
                    title: 'Preferências',
                    subtitle: 'Tema: ${mode.label} • Notificações e conta',
                    onTap: () {
                      showAppBottomSheet<void>(
                        context: context,
                        title: 'Preferências',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Tema do aplicativo',
                              style: textTheme.titleMedium,
                            ),
                            const SizedBox(height: 12),
                            const ThemeSwitcher(),
                          ],
                        ),
                      );
                    },
                  );
                },
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
