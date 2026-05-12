# 💻 Soluções Exemplo Para Os 5 Prompts

Este arquivo contém **GABARITOS** (soluções exemplo) para cada um dos 5 prompts.

Use para **comparar com o que seus alunos fazem** ou como referência de qualidade.

---

# ✅ SOLUÇÃO 1: Personalização e Tema

**Arquivo**: lib/solucoes/solucao_1_tema.dart

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ContagemInterativaApp());
}

class ContagemInterativaApp extends StatelessWidget {
  const ContagemInterativaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador Interativo - Personalizado',
      theme: ThemeData(
        // ← MUDANÇA 1: Altere a cor para roxo
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple, // Era: Colors.blueAccent
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ContagemInterativaHome(),
    );
  }
}

class ContagemInterativaHome extends StatefulWidget {
  const ContagemInterativaHome({Key? key}) : super(key: key);

  @override
  State<ContagemInterativaHome> createState() => _ContagemInterativaHomeState();
}

class _ContagemInterativaHomeState extends State<ContagemInterativaHome> {
  int _contador = 0;
  // ← MUDANÇA 2: Adicione um nome customizável para o contador
  final String nomeContador = 'Contador de Presença';

  void _incrementarContador() {
    setState(() {
      _contador++;
    });
  }

  void _decrementarContador() {
    setState(() {
      if (_contador > 0) _contador--;
    });
  }

  void _resetarContador() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Contador Interativo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ← MUDANÇA 3: Mostrar o nome do contador
            Text(
              nomeContador,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    // copyWith = copiar e modificar estilos
                    fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            // ← MUDANÇA 4: Aumentar tamanho do número para 100
            Text(
              '$_contador',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    // displayLarge = maior estilo de texto
                    fontSize: 100, // Era: padrão (~57)
                    fontWeight: FontWeight.bold,
                    // color: automaticamente usa cor do tema (roxo)
              ),
            ),
            const SizedBox(height: 40),
            // ← Layout horizontal para os botões
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ← MUDANÇA 5: Renomear botão de decremento
                ElevatedButton(
                  onPressed: _decrementarContador,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'Remover', // Era: '-1'
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // ← MUDANÇA 6: Renomear botão de incremento
                ElevatedButton(
                  onPressed: _incrementarContador,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Adicionar', // Era: '+1'
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // ← MUDANÇA 7: Renomear botão de reset
            ElevatedButton.icon(
              onPressed: _resetarContador,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                backgroundColor: Colors.orange,
              ),
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const Text(
                'Limpar', // Era: 'Resetar'
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 📝 Explicação das Mudanças

1. **seedColor: Colors.purple**
   - Define cor principal do app para roxo
   - Material Design usa isso para derivar outras cores

2. **copyWith(fontSize: 100)**
   - copyWith = copiar um estilo e modificar apenas algumas propriedades
   - Mantém outras propriedades do tema original

3. **nomeContador = 'Contador de Presença'**
   - Variável que pode ser mudada facilmente
   - Melhor que hardcoded em múltiplos localespoderia usar

4. **backgroundColor: Colors.red/green**
   - Botões agora têm cores específicas
   - Verde = ação positiva
   - Vermelho = ação negativa

5. **Row com SizedBox**
   - Organiza botões horizontalmente
   - SizedBox cria espaço entre eles

---

# ✅ SOLUÇÃO 2: Validação e Limites

**Arquivo**: lib/solucoes/solucao_2_validacao.dart

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ContagemInterativaApp());
}

class ContagemInterativaApp extends StatelessWidget {
  const ContagemInterativaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador com Validação',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ContagemInterativaHome(),
    );
  }
}

class ContagemInterativaHome extends StatefulWidget {
  const ContagemInterativaHome({Key? key}) : super(key: key);

  @override
  State<ContagemInterativaHome> createState() => _ContagemInterativaHomeState();
}

class _ContagemInterativaHomeState extends State<ContagemInterativaHome> {
  int _contador = 0;
  final int _limiteMaximo = 100; // ← Define limite máximo
  final int _limiteMinimo = 0;   // ← Define limite mínimo
  String _mensagem = '';         // ← Mostra feedback ao usuário
  Color _corMensagem = Colors.black;

  // ← NOVO: Obtém cor baseado no valor
  Color _obterCorContador() {
    // Se entre 0-50: verde
    if (_contador >= 0 && _contador <= 50) {
      return Colors.green;
    }
    // Se entre 51-80: amarelo/laranja
    else if (_contador > 50 && _contador <= 80) {
      return Colors.orange;
    }
    // Se entre 81-100: vermelho
    else {
      return Colors.red;
    }
  }

  // ← NOVO: Verifica se pode incrementar
  bool _podeBotaoIncrementar() {
    return _contador < _limiteMaximo;
  }

  // ← NOVO: Verifica se pode decrementar
  bool _podeBotaoDecrementar() {
    return _contador > _limiteMinimo;
  }

  void _incrementarComValidacao() {
    setState(() {
      // Validação: só incrementa se menor que máximo
      if (_contador < _limiteMaximo) {
        _contador++;
        _mensagem = '✅ Incrementado!';
        _corMensagem = Colors.green;
      } else {
        // Se atingiu máximo, mostra mensagem
        _mensagem = '⚠️ Máximo atingido! ($_limiteMaximo)';
        _corMensagem = Colors.red;
      }
    });

    // ← Limpa mensagem após 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _mensagem = '';
      });
    });
  }

  void _decrementarComValidacao() {
    setState(() {
      // Validação: só decrementa se maior que mínimo
      if (_contador > _limiteMinimo) {
        _contador--;
        _mensagem = '✅ Decrementado!';
        _corMensagem = Colors.green;
      } else {
        // Se atingiu mínimo, mostra mensagem
        _mensagem = '⚠️ Não pode ir para negativo!';
        _corMensagem = Colors.red;
      }
    });

    // ← Limpa mensagem após 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _mensagem = '';
      });
    });
  }

  void _resetarComValidacao() {
    setState(() {
      _contador = 0;
      _mensagem = '🔄 Resetado para 0!';
      _corMensagem = Colors.blue;
    });

    // ← Limpa mensagem após 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _mensagem = '';
      });
    });
  }

  String _obterPercentual() {
    // Calcula percentual (0-100 = 0%-100%)
    int percentual = ((_contador / _limiteMaximo) * 100).toInt();
    return '$percentual%';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Contador com Validação',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contador com Limites',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            // ← Mostra valor com cor dinâmica
            Text(
              '$_contador',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: _obterCorContador(), // ← Cor muda com valor!
              ),
            ),
            Text(
              'Limites: $_limiteMinimo - $_limiteMaximo',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            // ← Mostra barra de progresso
            SizedBox(
              width: 250,
              child: LinearProgressIndicator(
                value: _contador / _limiteMaximo, // ← 0.0 a 1.0
                minHeight: 10,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  _obterCorContador(),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(_obterPercentual(), style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 30),
            // ← Mostra mensagem de feedback
            if (_mensagem.isNotEmpty) // ← So mostra se não vazio
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _corMensagem.withOpacity(0.2),
                  border: Border.all(color: _corMensagem),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _mensagem,
                  style: TextStyle(
                    fontSize: 16,
                    color: _corMensagem,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ← Botão decrementar DESABILITA se em limite mínimo
                ElevatedButton(
                  onPressed:
                      _podeBotaoDecrementar() ? _decrementarComValidacao : null,
                  // null = desabilita botão
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    backgroundColor:
                        _podeBotaoDecrementar() ? Colors.red : Colors.grey,
                  ),
                  child: const Text(
                    '-1',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                // ← Botão incrementar DESABILITA se em limite máximo
                ElevatedButton(
                  onPressed:
                      _podeBotaoIncrementar() ? _incrementarComValidacao : null,
                  // null = desabilita botão
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    backgroundColor:
                        _podeBotaoIncrementar() ? Colors.green : Colors.grey,
                  ),
                  child: const Text(
                    '+1',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _resetarComValidacao,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                backgroundColor: Colors.orange,
              ),
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const Text(
                'Resetar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 📝 Explicação das Mudanças

1. **_limiteMaximo e _limiteMinimo**
   - Variáveis constantes que definem os limites
   - Fácil de mudar em um lugar

2. **_obterCorContador()**
   - Função que retorna cor baseado no valor
   - 0-50: verde, 51-80: laranja, 81-100: vermelho

3. **_podeBotaoIncrementar() e _podeBotaoDecrementar()**
   - Verifica se operação é permitida
   - Usada para desabilitar botões

4. **onPressed: _podeBotaoIncrementar() ? função : null**
   - Operador ternário
   - Se true: executa função
   - Se false: null (desabilita botão)

5. **Future.delayed()**
   - Aguarda 2 segundos
   - Depois limpa mensagem

6. **LinearProgressIndicator(value: _contador / _limiteMaximo)**
   - Barra de progresso visual
   - Value entre 0.0 e 1.0

---

# ✅ SOLUÇÃO 3: Persistência com SharedPreferences

**Arquivo**: lib/solucoes/solucao_3_persistencia.dart

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ContagemInterativaApp());
}

class ContagemInterativaApp extends StatelessWidget {
  const ContagemInterativaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador com Persistência',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ContagemInterativaHome(),
    );
  }
}

class ContagemInterativaHome extends StatefulWidget {
  const ContagemInterativaHome({Key? key}) : super(key: key);

  @override
  State<ContagemInterativaHome> createState() => _ContagemInterativaHomeState();
}

class _ContagemInterativaHomeState extends State<ContagemInterativaHome> {
  int _contador = 0;
  DateTime _ultimaAtualizacao = DateTime.now();
  int _totalIncrementos = 0;      // ← Rastreia quantas vezes incrementou
  int _totalDecrementos = 0;      // ← Rastreia quantas vezes decrementou
  bool _jaSincronizou = false;    // ← Indica se carregou dados
  int _maiorValor = 0;            // ← Rastreia maior valor atingido

  @override
  void initState() {
    super.initState();
    // ← IMPORTANTE: Carregar dados quando app inicia
    _carregarTodosOsDados();
  }

  // ← NOVO: Carrega TODOS os dados do SharedPreferences
  Future<void> _carregarTodosOsDados() async {
    try {
      // 1. Obter instância do SharedPreferences
      final prefs = await SharedPreferences.getInstance();

      // 2. Carregar cada valor (com valor padrão se não existir)
      setState(() {
        _contador = prefs.getInt('contador') ?? 0;
        // ?? significa: se for null, usar valor após ??

        _totalIncrementos = prefs.getInt('total_incrementos') ?? 0;
        _totalDecrementos = prefs.getInt('total_decrementos') ?? 0;
        _maiorValor = prefs.getInt('maior_valor') ?? 0;

        // ← Carregar timestamp (em milissegundos)
        int timestamp = prefs.getInt('ultima_atualizacao') ?? 0;
        if (timestamp == 0) {
          _ultimaAtualizacao = DateTime.now();
        } else {
          _ultimaAtualizacao =
              DateTime.fromMillisecondsSinceEpoch(timestamp);
        }

        _jaSincronizou = true; // ← Marca como sincronizado
      });

      print('✅ Dados carregados: contador=$_contador');
    } catch (e) {
      print('❌ Erro ao carregar dados: $e');
      _jaSincronizou = true; // Mesmo com erro, marca como tentado
    }
  }

  // ← NOVO: Salva TODOS os dados no SharedPreferences
  Future<void> _salvarTodosOsDados() async {
    try {
      // 1. Obter instância
      final prefs = await SharedPreferences.getInstance();

      // 2. Salvar cada valor
      await prefs.setInt('contador', _contador);
      await prefs.setInt('total_incrementos', _totalIncrementos);
      await prefs.setInt('total_decrementos', _totalDecrementos);
      await prefs.setInt('maior_valor', _maiorValor);
      // ← Salvar timestamp em milissegundos (int suporta)
      await prefs.setInt('ultima_atualizacao',
          _ultimaAtualizacao.millisecondsSinceEpoch);

      print('✅ Dados salvos: contador=$_contador');
    } catch (e) {
      print('❌ Erro ao salvar dados: $e');
    }
  }

  void _incrementarEPersistir() {
    setState(() {
      _contador++;
      _totalIncrementos++;

      // ← Atualizar maior valor
      if (_contador > _maiorValor) {
        _maiorValor = _contador;
      }

      _ultimaAtualizacao = DateTime.now();
    });

    // ← Salvar após atualizar estado
    _salvarTodosOsDados();
  }

  void _decrementarEPersistir() {
    setState(() {
      if (_contador > 0) {
        _contador--;
        _totalDecrementos++;
        _ultimaAtualizacao = DateTime.now();
      }
    });

    // ← Salvar após atualizar estado
    _salvarTodosOsDados();
  }

  void _resetarEPersistir() {
    setState(() {
      _contador = 0;
      _totalIncrementos = 0;
      _totalDecrementos = 0;
      _maiorValor = 0;
      _ultimaAtualizacao = DateTime.now();
    });

    // ← Salvar após resetar
    _salvarTodosOsDados();
  }

  // ← NOVO: Formata DateTime para string legível
  String _formatarData(DateTime data) {
    return '${data.day}/${data.month}/${data.year} ${data.hour}:${data.minute}:${data.second}';
  }

  // ← NOVO: Gera estatísticas
  String _gerarRelatorio() {
    return '''
════════════════════════════════════
📊 RELATÓRIO DO CONTADOR
════════════════════════════════════
Valor Atual: $_contador

📈 Estatísticas:
  • Total de Incrementos: $_totalIncrementos
  • Total de Decrementos: $_totalDecrementos
  • Maior Valor Atingido: $_maiorValor
  
🕐 Última Atualização:
  ${_formatarData(_ultimaAtualizacao)}

💾 Status: ${_jaSincronizou ? '✅ Sincronizado' : '⏳ Sincronizando...'}
════════════════════════════════════
    ''';
  }

  // ← NOVO: Mostra relatório em um Dialog
  void _mostrarRelatorio() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('📊 Relatório'),
        content: SingleChildScrollView(
          child: Text(
            _gerarRelatorio(),
            style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Contador Persistente',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // ← Mostrar status de sincronização
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                _jaSincronizou ? '✅' : '⏳',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contador Persistente',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Text(
              '$_contador',
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            // ← Mostrar data/hora da última atualização
            Text(
              'Última atualização: ${_formatarData(_ultimaAtualizacao)}',
              style:
                  const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementarEPersistir,
                  child: const Text('-1'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _incrementarEPersistir,
                  child: const Text('+1'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _resetarEPersistir,
              icon: const Icon(Icons.refresh),
              label: const Text('Resetar'),
            ),
            const SizedBox(height: 40),
            // ← Botão para ver relatório
            ElevatedButton.icon(
              onPressed: _mostrarRelatorio,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              icon: const Icon(Icons.assessment),
              label: const Text(
                'Ver Relatório',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 📝 Explicação das Mudanças

1. **SharedPreferences.getInstance()**
   - Obtém acesso ao armazenamento local
   - É async (precisa await)

2. **initState() + _carregarTodosOsDados()**
   - Quando app inicia, carrega dados salvos
   - Sem isso dados seriam perdidos ao fechar app

3. **prefs.getInt('chave') ?? 0**
   - ?? = operador null coalescing
   - Se valor não existe, usa 0

4. **Future<void> e async**
   - Future = operação que demora
   - async = função que pode usar await
   - await = aguarda terminar

5. **try/catch para tratar erros**
   - Se falhar a leitura, não quebra app

6. **DateTime.fromMillisecondsSinceEpoch()**
   - SharedPreferences só salva int
   - Convertemos DateTime em int e volta

---

#  ✅ SOLUÇÃO 4: Animações

**Arquivo**: lib/solucoes/solucao_4_animacoes.dart

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ContagemInterativaApp());
}

class ContagemInterativaApp extends StatelessWidget {
  const ContagemInterativaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador com Animações',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ContagemInterativaHome(),
    );
  }
}

class ContagemInterativaHome extends StatefulWidget {
  const ContagemInterativaHome({Key? key}) : super(key: key);

  @override
  State<ContagemInterativaHome> createState() => _ContagemInterativaHomeState();
}

// ← IMPORTANTE: with TickerProviderStateMixin permite usar AnimationController
class _ContagemInterativaHomeState extends State<ContagemInterativaHome>
    with TickerProviderStateMixin {
  int _contador = 0;

  // ← NOVO: Controladores de animação
  late AnimationController _controladorScale;     // Para crescimento
  late AnimationController _controladorOpacity;   // Para piscar
  late AnimationController _controladorRotacao;   // Para girar

  // ← NOVO: Animações (derivadas dos controladores)
  late Animation<double> _animacaoScale;
  late Animation<double> _animacaoOpacity;
  late Animation<double> _animacaoRotacao;

  @override
  void initState() {
    super.initState();

    // ← ANIMAÇÃO 1: Scale (Crescimento)
    _controladorScale = AnimationController(
      duration: const Duration(milliseconds: 300),
      // ← 300ms = duração da animação
      vsync: this, // ← this = TickerProviderStateMixin
    );

    // Tween define: começa em 1.0, termina em 1.3
    _animacaoScale = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _controladorScale,
        curve: Curves.elasticOut, // ← Curva "elástica"
      ),
    );

    // ← ANIMAÇÃO 2: Opacity (Piscar)
    _controladorOpacity = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animacaoOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controladorOpacity,
        curve: Curves.easeInOut,
      ),
    );

    // ← ANIMAÇÃO 3: Rotação
    _controladorRotacao = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _animacaoRotacao = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controladorRotacao,
        curve: Curves.circInOut,
      ),
    );
  }

  void _incrementarComAnimacao() {
    // 1. Inicia animação scale (0.3s)
    _controladorScale.forward().then((_) {
      // then() = executar depois que terminar
      _controladorScale.reverse(); // Volta ao normal
    });

    // 2. Atualiza estado
    setState(() {
      _contador++;
    });
  }

  void _decrementarComAnimacao() {
    // Rotaciona 180 graus
    _controladorRotacao.forward().then((_) {
      _controladorRotacao.reverse();
    });

    setState(() {
      if (_contador > 0) _contador--;
    });
  }

  void _resetarComAnimacao() {
    // Pisca 3 vezes
    for (int i = 0; i < 3; i++) {
      Future.delayed(Duration(milliseconds: i * 300), () {
        // ← Executa após i*300ms
        if (mounted) {
          // mounted = widget ainda está na tela
          _controladorOpacity.forward().then((_) {
            _controladorOpacity.reverse();
          });
        }
      });
    }

    setState(() {
      _contador = 0;
    });
  }

  @override
  void dispose() {
    // ← IMPORTANTE: Liberar recursos
    _controladorScale.dispose();
    _controladorOpacity.dispose();
    _controladorRotacao.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Contador com Animações',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contador Animado',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 40),
            // ← ANIMAÇÃO 1: Scale (crescimento)
            ScaleTransition(
              scale: _animacaoScale,
              child: FadeTransition(
                opacity: _animacaoOpacity,
                child: RotationTransition(
                  turns: _animacaoRotacao,
                  child: Text(
                    '$_contador',
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementarComAnimacao,
                  child: const Text('-1'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _incrementarComAnimacao,
                  child: const Text('+1'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _resetarComAnimacao,
              icon: const Icon(Icons.refresh),
              label: const Text('Resetar'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 📝 Explicação das Mudanças

1. **with TickerProviderStateMixin**
   - Permite usar AnimationController
   - Necessário para sincronizar com frame rate

2. **AnimationController(duration: Duration, vsync: this)**
   - Controla a animação
   - vsync sincroniza com vsync do device

3. **Tween<double>(begin: 1.0, end: 1.3)**
   - Define valores inicias e finais
   - 1.0 = tamanho normal
   - 1.3 = 30% maior

4. **CurvedAnimation(curve: Curves.elasticOut)**
   - Define a curva da animação
   - elasticOut = "pulo" elástico
   - circInOut = movimento circular

5. **ScaleTransition, FadeTransition, RotationTransition**
   - Widgets que aplicam as animações
   - Scale = tamanho
   - Fade = opacidade (transparência)
   - Rotation = rotação

6. **dispose()**
   - OBRIGATÓRIO liberar AnimationControllers
   - Senão há vazamento de memória

---

# ✅ SOLUÇÃO 5: Histórico e Incrementos Dinâmicos

**Arquivo**: lib/solucoes/solucao_5_historico.dart

```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const ContagemInterativaApp());
}

class ContagemInterativaApp extends StatelessWidget {
  const ContagemInterativaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador com Histórico',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ContagemInterativaHome(),
    );
  }
}

// ← NOVO: Classe que representa uma operação
class Operacao {
  final DateTime hora;
  final int valor;        // +5, -10, etc
  final int resultante;   // Valor resultado
  final String tipo;      // "incremento" ou "decremento"

  Operacao({
    required this.hora,
    required this.valor,
    required this.resultante,
    required this.tipo,
  });

  // ← Formata como string legível
  @override
  String toString() {
    String symbol = tipo == 'incremento' ? '+' : '-';
    return '${_formatarHora(hora)} | $symbol${valor.abs()} → $resultante';
  }

  static String _formatarHora(DateTime data) {
    return DateFormat('HH:mm:ss').format(data);
  }
}

class ContagemInterativaHome extends StatefulWidget {
  const ContagemInterativaHome({Key? key}) : super(key: key);

  @override
  State<ContagemInterativaHome> createState() => _ContagemInterativaHomeState();
}

class _ContagemInterativaHomeState extends State<ContagemInterativaHome> {
  int _contador = 0;
  List<Operacao> _historico = [];      // ← Rastreia tudo
  int _totalIncrementos = 0;
  int _totalDecrementos = 0;
  int _maiorValor = 0;
  DateTime _dataMaiorValor = DateTime.now();
  DateTime _dataInicio = DateTime.now();

  // ← NOVO: Incrementa por valor dinâmico
  void _incrementarPor(int valor) {
    setState(() {
      _contador += valor;
      _totalIncrementos++;

      // ← Atualizar maior valor
      if (_contador > _maiorValor) {
        _maiorValor = _contador;
        _dataMaiorValor = DateTime.now();
      }

      // ← Adicionar ao histórico
      _historico.add(
        Operacao(
          hora: DateTime.now(),
          valor: valor,
          resultante: _contador,
          tipo: 'incremento',
        ),
      );
    });

    // ← Mostrar feedback
    _mostrarSnackBar('➕ +$valor (Total: $_contador)');
  }

  // ← NOVO: Decrementa por valor dinâmico
  void _decrementarPor(int valor) {
    setState(() {
      _contador -= valor;

      // Não permitir negativo
      if (_contador < 0) _contador = 0;

      _totalDecrementos++;

      // ← Adicionar ao histórico
      _historico.add(
        Operacao(
          hora: DateTime.now(),
          valor: valor,
          resultante: _contador,
          tipo: 'decremento',
        ),
      );
    });

    _mostrarSnackBar('➖ -$valor (Total: $_contador)');
  }

  // ← NOVO: Desfaz última operação
  void _desfazer() {
    if (_historico.isEmpty) {
      _mostrarSnackBar('⚠️ Sem histórico para desfazer!');
      return;
    }

    setState(() {
      Operacao ultimaOperacao = _historico.removeLast();

      // Volta para o valor anterior
      _contador = ultimaOperacao.resultante;

      // Se era a última, mostra mensagem
      if (_historico.isNotEmpty) {
        _contador = _historico.last.resultante;
      } else {
        _contador = 0;
      }
    });

    _mostrarSnackBar('↩️ Operação desfeita!');
  }

  // ← NOVO: Gera estatísticas
  Map<String, dynamic> _gerarEstatisticas() {
    Duration tempoAberto = DateTime.now().difference(_dataInicio);

    return {
      'contador': _contador,
      'maior_valor': _maiorValor,
      'data_maior': _dataMaiorValor,
      'total_ops': _historico.length,
      'total_incrementos': _totalIncrementos,
      'total_decrementos': _totalDecrementos,
      'tempo_aberto': '${tempoAberto.inMinutes}m ${tempoAberto.inSeconds % 60}s',
    };
  }

  // ← NOVO: Formata hora
  String _formatarHora(DateTime data) {
    return DateFormat('HH:mm:ss').format(data);
  }

  String _formatarData(DateTime data) {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(data);
  }

  // ← NOVO: Mostra mensagem com SnackBar
  void _mostrarSnackBar(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // ← NOVO: Mostra histórico
  void _mostrarHistorico() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('📋 Histórico'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            itemCount: _historico.length,
            itemBuilder: (context, index) {
              Operacao op = _historico[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  op.toString(),
                  style: const TextStyle(fontFamily: 'monospace'),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  // ← NOVO: Mostra relatório
  void _mostrarRelatorio() {
    Map<String, dynamic> stats = _gerarEstatisticas();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('📊 Relatório'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Valor Atual: ${stats['contador']}'),
              Text('Maior Valor: ${stats['maior_valor']}'),
              Text('Total de Operações: ${stats['total_ops']}'),
              Text('Incrementos: ${stats['total_incrementos']}'),
              Text('Decrementos: ${stats['total_decrementos']}'),
              Text('Tempo Aberto: ${stats['tempo_aberto']}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Contador com Histórico',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contador Avançado',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Text(
              '$_contador',
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${_historico.length} operações',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            // ← Botões com incrementos diferentes
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _botaoIncrementar(1, Colors.green),
                _botaoIncrementar(5, Colors.lightGreen),
                _botaoIncrementar(10, Colors.teal),
                _botaoIncrementar(50, Colors.cyan),
                _botaoDecrementar(1, Colors.red),
                _botaoDecrementar(5, Colors.pink),
                _botaoDecrementar(10, Colors.purple),
                _botaoDecrementar(50, Colors.indigo),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _desfazer,
                  icon: const Icon(Icons.undo),
                  label: const Text('Desfazer'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: _mostrarHistorico,
                  icon: const Icon(Icons.list),
                  label: const Text('Histórico'),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: _mostrarRelatorio,
                  icon: const Icon(Icons.assessment),
                  label: const Text('Relatório'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ← Helper: cria botão de incrementar
  Widget _botaoIncrementar(int valor, Color cor) {
    return ElevatedButton(
      onPressed: () => _incrementarPor(valor),
      style: ElevatedButton.styleFrom(backgroundColor: cor),
      child: Text(
        '+$valor',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  // ← Helper: cria botão de decrementar
  Widget _botaoDecrementar(int valor, Color cor) {
    return ElevatedButton(
      onPressed: () => _decrementarPor(valor),
      style: ElevatedButton.styleFrom(backgroundColor: cor),
      child: Text(
        '-$valor',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
```

### 📝 Explicação das Mudanças

1. **Classe Operacao**
   - Encapsula: hora, valor, resultante, tipo
   - toString() para exibição legível

2. **List<Operacao> _historico**
   - Mantém todas as operações
   - Permite undo/redo

3. **_incrementarPor(int valor)**
   - Função parametrizada
   - Reutilizável para +1, +5, +10, etc

4. **_desfazer()**
   - Remove última operação da lista
   - Volta ao valor anterior

5. **DateFormat('HH:mm:ss')**
   - Formata DateTime
   - Requer: import 'package:intl/intl.dart'

6. **Wrap widget**
   - Layout que quebra linha automaticamente
   - Melhor para múltiplos botões

7. **ScaffoldMessenger.showSnackBar()**
   - Mostra mensagem tipo toast
   - Flutuante e desaparece

---

# 📊 Resumo das 5 Soluções

| Solução | Arquivo | Tópicos |  Tamanho |
|---------|---------|---------|----------|
| 1 | solucao_1_tema.dart | Theme, Colors, TextStyle | ~120 linhas |
| 2 | solucao_2_validacao.dart | if/else, Ternário, UX | ~190 linhas |
| 3 | solucao_3_persistencia.dart | SharedPreferences, async/await | ~250 linhas |
| 4 | solucao_4_animacoes.dart | AnimationController, Tween | ~200 linhas |
| 5 | solucao_5_historico.dart | List, Classes, Wrap | ~350 linhas |

**TOTAL**: ~1.100 linhas de código exemplo + comentários

---

# 🎯 Como Usar Este Arquivo

## Para Professores
1. Use como "gabarito" para verificar se aluno fez correto
2. Mostre em aula para exemplificar
3. Deixe aluno analisar diferenças

## Para Alunos
1. Se travou, compare com a solução
2. Veja os comentários para aprender
3. Tente reproduzir antes de copiar

## Para Pré-aula
1. Prepare suas aulas estudando estas soluções
2. Teste cada uma localmente
3. Prepare anotações de pontos principais

---

**Última atualização**: Maio 2026  
**Status**: ✅ Soluções Prontas  
**Versão**: 1.0

