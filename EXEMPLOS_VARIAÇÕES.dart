/// EXEMPLOS DE VARIAÇÕES PARA O CONTADOR INTERATIVO
/// 
/// Este arquivo contém exemplos de diferentes formas de usar o Contador Interativo
/// para diferentes contextos educacionais.

// ============================================================================
// EXEMPLO 1: Contador de Presença em Sala de Aula
// ============================================================================

/*
import 'package:flutter/material.dart';

void main() {
  runApp(const ContagemInterativaApp());
}

class ContagemInterativaApp extends StatelessWidget {
  const ContagemInterativaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presença em Sala',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ContagemInterativaHome(
        titulo: 'Presença em Sala',
        nomeContador: 'Alunos Presentes',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
*/

// ============================================================================
// EXEMPLO 2: Contador de Tarefas Concluídas
// ============================================================================

/*
import 'package:flutter/material.dart';

void main() {
  runApp(const ContagemInterativaApp());
}

class ContagemInterativaApp extends StatelessWidget {
  const ContagemInterativaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefas Realizadas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const ContagemInterativaHome(
        titulo: 'Tarefas Realizadas',
        nomeContador: 'Tarefas Concluídas',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
*/

// ============================================================================
// EXEMPLO 3: Contador com Limite Máximo
// ============================================================================

/*
import 'package:flutter/material.dart';

void main() {
  runApp(const ContagemInterativaApp());
}

class ContagemInterativaApp extends StatelessWidget {
  const ContagemInterativaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador com Limite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const ContagemInterativaHome(
        titulo: 'Contador com Limite',
        nomeContador: 'Pontos',
        limiteMaximo: 100,  // Adicione este parâmetro
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Modifique a classe ContagemInterativaHome:
class ContagemInterativaHome extends StatefulWidget {
  final String titulo;
  final String nomeContador;
  final int? limiteMaximo;  // Adicione este parâmetro

  const ContagemInterativaHome({
    super.key,
    required this.titulo,
    required this.nomeContador,
    this.limiteMaximo,
  });

  @override
  State<ContagemInterativaHome> createState() => _ContagemInterativaHomeState();
}

class _ContagemInterativaHomeState extends State<ContagemInterativaHome> {
  int _contador = 0;

  void _incrementarContador() {
    setState(() {
      // Verifica se atingiu o limite
      if (widget.limiteMaximo == null || _contador < widget.limiteMaximo!) {
        _contador++;
      }
    });
  }

  void _decrementarContador() {
    setState(() {
      if (_contador > 0) {
        _contador--;
      }
    });
  }

  void _resetarContador() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calcular percentual se houver limite
    String percentual = '';
    if (widget.limiteMaximo != null) {
      double perc = (_contador / widget.limiteMaximo!) * 100;
      percentual = ' (${perc.toStringAsFixed(0)}%)';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.nomeContador),
            Text(
              '$_contador$percentual',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 30),
            // Barra de progresso (se houver limite)
            if (widget.limiteMaximo != null)
              SizedBox(
                width: 250,
                child: LinearProgressIndicator(
                  value: _contador / widget.limiteMaximo!,
                  minHeight: 10,
                ),
              ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _decrementarContador, child: Text('-')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: _incrementarContador, child: Text('+')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: _resetarContador, child: Text('Reset')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

// ============================================================================
// EXEMPLO 4: Contador com Histórico de Mudanças
// ============================================================================

/*
import 'package:flutter/material.dart';

void main() {
  runApp(const ContagemInterativaApp());
}

class ContagemInterativaApp extends StatelessWidget {
  const ContagemInterativaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador com Histórico',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ContagemInterativaHome(
        titulo: 'Contador com Histórico',
        nomeContador: 'Eventos',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContagemInterativaHome extends StatefulWidget {
  final String titulo;
  final String nomeContador;

  const ContagemInterativaHome({
    super.key,
    required this.titulo,
    required this.nomeContador,
  });

  @override
  State<ContagemInterativaHome> createState() => _ContagemInterativaHomeState();
}

class _ContagemInterativaHomeState extends State<ContagemInterativaHome> {
  int _contador = 0;
  List<String> historico = [];  // Lista para armazenar histórico

  void _incrementarContador() {
    setState(() {
      _contador++;
      historico.add('+ 1 at ${DateTime.now().toString().split('.')[0]}');
    });
  }

  void _decrementarContador() {
    setState(() {
      _contador--;
      historico.add('- 1 at ${DateTime.now().toString().split('.')[0]}');
    });
  }

  void _resetarContador() {
    setState(() {
      _contador = 0;
      historico.add('Reset at ${DateTime.now().toString().split('.')[0]}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '$_contador',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          // Seção de histórico
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Histórico:',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: historico.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(historico[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Botões
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _decrementarContador, child: Text('- 1')),
                ElevatedButton(
                    onPressed: _incrementarContador, child: Text('+ 1')),
                ElevatedButton(onPressed: _resetarContador, child: Text('Reset')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/

// ============================================================================
// EXEMPLO 5: Contador com Som (usando just_audio)
// ============================================================================

/*
// Adicione ao pubspec.yaml:
// dependencies:
//   just_audio: ^0.9.0

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

// ... resto do código ...

class _ContagemInterativaHomeState extends State<ContagemInterativaHome> {
  int _contador = 0;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _incrementarContador() async {
    await _audioPlayer.play(AssetSource('sounds/pong.wav'));
    setState(() {
      _contador++;
    });
  }

  // ... resto do código ...
}
*/

// ============================================================================
// DICAS DE IMPLEMENTAÇÃO
// ============================================================================

/*
1. MODIFICAR CORES:
   ColorScheme.fromSeed(seedColor: Colors.blueAccent)
   
   Opções: Colors.red, Colors.green, Colors.purple, Colors.orange, etc.

2. MODIFICAR TAMANHO DO TEXTO:
   Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 80)

3. MODIFICAR ESPAÇAMENTO:
   SizedBox(height: 50) - Aumentar altura
   Padding(padding: const EdgeInsets.all(20.0)) - Aumentar espaçamento interno

4. MODIFICAR FORMA DOS BOTÕES:
   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))

5. ADICIONAR IMAGENS:
   Image.asset('assets/image.png')

6. USAR CONDITIONAL RENDERING:
   if (condition) Widget() else AnotherWidget()

7. USAR LISTA DE WIDGETS:
   ...listaDeWidgets  // Spread operator para adicionar múltiplos widgets

8. USAR CONSTANTES:
   const double buttonHeight = 50;
   const double padding = 20;
*/

