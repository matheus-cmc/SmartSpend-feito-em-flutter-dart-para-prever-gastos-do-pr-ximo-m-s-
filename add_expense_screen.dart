import 'package:flutter/material.dart';
import '../models/expense.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  void _saveExpense() {
    final String month = _monthController.text;
    final double? value = double.tryParse(_valueController.text);

    if (month.isEmpty || value == null) return;

    Navigator.pop(
      context,
      Expense(month: month, value: value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Gasto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _monthController,
              decoration: const InputDecoration(
                labelText: 'Mês',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _valueController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveExpense,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
