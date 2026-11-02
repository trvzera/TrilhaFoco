> **EN:** SwiftUI study-session app with shared observable state and controls for subject, target duration, focus level, sound, and exam date. Built in Xcode. The exercise implementation is still in progress; the remaining requirements are documented below.
>
> *The rest of this README is in Brazilian Portuguese (pt-BR).*

---

# Trilha Foco — Ficha de Foco (SwiftUI)

App desenvolvido em **SwiftUI** para montar uma ficha de sessão de estudo. O projeto pratica o compartilhamento de estado com **`ObservableObject`**, **`@StateObject`** e **`@ObservedObject`**, usando controles para editar a matéria, os minutos, o nível de foco, o som e a data da prova.

O projeto Xcode mantém o nome original **`fichaFoco`**. A atividade corresponde ao exercício **“1. Ficha de foco”**, do capítulo 5 do material de revisão.

## Status

**Em desenvolvimento** — Modelo observável, tela principal e tela de ajustes implementados parcialmente. A conferência do enunciado encontrou os requisitos pendentes listados abaixo. O código foi preservado, sem implementar as correções.

## Em que consiste

- **`FocoViewModel`** — Classe `ObservableObject` com cinco propriedades `@Published`: matéria, minutos, nível de foco, som e data da prova. O método `reiniciar()` restaura os valores iniciais.
- **`ContentView`** — Cria o modelo com `@StateObject`, apresenta os dados da sessão e contém o slider, o botão de reinício e a navegação para ajustes.
- **`AjustesFocoView`** — Recebe o mesmo modelo por `@ObservedObject` e oferece `TextField`, `Stepper`, `Toggle` e `DatePicker`. Atualmente, o botão **Salvar** apenas fecha a tela de ajustes.
- **`fichaFocoApp`** — Ponto de entrada do aplicativo.

### Conferência do exercício

Referência: `Revisao/Revisao/Revisao/Exercicios/Cap5/00 - Capitulo 5.md`, seção **1. Ficha de foco**, no material original de revisão.

Já atendido:

- Classe `ObservableObject` com os cinco dados publicados e os valores iniciais pedidos: matéria vazia, 25 minutos, nível 0,5, som desligado e data atual.
- `reiniciar()` restaura os cinco valores.
- Tela principal cria o modelo com `@StateObject`; os ajustes recebem a mesma instância com `@ObservedObject`.
- Exibição de matéria e minutos, título “Foco”, campo de matéria, stepper, toggle e seletor apenas de data.
- Não há uso de `Timer`, conforme solicitado.

Ainda falta:

- **Validação:** `formularioValido` retorna sempre `false`. O enunciado exige matéria não vazia após remover espaços nas pontas e nível maior que zero. O botão **Salvar** também precisa ficar desabilitado quando a validação falhar; atualmente ele permanece habilitado.
- **Painel filho:** falta `PainelFocoView`, recebendo o modelo por `@ObservedObject`. O slider e seu texto de porcentagem deveriam estar nessa view; hoje o slider está na tela principal.
- **Escala e porcentagem:** o slider usa `0...100`, com passo 5, enquanto o exercício pede `0...1`. A porcentagem deve ser `Int(nivelFoco * 100)`; hoje o valor inicial aparece como `0.5%`, em vez de `50%`.
- **Bloqueio do slider:** falta desabilitá-lo enquanto a matéria, sem espaços nas pontas, estiver vazia.
- **Botão Reiniciar:** falta desabilitá-lo quando matéria, minutos, nível e som já estiverem nos valores iniciais. A aparência cinza atual não desabilita o botão.
- **Abertura dos ajustes:** hoje é feita por `NavigationLink`. O exercício pede um botão que abra `.sheet(isPresented:)`, controlada pelo estado da tela principal; `mostrarAjustes` está declarado, mas não é utilizado.
- **Formulário dos ajustes:** falta usar `Form`, aplicar autocapitalização de palavras no campo da matéria e limitar o stepper ao intervalo de 5 a 60 minutos. Atualmente o stepper não tem esses limites.
- **Confirmação ao salvar:** falta ativar o binding `mostrarAlerta` e apresentar, na tela principal, o alerta **“Pronto”**, com botão **“OK”** e mensagem **“Sessão de (matéria) pronta: (minutos) min.”**. O binding já existe, mas não é utilizado, e não há `.alert`.

## Como executar

Compilação para o simulador concluída com sucesso no **Xcode 27.2**, sem alterações no código. Essa verificação não substitui a conferência funcional dos requisitos pendentes.

### Pré-requisitos

* macOS com uma versão do Xcode compatível com o projeto.
* SDK e simulador/dispositivo compatíveis com **iOS 26.5 ou superior**, versão mínima configurada no projeto.
* Sem dependências externas.

### Passo a passo

1. Clone o repositório: `git clone https://github.com/trvzera/TrilhaFoco.git`.
2. Abra `fichaFoco.xcodeproj` no Xcode.
3. Selecione o scheme **fichaFoco** e um simulador compatível.
4. Execute com **⌘ + R** ou abra o **Canvas/Preview** de `ContentView.swift`.

Para executar em um dispositivo físico, configure sua equipe de assinatura no Xcode.
