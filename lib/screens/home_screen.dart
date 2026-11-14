import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const int _activeStudentsCount = 64;

  static const _upcomingClasses = [
    (
      time: '18:00',
      title: 'Turma Infantil (6 a 10 anos)',
      subtitle: 'Tatame 1 • 14 alunos confirmados',
    ),
    (
      time: '19:15',
      title: 'Juvenil e Adulto',
      subtitle: 'Tatame 1 • 22 alunos confirmados',
    ),
    (
      time: '20:30',
      title: 'Treino de Matsogi (Luta)',
      subtitle: 'Tatame 2 • 12 alunos confirmados',
    ),
  ];

  static const _monthBirthdays = [
    (name: 'Lucas Ferreira', belt: 'Faixa Azul (4º Gub)', date: '14/11'),
    (name: 'Mariana Costa', belt: 'Faixa Verde (6º Gub)', date: '19/11'),
    (name: 'Rafael Oliveira', belt: 'Faixa Preta I Dan', date: '25/11'),
  ];

  static const _notices = [
    (
      title: 'Exame de Faixa em 28/11',
      description:
          'Inscrições abertas até sexta-feira. Confirme a lista de alunos aptos.',
    ),
    (
      title: 'Treino especial de Tul',
      description:
          'Sábado às 09h00 no tatame principal. Revisão de Chon-Ji até Choong-Moo.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppHeader(
        title: 'Início',
        rightIcon: Icons.notifications_none,
        rightIconTooltip: 'Notificações',
        rightIconBadgeCount: _notices.length,
        onRightIconPressed: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('${_notices.length} avisos importantes no dojang.'),
              ),
            );
        },
      ),
      body: RoleBuilder(
        builder: (context, role) {
          final isStaff = role.canManageStudents;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                children: [
                  Expanded(
                    child: _DashboardMetricCard(
                      icon: isStaff
                          ? Icons.group_outlined
                          : Icons.military_tech_outlined,
                      label: isStaff ? 'Alunos ativos' : 'Minha faixa',
                      value: isStaff ? '$_activeStudentsCount' : '4º Gub',
                      containerColor: colorScheme.primaryContainer,
                      contentColor: colorScheme.onPrimaryContainer,
                      onTap: () => context.go('/alunos'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _DashboardMetricCard(
                      icon: Icons.calendar_month_outlined,
                      label: isStaff ? 'Aulas hoje' : 'Presenças no mês',
                      value: isStaff ? '${_upcomingClasses.length}' : '8',
                      containerColor: colorScheme.secondaryContainer,
                      contentColor: colorScheme.onSecondaryContainer,
                      onTap: () => context.go('/aulas'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const _SectionHeader(title: 'Avisos importantes'),
              const SizedBox(height: 8),
              for (var i = 0; i < _notices.length; i++) ...[
                AppBannerCard(
                  icon: Icons.campaign_outlined,
                  title: _notices[i].title,
                  description: _notices[i].description,
                  backgroundColor: i == 0
                      ? colorScheme.tertiaryContainer
                      : colorScheme.secondaryContainer,
                  foregroundColor: i == 0
                      ? colorScheme.onTertiaryContainer
                      : colorScheme.onSecondaryContainer,
                  padding: const EdgeInsets.all(16),
                ),
                if (i < _notices.length - 1) const SizedBox(height: 8),
              ],
              const SizedBox(height: 20),
              _SectionHeader(
                title: isStaff ? 'Próximas aulas' : 'Meu horário de treino',
                actionLabel: 'Ver todas',
                onActionTap: () => context.go('/aulas'),
              ),
              const SizedBox(height: 8),
              if (isStaff)
                for (final item in _upcomingClasses)
                  AppListCard(
                    leading: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item.time,
                        style: textTheme.labelLarge?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    title: item.title,
                    subtitle: item.subtitle,
                    onTap: () => context.go('/aulas'),
                  )
              else
                AppListCard(
                  leading: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '19:00',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  title: 'Seg, Qua e Sex • 19:00 - 20:00',
                  subtitle: 'Juvenil e Adulto • Tatame 1',
                  onTap: () => context.go('/aulas'),
                ),
              if (isStaff) ...[
                const SizedBox(height: 16),
                _SectionHeader(
                  title: 'Aniversariantes do mês',
                  actionLabel: 'Alunos',
                  onActionTap: () => context.go('/alunos'),
                ),
                const SizedBox(height: 8),
                for (final student in _monthBirthdays)
                  AppListCard(
                    leading: AppAvatar(name: student.name, radius: 20),
                    title: student.name,
                    subtitle: student.belt,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.cake_outlined,
                          size: 16,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(student.date, style: textTheme.labelLarge),
                      ],
                    ),
                    showChevron: false,
                    onTap: () => context.go('/alunos'),
                  ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    this.actionLabel,
    this.onActionTap,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: textTheme.titleMedium),
        if (actionLabel != null && onActionTap != null)
          TextButton(onPressed: onActionTap, child: Text(actionLabel!)),
      ],
    );
  }
}

class _DashboardMetricCard extends StatelessWidget {
  const _DashboardMetricCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.containerColor,
    required this.contentColor,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color containerColor;
  final Color contentColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      color: containerColor,
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: contentColor),
              const SizedBox(height: 12),
              Text(
                value,
                style: textTheme.headlineMedium?.copyWith(
                  color: contentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: textTheme.bodyMedium?.copyWith(color: contentColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
