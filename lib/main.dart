import 'package:flutter/material.dart';

/// Função main: Ponto de entrada do aplicativo Flutter
/// runApp() inicia a execução do aplicativo com o widget raiz
void main() {
  runApp(const ContagemInterativaApp());
}

/// ContagemInterativaApp - StatelessWidget
/// 
/// Esta é a classe raiz do aplicativo. Utilizamos StatelessWidget porque
/// suas propriedades não mudam após o widget ser construído.
/// 
/// Diferença entre StatelessWidget e StatefulWidget:
/// - StatelessWidget: Imutável, não muda após construção
/// - StatefulWidget: Pode mudar seu estado durante a execução
class ContagemInterativaApp extends StatelessWidget {
  const ContagemInterativaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador Interativo',
      theme: ThemeData(
        // Tema moderno com cor primária azul
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ContagemInterativaHome(
        titulo: 'Contador Interativo',
        nomeContador: 'Pontos',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// ContagemInterativaHome - StatefulWidget
/// 
/// Este widget é stateful (com estado) porque o valor do contador
/// muda quando o usuário interage com os botões.
/// 
/// Um StatefulWidget requer uma classe State correspondente (_ContagemInterativaHomeState)
/// onde o estado real é mantido e gerenciado.
class ContagemInterativaHome extends StatefulWidget {
  // Propriedades finais (imutáveis) do widget
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

/// _ContagemInterativaHomeState - Classe que gerencia o estado
/// 
/// Esta classe herda de State<ContagemInterativaHome> e é responsável
/// por manter e atualizar o estado do widget.
/// 
/// O underscore (_) no início do nome indica que é uma classe privada.
class _ContagemInterativaHomeState extends State<ContagemInterativaHome> {
  // Variável de estado: armazena o valor atual do contador
  // Inicializa em 0
  int _contador = 0;

  /// Método para incrementar o contador
  /// 
  /// setState() notifica o Flutter que o estado mudou e que o widget
  /// precisa ser reconstruído com os novos valores.
  void _incrementarContador() {
    setState(() {
      _contador++;
    });
  }

  /// Método para decrementar o contador
  void _decrementarContador() {
    setState(() {
      _contador--;
    });
  }

  /// Método para resetar o contador
  void _resetarContador() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: Barra de título no topo do aplicativo
      appBar: AppBar(
        title: Text(widget.titulo),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),

      // Body: Corpo principal do aplicativo
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ========== CABEÇALHO ==========
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.nomeContador,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),

              // ========== CONTADOR PRINCIPAL ==========
              // Exibe o número do contador em grande destaque
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    '$_contador',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // ========== DESCRIÇÃO ==========
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Use os botões abaixo para incrementar, decrementar ou resetar o ${widget.nomeContador.toLowerCase()}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              const SizedBox(height: 40),

              // ========== BOTÕES DE AÇÃO ==========
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Botão Decrementar (-1)
                    ElevatedButton.icon(
                      onPressed: _decrementarContador,
                      icon: const Icon(Icons.remove, size: 24),
                      label: const Text('-1'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),

                    // Botão Incrementar (+1)
                    ElevatedButton.icon(
                      onPressed: _incrementarContador,
                      icon: const Icon(Icons.add, size: 24),
                      label: const Text('+1'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Botão Resetar (0)
              ElevatedButton.icon(
                onPressed: _resetarContador,
                icon: const Icon(Icons.refresh, size: 24),
                label: const Text('Resetar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // ========== INFORMAÇÃO EDUCACIONAL ==========
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        'Conceitos Demonstrados:',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '• StatefulWidget para gerenciar estado\n'
                        '• setState() para atualizar a interface\n'
                        '• Layouts com Center, Column e Row\n'
                        '• Widgets: Text, ElevatedButton, Container\n'
                        '• Hot Reload para teste em tempo real',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
