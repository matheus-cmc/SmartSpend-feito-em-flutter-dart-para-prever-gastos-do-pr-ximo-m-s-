# 📊 SmartSpend

SmartSpend é um aplicativo Flutter que ajuda usuários a **registrar despesas mensais** e **prever gastos do próximo mês** usando a média dos últimos meses. É ideal para **controle financeiro pessoal** de forma simples e visual.

---

## 🛠 Funcionalidades

- Adicionar, visualizar e gerenciar despesas mensais.
- Exibir previsão de gastos do próximo mês com base nos últimos 3 meses.
- Histórico completo de despesas.
- Navegação intuitiva com menu inferior.
- Interface limpa e amigável.

---

## ⚙️ Tecnologias usadas

- [Flutter](https://flutter.dev/) – Framework para desenvolvimento de aplicativos móveis.
- Dart – Linguagem principal do Flutter.
- Widgets Flutter para listas, botões, navegação e layout.
- Lógica de previsão simples baseada em **média móvel** dos últimos 3 meses.

---

## 📝 Estrutura do Projeto

- `models/expense.dart` → Modelo de dados das despesas.
- `services/prediction_service.dart` → Função de previsão de gastos (`predictNextMonth`).
- `add_expense_screen.dart` → Tela para adicionar novas despesas.
- `history_screen.dart` → Tela que exibe o histórico completo.
- `home_screen.dart` → Tela principal do app, mostrando previsão e lista de despesas.

---

## 🚀 Como usar

1. Clone este repositório:
   ```bash
   git clone <URL_DO_SEU_REPOSITORIO>
