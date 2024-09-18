import 'package:expense_tracker/theme/theme_provider.dart';
import 'package:expense_tracker/transaction_condition.dart';
import 'package:expense_tracker/transaction_item.dart';
import 'package:expense_tracker/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Toggle detector for dark / light theme
bool themeIconToggle = false;
int incomeAmount = 0;
int expenditureAmount = 0;
int totalAmount = incomeAmount - expenditureAmount;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String monthDropdownValue = 'January';
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: NewEntryFAB(
        amountController: amountController,
        descriptionController: descriptionController,
        dateController: dateController,
      ),
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 5,
        shadowColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.new_label,
            ),
            onPressed: () => {},
          ),
          IconButton(
            icon: const Icon(
              Icons.sort,
            ),
            onPressed: () => {}, // TODO: Implement sort
          ),
          IconButton(
            icon: themeIconToggle
                ? const Icon(
                    Icons.light_mode,
                  )
                : const Icon(
                    Icons.dark_mode,
                  ),
            onPressed: () => {
              themeIconToggle = !themeIconToggle,
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
            },
            padding: const EdgeInsets.only(right: 15),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: MonthDropdown(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TransactionCondition(
                      type: "income",
                      amount: incomeAmount,
                      icon: Image.asset("assets/images/icons/income.png"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TransactionCondition(
                      type: "expense",
                      amount: incomeAmount,
                      icon: Image.asset("assets/images/icons/expense.png"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TransactionCondition(
                      type: "total",
                      amount: incomeAmount,
                      icon: Image.asset("assets/images/icons/total.png"),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return TransactionItem();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

const List<String> monthList = <String>[
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

class MonthDropdown extends StatefulWidget {
  const MonthDropdown({super.key});

  @override
  State<MonthDropdown> createState() => _MonthDropdownState();
}

class _MonthDropdownState extends State<MonthDropdown> {
  String monthDropdownValue = monthList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: monthDropdownValue,
      icon: const Icon(Icons.menu),
      underline: Container(
        height: 2,
      ),
      onChanged: (String? value) {
        setState(() {
          monthDropdownValue = value!;
        });
      },
      items: monthList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

const List<String> incomeExpenseOp = <String>["Expense", "Income"];
List items = [
  TransactionModel(
    description: "Food for the week",
    amount: 1000,
    tag: "Food",
    date: DateTime.now(),
    isIncome: false,
  ),
];

class NewEntryFAB extends StatelessWidget {
  final TextEditingController amountController;
  final TextEditingController descriptionController;
  final TextEditingController dateController;
  DateTime? pickedDate;
  String currentOption = incomeExpenseOp[0];

  NewEntryFAB({
    super.key,
    required this.amountController,
    required this.descriptionController,
    required this.dateController,
    // this.pickedDate,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return SizedBox(
              height: 400,
              child: AlertDialog(
                title: const Text('Add Transaction'),
                actions: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text('ADD'),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text('CANCEL'),
                  ),
                ],
                content: SizedBox(
                  height: 400,
                  width: 350,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RadioMenuButton(
                            value: incomeExpenseOp[0],
                            groupValue: currentOption,
                            onChanged: (expense) {
                              currentOption = expense.toString();
                            },
                            child: const Text("Expense"),
                          ),
                          RadioMenuButton(
                            value: incomeExpenseOp[1],
                            groupValue: currentOption,
                            onChanged: (income) {
                              currentOption = income.toString();
                            },
                            child: const Text("Income"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: TextField(
                          controller: amountController,
                          decoration: const InputDecoration(
                            hintText: "Amount (₹)",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            hintText: "Description",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onTap: () async {
                            pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(0),
                              lastDate: DateTime(9999),
                            );
                            String convertedDate =
                                DateFormat().add_yMMMd().format(pickedDate!);
                            dateController.text = convertedDate;
                          },
                          controller: dateController,
                          readOnly: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.calendar_today),
                            prefixIconColor: Colors.blue,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(
                      //     left: 8.0,
                      //     right: 8.0,
                      //     bottom: 8.0,
                      //   ),
                      //   child: ,
                      // )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      backgroundColor: Theme.of(context).colorScheme.secondary,
      foregroundColor: Theme.of(context).colorScheme.primary,
      child: const Icon(Icons.add),
    ); // TODO: Implement new entry action
  }
}
