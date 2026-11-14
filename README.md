# Meu Dojang

[![Flutter](https://img.shields.io/badge/Flutter-3.50.0-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.14.0-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Aplicativo Flutter para gerenciamento de academias de Taekwondo, atualmente em construção.

Este projeto foi criado a partir do template [flutter-route-kit](https://github.com/carlosxfelipe/flutter-route-kit).

## Configuração

Instale as dependências após clonar o repositório:

```bash
flutter pub get
```

## Executando o App

Liste os dispositivos e IDs disponíveis:

```bash
flutter devices
```

Executar na Web (Chrome):

```bash
flutter run -d chrome
```

Inicie o simulador do iOS primeiro caso nenhum esteja em execução:

```bash
flutter emulators --launch apple_ios_simulator
```

Executar no iOS (corresponde a um simulador de iPhone ou iPhone conectado pelo prefixo do nome):

```bash
flutter run -d iphone
```

Iniciar o emulador Android (`Medium_Phone`):

```bash
flutter emulators --launch Medium_Phone
```

Executar no Android (ou em qualquer dispositivo específico pelo ID obtido em `flutter devices`):

```bash
flutter run -d <device-id>
```

## Formatação, Lint e Testes

Formatar o código Dart:

```bash
dart format .
```

Executar análise estática / lint:

```bash
flutter analyze
```

Executar testes:

```bash
flutter test
```

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE) © 2026 Carlos Felipe Araujo.
