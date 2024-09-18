class TransactionModel {
  final String description;
  final int amount;
  final String tag;
  final DateTime date;
  final bool isIncome;

  TransactionModel(
      {required this.description,
      required this.amount,
      required this.tag,
      required this.date,
      required this.isIncome});
}
