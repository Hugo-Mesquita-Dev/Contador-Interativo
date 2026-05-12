# 🎓 Guia Prático: Como Usar Prompts em Aula

## 📌 O Que Você Tem

1. **PROMPTS_PARA_AULA.md** - 5 prompts prontos
2. **SOLUCOES_PROMPTS.md** - Gabaritos das soluções
3. **Este arquivo** - Como usar tudo em prática

---

# 🎯 Cenário 1: Aula ao Vivo (Recomendado)

**Duração**: 2-3 horas  
**Formato**: Expositivo + Prático

### Antes da Aula (30 min)

1. Leia o PROMPT do tópico
2. Abra SOLUCOES_PROMPTS e estude o código
3. Execute localmente uma vez para ver funcionando
4. Prepare seus slides/anotações

### Durante a Aula (90-120 min)

**Tempo: 0-10 min**
- Apresente o tópico
- Mostre resultado final no emulador

**Tempo: 10-30 min**
- Explique teória (comentários do código)
- Mostre cada parte do código
- Faça perguntas aos alunos

**Tempo: 30-60 min**
- Abra IA (ChatGPT, Copilot, Gemini)
- Cole o PROMPT completo
- Execute junto com alunos
- Pause para explicações

**Tempo: 60-90 min**
- Alunos tentam implementar
- Você circula ajudando
- Mostre SOLUCOES quando necessário

**Tempo: 90-120 min**
- Discussão em grupo
- Dúvidas
- Exercício para casa

---

# 📱 Cenário 2: Aula Pré-Gravada

**Duração**: 30-40 min de vídeo  
**Formato**: Gravado e assíncrono

### Roteiro de Gravação

```
[00:00] Introdução ao tópico (2 min)
        "Hoje vamos aprender sobre..."

[02:00] Teoria (5 min)
        Explicar conceitos
        Mostrar código com comentários

[07:00] Executar IA (15 min)
        Colar prompt
        Executar resultado
        Pausar para explicações
        Mostrar teste no emulador

[22:00] Análise de Código (10 min)
        Linha por linha
        Por que cada parte existe
        Que problemas resolveria

[32:00] Exercício (3 min)
        Aqui está o desafio
        Tente em casa
        Próxima aula revemos

[35:00] Recap e CTA (2 min)
        Resumir
        Mostrar SOLUCOES_PROMPTS
        Próxima aula...
```

### Dicas de Gravação

- Use resolução mínima 720p
- Zoom na tela (120% ou 150%)
- Deixe código bem visível
- Fale pausadamente
- Gravar pedaço por pedaço (editar depois)

---

# 👥 Cenário 3: Workshop Presencial

**Duração**: 4-6 horas  
**Formato**: Intensivo, hands-on

### Estrutura

```
Horário         Atividade                    Prompt
─────────────────────────────────────────────────────
08:00-08:30     Boas-vindas + Setup         -
08:30-09:30     Prompt 1: Tema              ✅
09:30-10:00     Pausa
10:00-11:00     Prompt 2: Validação         ✅
11:00-12:00     Desafio: Misturar P1 + P2   🆓
12:00-13:00     Almoço
13:00-14:00     Prompt 3: Persistência      ✅
14:00-14:30     Pausa
14:30-15:30     Prompt 4: Animações         ✅
15:30-16:30     Prompt 5: Histórico         ✅
16:30-17:00     Desafio Final: Integrar Tudo 🆓
17:00-17:30     Encerramento + Dúvidas      -
```

---

# 🎬 Passo-a-Passo: Usar Um Prompt em Tempo Real

## X. Prepare (Antes)

```
1. Copie o PROMPT_N do arquivo PROMPTS_PARA_AULA.md
   └─ Ctrl+A, Ctrl+C

2. Abra ferramenta IA (ChatGPT, Copilot, etc)

3. Estude SOLUCOES_PROMPTS para saber o que esperar
```

## Y. Mostre em Aula

```
1. Projete a tela no projetor

2. Cole o PROMPT na IA
   └─ Moste aos alunos enquanto cola

3. Envie (clique em "Enviar")

4. Deixe poucos segundos processarenswer

5. Leia a resposta DA IA junto com alunos
   └─ "Vejam que a IA colocou comentários aqui..."
   └─ "Isso significa..."

6. Copie o código que a IA gerou

7. Crie novo arquivo em seu projeto
   └─ lib/solucoes/solucao_X_topico.dart

8. Cole o código

9. Execute (flutter run)
   └─ Se tiver erro, corrija junto

10. Depois mostre SOLUCOES_PROMPTS para comparar
    └─ "Vejam que nossa é bem parecida"
    └─ "Poderia ser assim também..."
```

---

# 💡 Example: Aula 1 (Prompt 1 - Tema)

### Antes da Aula (em casa):

```
1. Leia PROMPTS_PARA_AULA.md, seção PROMPT 1

2. Abra SOLUCOES_PROMPTS.md e veja solucao_1_tema.dart

3. Estude:
   - Por que usa copyWith()
   - Qual a função do seedColor
   - Como mudar cores Material Design

4. Testes locais:
   - Execute solução 1
   - Mude para Colors.pink (veja mudanças)
   - Hot reload (pressione 'r')
```

### Durante a Aula (ao vivo):

```
[00:00] "Oi turma! Hoje vamos aprender personalização"
        Mostrar app original no emulador

[02:00] Copiar PROMPT 1
        Colar em ChatGPT/Copilot

[05:00] Mostrar resultado da IA
        "Vejam que a IA comentou cada linha aqui"

[08:00] Copiar código da IA
        Colar em novo arquivo (solucao_1_tema.dart)
        Executar (flutter run)
        Hot reload se necessário

[15:00] Comparar com SOLUCOES_PROMPTS
        "Nossa solução ficou parecida?"
        "Qual é a diferença?"

[20:00] Exercício para casa:
        "Você consegue mudar para Colors.purple?"
        "E aumentar texto para 120px?"
        "Traga resultado próxima aula"
```

---

# 🎁 Modelos de Planos de Aula

## Plano 1: Simples (1 hora)

```
[00:00-10] Apresentação + teória
[10-40] Usar IA com PROMPT
[40-50] Alunos fazem exercício
[50-60] Recap + dúvidas
```

## Plano 2: Completo (2-3 horas)

```
[00:00-15] Apresentação teórica detalhada
[15-30] Código base sem IA (você explica)
[30-60] IA + exercício guiado
[60-75] Pausa
[75-105] Alunos codificam independente
[105-120] Code review + dúvidas
[120-150] Extensão/Extra desafio / Recap
```

## Plano 3: Imersivo (4-6 horas)

```
[00:00-30] Boas-vindas + Setup
[30-90] Prompt 1 (teória + IA + exercício)
[90-120] Prompt 2 (paralelo)
[120-180] Pausa + Almoço
[180-240] Prompts 3 + 4 (ritmado)
[240-300] Prompt 5 ou Desafio integrado
[300-330] Code review + Encerramento
```

---

# 🛠️ Troubleshooting: Se der erro...

### Erro 1: "IA gerou código com erro"

```
Solução 1:
- Copie SOLUCOES_PROMPTS.md
- Use como referência
- Corrija junto com alunos

Solução 2:
- Explique o erro
- Educacional: "Até IA erra"
- Mostre como debugar

Solução 3:
- Crie novo PROMPT com "corrija este erro"
- Veja resposta da IA
- Discuta a correção
```

### Erro 2: "Hot reload não funcionou"

```
Solução:
- Hot Restart (Ctrl+Shift+i maior em emulador)
ou
- Feche app e execute flutter run novamente
```

### Erro 3: "Alunos não entenderam a IA"

```
Solução 1:
- Leia resultado vagarosamente
- Explique cada linha
- Comparar com SOLUCOES_PROMPTS

Solução 2:
- Mostre diferenças entre:
  ✅ O que IA fez
  ✅ O que você faria
  ✅ A solução em SOLUCOES_PROMPTS

Solução 3:
- Use exercício mais simples
- Volta ao básico
- Avança depois
```

---

# 📊 Avaliação: Como Saber se Funcionou?

### Indicadores de Êxito

✅ Alunos conseguem rodar código  
✅ Alunos entendem comentários  
✅ Alunos conseguem modificar valores  
✅ Alunos fazem perguntas inteligentes  
✅ Alunos conseguem fazer exercício   
✅ Alunos trazem dúvidas (faz exercício)  
✅ Alunos se interessam em continuar  

### Indicadores de Fracasso

❌ Código não executa  
❌ Alunos copiam sem entender  
❌ Silêncio total (desengajamento)  
❌ Alunos não sabem por que existe cada linha  
❌ Alunos não conseguem fazer exercício  
❌ Alunos não apareceram próxima aula  

**Se há fracasso**: Use um dos planos alternativas ou revise a aula

---

# 📋 Checklist Antes de Aula

- [ ] Li o PROMPT completo
- [ ] Estude SOLUCOES_PROMPTS
- [ ] Testei código localmente
- [ ] Preparei slides/anotações
- [ ] Tenho acesso a IA (ChatGPT/Copilot)
- [ ] Testefunciona flutter run pronto
- [ ] Tenho emulador aberto ou device pronto
- [ ] Projetor testado
- [ ] Internet conferida (para IA)
- [ ] Exercício para casa preparado
- [ ] Material impresso para alunos (opcional)

---

# 🏆 Dicas de Ouro

1. **Sempre estruture assim: Teoria → IA → Prática → Exercício**
   - Alunos aprendem melhor progressivamente

2. **Pause! Não saia clicando rápido**
   - Deixe alunos acompanharem
   - Faça perguntas no meio

3. **Mostre que IA erra às vezes**
   - Educa que não é mágica
   - Mostra importância do humano

4. **Deixe alunos tocarem no código**
   - Não só assista
   - Deixe brincar e quebrar

5. **Exercício = essencial**
   - Sem exercício, alunos esquecem
   - Próxima aula, reveja exercício

6. **Comparação é aprendizado**
   - Mostre sua solução vs IA
   - Discuta diferenças

7. **Reforce conceptos**
   - "Por quê async?"
   - "Por quê setState()?"

8. **Encerre com próxima aula**
   - Gere expectativa
   - "Próxima vamos..."

---

# 🎯 Fluxo de Uma Aula Completa (90 min)

```
┌─────────────────────────────────────────┐
│ MINUTO 0-5: Abertura (5 min)           │
│ - Boas-vindas                           │
│ - Recapitulação aula anterior           │
│ - O que vamos aprender hoje             │
└─────────────────────────────────────────┘
        ↓
┌─────────────────────────────────────────┐
│ MINUTO 5-20: Teoria (15 min)            │
│ - Conceitos do tópico                   │
│ - "Por quê é importante"                │
│ - Código de exemplo (seu ou slides)     │
└─────────────────────────────────────────┘
        ↓
┌─────────────────────────────────────────┐
│ MINUTO 20-50: Demonstração IA (30 min) │
│ - Copiar PROMPT                         │
│ - Executar em IA                        │
│ - Mostrar resultado                     │
│ - Copiar código                         │
│ - Executar em emulador                  │
│ - Comparar com SOLUCOES_PROMPTS         │
└─────────────────────────────────────────┘
        ↓
┌─────────────────────────────────────────┐
│ MINUTO 50-75: Prática Alunos (25 min)  │
│ - Alunos tentam replicar                │
│ - Você ajuda individual                 │
│ - Hot reload para testar                │
└─────────────────────────────────────────┘
        ↓
┌─────────────────────────────────────────┐
│ MINUTO 75-88: Recap + Exercício (13 min)│
│ - Resumir o que aprendeu                │
│ - Mostrar exercício para casa            │
│ - Diferças de SOLUCOES_PROMPTS         │
│ - Esclarecer dúvidas                    │
└─────────────────────────────────────────┘
        ↓
┌─────────────────────────────────────────┐
│ MINUTO 88-90: Encerramento (2 min)     │
│ - Próxima aula                          │
│ - "Qualquer dúvida?"                    │
│ - Obrigado!                             │
└─────────────────────────────────────────┘
```

---

# 🎓 Exercício Sugerido Para Casa

**Depois de cada aula com PROMPT:**

```
Desafio 1: Modificar  (Fácil - 30 min)
- Execute a solução da aula
- Mude UMA cor
- Mude UM tamanho
- Screenshot do resultado

Desafio 2: Combinar (Médio - 60 min)
- Pegue código da aula D
- Combine com código da aula D-1
- Faça ambas funcionar juntas

Desafio 3: Criar (Difícil - 90 min)
- Baseado no que aprendeu
- Crie versão TODA nova
- Criativa (sua ideia)

Devolva: Código ou screenshot para discussão
```

---

# 📞 Próximas Étapas

1. Escolha um dos 5 PROMPTS
2. Escolha um dos 3 cenários (ao vivo, gravado, workshop)
3. Prepare sua primeira aula
4. Execute!
5. Feedback: O que funcionou? O que não?
6. Ajuste para próxima aula

---

**Última atualização**: Maio 2026  
**Status**: ✅ Guia Completo  
**Versão**: 1.0

*Boa sorte nas suas aulas! 🚀*

