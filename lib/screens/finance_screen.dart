import 'package:material_ui/material_ui.dart';

import '../widgets/widgets.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppHeader(title: 'Financeiro'),
      body: Center(
        child: AppEmptyState(
          icon: Icons.construction_outlined,
          title: 'Em construção',
          description:
              'O módulo financeiro está em desenvolvimento e estará disponível em breve.',
        ),
      ),
    );
  }
}
