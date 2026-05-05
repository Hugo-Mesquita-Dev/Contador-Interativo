# 📱 Contador Interativo - Aplicativo Flutter Educacional

Um aplicativo Flutter simples e educacional que demonstra conceitos fundamentais de desenvolvimento mobile, perfeito para iniciantes aprenderem sobre **StatefulWidget**, **setState()** e desenvolvimento de interfaces responsivas.

## 🎯 Sobre o Projeto

O **Contador Interativo** é um projeto educacional criado para demonstrar como construir aplicativos interativos em Flutter. Com uma interface limpa e intuitiva, ele permite contar/rastrear qualquer coisa: pontos em um jogo, presença em sala, tarefas concluídas, etc.

### ✨ Características

- ✅ Interface limpa e moderna com Material Design 3
- ✅ Demonstra uso de **StatefulWidget** e **StatelessWidget**
- ✅ Implementação prática de **setState()**
- ✅ Layout centralizado e responsivo
- ✅ Botões para incrementar, decrementar e resetar
- ✅ Nome personalizável do contador
- ✅ Código bem comentado (em português)
- ✅ Compatível com **Hot Reload**
- ✅ Pronto para expandir e personalizar

## 🚀 Como Começar

### Pré-requisitos

- [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado
- Um dispositivo ou emulador para testar

### Instalação e Execução

1. **Abra o terminal** na pasta do projeto:
   ```bash
   cd "C:\Users\Hugo\MOnitoria\Contador Interativo"
   ```

2. **Obtenha as dependências**:
   ```bash
   flutter pub get
   ```

3. **Execute o aplicativo**:
   ```bash
   flutter run
   ```

4. **Use Hot Reload**:
   - Pressione `r` no terminal para recarregar sem perder dados
   - Pressione `R` para reiniciar completamente

## 📚 Conceitos Educacionais

### StatelessWidget vs StatefulWidget

#### StatelessWidget
```dart
class ContagemInterativaApp extends StatelessWidget {
  // Imutável - não muda após construção
  // Ideal para UIs estáticas
}
```

#### StatefulWidget
```dart
class ContagemInterativaHome extends StatefulWidget {
  // Pode mudar seu estado durante execução
  // Requer classe State correspondente
}
```

### setState() e Atualização de Estado

```dart
void _incrementarContador() {
  setState(() {
    // Qualquer mudança aqui causa rebuild
    _contador++;
  });
}
```

## 📁 Estrutura do Projeto

```
Contador Interativo/
├── lib/
│   └── main.dart                  # Código principal (bem comentado)
├── test/
│   └── widget_test.dart           # Testes do app
├── android/                       # Configurações Android
├── ios/                           # Configurações iOS
├── web/                           # Configurações Web
├── pubspec.yaml                   # Dependências do projeto
│
├── README.md                      # Este arquivo
├── COMO_INICIAR.md               # Guia rápido
├── CONTADOR_GUIA.md              # Guia completo com conceitos
├── DESAFIOS_E_EXPANSÕES.md       # 15 desafios de programação
└── EXEMPLOS_VARIAÇÕES.dart       # 5 variações do contador
```

## 🎨 Personalizações

### Mudar o Nome do Contador

Abra `lib/main.dart` e localize a função `main()`:

```dart
home: const ContagemInterativaHome(
  titulo: 'Contador Interativo',
  nomeContador: 'Pontos',  // ← Mude aqui!
),
```

**Exemplos**:
- `'Alunos Presentes'` - Para presença em sala
- `'Tarefas Concluídas'` - Para acompanhamento de tarefas
- `'Pontos do Jogo'` - Para aplicativos de jogos
- `'Vendas Hoje'` - Para vendedores

### Mudar Cores

Procure por `Colors.blueAccent` no código e substitua por:

```dart
Colors.red, Colors.green, Colors.purple, Colors.orange, 
Colors.pink, Colors.cyan, Colors.redAccent, Colors.greenAccent
```

Exemplo:
```dart
colorScheme: ColorScheme.fromSeed(
  seedColor: Colors.green,  // ← Mudou para verde!
  brightness: Brightness.light,
),
```

### Aumentar Tamanho do Número

```dart
Text(
  '$_contador',
  style: Theme.of(context).textTheme.displayLarge?.copyWith(
    fontSize: 120,  // ← Aumente este valor
    fontWeight: FontWeight.bold,
  ),
),
```

## 📖 Arquivos de Documentação

| Arquivo | Descrição |
|---------|-----------|
| **COMO_INICIAR.md** | Guia rápido para começar (atalhos, troubleshooting) |
| **CONTADOR_GUIA.md** | Guia completo com conceitos e explicações detalhadas |
| **DESAFIOS_E_EXPANSÕES.md** | 15 desafios progressivos (fácil → médio → difícil) |
| **EXEMPLOS_VARIAÇÕES.dart** | 5 variações comentadas do contador |

## 💡 Widgets Utilizados

| Widget | Propósito |
|--------|-----------|
| `MaterialApp` | Raiz do aplicativo com Material Design |
| `Scaffold` | Estrutura básica (AppBar, Body, FloatingActionButton) |
| `AppBar` | Barra de título |
| `Center` | Centraliza conteúdo |
| `Column` | Layout vertical |
| `Row` | Layout horizontal |
| `Text` | Texto |
| `ElevatedButton` | Botão com elevação |
| `Container` | Decoração e layout |
| `SingleChildScrollView` | Scroll para telas pequenas |

## 🎓 O que Você Aprenderá

Após completar este projeto e seus desafios, você entenderá:

- [ ] Diferença entre StatelessWidget e StatefulWidget
- [ ] Como usar setState() para atualizar a UI
- [ ] Estrutura básica de um app Flutter
- [ ] Layout com Column, Row, Center
- [ ] Widgets Material Design
- [ ] Interatividade com botões
- [ ] Hot Reload e Hot Restart
- [ ] Como estruturar projeto Flutter
- [ ] Boas práticas de clean code
- [ ] Como expandir funcionalidades

## 🚀 Próximos Passos

1. **Comece com Desafios Fáceis** (alterar cores, nomes)
2. **Progresse para Médios** (limite máximo, barra de progresso)
3. **Teste Desafios Difíceis** (persistência, animações, som)
4. **Explore as 5 Variações** (contextos diferentes)
5. **Crie Seu Próprio Contador** (customizado para seu caso)

## 🔗 Recursos Úteis

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Material Design Guidelines](https://material.io/design)
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)
- [Awesome Flutter](https://github.com/Solido/awesome-flutter)

## 📱 Compatibilidade

- ✅ Android 5.0+
- ✅ iOS 11.0+
- ✅ Web (Chrome, Firefox, Safari)
- ✅ Windows 10+
- ✅ macOS 10.11+
- ✅ Linux (Ubuntu, Fedora, etc)

## 🐛 Troubleshooting

### "Flutter command not found"
```bash
# Adicione Flutter ao PATH do seu sistema
# Windows: C:\flutter\bin
# macOS/Linux: /path/to/flutter/bin
```

### Emulador não inicia
```bash
flutter emulators
flutter emulators --launch <emulator-id>
```

### Erro de certificado Android
```bash
flutter doctor --android-licenses
```

Veja **COMO_INICIAR.md** para mais soluções.

## 📝 Licença

Este projeto é aberto e livre para uso educacional.

## 👨‍💻 Criado para Fins Educacionais

Este projeto foi desenvolvido como um exemplo prático para ensinar:
- Conceitos fundamentais de Flutter
- Boas práticas de desenvolvimento
- Estrutura de código limpa e organizada
- Documentação adequada

Perfeito para:
- Iniciantes em Flutter
- Aulas de desenvolvimento mobile
- Bootcamps de programação
- Auto-aprendizado

## 🎉 Comece Agora!

```bash
cd "C:\Users\Hugo\MOnitoria\Contador Interativo"
flutter run
```

**Happy Coding!** 🚀

---

Para dúvidas ou sugestões, consulte a documentação oficial do Flutter em https://flutter.dev
