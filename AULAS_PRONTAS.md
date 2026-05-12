# 🎓 Ideias de Aulas Prontas: Começar Hoje!

Este documento contém 20+ ideias de aulas que você pode preparar e ministrar a partir do Contador Interativo.

---

# 📌 AULAS PRONTAS (Clique e Prepare!)

## NÍVEL 1: INICIANTE (Primeiras 2-3 aulas)

### Aula 1: "Meu Primeiro App em Flutter" ⭐⭐
**Duração**: 2-3 horas  
**Pré-requisito**: Nenhum (Flutter instalado)  
**Objetivo**: Rodar o Contador no dispositivo do aluno

**Conteúdo**:
- [ ] Instalar Flutter (10 min)
- [ ] Abrir projeto Contador
- [ ] Rodar `flutter run`
- [ ] Ver app funcionando
- [ ] Entender estrutura básica
- [ ] Fazer hot reload (pressionar `r`)
- [ ] Mudar uma cor (Azul → Verde) com hot reload
- [ ] Mudar o nome do contador

**Resultado**: App rodando + primeira mudança feita

**Arquivo Referência**: COMO_INICIAR.md

---

### Aula 2: "Entendendo StatefulWidget" ⭐⭐⭐
**Duração**: 2-3 horas  
**Pré-requisito**: Aula 1  
**Objetivo**: Compreender ciclo de vida de widgets

**Conteúdo**:
- [ ] Explicar StatelessWidget vs StatefulWidget
- [ ] Mostrar main.dart lado-a-lado
- [ ] Explicar `build()`, `setState()`, ciclo de vida
- [ ] Debugar com DevTools
- [ ] Ver rebuild acontecendo
- [ ] Inserir print() para entender fluxo

**Exercício Prático**:
1. Adicionar contador de rebuilds
2. Observar quando rebuild acontece
3. Prever quando rebuild ocorrerá

**Arquivo Referência**: CONTADOR_GUIA.md

---

### Aula 3: "Os 5 Primeiros Desafios" ⭐⭐⭐
**Duração**: 2-3 horas  
**Pré-requisito**: Aula 2  
**Objetivo**: Primeiro desafio implementado

**Desafios (escolha 1 ou vários)**:
1. Adicionar incremento de +5 e -5
2. Adicionar limite máximo e mínimo
3. Mudar cores dos botões
4. Aumentar tamanho do texto
5. Adicionar bordas arredondadas

**Resultado**: 5 versões do Contador prontas

---

## NÍVEL 2: INTERMEDIÁRIO (Aulas 4-8)

### Aula 4: "Persistência de Dados com SharedPreferences" ⭐⭐⭐
**Duração**: 2 horas  
**Pré-requisito**: Aula 2  
**Objetivo**: Salvar contador quando fecha app

**Conteúdo**:
1. Instalar `shared_preferences`
2. Entender Key-Value storage
3. Implementar `_salvarContador()`
4. Implementar `_carregarContador()`
5. Chamar ao iniciar app
6. Testar: fechar app, abrir, valor mantido

**Código Mínimo**:
```dart
import 'package:shared_preferences/shared_preferences.dart';

Future<void> salvar() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('contador', contador);
}

Future<void> carregar() async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    contador = prefs.getInt('contador') ?? 0;
  });
}
```

**Extra**: Criar botão "Exportar" que mostra valor salvo

---

### Aula 5: "Animações Simples" ⭐⭐⭐
**Duração**: 2-3 horas  
**Pré-requisito**: Aula 2  
**Objetivo**: Número cresce suavemente

**Conteúdo**:
1. Introduzir AnimationController
2. Explicar Tween (valores iniciais e finais)
3. Adicionar ScaleTransition
4. Animar ao incrementar/decrementar
5. Ajustar duração e curva

**Código Simplificado**:
```dart
class _ContadorState extends State<Contador> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  
  void _animar() {
    _controller.forward().then((_) => _controller.reverse());
  }
}
```

**Extra**: Adicionar FadeTransition (desaparecer/aparecer)

---

### Aula 6: "Múltiplos Contadores em uma Lista" ⭐⭐⭐⭐
**Duração**: 3 horas  
**Pré-requisito**: Aula 2, 4  
**Objetivo**: ListView de contadores

**Conteúdo**:
1. Criar classe Contador (nome, valor)
2. Manter Lista<Contador>
3. Usar ListView.builder
4. Cada item é um CountadorCard
5. Adicionar novo com FloatingActionButton
6. Deletar com swipe/botão

**Resultado**: App com múltiplos contadores!

---

### Aula 7: "Temas e Customização" ⭐⭐
**Duração**: 2 horas  
**Pré-requisito**: Aula 1  
**Objetivo**: Dark mode + seletor de cores

**Conteúdo**:
1. Alterar seedColor do ThemeData
2. Criar escolha Light/Dark
3. Guardar preferência com SharedPreferences
4. Aplicar ao reiniciar

**Código**:
```dart
final tema = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  brightness: brightness, // Brightness.dark ou .light
);
```

**Extra**: Paleta de cores (5 temas diferentes)

---

### Aula 8: "Histórico e Undo" ⭐⭐⭐⭐
**Duração**: 3 horas  
**Pré-requisito**: Aula 2, 5  
**Objetivo**: Ver todas as mudanças + desfazer

**Conteúdo**:
1. Criar Stack<int> de histórico
2. Adicionar ao incrementar/decrementar
3. Botão "Undo" que faz pop()
4. Mostrar lista com todas as mudanças
5. Timestamp de cada mudança

**Extra**: Botão "Redo"

---

## NÍVEL 3: AVANÇADO (Aulas 9-15)

### Aula 9: "OOP no Contador" ⭐⭐⭐⭐
**Duração**: 2-3 horas  
**Pré-requisito**: Aula 2, 3  
**Objetivo**: Refatorar com classes

**Conteúdo**:
1. Criar classe `ContadorModel`
2. Encapsulamento (propriedades privadas)
3. Métodos públicos (incrementar, decrementar)
4. Validação dentro dos métodos
5. Separar lógica da UI

**Resultado**: Código mais organizado e testável

---

### Aula 10: "Design Patterns: Factory e Singleton" ⭐⭐⭐⭐
**Duração**: 2 horas  
**Pré-requisito**: Aula 9  
**Objetivo**: Entender e aplicar patterns

**Conteúdo**:
1. Factory Pattern para criar tipos diferentes
2. SimpleContador vs AdvancedContador
3. Singleton para serviço único
4. Aplicación prática no projeto

**Código**:
```dart
abstract class Contador {
  void incrementar();
}

class SimpleContador implements Contador {
  @override void incrementar() => valor++;
}

class AdvancedContador implements Contador {
  @override void incrementar() => valor += 5;
}

class ContadorFactory {
  static Contador criar(String tipo) {
    return tipo == 'simple' ? SimpleContador() : AdvancedContador();
  }
}
```

---

### Aula 11: "Provider Pattern - Gerenciamento Real" ⭐⭐⭐⭐⭐
**Duração**: 3-4 horas  
**Pré-requisito**: Aula 9, 10  
**Objetivo**: Código profissional

**Conteúdo**:
1. Instalar `provider` package
2. Criar `ContadorNotifier extends ChangeNotifier`
3. Aplicar ao app com `ChangeNotifierProvider`
4. Usar `context.watch()` nos widgets
5. Refatorar todo o código anterior

**Resultado**: App profissional com Provider!

**Exemplo Mínimo**:
```dart
class ContadorNotifier extends ChangeNotifier {
  int _valor = 0;
  void incrementar() {
    _valor++;
    notifyListeners();
  }
}

// No widget
final contador = context.watch<ContadorNotifier>();
Text('${contador.valor}')
```

---

### Aula 12: "Testes Automatizados" ⭐⭐⭐⭐
**Duração**: 2-3 horas  
**Pré-requisito**: Aula 9  
**Objetivo**: Testar lógica e UI

**Conteúdo**:
1. Unit tests para `ContadorModel`
2. Widget tests para UI
3. Assertions básicas
4. Rodar testes e ver cobertura

**Teste de Exemplo**:
```dart
test('incrementa valor corretamente', () {
  final contador = ContadorModel();
  contador.value = 5;
  contador.incrementar();
  expect(contador.value, 6);
});
```

---

### Aula 13: "Internacionalização (i18n)" ⭐⭐⭐
**Duração**: 2 horas  
**Pré-requisito**: Aula 1  
**Objetivo**: Contador em 2+ idiomas

**Conteúdo**:
1. Instalar `intl` package
2. Criar arquivo `l10n` com strings
3. Configurar MaterialApp com localizationDelegates
4. Usar `AppLocalizations.of(context)?...`
5. Seletor de idioma

**Suportado**: PT, EN, ES (idiomas mais fáceis)

---

### Aula 14: "Acessibilidade (a11y)" ⭐⭐⭐
**Duração**: 1-2 horas  
**Pré-requisito**: Aula 1  
**Objetivo**: Contador para todos

**Conteúdo**:
1. Entender Semantics widget
2. Adicionar labels para leitores de tela
3. Garantir tamanho mínimo de botões
4. Contraste suficiente de cores
5. Testar com TalkBack (Android) ou VoiceOver (iOS)

**Código Básico**:
```dart
Semantics(
  label: 'Incrementar contador de $valor',
  button: true,
  onTap: incrementar,
  child: ElevatedButton(...),
)
```

---

### Aula 15: "Firebase Básico - Sincronização Cloud" ⭐⭐⭐⭐✨
**Duração**: 3-4 horas  
**Pré-requisito**: Aula 4  
**Objetivo**: Contador na nuvem

**Conteúdo**:
1. Criar projeto Firebase Console
2. Instalar `firebase_core` + `cloud_firestore`
3. Autenticar com Anonymous auth
4. Salvar contador em Firestore
5. Carregar valor ao abrir

**Resultado**: Contador sincronizado entre dispositivos!

---

## NÍVEL 4: PROFISSIONAL (Aulas 16-20)

### Aula 16: "BLoC Pattern - Corporativo" ⭐⭐⭐⭐⭐
**Duração**: 4 horas  
**Pré-requisito**: Aula 11, 12  
**Objetivo**: Integrar com BLoC

**Conteúdo**:
1. Instalar `flutter_bloc`
2. Criar Events, States, BLoC
3. Estrutura de pastas profissional
4. Usar BlocBuilder na UI
5. Testar BLoC com blocTest

**Estrutura**:
```
lib/
├── blocs/
│   └── contador/
│       ├── contador_event.dart
│       ├── contador_state.dart
│       └── contador_bloc.dart
└── presentation/
    └── contador_page.dart
```

---

### Aula 17: "Deploy no Google Play Store" ⭐⭐⭐
**Duração**: 2-3 horas  
**Pré-requisito**: Aula 1  
**Objetivo**: App publicado

**Conteúdo** (checklist):
- [ ] Gerar keystore
- [ ] Configurar build.gradle
- [ ] Build APK/App Bundle
- [ ] Criar conta Play Console
- [ ] Preparar screenshots e descrição
- [ ] Upload de APK
- [ ] Submeter para review

**Resultado**: App no Play Store!

---

### Aula 18: "Deploy na App Store" ⭐⭐⭐
**Duração**: 2-3 horas  
**Pré-requisito**: Aula 1, acesso Mac  
**Objetivo**: App publicado em iOS

**Conteúdo** (checklist):
- [ ] Configurar Xcode certificates
- [ ] Provisioning profiles
- [ ] Build iOS
- [ ] TestFlight
- [ ] App Store Connect
- [ ] Submeter para review

**Nota**: Requer Mac + $99 Apple Developer

---

### Aula 19: "Custom UI - Desenhar Contador Circular" ⭐⭐⭐⭐⭐
**Duração**: 3-4 horas  
**Pré-requisito**: Aula 5  
**Objetivo**: UI completamente customizada

**Conteúdo**:
1. CustomPaint widget
2. Canvas API (drawCircle, drawText)
3. Animar valor de 0 até número
4. Adicionar animação ao incrementar
5. Responder ao tap

**Resultado**: Contador circular e profissional!

---

### Aula 20: "Arquitetura Clean + SOLID" ⭐⭐⭐⭐⭐
**Duração**: 4-5 horas  
**Pré-requisito**: Aula 9, 16  
**Objetivo**: Estrutura profissional

**Conteúdo**:
1. Data layer (repositories, datasources)
2. Domain layer (entities, usecases)
3. Presentation layer (BLoC, pages)
4. Dependency injection
5. Refatorar Contador completamente

**Estrutura Final**:
```
lib/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── bloc/
    ├── pages/
    └── widgets/
```

---

# 📚 AULAS DE CONCEITOS (Transversais)

### Aula Extra 1: "Git e Versionamento" ⭐⭐
**Duração**: 1-2 horas  
**Objetivo**: Controlar versões do código

**Conteúdo**:
- [ ] Init git
- [ ] Commits significativos
- [ ] Branches para features
- [ ] Merge
- [ ] GitHub (push, pull, issues)

---

### Aula Extra 2: "DevTools - Debugging Profundo" ⭐⭐⭐
**Duração**: 1-2 horas  
**Objetivo**: Debugar problemas

**Conteúdo**:
- [ ] Abrir DevTools
- [ ] Inspector (selecionar widgets)
- [ ] Console (logs)
- [ ] Debugger (breakpoints)
- [ ] Performance (FPS)
- [ ] Memory (leaks)

---

### Aula Extra 3: "Performance e Otimização" ⭐⭐⭐
**Duração**: 2 horas  
**Objetivo**: App rápido

**Conteúdo**:
- [ ] Identificar rebuilds desnecessários
- [ ] const constructors
- [ ] RepaintBoundary
- [ ] ListView lazy loading
- [ ] Image optimization

---

### Aula Extra 4: "Sound Null Safety" ⭐⭐
**Duração**: 1-2 horas  
**Objetivo**: Evitar erros de null

**Conteúdo**:
- [ ] Null vs non-null types
- [ ] Late keyword
- [ ] Null checking
- [ ] Try-catch adequado

---

# 🎯 PLANO PARA 12 SEMANAS

### Semana 1
- Aula 1: Meu Primeiro App
- Aula 2: StatefulWidget

### Semana 2
- Aula 3: Primeiros Desafios
- Aula Extra 2: DevTools

### Semana 3
- Aula 4: SharedPreferences
- Aula Extra 1: Git

### Semana 4
- Aula 5: Animações
- Aula 7: Temas

### Semana 5
- Aula 6: Múltiplos Contadores
- Aula Extra 3: Performance

### Semana 6
- Aula 8: Histórico/Undo
- Aula 13: i18n

### Semana 7
- Aula 9: OOP
- Aula 10: Design Patterns

### Semana 8
- Aula 11: Provider Pattern
- Aula 12: Testes

### Semana 9
- Aula 14: Acessibilidade
- Aula 15: Firebase

### Semana 10
- Aula 16: BLoC Pattern
- Aula 19: Custom UI

### Semana 11
- Aula 17: Play Store
- Aula 18: App Store

### Semana 12
- Aula 20: Clean Architecture
- Revisão e Projeto Final

---

# 🎁 BÔNUS: Mini-Workshops (45-90 min)

1. **"Animar seu App em 60 min"** → Aula 5
2. **"Publicar no Play Store em 90 min"** → Aula 17
3. **"Dark Mode em 45 min"** → Aula 7
4. **"Testar seu App em 75 min"** → Aula 12
5. **"Persistência em 60 min"** → Aula 4
6. **"Múltiplos Idiomas em 45 min"** → Aula 13
7. **"Firebase em 90 min"** → Aula 15
8. **"Custom UI em 120 min"** → Aula 19

---

# 🚀 COMO COM EÇAR

1. **Escolha 5-8 aulas** da lista
2. **Organize em cronograma** (2-3 aulas/semana)
3. **Prepare materiais** (slides, código, exercícios)
4. **Grave vídeos** (ou faça ao vivo)
5. **Disponibiliz para alunos**

---

**Última atualização**: Maio 2026  
**Status**: 20+ Aulas prontas!  
**Versão**: 1.0

