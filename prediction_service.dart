double predictNextMonth(List<double> monthlyExpenses) {
  if (monthlyExpenses.isEmpty) return 0;

  int n = monthlyExpenses.length >= 3 ? 3 : monthlyExpenses.length;
  double sum = 0;

  for (int i = monthlyExpenses.length - n; i < monthlyExpenses.length; i++) {
    if (i >= 0) {
      sum += monthlyExpenses[i];
    }
  }

  return sum / n;
}
