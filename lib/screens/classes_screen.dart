import 'package:material_ui/material_ui.dart';

import '../widgets/widgets.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return RoleBuilder(
      builder: (context, role) {
        final isStaff = role.canManageClasses;

        return Scaffold(
          appBar: const AppHeader(title: 'Aulas'),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              AppBannerCard(
                icon: Icons.calendar_month_outlined,
                title: isStaff ? 'Agenda de Aulas' : 'Minhas Aulas',
                description: isStaff
                    ? 'Organize horários, turmas de Taekwondo e registre a presença dos alunos.'
                    : 'Confira os horários das suas turmas e registre sua presença.',
              ),
              const SizedBox(height: 20),
              Text(
                isStaff ? 'Turmas e presenças' : 'Horários disponíveis',
                style: textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              if (isStaff) ...[
                RoleGate(
                  allowedRoles: const {UserRole.admin},
                  child: const AppListCard(
                    icon: Icons.add_circle_outline,
                    title: 'Criar nova turma',
                    subtitle: 'Definir horário, tatame e instrutor responsável',
                  ),
                ),
                const AppListCard(
                  icon: Icons.schedule_outlined,
                  title: 'Horários e turmas',
                  subtitle: 'Gerenciar turmas infantis, juvenis e adultos',
                ),
                const AppListCard(
                  icon: Icons.fact_check_outlined,
                  title: 'Lista de presença',
                  subtitle: 'Registrar chamada das aulas de hoje',
                ),
              ] else ...[
                const AppListCard(
                  icon: Icons.schedule_outlined,
                  title: 'Seg, Qua e Sex • 19:00 - 20:00',
                  subtitle: 'Juvenil e Adulto • Tatame 1',
                ),
                const AppListCard(
                  icon: Icons.check_circle_outline,
                  title: 'Confirmar presença',
                  subtitle: 'Avisar o instrutor que você vai treinar hoje',
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
