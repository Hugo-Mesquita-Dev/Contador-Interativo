# 🎓 Prompts Para Usar na Aula - Contador Interativo

## 📌 Como Usar Estes Prompts

Estes 5 prompts foram criados para usar com IA (ChatGPT, Copilot, etc) durante suas aulas. Cada prompt:

- ✅ Pede uma implementação específica
- ✅ Inclui explicação de cada linha
- ✅ Traz código comentado
- ✅ É educacional para alunos

**Dica**: Cole o prompt completo em uma ferramenta de IA e peça para implementar + explicar.

---

# 💡 PROMPT 1: Personalização e Tema
**Tópico**: Design, Cores, Nomes  
**Nível**: 🟢 Iniciante  
**Tempo de Aula**: 15-20 minutos  
**Objetivo**: Entender como personalizar UI

## Copie e Cole Este Prompt:

```
Estou criando uma aula sobre Flutter para iniciantes usando o projeto "Contador Interativo".

Quero que você implemente uma versão personalizada do contador que:

1. Mude a cor principal do app (seedColor) para roxo
2. Mude o nome do título do contador para "Contador de Presença"
3. Aumente o tamanho do número central para 100px
4. Mude o label dos botões para:
   - Botão +1: "Adicionar"
   - Botão -1: "Remover"
   - Botão Reset: "Limpar"

Requisitos:
- Mantenha o código original do main.dart
- Adicione COMENTÁRIOS EXPLICATIVOS em cada linha que foi mudada
- Explique ABAIXO do código o que cada mudança faz e por quê
- Use cores Material Design (Colors.purple, Colors.blue, etc)
- Mantenha a estrutura de StatefulWidget

Após implementar, explique em linguagem simples:
- Qual é o papel do seedColor no MaterialApp?
- Por que usamos copyWith() no TextStyle?
- Como o Flutter sabe qual cor usar em cada lugar?
- O que significa o "?" antes de displayLarge?

Código base (main.dart) para referência:
[Cole o conteúdo do seu main.dart aqui]

Por favor, forneça:
1. O código completo do main.dart modificado com comentários
2. Explicação linha por linha das mudanças
3. 3 exemplos de outras cores que poderiam ser usadas
4. Um exercício para o aluno tentar sozinho (mudar para verde/laranja)
```

---

## 🎯 Resultado Esperado em Aula

O aluno verá:
- ✅ Como mudar cores no Flutter
- ✅ Como adicionar comentários úteis
- ✅ Diferença entre "hardcoded" vs usando Theme
- ✅ Estrutura de MaterialApp

---

# 💡 PROMPT 2: Validação e Limites
**Tópico**: Lógica de Negócio, If/Else, Validação  
**Nível**: 🟡 Intermediário  
**Tempo de Aula**: 20-25 minutos  
**Objetivo**: Entender controle de fluxo e validação

## Copie e Cole Este Prompt:

```
Estou criando uma aula sobre VALIDAÇÃO em Flutter usando "Contador Interativo".

Implemente um contador com limites:

1. Limite máximo: 100 (não pode passar)
2. Limite mínimo: 0 (não pode ficar negativo)
3. Mostrar uma mensagem quando atinge limites:
   - Quando tenta ir além de 100: "Máximo atingido!"
   - Quando tenta ir abaixo de 0: "Não pode ir para negativo"

4. Mudar a cor do número:
   - Verde se está entre 0-50
   - Amarelo se está entre 51-80
   - Vermelho se está entre 81-100

5. Desabilitar botões quando em limites:
   - Desabilitar botão "+" quando = 100
   - Desabilitar botão "-" quando = 0

Estrutura esperada:
```dart
// Classe com limites definidos
class _ContagemInterativaHomeState extends State<ContagemInterativaHome> {
  int _contador = 0;
  final int _limiteMaximo = 100;  // ← Máximo
  final int _limiteMinimo = 0;    // ← Mínimo
  String _mensagem = '';          // ← Mensagem feedback

  // Métodos com VALIDAÇÃO
  void _incrementarComValidacao() { }
  void _decrementarComValidacao() { }
  
  // Método que retorna cor baseado no valor
  Color _obterCorContador() { }
  
  // Método que valida se botão pode ser clicado
  bool _podeBotaoIncrementar() { }
  bool _podeBotaoDecrementar() { }
}
```

Requisitos:
- Adicione comentários explicando cada validação
- Use if/else ou operador ternário
- Mostre a mensagem por 2 segundos e desapareça
- Explique o conceito de "estados válidos" vs "inválidos"
- Use MaterialApp com seedColor apropriado

Após o código, explique:
1. O que é uma validação?
2. Por que precisamos validar entrada do usuário?
3. Qual é a diferença entre _podeBotaoIncrementar() e _incrementarComValidacao()?
4. Como usar ternários para simplificar código?
5. Qual seria uma validação real em um app de verdade?

Forneça:
1. Código completo e comentado
2. Explicação das 5 perguntas acima
3. 1 exercício desafio: "Como você adicionaria um 'limpar' que reseta para 50?"
```

---

## 🎯 Resultado Esperado em Aula

O aluno aprenderá:
- ✅ Validações com if/else
- ✅ Operadores ternários
- ✅ Estados válidos e inválidos
- ✅ UX: desabilitar botões
- ✅ Feedback visual ao usuário

---

# 💡 PROMPT 3: Persistência de Dados
**Tópico**: SharedPreferences, Async/Await, Iniciação  
**Nível**: 🔴 Avançado  
**Tempo de Aula**: 30-40 minutos  
**Objetivo**: Entender salvamento de dados local

## Copie e Cole Este Prompt:

```
Estou criando uma aula sobre PERSISTÊNCIA DE DADOS em Flutter.

Implemente uma versão do "Contador Interativo" que:

1. SALVA automaticamente o valor do contador usando SharedPreferences
2. CARREGA o valor quando o app abre
3. Tem um botão "Exportar" que mostra:
   - Valor atual do contador
   - Data/hora da última atualização
   - Número total de incrementos (estatísticas)

4. Tem um botão "Limpar Dados" que:
   - Reseta o contador para 0
   - Limpa também a persistência
   - Pede confirmação antes (AlertDialog)

5. Mostra um indicador visual se dados foram carregados

Estrutura esperada:
```dart
import 'package:shared_preferences/shared_preferences.dart';

class _ContagemInterativaHomeState extends State<ContagemInterativaHome> {
  int _contador = 0;
  DateTime _ultimaAtualizacao = DateTime.now();
  int _totalIncrementos = 0;  // ← Rastreia quantas vezes incrementou
  bool _jaSincronizou = false;  // ← Indica se carregou dados

  @override
  void initState() {
    super.initState();
    _carregarTodosOsDados();  // ← Carrega quando inicia
  }

  // Carrega TODOS os dados salvos
  Future<void> _carregarTodosOsDados() async { }

  // Salva TODOS os dados
  Future<void> _salvarTodosOsDados() async { }

  // Incrementa E salva
  void _incrementarEPersistir() { }

  // Exporta dados como String
  String _exportarDados() { }

  // Limpa dados com confirmação
  void _limparDadosComConfirmacao() { }
}
```

Requisitos:
- Adicione bem comentários explicando async/await
- Explique por que usar "Future<void>"
- Mostre tratamento de erros com try/catch
- Use AlertDialog para confirmação
- Salve MÚLTIPLOS valores (não só contador)

Após o código, responda:
1. O que é uma Future? Por que é necessário?
2. O que significa "await"? 
3. Por que precisa de "async" na função?
4. O que é SharedPreferences? Como funciona?
5. Qual é a diferença entre getInt(), setInt(), remove()?
6. O que acontece se os dados não existem (??)?
7. Por que usamos ?? 0 no código?

Forneça:
1. Código COMPLETO com incrementos salvos em initState
2. Teste local: "Como você testaria se está salvando corretamente?"
3. Um diagrama textual mostrando:
   - App abre → carrega dados
   - Usuário clica + → salva
   - App fecha
   - App abre → carrega dados antigos
4. Desafio: "Como você salvaria um HISTÓRICO de todos os valores?"

Importante: Use comentários como:
// ← Explicar por que async
// ← O que significa Future
// ← Por que usar ?? aqui
```

---

## 🎯 Resultado Esperado em Aula

O aluno aprenderá:
- ✅ Async/Await
- ✅ Futures
- ✅ SharedPreferences API
- ✅ initState para carregar dados
- ✅ Persistência = dados que sobrevivem ao app fechar
- ✅ Try/catch para erros

---

# 💡 PROMPT 4: Animações e Interatividade
**Tópico**: AnimationController, Tween, Transições  
**Nível**: 🔴 Avançado  
**Tempo de Aula**: 35-45 minutos  
**Objetivo**: Entender animações em Flutter

## Copie e Cole Este Prompt:

```
Estou criando uma aula sobre ANIMAÇÕES em Flutter.

Implemente 3 animações diferentes no Contador Interativo:

1. ANIMAÇÃO 1: Scale (Crescimento)
   - Quando clica +1, o número cresce de 1.0 até 1.3 e volta
   - Duração: 300ms
   - Curve: elasticOut (elástica)

2. ANIMAÇÃO 2: Opacity (Desaparecimento)
   - Quando reseta para 0, o número pisca (desaparece/aparece)
   - Duração: 500ms
   - Repeat 3 vezes

3. ANIMAÇÃO 3: Rotation (Rotação)
   - Quando clica -1, o número rotaciona 180 graus
   - Duração: 400ms
   - Curve: circInOut

Estrutura esperada:
```dart
class _ContagemInterativaHomeState extends State<ContagemInterativaHome>
    with TickerProviderStateMixin {  // ← Por que isso aqui?
      
  late AnimationController _controladorScale;     // ← Anima escala
  late AnimationController _controladorOpacity;   // ← Anima aparência
  late AnimationController _controladorRotacao;   // ← Anima rotação
  
  late Animation<double> _animacaoScale;
  late Animation<double> _animacaoOpacity;
  late Animation<double> _animacaoRotacao;

  @override
  void initState() {
    super.initState();
    // ← Criar controllers aqui
  }

  void _incrementarComAnimacao() { }
  void _decrementarComAnimacao() { }
  void _resetarComAnimacao() { }

  @override
  void dispose() {
    // ← Limpar controllers aqui
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _animacaoScale, child: /* numero */);
  }
}
```

Requisitos:
- Explique cada linha de anime
- Use Tween<double>(begin, end)
- Use CurvedAnimation para curvas
- Use ScaleTransition, FadeTransition, RotationTransition
- Mostre múltiplos controllers

Após o código, responda (em linguagem simples):
1. O que é um AnimationController?
2. O que é Tween? Por que "begin: 1.0, end: 1.3"?
3. Por que usar "with TickerProviderStateMixin"?
4. O que é uma Curve? Qual a diferença entre elasticOut e linear?
5. Por que precisamos fazer dispose() dos controllers?
6. O que é uma Transition widget? (ScaleTransition, FadeTransition, etc)
7. Qual seria uma animação inútil?
8. Como você faria uma animação contínua (infinita)?

Forneça:
1. Código COMPLETO e COMENTADO
2. Explicação das 8 perguntas
3. Um exercício: "Crie uma 4ª animação que muda de cor"
4. Um diagrama mostrando:
   duration: 300ms
   begin: 1.0 ----animação--> end: 1.3 ----volta--> 1.0
5. Desafio: "Como você faria a animação executar automaticamente a cada 2 segundos?"
```

---

## 🎯 Resultado Esperado em Aula

O aluno aprenderá:
- ✅ AnimationController
- ✅ Tween (tweening)
- ✅ Curves (curvas de animação)
- ✅ Transition widgets
- ✅ Dispose (limpeza de recursos)
- ✅ Por que animações melhoram UX

---

# 💡 PROMPT 5: Incrementos Dinâmicos e Histórico
**Tópico**: Variáveis, Listas, Métodos, Estado  
**Nível**: 🔴 Avançado  
**Tempo de Aula**: 40-50 minutos  
**Objetivo**: Trabalhar com estado complexo

## Copie e Cole Este Prompt:

```
Estou criando uma aula sobre ESTADO COMPLEXO em Flutter.

Implemente uma versão avançada do Contador que:

1. TEM MÚLTIPLOS BOTÕES DE INCREMENTO:
   +1, +5, +10, +50 e seus correspondentes de decremento
   Cada cor diferente (verde, azul, roxo, vermelho)

2. RASTREIA HISTÓRICO:
   - Mantém lista de TODAS as operações
   - Formato: "11:23:45 - +5 → 127"
   - Mostra últimas 10 operações

3. TEM BOTÃO "DESFAZER" (Undo):
   - Volta para o valor anterior
   - Só funciona se há histórico
   - Mostra quanto "desfez"

4. ESTATÍSTICAS:
   - Total de incrementos
   - Total de decrementos
   - Maior valor atingido
   - Data/hora que atingiu máximo
   - Tempo que o app está aberto

5. EXPORTAR RELATÓRIO:
   - Mostra tudo em um dialog
   - Com botão para copiar texto

Estrutura esperada:
```dart
class Operacao {
  final DateTime hora;
  final int valor;        // +5, -10, etc
  final int resultante;   // Valor após operação
  Operacao({required this.hora, required this.valor, required this.resultante});
}

class _ContagemInterativaHomeState extends State<ContagemInterativaHome> {
  int _contador = 0;
  List<Operacao> _historico = [];  // ← Rastreia tudo
  int _maiorValor = 0;
  DateTime _dataMaximo = DateTime.now();
  DateTime _dataInicio = DateTime.now();

  // Incrementa com valor dinâmico
  void _incrementarPor(int valor) { }
  
  // Decrementapor valor dinâmico  
  void _decrementarPor(int valor) { }

  // Desfaz última operação
  void _desfazer() { }

  // Gera estatísticas
  Map<String, dynamic> _gerarEstatisticas() { }

  // Formata hora para "HH:MM:SS"
  String _formatarHora(DateTime data) { }

  // Mostra relatório
  void _mostrarRelatorio() { }
}
```

Requisitos:
- Adicione comentários explicando cada variável
- Explique Types (int, List<Operacao>, Map)
- Use toString() para debugar
- Use DateTime para rastrear tempo
- Use List.add() e List.removeLast()
- Use ScaffoldMessenger para mostrar mensagens

Após o código, responda:
1. Por que criar uma classe Operacao separada?
2. O que é List<Operacao>? Por que preciamos disso?
3. Como function _incrementarPor(int valor) é melhor que _incrementarContador()?
4. O que é um Map<String, dynamic>? Quando usar?
5. Como você rastrearia o histórico se o número tivesse 1 milhão de operações?
6. Por que usar ScaffoldMessenger vs print()?
7. Qual seria um "limite" de histórico sensato? (10, 100, 1000?)
8. Como você testaria se o undo está fazendo corretamente?

Forneça:
1. Código COMPLETO, muito comentado
2. Classe Operacao bem estruturada
3. Explicação das 8 perguntas
4. Um exercício: "Adicione um botão 'Refazer' (Redo)"
5. Um desafio: "Como você salvaria histórico com SharedPreferences?"
6. Diagrama de fluxo:
   Clica +5
   --> _incrementarPor(5)
   --> Cria nova Operacao(time, 5, novoValor)
   --> Adiciona ao _historico
   --> setState() para atualizar UI
   --> Se clica Undo, remove último Operacao
```

---

## 🎯 Resultado Esperado em Aula

O aluno aprenderá:
- ✅ Variáveis complexas (List, Map)
- ✅ Classes personalizadas (Operacao)
- ✅ Métodos parametrizados
- ✅ Histórico e Undo
- ✅ Estatísticas e relatórios
- ✅ DateTime para rastrear tempo
- ✅ Estrutura de dados profissional

---

# 🎯 Como Usar Estes 5 Prompts em Aula

## Cenário 1: Aula de 2 horas
- 🟢 Use PROMPT 1 (Tema) - 20 min
- 🟡 Use PROMPT 2 (Validação) - 25 min
- 🔴 Use PROMPT 3 ou 4 (escolha uma) - 40 min
- 5 min de pausa
- Discussão e dúvidas - 10 min

## Cenário 2: Aula de 3 horas
- Use TODOS os 5 prompts!
- 20 min cada para primeiros 3
- 35 min para prompts 4 e 5
- Muitos intervalos

## Cenário 3: Série de 5 Aulas
- Aula 1: PROMPT 1 (Tema)
- Aula 2: PROMPT 2 (Validação)
- Aula 3: PROMPT 3 (Persistência)
- Aula 4: PROMPT 4 (Animações)
- Aula 5: PROMPT 5 (Histórico Avançado)

---

# 💡 Dicas Para Usar em Aula

1. **Mostre o código no projetor enquanto explica**
2. **Deixe alunos copiarem o código**
3. **Execute no emulador para ver resultado**
4. **Use hot reload para mostrar mudanças**
5. **Faça perguntas ("Por que precisa async?**
6. **Deixe alunos modificarem cores/valores**
7. **Dê o exercício como dever de casa**
8. **Na próxima aula, revise o exercício**

---

# 📊 Resumo dos 5 Prompts

| # | Prompt | Nível | Tempo | Tópicos |
|---|--------|-------|-------|---------|
| 1 | Tema & Cores | 🟢 | 15-20 min | Theme, TextStyle |
| 2 | Validação | 🟡 | 20-25 min | if/else, ternário, UX |
| 3 | Persistência | 🔴 | 30-40 min | async/await, SharedPreferences |
| 4 | Animações | 🔴 | 35-45 min | AnimationController, Tween |
| 5 | Histórico | 🔴 | 40-50 min | List, Classes, Map |

**Total**: 140-180 minutos (~3 aulas inteiras!)

---

**Última atualização**: Maio 2026  
**Status**: ✅ Prompts Prontos Para Usar  
**Versão**: 1.0

*Cole cada prompt em GPT/Copilot e implemente com suas turmas!* 🚀

