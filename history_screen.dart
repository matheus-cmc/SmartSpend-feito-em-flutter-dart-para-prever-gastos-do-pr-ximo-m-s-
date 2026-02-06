import 'package:flutter/material.dart';
import '../models/expense.dart';

class HistoryScreen extends StatelessWidget {
  final List<Expense> expenses;

  const HistoryScreen({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Gastos')),
      body: expenses.isEmpty
          ? const Center(child: Text('Nenhum gasto registrado.'))
          : ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];
                return ListTile(
                  leading: const Icon(Icons.calendar_month),
                  title: Text(expense.month),
                  trailing:
                      Text('R\$ ${expense.value.toStringAsFixed(2)}'),
                );
              },
            ),
    );
  }
}
