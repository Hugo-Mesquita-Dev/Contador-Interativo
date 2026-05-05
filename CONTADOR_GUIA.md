# 🎯 Contador Interativo - Guia Educacional

Um aplicativo Flutter educacional que demonstra conceitos fundamentais como **StatefulWidget**, gerenciamento de estado com **setState()** e construção de interfaces visuais.

## 📲 Recursos

✅ **Número central** - Exibido em grande destaque (iniciando em 0)
✅ **Botão Incrementar** - Aumenta o valor em +1 (botão verde)
✅ **Botão Decrementar** - Diminui o valor em -1 (botão vermelho)
✅ **Botão Resetar** - Retorna o valor a 0 (botão laranja)
✅ **Personalizável** - Nome do contador customizável
✅ **Design Moderno** - Interface limpa e intuitiva
✅ **Hot Reload** - Teste mudanças em tempo real
✅ **Bem Comentado** - Explicações detalhadas no código

## 🚀 Como Executar

### Pré-requisitos
- Flutter instalado ([Download](https://flutter.dev/docs/get-started/install))
- Um emulador ou dispositivo físico

### Passos
1. Navegue até a pasta do projeto:
   ```bash
   cd "C:\Users\Hugo\MOnitoria\Contador Interativo"
   ```

2. Execute o aplicativo:
   ```bash
   flutter run
   ```

3. Para usar **Hot Reload**:
   - Salve as alterações no VS Code
   - Pressione `r` no terminal para recarregar em tempo real
   - Pressione `R` para reiniciar completamente

## 📚 Conceitos Educacionais Demonstrados

### 1. **StatelessWidget vs StatefulWidget**

#### StatelessWidget (Na classe `ContagemInterativaApp`)
```dart
class ContagemInterativaApp extends StatelessWidget {
  // Imutável - não muda após construção
  // Propriedades não alteram durante a execução
}
```
- **Quando usar**: Para interfaces estáticas que não mudam
- **Características**: Imutável, simples, sem estado

#### StatefulWidget (Na classe `ContagemInterativaHome`)
```dart
class ContagemInterativaHome extends StatefulWidget {
  // Pode mudar seu estado durante a execução
  // Requer uma classe State correspondente
}
```
- **Quando usar**: Para widgets que precisam alterar seu conteúdo
- **Características**: Dinâmico, com estado gerenciado

### 2. **Gerenciamento de Estado com setState()**

```dart
void _incrementarContador() {
  setState(() {
    _contador++;
  });
}
```

O que acontece:
1. `setState()` é chamado
2. O Flutter é notificado que algo mudou
3. O método `build()` é reconstruído
4. A UI atualiza com os novos valores

### 3. **Widgets Utilizados**

| Widget | Uso |
|--------|-----|
| `MaterialApp` | Raiz do app com tema Material Design |
| `Scaffold` | Estrutura básica com AppBar e body |
| `AppBar` | Barra de título no topo |
| `Center` | Centraliza o conteúdo na tela |
| `Column` | Organiza widgets verticalmente |
| `Row` | Organiza widgets horizontalmente |
| `Text` | Exibe texto |
| `ElevatedButton` | Botão com elevação (sombra) |
| `Container` | Widget para decoração e layout |
| `SingleChildScrollView` | Permite scroll se conteúdo sair da tela |

### 4. **Estrutura de Projeto**

```
lib/
└── main.dart          # Código principal do aplicativo
    ├── main()         # Função de entrada
    ├── ContagemInterativaApp (StatelessWidget)
    ├── ContagemInterativaHome (StatefulWidget)
    └── _ContagemInterativaHomeState (State)
```

## 🎨 Personalizações Sugeridas

### Mudar o Nome do Contador
Edite a linha na função `main()`:
```dart
home: const ContagemInterativaHome(
  titulo: 'Contador Interativo',
  nomeContador: 'Pontos',  // ← Mude aqui!
),
```

### Mudar Cores
Procure por `Colors.blueAccent` no código e substitua por:
- `Colors.red`
- `Colors.green`
- `Colors.purple`
- E mais!

### Adicionar Som ao Clicar
1. Adicione ao `pubspec.yaml`:
   ```yaml
   dependencies:
     just_audio: ^0.9.0
   ```

2. Implemente em cada método:
   ```dart
   void _incrementarContador() {
     // Reproduzir som aqui
     setState(() {
       _contador++;
     });
   }
   ```

## 🔧 Estrutura do Código

### Arquivo: `lib/main.dart`

1. **Imports**: Import do Material Design do Flutter
2. **Função main()**: Ponto de entrada do app
3. **ContagemInterativaApp**: Classe raiz (StatelessWidget)
   - Configura o tema e cores
   - Define o widget home
4. **ContagemInterativaHome**: Widget principal (StatefulWidget)
   - Define propriedades: título, nome do contador
5. **_ContagemInterativaHomeState**: Classe que gerencia estado
   - Variável `_contador`: armazena o valor
   - Métodos de ação: incrementar, decrementar, resetar
   - Método `build()`: constrói a interface

## 📖 Desafios de Aprendizado

1. **Fácil**: Mude as cores do aplicativo
2. **Médio**: Adicione um limite máximo/mínimo para o contador
3. **Médio**: Exiba o contador como porcentagem (0-100%)
4. **Difícil**: Salve o valor do contador usando `SharedPreferences`
5. **Difícil**: Adicione animações quando o contador muda

## 💡 Dicas Flutter

- **Hot Reload**: Pressione `r` para recarregar sem perder estado
- **Hot Restart**: Pressione `R` para reiniciar completamente
- **Debug Mode**: Use `print()` ou `debugPrint()` para debug
- **Flutter DevTools**: Execute `flutter pub global activate devtools` e depois `devtools`

## 📝 Licença

Este projeto é um exemplo educacional e pode ser usado livremente.

## 🤝 Contribuições

Sinta-se livre para modificar e expandir este projeto!

---

**Desenvolvido para fins educacionais em Flutter** 🎓

