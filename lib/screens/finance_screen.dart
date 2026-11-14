import 'package:material_ui/material_ui.dart';

import '../widgets/widgets.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RoleBuilder(
      builder: (context, role) {
        if (!role.canAccessFinance) {
          return const Scaffold(
            appBar: AppHeader(title: 'Financeiro'),
            body: Center(
              child: AppEmptyState(
                icon: Icons.lock_outline,
                title: 'Acesso restrito',
                description:
                    'Apenas o administrador do dojang tem permissão para visualizar o módulo financeiro.',
              ),
            ),
          );
        }

        return const Scaffold(
          appBar: AppHeader(title: 'Financeiro'),
          body: Center(
            child: AppEmptyState(
              icon: Icons.account_balance_wallet_outlined,
              title: 'Financeiro em breve',
              description:
                  'O controle de mensalidades, pagamentos pendentes e lançamentos do dojang ficará disponível aqui.',
            ),
          ),
        );
      },
    );
  }
}
