import 'package:material_ui/material_ui.dart';

import '../widgets/widgets.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return RoleBuilder(
      builder: (context, role) {
        final isStaff = role.canManageStudents;

        return Scaffold(
          appBar: AppHeader(title: isStaff ? 'Alunos' : 'Minha Jornada'),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              AppBannerCard(
                icon: isStaff
                    ? Icons.group_outlined
                    : Icons.military_tech_outlined,
                title: isStaff ? 'Gestão de Alunos' : 'Minha Graduação',
                description: isStaff
                    ? 'Acompanhe alunos, faixas, graduações e frequência no dojang.'
                    : 'Acompanhe sua faixa atual, Tuls e requisitos para o próximo exame.',
              ),
              const SizedBox(height: 20),
              Text(
                isStaff ? 'Ações disponíveis' : 'Meu progresso',
                style: textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              RoleGate(
                allowedRoles: const {UserRole.admin},
                child: const AppListCard(
                  icon: Icons.person_add_outlined,
                  title: 'Novo aluno',
                  subtitle: 'Cadastrar praticante e faixa atual',
                ),
              ),
              if (isStaff) ...[
                const AppListCard(
                  icon: Icons.badge_outlined,
                  title: 'Lista de alunos',
                  subtitle: 'Consultar cadastros, faixas e frequência',
                ),
                const AppListCard(
                  icon: Icons.military_tech_outlined,
                  title: 'Graduações e faixas',
                  subtitle: 'Acompanhar evolução e exames de faixa',
                ),
              ] else ...[
                const AppListCard(
                  icon: Icons.military_tech_outlined,
                  title: 'Faixa Azul (4º Gub)',
                  subtitle: 'Próximo objetivo: Faixa Azul Ponta Vermelha (3º Gub)',
                ),
                const AppListCard(
                  icon: Icons.menu_book_outlined,
                  title: 'Tuls e técnicas',
                  subtitle: 'Consultar sequência de Tuls para o próximo exame',
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
