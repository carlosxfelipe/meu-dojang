enum UserRole {
  admin,
  instructor,
  student;

  String get label => switch (this) {
    UserRole.admin => 'Administrador',
    UserRole.instructor => 'Instrutor',
    UserRole.student => 'Aluno',
  };

  String get description => switch (this) {
    UserRole.admin => 'Controle total do dojang, alunos, aulas e financeiro.',
    UserRole.instructor =>
      'Gerencia aulas, chamadas e acompanhamento dos alunos.',
    UserRole.student =>
      'Visualiza horários, avisos, frequência e sua graduação.',
  };

  bool get canManageAll => this == UserRole.admin;
  bool get canManageStudents =>
      this == UserRole.admin || this == UserRole.instructor;
  bool get canManageClasses =>
      this == UserRole.admin || this == UserRole.instructor;
  bool get canAccessFinance => this == UserRole.admin;
}
