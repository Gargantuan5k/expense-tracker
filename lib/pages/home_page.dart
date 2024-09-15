import 'package:expense_tracker/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Toggle detector for dark / light theme
bool themeIconToggle = false;
int incomeAmount = 0;
int expenditureAmount = 0;
int totalAmount = incomeAmount - expenditureAmount;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String monthDropdownValue = 'January';
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: const NewEntryFAB(),
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        backgroundColor: Theme.of(context).colorScheme.primary,
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
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('INCOME'),
                        Text('₹ $incomeAmount'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('EXPENDITURE'),
                        Text('₹ $expenditureAmount'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('TOTAL'),
                        Text('₹ $expenditureAmount'),
                      ],
                    ),
                  ),
                ),
              ],
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

class NewEntryFAB extends StatelessWidget {
  const NewEntryFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => print('New Entry!!'),
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.secondary,
      child: const Icon(Icons.add),
    ); // TODO: Implement new entry action
  }
}
