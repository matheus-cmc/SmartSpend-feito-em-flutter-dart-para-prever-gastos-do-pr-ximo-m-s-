import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../services/prediction_service.dart';
import 'add_expense_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Expense> _expenses = [];

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    final prediction = predictNextMonth(
      _expenses.map((e) => e.value).toList(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('📊 SmartSpend'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              '🔮 Previsão do próximo mês: R\$ ${prediction.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _expenses.isEmpty
                  ? const Center(child: Text('Nenhum gasto cadastrado.'))
                  : ListView.builder(
                      itemCount: _expenses.length,
                      itemBuilder: (context, index) {
                        final expense = _expenses[index];
                        return ListTile(
                          leading: const Icon(Icons.attach_money),
                          title: Text(expense.month),
                          trailing:
                              Text('R\$ ${expense.value.toStringAsFixed(2)}'),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Expense? newExpense = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddExpenseScreen(),
            ),
          );

          if (newExpense != null) {
            _addExpense(newExpense);
          }
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HistoryScreen(expenses: _expenses),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
        ],
      ),
    );
  }
}
