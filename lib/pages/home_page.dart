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
  final tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setState(() {});
    String monthDropdownValue = 'January';
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: NewEntryFAB(
        amountController: amountController,
        descriptionController: descriptionController,
        dateController: dateController,
        tagController: tagController,
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
            onPressed: () {
              setState(() {});
            },
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
                  return TransactionItem(
                    transactionModel: TransactionModel(
                      description: items[index].description,
                      amount: items[index].amount,
                      tag: items[index].tag,
                      date: items[index].date,
                      isIncome: items[index].isIncome,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

const List<String> tagList = <String>[
  'Food',
  'Bills',
  'School',
  'Miscellaneous',
  'Salary',
];

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

class TagDropdown extends StatefulWidget {
  // final TextEditingController tagController;

  const TagDropdown({
    super.key,
    // required this.tagController,
  });

  @override
  State<TagDropdown> createState() => _TagDropdownState();
}

class _TagDropdownState extends State<TagDropdown> {
  String tagDropdownValue = tagList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      // controller: ,
      initialSelection: tagDropdownValue,
      onSelected: (String? value) {
        setState(() {
          tagDropdownValue = value!;
        });
      },
      dropdownMenuEntries:
          tagList.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
        );
      }).toList(),
    );
  }
}

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

class NewEntryFAB extends StatefulWidget {
  const NewEntryFAB({
    super.key,
    required TextEditingController amountController,
    required TextEditingController descriptionController,
    required TextEditingController dateController,
    required TextEditingController tagController,
  });

  @override
  State<NewEntryFAB> createState() => _NewEntryFABState();
}

class _NewEntryFABState extends State<NewEntryFAB> {
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final tagController = TextEditingController();
  DateTime? pickedDate;
  String currentOption = incomeExpenseOp[0];

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
                    onPressed: () {
                      int convertedAmount = int.parse(amountController.text);
                      final TransactionModel transactionModel =
                          TransactionModel(
                        description: descriptionController.text,
                        amount: convertedAmount,
                        tag: tagController.text,
                        date: pickedDate!,
                        isIncome: false,
                      );
                      items.add(
                        transactionModel,
                      );
                      Navigator.pop(context);
                      setState(() {});
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text('ADD'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                        children: <Widget>[
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
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          bottom: 8.0,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                          ),
                          child: TagDropdown(),
                        ),
                      )
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
